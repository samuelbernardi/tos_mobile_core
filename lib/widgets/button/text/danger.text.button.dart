import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class DangerTextButton extends StatelessWidget {
  final String text;
  final Function callback;
  final IconData icon;
  final MarginDirection marginDirection;

  DangerTextButton(
      {this.text,
      this.callback,
      this.icon,
      this.marginDirection = MarginDirection.both});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
      direction: marginDirection,
      child: FlatButton(
        child: icon != null ? _withIcon() : FittedBox(child: Text(text)),
        textColor: SystemColor.DANGER,
        onPressed: this.callback,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(color: SystemColor.DANGER)),
      ),
    );
  }

  Widget _withIcon() {
    return Row(
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
