import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/design-system.dart';

class CaptionValueTextWidget extends StatelessWidget {
  final String caption;
  final String value;

  CaptionValueTextWidget({this.caption, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 5,
            child: InnerMarginWidget(
              child: Text(
                '${caption}:',
                style: TextStyle(
                    color: SystemColor.CAPTION_GRAY,
                    fontWeight: FontWeight.w400),
              ),
            )),
        Expanded(
            flex: 5,
            child: InnerMarginWidget(
              child: Text(
                value,
                style: TextStyle(
                    color: SystemColor.CAPTION_GRAY,
                    fontWeight: FontWeight.w300),
              ),
            ))
      ],
    );
  }
}
