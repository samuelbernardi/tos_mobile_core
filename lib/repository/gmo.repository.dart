import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/model/gmo-foto.model.dart';
import 'package:tos_mobile_core/model/gmo.model.dart';
import 'package:tos_mobile_core/model/pessoa.model.dart';
import 'package:tos_mobile_core/model/response.model.dart';
import 'package:tos_mobile_core/repository/api.repository.dart';

class GmoRepository {
  final ApiRepository apiRepository = Modular.get<ApiRepository>();

  GmoRepository();

  Future<List<GmoModel>> getGmo({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/gmo', params: params);

    print(response.result['gmo']);

    List<GmoModel> gmos = (response.result['gmo'] as List)
        .map((e) => GmoModel.fromJson(e))
        .toList();

    return gmos;
  }

  Future<List<GmoFotoModel>> getGmoFoto({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/gmo/foto', params: params);

    List<GmoFotoModel> itens = (response.result['gmo_foto'] as List)
        .map((e) => GmoFotoModel.fromJson(e))
        .toList();

    return itens;
  }

  Future<List<PessoaModel>> getMotorista({Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/pessoa', params: params);

    List<PessoaModel> pessoas = (response.result['pessoa'] as List)
        .map((e) => PessoaModel.fromJson(e))
        .toList();

    return pessoas;
  }

  Future<ResponseModel> refugar({Map<String, dynamic> params}) async {
    DateTime now = DateTime.now();
    String isoDate = DateTime.parse(
            '${now.year}-${now.month < 10 ? '0' : ''}${now.month}-${now.day < 10 ? '0' : ''}${now.day} ${now.hour < 10 ? '0' : ''}${now.hour}:${now.minute < 10 ? '0' : ''}${now.minute}:${now.second < 10 ? '0' : ''}${now.second}')
        .toIso8601String();

    params.addAll({
      'gmo_evento_id': 40,
      'log_evento_id': 40,
      'retorno': 0,
      'data_gmo_evento': isoDate,
      'operation': 'GMO_EVENTO'
    });

    ResponseModel response =
        await apiRepository.call(url: '/gmo/refugar', params: params);

    return response;
  }

  Future<ResponseModel> retornar({Map<String, dynamic> params}) async {
    DateTime now = DateTime.now();
    String isoDate = DateTime.parse(
            '${now.year}-${now.month < 10 ? '0' : ''}${now.month}-${now.day < 10 ? '0' : ''}${now.day} ${now.hour < 10 ? '0' : ''}${now.hour}:${now.minute < 10 ? '0' : ''}${now.minute}:${now.second < 10 ? '0' : ''}${now.second}')
        .toIso8601String();

    params.addAll({
      'gmo_evento_id': 35,
      'log_evento_id': 43,
      'retorno': 1,
      'data_gmo_evento': isoDate,
      'operation': 'GMO_EVENTO'
    });

    ResponseModel response =
        await apiRepository.call(url: '/gmo/retorno', params: params);

    return response;
  }
}
