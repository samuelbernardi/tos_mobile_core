part of design_system_widget;

class DividerWidget extends StatelessWidget {
  final double margin;
  final MarginDirection marginDirection;

  DividerWidget({this.margin = 8, this.marginDirection = MarginDirection.both});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
        direction: marginDirection,
        margin: margin,
        child: Divider(
          color: SystemColor.TEXT_GRAY,
        ));
  }
}
