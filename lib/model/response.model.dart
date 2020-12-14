import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';

class ResponseModel {
  bool success;
  int code;
  Map<String, dynamic> result;
  String errorMessage;
  Map<String, dynamic> detail;

  ResponseModel(
      {this.success, this.code, this.result, this.errorMessage, this.detail});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> resultJson = json['result'];

    if (resultJson != null && resultJson['root'] != null) {
      String resultset = resultJson['root']['header']['resultset'];

      result = {
        resultset: resultJson['root'][resultJson['root']['header']['resultset']]
      };
    } else {
      result = resultJson;
    }

    success = json['success'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    if (this.result != null) {
      data['result'] = this.result;
    }
    return data;
  }
}

class ResponseException implements Exception {
  final String message;
  final Map<String, dynamic> detail;
  final int code;
  final Map<String, dynamic> debug;
  final AppBloc appBloc = Modular.get<AppBloc>();

  ResponseException(this.message, this.code, {this.detail, this.debug}) {
    if (debug != null) appBloc.sendDebug(debug);
  }
}
