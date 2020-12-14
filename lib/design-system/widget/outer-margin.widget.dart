part of design_system_widget;

class OuterMarginWidget extends StatelessWidget {
  final Widget child;
  final MarginDirection direction;

  OuterMarginWidget({this.child, this.direction = MarginDirection.both});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: direction == MarginDirection.both ||
                direction == MarginDirection.horizontal
            ? 16
            : 0,
        vertical: direction == MarginDirection.both ||
                direction == MarginDirection.vertical
            ? 16
            : 0,
      ),
      child: child,
    );
  }
}
