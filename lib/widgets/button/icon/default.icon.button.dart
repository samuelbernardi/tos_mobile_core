import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class DefaultIconButton extends StatelessWidget {
  double height;
  double width;
  double iconSize;
  double borderRadius;
  Color borderColor;
  Color btnColor;
  Color iconColor;
  double border;
  Color textColor;

  final IconData icon;
  final Function callback;

  DefaultIconButton(
      {this.icon,
      this.height,
      this.width = 52,
      this.iconSize = 20,
      this.borderRadius = 4,
      this.borderColor,
      this.callback,
      this.btnColor,
      this.textColor,
      this.iconColor,
      this.border = 4});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
      child: SizedBox(
        height: this.height,
        width: this.width,
        child: DecoratedBox(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(border),
                  side: BorderSide(
                      color: borderColor != null
                          ? borderColor
                          : SystemColor.GRAY)),
              color: btnColor ?? Colors.white),
          child: FlatButton(
              textColor: textColor ?? Colors.black,
              child: Icon(
                this.icon,
                size: this.iconSize,
                color: iconColor ?? Colors.black,
              ),
              onPressed: this.callback),
        ),
      ),
    );
  }
}
