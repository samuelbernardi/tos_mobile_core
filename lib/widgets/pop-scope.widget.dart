import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/service/drawer.service.dart';

class PopScopeWidget extends StatelessWidget {
  final Widget child;
  final Function callback;

  PopScopeWidget({this.child, this.callback});

  @override
  Widget build(BuildContext context) {
    AppBloc _appBloc = Modular.get<AppBloc>();

    if (_appBloc.isPoping) {
      if (_appBloc.popCallback != null) {
        _appBloc.popCallback(_appBloc.popArguments);

        _appBloc.isPoping = false;
      }
    }

    return WillPopScope(
      onWillPop: () async {
        AppBloc appBloc = Modular.get<AppBloc>();

        var routerStack = appBloc.routesStack;

        if (routerStack.isNotEmpty) {
          await DrawerService.popRouteStack(context);
        }

        return Future.value(false);
      },
      child: child,
    );
  }
}
