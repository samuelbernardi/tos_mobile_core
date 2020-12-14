import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/model/environment.model.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketBloc {
  final Environment _environment = Modular.get<Environment>();
  final ChangeNotifier clientConnected = ChangeNotifier();
  final ChangeNotifier clientDisconnected = ChangeNotifier();

  IOWebSocketChannel channel;
  Stream stream;
  bool connected = false;

  WebsocketBloc() {
    if (_environment.debug.useWs) {
      _connect();
    }
  }

  void _connect() {
    try {
      channel = IOWebSocketChannel.connect(_environment.debug.endpoint);
      stream = channel.stream;

      stream.listen((msg) {
        print(msg);
      }, onError: (err) {
        print(err);
      }, onDone: () {
        print('ws disconnected');
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
