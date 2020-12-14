import 'package:json_annotation/json_annotation.dart';
import 'package:intl/intl.dart';

abstract class BaseModel {
  String operation;

  @JsonKey(name: 'date_insert')
  DateTime dateInsert;

  @JsonKey(name: 'user_insert')
  String userInsert;

  @JsonKey(name: 'user_update')
  String userUpdate;

  @JsonKey(name: 'date_update', fromJson: dateUpdateFromJson)
  DateTime dateUpdate;

  static dateUpdateFromJson(value) {
    DateFormat format;

    if (value.toString().contains('/')) {
      format = DateFormat('dd/MM/yyyy HH:mm:ss');
    } else {
      format = DateFormat('yyyy-MM-dd HH:mm:ss');
    }

    return value == null || value == '' ? null : format.parse(value as String);
  }

  static booleanToJson(value) {
    if (value) {
      return 1;
    } else {
      return 0;
    }
  }

  static operationOrUpdate(value) {
    if (value != null) {
      return value;
    } else {
      return 'update'.toUpperCase();
    }
  }

  Map<String, dynamic> toJson();
}
