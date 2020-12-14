import 'package:flutter_modular/flutter_modular.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/bloc/base-bloc.dart';
import 'package:tos_mobile_core/model/environment.model.dart';
import 'package:tos_mobile_core/model/item-acesso.model.dart';
import 'package:tos_mobile_core/widgets/drawer/drawer.repository.dart';

class DrawerBloc extends BaseBloc {
  final AppBloc appBloc = Modular.get<AppBloc>();
  final DrawerRepository drawerRepository = Modular.get<DrawerRepository>();
  final Environment environment = Modular.get<Environment>();

  DrawerBloc();

  Future<List<ItemAcessoModel>> getItems() async {
    List<ItemAcessoModel> itensAcesso = await drawerRepository.getArvoreAcesso(
        params: {
          'descricao': 'Recinto Alfandegado',
          'tags': 'APP-CHECKLIST-HOMOLOG'
        });

    return itensAcesso;
  }
}
