import './../../../design-system/colors.dart';
import 'package:flutter/material.dart';

class SuccessIconButton extends StatelessWidget {
  double height;
  double width;
  double iconSize;
  double borderRadius;

  final IconData icon;
  final Function callback;

  SuccessIconButton(
      {this.icon,
      this.height = 32,
      this.width = 52,
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
            color: SystemColor.SUCCESS),
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
