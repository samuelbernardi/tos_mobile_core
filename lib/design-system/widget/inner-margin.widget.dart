part of design_system_widget;

class InnerMarginWidget extends StatelessWidget {
  final Widget child;
  final MarginDirection direction;
  double margin;

  InnerMarginWidget(
      {this.child, this.direction = MarginDirection.both, this.margin = 8});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: this.direction == MarginDirection.both ||
                this.direction == MarginDirection.horizontal
            ? margin
            : 0,
        vertical: this.direction == MarginDirection.both ||
                this.direction == MarginDirection.vertical
            ? margin
            : 0,
      ),
      child: child,
    );
  }

  void multiply(int times) {
    margin = margin * times;
  }

  void divide(double divider) {
    margin = margin / divider;
  }
}
