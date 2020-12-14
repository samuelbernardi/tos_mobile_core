import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'usuario.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UsuarioModel extends BaseModel {
  String username;
  String password;
  int codGestao;
  String token;
  String ambiente;

  UsuarioModel(
      {this.username,
      this.password,
      this.codGestao,
      this.ambiente,
      this.token});

  factory UsuarioModel.fromJson(Map<String, dynamic> data) =>
      _$UsuarioModelFromJson(data);

  Map<String, dynamic> toJson() => _$UsuarioModelToJson(this);

  UsuarioModel get fromJson {
    return UsuarioModel.fromJson(this.toJson());
  }
}
