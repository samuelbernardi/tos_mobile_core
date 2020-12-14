import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/model/camera.model.dart';
import 'package:tos_mobile_core/model/foto.model.dart';
import 'package:tos_mobile_core/model/gate.model.dart';
import 'package:tos_mobile_core/model/response.model.dart';
import 'package:tos_mobile_core/model/sessao.model.dart';
import 'package:tos_mobile_core/repository/api.repository.dart';

class OCRRepository {
  final ApiRepository apiRepository = Modular.get<ApiRepository>();

  OCRRepository();

  Future<List<CameraModel>> getCamera({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/ocr/camera', params: params);

    List<CameraModel> items = (response.result['camera'] as List)
        .map((e) => CameraModel.fromJson(e))
        .toList();

    return items;
  }

  Future<List<FotoModel>> getFoto({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/ocr/foto', params: params);

    List<FotoModel> items = (response.result['foto'] as List)
        .map((e) => FotoModel.fromJson(e))
        .toList();

    return items;
  }

  Future<List<GateModel>> getGates({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/ocr/gate', params: params);

    List<GateModel> items = (response.result['gate'] as List)
        .map((e) => GateModel.fromJson(e))
        .toList();

    return items;
  }

  Future<List<SessaoModel>> getSessao({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/ocr/sessao', params: params);

    List<SessaoModel> items = (response.result['sessao'] as List)
        .map((e) => SessaoModel.fromJson(e))
        .toList();

    return items;
  }

  Future<ResponseModel> insLogAcaoManual({Map<String, dynamic> params}) async {
    AppBloc.loading();

    ResponseModel response =
        await apiRepository.call(url: '/ocr/log/insert', params: params);

    return response;
  }

  Future<ResponseModel> updateFoto({Map<String, dynamic> params}) async {
    AppBloc.loading();

    ResponseModel response =
        await apiRepository.call(url: '/ocr/foto/update', params: params);

    Get.back(closeOverlays: true);

    return response;
  }
}
