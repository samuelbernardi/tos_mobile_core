import 'package:flutter/material.dart';
import 'package:tos_mobile_core/widgets/form/form-item.widget.dart';

class AppFormWidget<T> extends StatefulWidget {
  final List<Widget> actions;

  List<Widget> items;
  T dataModel;

  static const List<Widget> defaultItems = [];

  AppFormWidget(
      {this.items = defaultItems, this.actions = defaultItems, this.dataModel});

  @override
  _AppFormWidgetState createState() => _AppFormWidgetState();
}

class _AppFormWidgetState extends State<AppFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.items = widget.items.map((e) {
      if (e is AppTextField) {
        e.valueChanged = (value) {
          _fieldChange(value, e.dataField);
        };
      }

      return e;
    }).toList();

    widget.items.addAll(widget.actions);

    return Form(
      key: _formKey,
      child: Column(
        children: widget.items,
      ),
    );
  }

  void _fieldChange(value, String dataField) {
    Map<String, dynamic> dm = widget.dataModel.toJson();
    dm[dataField] = value;

    widget.dataModel = widget.dataModel.fromJson;
  }
}
