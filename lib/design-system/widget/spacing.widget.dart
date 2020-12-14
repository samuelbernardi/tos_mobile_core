part of design_system_widget;

enum SpacingDirection { vertical, horizontal, both }

class SpacingWidget extends StatelessWidget {
  final SpacingDirection direction;
  double spacing;

  SpacingWidget({this.spacing = 8, this.direction = SpacingDirection.vertical});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: direction == SpacingDirection.vertical ||
              direction == SpacingDirection.both
          ? spacing
          : null,
      width: direction == SpacingDirection.horizontal ||
              direction == SpacingDirection.both
          ? spacing
          : null,
    );
  }

  divide(double divider) {
    spacing = spacing / divider;
  }

  multiply(double multiplier) {
    spacing = multiplier * spacing;
  }
}
