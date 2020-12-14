import './../../../design-system/colors.dart';
import './../../../design-system/widget/widget.dart';
import 'package:flutter/material.dart';

class SuccessTextButton extends StatelessWidget {
  final String text;
  final Function callback;
  final IconData icon;
  final MarginDirection marginDirection;

  SuccessTextButton(
      {this.text,
      this.callback,
      this.icon,
      this.marginDirection = MarginDirection.both});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
      direction: marginDirection,
      child: RaisedButton(
          color: SystemColor.SUCCESS,
          child: InnerMarginWidget(
              child: icon != null ? _withIcon() : FittedBox(child: Text(text))),
          textColor: Colors.white,
          onPressed: callback),
    );
  }

  Widget _withIcon() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SpacingWidget(
          direction: SpacingDirection.horizontal,
        ),
        Text(text)
      ],
    );
  }
}
