import 'package:flutter/material.dart';
import 'package:tos_mobile_core/widgets/appbar.widget.dart';
import 'package:tos_mobile_core/widgets/safe-scaffold.widget.dart';
import './../../design-system/widget/widget.dart';

class NotFoundPage extends StatelessWidget {
  final RouteSettings settings;

  NotFoundPage({this.settings});

  @override
  Widget build(BuildContext context) {
    return SafeScaffoldWidget(
      disableDrawer: true,
      appBar: AppbarWidget(
        centerTitle: true,
        title: 'Página não encontrada',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Ops',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SpacingWidget(),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleWidget(text: settings.name),
                SubTitleWidget(text: 'Não foi encontrado.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
