import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart' as DioPkg;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/model/environment.model.dart';
import 'package:tos_mobile_core/model/response.model.dart';

class ApiRepository {
  final AppBloc appBloc = Modular.get<AppBloc>();
  final DioPkg.Dio dio = Modular.get<DioPkg.Dio>();
  final Environment _environment = Modular.get<Environment>();
  Timer timer;

  ApiRepository();

  AppBloc _appBloc = Modular.get<AppBloc>();

  Future<ResponseModel> call(
      {Map<String, dynamic> params, @required String url}) async {
    try {
      timer = Timer(Duration(seconds: 10), () {
//        AppBloc.warning(
//            'Aviso', 'Requisição demorando mais do que o esperado.');
      });

      DioPkg.Options options = DioPkg.Options(
          headers: {'authorization': _appBloc.usuarioModel.token});

      if (params == null) {
        params = {};
      }

      if (_environment.debug.request) {
        print('Request: ${_environment.api.url}${url}');
      }

      if (_environment.debug.requestParams) {
        print('Request params: ${json.encode(params)}');
      }

      DioPkg.Response response = await dio.post('${_environment.api.url}${url}',
          data: params, options: options);

      ResponseModel responseModel = ResponseModel.fromJson(response.data);

      if (_environment.debug.response) {
        print('Response: ${responseModel.result}');
      }

      timer.cancel();

      if (Get.isDialogOpen) {
        Get.back(closeOverlays: true);
      }

      return responseModel;
    } on DioPkg.DioError catch (e) {
      timer.cancel();

      String message = e.message;
      int code = e.response != null ? e.response.data['code'] : 500;

      if (e.response != null) {
        message = e.response.data['message'];
      }

      if (message.contains('Connection refused')) {
        message = 'Não foi possível comunicar-se com o servidor.';
        code = 503;
      } else if (e.type == DioPkg.DioErrorType.CONNECT_TIMEOUT) {
        message = 'Sem resposta do servidor.';
        code = 408;
      }

      if (Get.isDialogOpen) {
        Get.back(closeOverlays: true);
      }

      if (Get.currentRoute != Modular.initialRoute) {
        if (code == 401) {
          message = 'Usuario não autenticado.';
          Get.offAndToNamed(Modular.initialRoute);
        }
      }

      AppBloc.error('Erro', message);

      throw new ResponseException(message, code,
          detail: e.response != null ? e.response.data['detail'] : null,
          debug: {
            'username': appBloc.usuarioModel.username,
            'request': '${_environment.api.url}${url}',
            'parameters': params,
            'message':
                e.response != null ? e.response.data['message'] : message,
            'code': code,
            'detail': e.response != null ? e.response.data['detail'] : null
          });
    }
  }
}
