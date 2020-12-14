part of design_system_widget;

class SubTitleWidget extends StatelessWidget {
  final String text;
  final bool removeMargin;

  SubTitleWidget({this.text, this.removeMargin = false});

  @override
  Widget build(BuildContext context) {
    if (removeMargin) {
      return _text();
    } else {
      return InnerMarginWidget(child: _text());
    }
  }

  Widget _text() {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14,
          color: SystemColor.SUB_TITLE_GRAY,
          fontWeight: FontWeight.w400),
    );
  }
}
