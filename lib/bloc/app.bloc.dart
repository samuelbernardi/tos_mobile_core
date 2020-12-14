import 'dart:async';
import 'dart:convert';
import 'dart:io' show File;

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as ImageDart;
import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';
import 'package:tos_mobile_core/bloc/mqtt.bloc.dart';
import 'package:tos_mobile_core/bloc/websocket.bloc.dart';
import 'package:tos_mobile_core/design-system/colors.dart';
import 'package:tos_mobile_core/model/environment.model.dart';
import 'package:tos_mobile_core/model/usuario.model.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';

class AppBloc extends ChangeNotifier {
  final MqttBloc mqttBloc = Modular.get<MqttBloc>();
  final WebsocketBloc websocketBloc = Modular.get<WebsocketBloc>();
  final Environment _environment = Modular.get<Environment>();

  UsuarioModel usuarioModel = UsuarioModel();
  String oldRoute;
  Object oldArguments;
  BuildContext appContext;
  List<Map<String, dynamic>> routesStack = [];
  Function popCallback;
  bool isPoping = false;
  bool canSendState = true;
  String lastStateSend = '';
  dynamic popArguments;

  ChangeNotifier getStateNotifier = ChangeNotifier();

  AppBloc() {
    bool debug = _environment.debug.state;

    if (debug) {
      if (!mqttBloc.isConnected) {
        mqttBloc.clientConnected.addListener(() {
          mqttBloc.subscribe('/debug/status', null);
          mqttBloc.subscribe('/debug/getState', _getStateListener);
        });
      }
    }
  }

