import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class DefaultTextButton extends StatelessWidget {
  double height;
  double width;
  double iconSize;
  double borderRadius;
  String text;
  Color btnColor;
  Color textColor;

  final Function callback;
  final Color borderColor;

  DefaultTextButton(
      {this.text,
      this.height = 32,
      this.width = 57,
      this.iconSize = 20,
      this.borderRadius = 4,
      this.borderColor,
      this.callback,
      this.btnColor = Colors.white,
      this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
      child: SizedBox(
        width: this.width,
        child: DecoratedBox(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  side: BorderSide(
                      color: borderColor != null
                          ? borderColor
                          : SystemColor.GRAY)),
              color: btnColor),
          child: FlatButton(
              textColor: textColor,
              child: Text(text.toUpperCase()),
              onPressed: this.callback),
        ),
      ),
    );
  }
}
