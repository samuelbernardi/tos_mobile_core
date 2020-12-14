import './../../../design-system/colors.dart';
import 'package:flutter/material.dart';

class DangerIconButton extends StatelessWidget {
  double height;
  double width;
  double iconSize;
  double borderRadius;

  final IconData icon;
  final Function callback;

  DangerIconButton(
      {this.icon,
      this.height = 32,
      this.width = 50,
      this.iconSize = 20,
      this.borderRadius = 8,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: this.height,
      width: this.width,
      child: DecoratedBox(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(this.borderRadius)),
            color: SystemColor.DANGER),
        child: FlatButton(
            textColor: Colors.white,
            child: Icon(
              this.icon,
              size: this.iconSize,
            ),
            onPressed: this.callback),
      ),
    );
  }
}