  static void warning(String title, String message,
      {int duration = 5, bool isDismissable = true}) {
    Get.snackbar(title, message,
        borderRadius: 0,
        backgroundColor: SystemColor.WARNING,
        icon: Icon(
          Icons.warning,
          color: Colors.black,
        ),
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: duration),
        margin: EdgeInsets.zero,
        colorText: Colors.black,
        isDismissible: isDismissable);
  }

  static void success(String title, String message) {
    Get.snackbar(title, message,
        borderRadius: 0,
        backgroundColor: SystemColor.SUCCESS,
        icon: Icon(
          Icons.check_circle_outline,
          color: Colors.white,
        ),
        colorText: Colors.white,
        margin: EdgeInsets.zero,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: false);
  }

  static void error(String title, String message) {
    Get.snackbar(title, null, onTap: (snack) {
      Get.back();
    },
        borderRadius: 0,
        backgroundColor: SystemColor.DANGER,
        icon: Icon(
          Icons.cancel,
          color: Colors.white,
        ),
        colorText: Colors.white,
        margin: EdgeInsets.zero,
        messageText: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    'Toque para fechar',
                    style: TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
        duration: Duration(days: 365),
        snackPosition: SnackPosition.BOTTOM,
        overlayColor: Colors.black.withOpacity(0.6));
  }

  static void loading() {
    Get.dialog(
        Center(
          child: CircularProgressIndicator(),
        ),
        barrierDismissible: false);
  }

  static Future<void> confirm(
      String title, Widget content, VoidCallback onConfirm,
      {VoidCallback onCancel,
      String confirmText = 'Sim',
      String cancelText = 'Não'}) async {
    await Get.defaultDialog(
      title: title,
      barrierDismissible: false,
      textConfirm: confirmText,
      textCancel: cancelText,
      content: content,
      confirmTextColor: Colors.white,
      radius: 8,
      cancel: FlatButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            onCancel?.call();

            Get.back(closeOverlays: true);
          },
          child: Text(
            cancelText,
            style: TextStyle(color: SystemColor.DANGER),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: SystemColor.DANGER,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(100))),
      confirm: FlatButton(
          color: SystemColor.SUCCESS,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          onPressed: () {
            onConfirm?.call();
          },
          child: Text(
            confirmText,
            style: TextStyle(color: Colors.white),
          ),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: SystemColor.SUCCESS,
                  width: 2,
                  style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(100))),
    );
  }

  void _getStateListener(Map<String, dynamic> data) async {
    getStateNotifier.notifyListeners();
  }

  Future<void> sendState(File file, {Map<String, dynamic> info}) {
    String fileBase64;

    bool compress = _environment.debug.compressImage;

    if (file != null) {
      if (compress) {
        var image = ImageDart.decodeImage(file.readAsBytesSync());
        var thumbnail = ImageDart.copyResize(image, width: 200);

        fileBase64 = base64Encode(ImageDart.encodeJpg(thumbnail));
      } else {
        fileBase64 = base64Encode(file.readAsBytesSync());
      }
    }

    info.addAll({'username': usuarioModel.username});

    PackageInfo.fromPlatform().then((value) async {
      try {
        WifiInfoWrapper wifiObject;

        if (GetPlatform.isAndroid) {
          wifiObject = await WifiInfoPlugin.wifiDetails;
        }

        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

        Map<String, dynamic> device;
        if (GetPlatform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          device = {
            'os': 'android',
            'device': androidInfo.device,
            'version': androidInfo.version.release,
            'brand': androidInfo.brand,
            'model': androidInfo.model,
            'display': androidInfo.display
          };
        } else {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          device = {
            'os': 'iOS',
            'device': iosInfo.utsname.machine,
            'version': iosInfo.systemVersion,
            'brand': 'Apple',
            'model': iosInfo.model,
            'display': ''
          };
        }

        if (_environment.debug.useWs) {
          websocketBloc.channel.sink.add(json.encode({
            'screen': fileBase64,
            'app-version': value.version,
            'deviceInfo': device,
            'ipAddress': wifiObject != null ? wifiObject.ipAddress : '',
            'macAddress': wifiObject != null ? wifiObject.macAddress : '',
            'networkId': wifiObject != null ? wifiObject.networkId : '',
            'info': info
          }));
        }

        mqttBloc
            .publish(
                '/debug/state',
                json.encode({
                  'screen': fileBase64,
                  'state': AppLifecycleState.resumed.toString(),
                  'app-version': value.version,
                  'deviceInfo': device,
                  'ipAddress': wifiObject != null ? wifiObject.ipAddress : '',
                  'macAddress': wifiObject != null ? wifiObject.macAddress : '',
                  'networkId': wifiObject != null ? wifiObject.networkId : '',
                  'info': info
                }))
            .then((value) => file.delete());
      } on PlatformException {}
    });
  }

  void sendDebug(Map<String, dynamic> info) {
    PackageInfo.fromPlatform().then((value) async {
      try {
        WifiInfoWrapper wifiObject; // = await WifiInfoPlugin.wifiDetails;
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

        if (GetPlatform.isAndroid) {
          wifiObject = await WifiInfoPlugin.wifiDetails;
        }

        Map<String, dynamic> device;
        if (GetPlatform.isAndroid) {
          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
          device = {
            'os': 'android',
            'device': androidInfo.device,
            'version': androidInfo.version.release,
            'brand': androidInfo.brand,
            'model': androidInfo.model,
            'display': androidInfo.display
          };
        } else {
          IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
          device = {
            'os': 'iOS',
            'device': iosInfo.utsname.machine,
            'version': iosInfo.systemVersion,
            'brand': 'Apple',
            'model': iosInfo.model,
            'display': ''
          };
        }

        mqttBloc.publish(
            '/checklist/debug',
            json.encode({
              DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()): {
                'app-version': value.version,
                'deviceInfo': device,
                'ipAddress': wifiObject != null ? wifiObject.ipAddress : '',
                'macAddress': wifiObject != null ? wifiObject.macAddress : '',
                'networkId': wifiObject != null ? wifiObject.networkId : '',
                'info': info
              }
            }));
      } on PlatformException {}
    });
  }
}
