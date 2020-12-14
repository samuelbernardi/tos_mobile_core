import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/bloc/mqtt.bloc.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';
import 'package:tos_mobile_core/model/environment.model.dart';
import 'package:tos_mobile_core/widgets/drawer/drawer.widget.dart';
import 'package:tos_mobile_core/widgets/pop-scope.widget.dart';

class SafeScaffoldWidget extends StatefulWidget {
  Widget appBar;
  Widget body;
  bool disableMargin;
  bool disableDrawer;
  Function popCallback;

  SafeScaffoldWidget(
      {Key key,
      this.appBar,
      this.body,
      this.disableMargin = false,
      this.disableDrawer = false,
      this.popCallback})
      : super(key: key);

  @override
  _SafeScaffoldWidgetState createState() => _SafeScaffoldWidgetState();
}

class _SafeScaffoldWidgetState extends State<SafeScaffoldWidget>
    with WidgetsBindingObserver {
  var scaffoldKey = new GlobalKey<ScaffoldState>();

  ScreenshotController screenshotController = ScreenshotController();

  AppBloc _appBloc = Modular.get<AppBloc>();
  Environment _environment = Modular.get<Environment>();
  MqttBloc _mqttBloc = Modular.get<MqttBloc>();

  Function clientConnectedListener;
  Timer sendStateTimer;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    bool debugState = _environment.debug.state;

    if (debugState && !GetPlatform.isWeb) {
      clientConnectedListener = () {
        _sendState(ignoreRoute: true);
      };

      _appBloc.getStateNotifier.addListener(clientConnectedListener);

      if (_mqttBloc.isConnected) {
        clientConnectedListener();
      } else {
        _mqttBloc.clientConnected.addListener(clientConnectedListener);
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScopeWidget(
      callback: widget.popCallback,
      child: Screenshot(
        controller: screenshotController,
        child: Scaffold(
          appBar: widget.appBar,
          drawer: widget.disableDrawer ? null : DrawerWidget(),
          key: scaffoldKey,
          body: Builder(
            builder: (context) {
              return Visibility(
                visible: widget.disableMargin,
                child: widget.body,
                replacement: OuterMarginWidget(child: widget.body),
              );
            },
          ),
        ),
      ),
    );
  }

  _sendState({bool ignoreRoute = false}) async {
    Future.delayed(Duration(seconds: 2), () async {
      if (context != null &&
              ModalRoute.of(context) != null &&
              _appBloc.lastStateSend != ModalRoute.of(context).settings.name ||
          ignoreRoute) {
        _appBloc.lastStateSend = ModalRoute.of(context).settings.name;

        File file = await screenshotController.capture();

        await _appBloc.sendState(file, info: {
          'state': _mqttBloc.lifecycleState.toString(),
          'route': {
            'url': ModalRoute.of(context).settings.name,
            'arguments': ModalRoute.of(context).settings.arguments
          }
        });

        if (_mqttBloc.clientConnected.hasListeners) {
          _mqttBloc.clientConnected.removeListener(clientConnectedListener);
        }
      }
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _mqttBloc.lifecycleState = state;

    if (_environment.debug.state && !GetPlatform.isWeb) {
      _sendState();
    }

    if (state == AppLifecycleState.resumed) {
      if (!_mqttBloc.isConnected) {
        print('mqtt not connected');

        _mqttBloc.connect();
      }
    }
  }
}
