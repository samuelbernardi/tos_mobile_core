import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/model/item-acesso.model.dart';
import 'package:tos_mobile_core/model/response.model.dart';
import 'package:tos_mobile_core/repository/api.repository.dart';

class DrawerRepository {
  final ApiRepository apiRepository = Modular.get<ApiRepository>();

  DrawerRepository();

  Future<List<ItemAcessoModel>> getArvoreAcesso(
      {Map<String, dynamic> params}) async {
    ResponseModel response =
        await apiRepository.call(url: '/menu/arvore-acesso', params: params);

    List<ItemAcessoModel> items = (response.result['itens'][0]['itens'] as List)
        .map((e) => ItemAcessoModel.fromJson(e))
        .toList();

    return items;
  }
}
