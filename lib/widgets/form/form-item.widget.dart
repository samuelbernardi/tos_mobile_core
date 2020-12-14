import 'package:flutter/material.dart';
import 'package:tos_mobile_core/design-system/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  final String caption;
  final String dataField;

  Function valueChanged;

  AppTextField({this.caption, this.dataField});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        key: ValueKey(dataField),
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.black.withOpacity(0.5),
          filled: true,
          labelText: caption,
          errorStyle: TextStyle(color: SystemColor.DANGER_ALT),
          labelStyle: TextStyle(color: Colors.white),
        ),
        validator: (value) {
          if (value.isEmpty) {
            return '$dataField obrigatório.';
          }

          return null;
        },
        onChanged: valueChanged);
  }
}
