import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_browser_client.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:tos_mobile_core/bloc/websocket.bloc.dart';
import 'package:tos_mobile_core/model/environment.model.dart';

class MqttTopic {
  static const String CHECKLIST_ERROR = '/checklist-error';
  static const String CHECKLIST_REMOVED = '/gate/checklist-removed';
  static const String CHECKLIST_RESULT = '/checklist/result';
  static const String CONCLUIR_TOMBADOR = '/supervisorio/confirmar';
  static const String EXECUCAO = '/gate/execucao';
  static const String EXECUTAR_CHECKLIST = '/gate/executar-checklist';
  static const String GET_EXECUCAO = '/gate/get-execucao';
  static const String LIBERAR_BIOMETRIA = '/biometria/liberar';
  static const String OCR_UPDATED = '/ocr/updated';
  static const String OCR_MANUAL = '/supervisorio/ocr_manual';
  static const String REMOVE_TOMBADOR = '/tombador/remove';
  static const String RESET_TOMBADOR = '/supervisorio/reset';
  static const String REVALDIAR_TOMBADOR = '/supervisorio/revalidar';
  static const String SUPERVISORIO = '/supervisorio';
}

class MqttBloc {
  final Environment _environment = Modular.get<Environment>();

  final ChangeNotifier clientConnected = ChangeNotifier();
  final ChangeNotifier clientDisconnected = ChangeNotifier();
  final WebsocketBloc websocketBloc = Modular.get<WebsocketBloc>();
  AppLifecycleState lifecycleState = AppLifecycleState.resumed;

  bool isConnected = false;
  Timer reconnect;
  Timer reconnectCounter;
  RxInt time;

  dynamic client;

  MqttServerClient clientMobile;

  MqttBloc() {
    connect();
  }

  void connect() {
    time = _environment.mqtt.reconnectPeriod.obs;

    time.value = _environment.mqtt.reconnectPeriod;

    reconnectCounter = Timer.periodic(Duration(seconds: 1), (timer) {
      time.value--;

      if (time.value < 1) {
        time.value = _environment.mqtt.reconnectPeriod;
      }
    });

    _connectToClient().then((status) {
      if (status) {
        if (reconnect != null) {
          reconnect.cancel();

          reconnect = null;
        }

        if (client.onDisconnected == null) {
          /// Add the unsolicited disconnection callback
          client.onDisconnected = _onDisconnected;
        }

        if (client.onSubscribed == null) {
          /// Add a subscribed callback, there is also an unsubscribed callback if you need it.
          /// You can add these before connection or change them dynamically after connection if
          /// you wish. There is also an onSubscribeFail callback for failed subscriptions, these
          /// can fail either because you have tried to subscribe to an invalid topic or the broker
          /// rejects the subscribe request.
          client.onSubscribed = onSubscribed;
        }

        clientConnected.notifyListeners();
      } else {
        if (!Get.isSnackbarOpen) {
          clientDisconnected.notifyListeners();
        }

        if (reconnect == null) {
          if ((lifecycleState != AppLifecycleState.paused &&
              lifecycleState != AppLifecycleState.inactive)) {
            reconnect = Timer.periodic(
                Duration(seconds: _environment.mqtt.reconnectPeriod), (timer) {
              print('trying MQTT reconnection');

              time.value = _environment.mqtt.reconnectPeriod;

              if (reconnectCounter != null) {
                reconnectCounter.cancel();
                reconnectCounter = null;
              }

              connect();
            });
          }
        }
      }

      isConnected = status;
    });
  }

  void reconnectAction() async {
    if (reconnect != null) {
      reconnect.cancel();

      reconnect = null;
    }

    if (reconnectCounter != null) {
      reconnectCounter.cancel();
      reconnectCounter = null;
    }

    if (Get.isSnackbarOpen) {
      Get.back(closeOverlays: true);
    }

    await Future.delayed(Duration(seconds: 2), () {
      if (!isConnected) {
        time.value = _environment.mqtt.reconnectPeriod;

        clientDisconnected.notifyListeners();

        connect();
      }
    });
  }

  Future<void> subscribe(String topic, Function listener) async {
    if (client.getSubscriptionsStatus(topic) != MqttSubscriptionStatus.active) {
      _subscribe(topic, listener);
    }
  }

  Future<bool> _connectToClient() async {
    try {
      if (client != null &&
          client.connectionStatus.state == MqttConnectionState.connected) {
      } else {
        if (GetPlatform.isWeb) {
          print(
              'connecting to: ws://${_environment.mqtt.gate}:${_environment.mqtt.gatePortWeb}');

          client = MqttBrowserClient.withPort('ws://${_environment.mqtt.gate}',
              Random().nextInt(200).toString(), _environment.mqtt.gatePortWeb);
        } else {
          print(
              'connecting to: ${_environment.mqtt.gate}:${_environment.mqtt.gatePort}');

          client = MqttServerClient.withPort(_environment.mqtt.gate,
              Random().nextInt(200).toString(), _environment.mqtt.gatePort);
        }

        if (client.onConnected == null) {
          /// Add the successful connection callback
          client.onConnected = _onConnected;
        }

        final MqttConnectMessage connMess = MqttConnectMessage()
            .authenticateAs(
                _environment.mqtt.username, _environment.mqtt.password)
            .keepAliveFor(3600)
            .startClean()
            .withClientIdentifier(Random().nextInt(200).toString());
        client.connectionMessage = connMess;

        await client.connect();

        if (client == null) {
          return false;
        }
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  void onSubscribed(String topic) {
    print('Subcribed to: ${topic}');
  }

  void _onDisconnected() {
    clientDisconnected.notifyListeners();

    print('MQTT disconnected');

    connect();
  }

  /// The successful connect callback
  void _onConnected() {
    clientConnected.notifyListeners();

    if (reconnectCounter != null) {
      reconnectCounter.cancel();
      reconnectCounter = null;
      if (Get.isSnackbarOpen) {
        Get.back(closeOverlays: true);
      }
    }

    print('MQTT connected');
  }

  Future _subscribe(String topic, Function listener) async {
    client.subscribe(topic, MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      if (topic == c[0].topic) {
        final MqttPublishMessage recMess = c[0].payload;

        final String pt = utf8.decode(
            MqttPublishPayload.bytesToStringAsString(recMess.payload.message)
                .runes
                .toList());

        if (listener != null) {
          if (pt != null && pt.trim().isNotEmpty) {
            listener(json.decode(pt));
          } else {
            listener(Map<String, dynamic>());
          }
        }
      }
    });
  }

  Future<void> publish(String topic, String value) async {
    try {
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(value);
      client.publishMessage(topic, MqttQos.atMostOnce, builder.payload);

      if (_environment.debug.useWs) {
        websocketBloc.channel.sink
            .add('"topic": "$topic", "status": "success", "value": "$value"');
      }

      if (_environment.debug.mqttPublish) {
        print('MQTT publish: topic:[$topic], payload:[$value]');
      }
    } catch (e) {
      if (_environment.debug.mqttPublish) {
        print('error - MQTT not published: topic:[$topic], payload:[$value]');
      }

      if (_environment.debug.useWs) {
        websocketBloc.channel.sink
            .add('"topic": "$topic", "status": "success", "value": "$value"');
      }
    }
  }
}
