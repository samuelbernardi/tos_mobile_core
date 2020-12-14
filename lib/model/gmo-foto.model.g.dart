// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gmo-foto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GmoFotoModel _$GmoFotoModelFromJson(Map<String, dynamic> json) {
  return GmoFotoModel(
    gmoId: json['gmo_id'] as int,
    gmoFotoId: json['gmo_foto_id'] as int,
    foto: json['foto'] as String,
    url: json['url'] as String,
    descricao: json['descricao'] as String,
    placaOcr: json['placa_ocr'] as String,
    placaUtil: json['placa_util'] as String,
    sessaoId: json['sessao_id'] as int,
    posicaoId: json['posicao_id'] as int,
    posicao: json['posicao'] as String,
    gateId: json['gate_id'] as int,
    fotoId: json['foto_id'] as int,
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$GmoFotoModelToJson(GmoFotoModel instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'gmo_id': instance.gmoId,
      'gmo_foto_id': instance.gmoFotoId,
      'foto': instance.foto,
      'url': instance.url,
      'descricao': instance.descricao,
      'placa_ocr': instance.placaOcr,
      'placa_util': instance.placaUtil,
      'sessao_id': instance.sessaoId,
      'posicao_id': instance.posicaoId,
      'posicao': instance.posicao,
      'gate_id': instance.gateId,
      'foto_id': instance.fotoId,
    };
