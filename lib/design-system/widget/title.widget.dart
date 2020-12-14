part of design_system_widget;

class TitleWidget extends StatelessWidget {
  final String text;
  final Color color;
  final bool isHero;
  final MarginDirection marginDirection;

  TitleWidget(
      {this.text,
      this.color,
      this.isHero = false,
      this.marginDirection = MarginDirection.both});

  @override
  Widget build(BuildContext context) {
    return InnerMarginWidget(
      direction: marginDirection,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            color: color != null ? color : SystemColor.GRAY,
            fontWeight: isHero ? FontWeight.w700 : FontWeight.w500),
      ),
    );
  }
}
