import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:package_info/package_info.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';
import 'package:tos_mobile_core/model/item-acesso.model.dart';
import 'package:tos_mobile_core/model/response.model.dart';
import 'package:tos_mobile_core/service/drawer.service.dart';
import 'package:tos_mobile_core/widgets/drawer/drawer.bloc.dart';

class DrawerWidget extends StatefulWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends ModularState<DrawerWidget, DrawerBloc> {
  Future<List<ItemAcessoModel>> getItens;

  @override
  void initState() {
    super.initState();

    getItens = controller.getItems();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListTileTheme(
        iconColor: Colors.black,
        child: Column(
//          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 143,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/fundo_login.png'),
                      fit: BoxFit.cover)),
              child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [
                          Color(0xff07689C).withOpacity(0.9),
                          Color(0xff2D4C7B).withOpacity(0.9),
                          Color(0xff021128).withOpacity(0.9),
                        ],
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        stops: [0.0, 0.1, 0.3]),
                  ),
                  child: Center(
                    child: TitleWidget(
                      text: controller.appBloc.usuarioModel.username,
                      color: Colors.white,
                    ),
                  ),
                  margin: EdgeInsets.all(0.0),
                  padding: EdgeInsets.all(0.0)),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: InnerMarginWidget(
                      child: Row(children: [
                        Icon(Icons.home_rounded),
                        SpacingWidget(
                          direction: SpacingDirection.horizontal,
                        ),
                        Text('Home')
                      ]),
                    )..divide(2),
                    onTap: () {
                      DrawerService.moduleNavigation(context, '/home');
                    },
                  ),
                  FutureBuilder<List<ItemAcessoModel>>(
                      future: getItens,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<ItemAcessoModel> items = snapshot.data;
                          int level = 0;

                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                ItemAcessoModel itemAcesso = items[index];

                                return _buildItem(itemAcesso, level);
                              });
                        } else if (snapshot.hasError) {
                          if (snapshot.error.runtimeType == ResponseException) {
                            ResponseException exception = snapshot.error;

                            return Center(
                              child: InnerMarginWidget(
                                  child: Text(exception.message)),
                            );
                          } else {
                            return Center(
                              child: InnerMarginWidget(
                                  child: Text(snapshot.error.toString())),
                            );
                          }
                        }

                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                  ListTile(
                    title: InnerMarginWidget(
                      child: Row(
                        children: [
                          Icon(Icons.exit_to_app),
                          SpacingWidget(
                            direction: SpacingDirection.horizontal,
                          ),
                          Text('Sair'),
                        ],
                      ),
                    )..divide(2),
                    onTap: () async {
                      AppBloc.confirm('Sair', Text('Deseja sair da aplicação?'),
                          () {
                        DrawerService.moduleNavigation(context, '/',
                            clearStack: true);
                      });
                    },
                  ),
                ],
              ),
            ),
            DividerWidget(),
            FutureBuilder<PackageInfo>(
              future: PackageInfo.fromPlatform(),
              builder:
                  (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
                Widget widget;
                if (snapshot.hasData) {
                  widget = Column(
                    children: [
                      Center(
                        child: Text(
                          'v' + snapshot.data.version,
                          style:
                              TextStyle(color: Color(0xff878787), fontSize: 12),
                        ),
                      ),
                      controller.environment.isProd
                          ? Container()
                          : Center(
                              child: Text(
                                'dev',
                                style: TextStyle(
                                    color: Color(0xff878787), fontSize: 12),
                              ),
                            ),
                    ],
                  );
                } else {
                  widget = Center(child: Text(''));
                }

                return ListTile(title: widget);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(ItemAcessoModel itemAcesso, int level) {
    level++;

    if (itemAcesso.itens.isNotEmpty) {
      return ExpansionTile(
        title: InnerMarginWidget(
          child: Row(
            children: [
              Icon(Icons.check),
              SpacingWidget(
                direction: SpacingDirection.horizontal,
              ),
              Text(itemAcesso.item.descricao),
            ],
          ),
        )..divide(2),
        children: itemAcesso.itens.map((e) => _buildItem(e, level)).toList(),
      );
    } else {
      return ListTile(
        title: InnerMarginWidget(
          child: Row(
            children: [
              Icon(Icons.check),
              SpacingWidget(
                direction: SpacingDirection.horizontal,
              ),
              Text(itemAcesso.item.descricao),
            ],
          ),
        )
          ..divide(2)
          ..multiply(level),
        onTap: () {
          DrawerService.moduleNavigation(context, itemAcesso.item.webUrl);
        },
      );
    }
  }
}
