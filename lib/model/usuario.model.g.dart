// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsuarioModel _$UsuarioModelFromJson(Map<String, dynamic> json) {
  return UsuarioModel(
    username: json['username'] as String,
    password: json['password'] as String,
    codGestao: json['cod_gestao'] as int,
    ambiente: json['ambiente'] as String,
    token: json['token'] as String,
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$UsuarioModelToJson(UsuarioModel instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'username': instance.username,
      'password': instance.password,
      'cod_gestao': instance.codGestao,
      'token': instance.token,
      'ambiente': instance.ambiente,
    };
