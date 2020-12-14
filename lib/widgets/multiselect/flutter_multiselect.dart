import 'package:flutter/material.dart';
import 'package:tos_mobile_core/widgets/multiselect/selection_modal.dart';

class MultiSelect extends FormField<dynamic> {
  final String titleText;
  final String hintText;
  final bool required;
  final String errorText;
  final dynamic value;
  final bool filterable;
  final List dataSource;
  final String textField;
  final String valueField;
  final Function change;
  final Function open;
  final Function close;
  final Widget leading;
  final Widget trailing;
  final int maxLength;
  final Color inputBoxFillColor;
  final Color errorBorderColor;
  final Color enabledBorderColor;
  final String maxLengthText;
  final Color maxLengthIndicatorColor;
  final Color titleTextColor;
  final IconData selectIcon;
  final Color selectIconColor;
  final Color hintTextColor;

  // modal overrides
  final Color buttonBarColor;
  final String cancelButtonText;
  final IconData cancelButtonIcon;
  final Color cancelButtonColor;
  final Color cancelButtonTextColor;
  final String saveButtonText;
  final IconData saveButtonIcon;
  final Color saveButtonColor;
  final Color saveButtonTextColor;
  final String clearButtonText;
  final IconData clearButtonIcon;
  final Color clearButtonColor;
  final Color clearButtonTextColor;
  final String deleteButtonTooltipText;
  final IconData deleteIcon;
  final Color deleteIconColor;
  final Color selectedOptionsBoxColor;
  final String selectedOptionsInfoText;
  final Color selectedOptionsInfoTextColor;
  final IconData checkedIcon;
  final IconData uncheckedIcon;
  final Color checkBoxColor;
  final Color searchBoxColor;
  final String searchBoxHintText;
  final Color searchBoxFillColor;
  final IconData searchBoxIcon;
  final String searchBoxToolTipText;
  final bool multiSelect;

  MultiSelect(
      {FormFieldSetter<dynamic> onSaved,
      FormFieldValidator<dynamic> validator,
      dynamic initialValue,
      bool autovalidate = false,
      this.titleText = 'Title',
      this.titleTextColor,
      this.hintText = 'Tap to select one or more...',
      this.hintTextColor = Colors.grey,
      this.required = false,
      this.errorText = 'Please select one or more option(s)',
      this.value,
      this.leading,
      this.filterable = true,
      this.dataSource,
      this.textField,
      this.valueField,
      this.change,
      this.open,
      this.close,
      this.trailing,
      this.maxLength,
      this.maxLengthText,
      this.maxLengthIndicatorColor = Colors.red,
      this.inputBoxFillColor = Colors.white,
      this.errorBorderColor = Colors.red,
      this.enabledBorderColor = Colors.grey,
      this.selectIcon = Icons.arrow_drop_down,
      this.selectIconColor,
      this.buttonBarColor,
      this.cancelButtonText,
      this.cancelButtonIcon,
      this.cancelButtonColor,
      this.cancelButtonTextColor,
      this.saveButtonText,
      this.saveButtonIcon,
      this.saveButtonColor,
      this.saveButtonTextColor,
      this.clearButtonText,
      this.clearButtonIcon,
      this.clearButtonColor,
      this.clearButtonTextColor,
      this.deleteButtonTooltipText,
      this.deleteIcon,
      this.deleteIconColor,
      this.selectedOptionsBoxColor,
      this.selectedOptionsInfoText,
      this.selectedOptionsInfoTextColor,
      this.checkedIcon,
      this.uncheckedIcon,
      this.checkBoxColor,
      this.searchBoxColor,
      this.searchBoxHintText,
      this.searchBoxFillColor,
      this.searchBoxIcon,
      this.searchBoxToolTipText,
      this.multiSelect = true})
      : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autovalidate,
            builder: (FormFieldState<dynamic> state) {
              List<Widget> _buildSelectedOptions(dynamic values, state) {
                List<Widget> selectedOptions = [];

                if (values != null) {
                  values.forEach((item) {
                    var existingItem = dataSource.singleWhere(
                        (itm) => itm[valueField] == item,
                        orElse: () => null);

                    if (existingItem != null) {
                      selectedOptions.add(Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Chip(
                          labelPadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                          label: Text(existingItem[textField],
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis),
                        ),
                      ));
                    }
                  });
                }

                return selectedOptions;
              }

              Future<void> _goTo(FormFieldState<dynamic> state) async {
                var results = await Navigator.push(
                    state.context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => SelectionModal(
                        title: titleText,
                        filterable: filterable,
                        valueField: valueField,
                        textField: textField,
                        dataSource: dataSource,
                        values: state.value ?? [],
                        maxLength: maxLength ?? dataSource?.length,
                        buttonBarColor: buttonBarColor,
                        cancelButtonText: cancelButtonText,
                        cancelButtonIcon: cancelButtonIcon,
                        cancelButtonColor: cancelButtonColor,
                        cancelButtonTextColor: cancelButtonTextColor,
                        saveButtonText: saveButtonText,
                        saveButtonIcon: saveButtonIcon,
                        saveButtonColor: saveButtonColor,
                        saveButtonTextColor: saveButtonTextColor,
                        clearButtonText: clearButtonText,
                        clearButtonIcon: clearButtonIcon,
                        clearButtonColor: clearButtonColor,
                        clearButtonTextColor: clearButtonTextColor,
                        deleteButtonTooltipText: deleteButtonTooltipText,
                        deleteIcon: deleteIcon,
                        deleteIconColor: deleteIconColor,
                        selectedOptionsBoxColor: selectedOptionsBoxColor,
                        selectedOptionsInfoText: selectedOptionsInfoText,
                        selectedOptionsInfoTextColor:
                            selectedOptionsInfoTextColor,
                        checkedIcon: checkedIcon,
                        uncheckedIcon: uncheckedIcon,
                        checkBoxColor: checkBoxColor,
                        searchBoxColor: searchBoxColor,
                        searchBoxHintText: searchBoxHintText,
                        searchBoxFillColor: searchBoxFillColor,
                        searchBoxIcon: searchBoxIcon,
                        searchBoxToolTipText: searchBoxToolTipText,
                        multiSelect: multiSelect,
                      ),
                      fullscreenDialog: true,
                    ));

                if (results != null) {
                  dynamic newValue;
                  if (results.length > 0) {
                    newValue = results;
                  }
                  state.didChange(newValue);
                  if (change != null) {
                    change(newValue);
                  }
                }
              }

              return InkWell(
                highlightColor: Colors.amber.withOpacity(0.5),
                onTap: () async {
                  await _goTo(state);
                },
                child: Stack(children: [
                  TextField(
                    autofocus: false,
                    controller: TextEditingController()..text = 'AVARIAS',
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          borderSide: BorderSide(color: errorBorderColor)),
                      errorMaxLines: 50,
                      errorText: state.hasError ? state.errorText : null,
                      labelText: hintText + (required ? ' *' : ''),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                    readOnly: true,
                    showCursor: false,
                    style: TextStyle(color: Colors.white),
                    onTap: () async {
                      await _goTo(state);
                    },
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.only(left: 8, top: 5, right: 40),
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: _buildSelectedOptions(state.value, state),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            });
}
