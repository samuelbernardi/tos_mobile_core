import 'package:flutter/material.dart';
import 'package:tos_mobile_core/bloc/app.bloc.dart';
import 'package:tos_mobile_core/model/response.model.dart';

class AppButtonWidget extends StatefulWidget {
  bool busy;
  final bool calbacklNotification;
  final Function callbackValidator;
  final Function callback;
  final Widget child;
  final Color color;
  final Function onError;
  final Function onSuccess;

  AppButtonWidget(
      {this.callback,
      this.calbacklNotification = true,
      this.callbackValidator,
      this.child,
      this.color = Colors.white,
      this.busy = false,
      this.onError,
      this.onSuccess});

  @override
  _AppButtonWidgetState createState() => _AppButtonWidgetState();
}

class _AppButtonWidgetState extends State<AppButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: widget.child,
        color: widget.color,
        onPressed: widget.busy
            ? null
            : () async {
                if (widget.callback != null) {
                  try {
                    if (widget.callbackValidator()) {
                      setState(() {
                        widget.busy = true;
                      });

                      widget.callback().then((value) async {
                        ResponseModel response = value;

                        if (widget.calbacklNotification) {
                          AppBloc.success(
                              'Sucesso', response.result['mensagem']);

                          await Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              widget.busy = false;
                            });

                            widget.onSuccess();
                          });
                        } else {
                          setState(() {
                            widget.busy = false;
                          });

                          if (widget.onSuccess != null) {
                            widget.onSuccess();
                          }
                        }
                      }).catchError((err) {
                        setState(() {
                          widget.busy = false;
                        });

                        if (err is ResponseException) {
                          AppBloc.error('Erro', err.message);
                        } else {
                          AppBloc.error('Erro', err.toString());
                        }
                      });
                    }
                  } catch (e) {
                    setState(() {
                      widget.busy = false;
                    });

                    if (e is ResponseException) {
                      AppBloc.error('Erro', e.message);
                    } else {
                      AppBloc.error('Erro', e.toString());
                    }

                    if (widget.onError != null) {
                      widget.onError();
                    }
                  }
                }
              });
  }
}
