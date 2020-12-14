import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';

class DrawerService {
  static Future<void> moduleNavigation(BuildContext context, String route,
      {Object arguments,
      bool storeInStack = true,
      bool clearStack = false,
      bool isPoping = false,
      Function callback}) async {
    if (ModalRoute.of(context).settings.name != route) {
      AppBloc appBloc = Modular.get<AppBloc>();
      appBloc.isPoping = isPoping;

      if (storeInStack) {
        appBloc.routesStack.add({
          'oldRoute': ModalRoute.of(context).settings.name,
          'arguments': ModalRoute.of(context).settings.arguments,
          'callback': appBloc.popCallback
        });

        appBloc.popCallback = callback;
      }

      if (clearStack) {
        appBloc.routesStack = [];
      }

      try {
        await Modular.to.pushNamedAndRemoveUntil(
            route, ModalRoute.withName('/login'),
            arguments: arguments);
      } on Exception catch (e) {
        print(e);
      }
    } else {
      Modular.to.pop();
    }
  }

  static Future<void> popRouteStack(BuildContext context,
      {dynamic popArguments}) async {
    AppBloc appBloc = Modular.get<AppBloc>();
    appBloc.popArguments = popArguments;

    var routerStack = appBloc.routesStack;

    if (routerStack.isNotEmpty) {
      var oldRoute = routerStack.last;
      appBloc.routesStack.removeLast();

      await DrawerService.moduleNavigation(context, oldRoute['oldRoute'],
          arguments: oldRoute['arguments'],
          callback: oldRoute['callback'],
          storeInStack: false,
          isPoping: true);
    }
  }
}
