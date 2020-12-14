part of design_system_widget;

class TextWidget extends StatelessWidget {
  final String text;

  TextWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: TextStyle(color: SystemColor.TEXT_GRAY, fontSize: 12),
      ),
    );
  }
}
