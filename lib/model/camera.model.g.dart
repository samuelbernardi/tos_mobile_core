// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CameraModel _$CameraModelFromJson(Map<String, dynamic> json) {
  return CameraModel(
    cameraId: json['camera_id'] as int,
    descricao: json['descricao'] as String,
    tipoOcrId: json['tipo_ocr_id'] as int,
    urlGravacao: json['url_gravacao'] as String,
    ip: json['ip'] as String,
    porta: json['porta'] as int,
    marcaId: json['marca_id'] as int,
    posicaoId: json['posicao_id'] as int,
    servidor: json['servidor'] as String,
    urlSnapshot: json['url_snapshot'] as String,
    urlStream: json['url_stream'] as String,
    sentido: json['sentido'] as int,
    gateId: json['gate_id'] as int,
    abreviatura: json['abreviatura'] as String,
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$CameraModelToJson(CameraModel instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'camera_id': instance.cameraId,
      'descricao': instance.descricao,
      'tipo_ocr_id': instance.tipoOcrId,
      'url_gravacao': instance.urlGravacao,
      'ip': instance.ip,
      'porta': instance.porta,
      'marca_id': instance.marcaId,
      'posicao_id': instance.posicaoId,
      'servidor': instance.servidor,
      'url_snapshot': instance.urlSnapshot,
      'url_stream': instance.urlStream,
      'sentido': instance.sentido,
      'gate_id': instance.gateId,
      'abreviatura': instance.abreviatura,
    };
