import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class BusyButtonWidget extends StatelessWidget {
  Function callback;

  BusyButtonWidget({this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: RaisedButton(
          child: InnerMarginWidget(child: CircularProgressIndicator()),
          onPressed: callback),
    );
  }
}
