import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:tos_mobile_core/bloc/mqtt.bloc.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class AppbarWidget extends StatefulWidget with PreferredSizeWidget {
  final bool centerTitle;
  final String title;
  final double height;
  final bool bkgImage;
  final List<Widget> actions;
  final Widget leading;
  final bool showMqttState;

  AppbarWidget(
      {Key key,
      this.title,
      this.bkgImage = false,
      this.centerTitle = false,
      this.height = 50,
      this.actions,
      this.leading,
      this.showMqttState = false})
      : super(key: key);

  @override
  get preferredSize =>
      this.height != null ? Size.fromHeight(this.height) : Size.fromHeight(100);

  @override
  _AppbarWidgetState createState() => _AppbarWidgetState();
}

class _AppbarWidgetState extends State<AppbarWidget> {
  MqttBloc _mqttBloc = Modular.get<MqttBloc>();
  Color status = Colors.red;

  var _connectedListener;
  var _disconnectedListener;

  @override
  void initState() {
    super.initState();

    if (widget.showMqttState) {
      if (_mqttBloc.isConnected) {
        setState(() {
          status = Colors.green;
        });
      }

      _connectedListener = () {
        setState(() {
          status = Colors.green;
        });
      };

      _disconnectedListener = () {
        setState(() {
          status = Colors.red;
        });

        Get.snackbar('Sem conexão com servidor', null,
            messageText: Obx(() => Row(
                  children: [
                    Expanded(
                        child: Text(
                            'Tentando reconectar-se... ${_mqttBloc.time}')),
                    FlatButton(
                      child: Row(
                        children: [
                          Icon(Icons.network_check),
                          SpacingWidget(
                            direction: SpacingDirection.horizontal,
                          ),
                          Text('Reconectar')
                        ],
                      ),
                      onPressed: () {
                        _mqttBloc.reconnectAction();
                      },
                    )
                  ],
                )),
            isDismissible: false,
            colorText: Colors.black,
            margin: EdgeInsets.zero,
            borderRadius: 0,
            duration: Duration(seconds: 3600),
            backgroundColor: Colors.amber,
            icon: Icon(Icons.warning),
            showProgressIndicator: true,
            overlayBlur: 1,
            overlayColor: Colors.grey.withOpacity(0.5));
      };

      _mqttBloc.clientConnected.addListener(_connectedListener);
      _mqttBloc.clientDisconnected.addListener(_disconnectedListener);
    }
  }

  @override
  void dispose() {
    if (widget.showMqttState) {
      _mqttBloc.clientConnected.removeListener(_connectedListener);
      _mqttBloc.clientDisconnected.removeListener(_disconnectedListener);
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> act = [];

    if (widget.showMqttState) {
      act.addAll([
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: widget.actions != null ? 4 : 24),
          child: Container(
            height: 10,
            width: 10,
            child: FloatingActionButton(
              backgroundColor: status,
              heroTag: 'connection-status',
            ),
          ),
        )
      ]);
    }

    if (widget.actions != null) {
      act.addAll(widget.actions);
    }

    return AppBar(
      centerTitle: this.widget.centerTitle,
      title: Text(this.widget.title),
      leading: widget.leading,
      flexibleSpace: this.widget.bkgImage ? this.bkgAppBar() : this.appBar(),
      actions: act,
    );
  }

  Container bkgAppBar() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/fundo_login.png'),
              fit: BoxFit.cover)),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color(0xff07689C).withOpacity(0.8),
                    Color(0xff2D4C7B).withOpacity(0.8),
                    Color(0xff021128).withOpacity(0.8),
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  stops: [0.0, 0.1, 0.3]))),
    );
  }

  Container appBar() {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xff07689C),
                  Color(0xff2D4C7B),
                  Color(0xff021128),
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: [0.0, 0.1, 0.3])));
  }
}
