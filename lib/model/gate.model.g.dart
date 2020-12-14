// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GateModel _$GateModelFromJson(Map<String, dynamic> json) {
  return GateModel(
    gateId: json['gate_id'] as int,
    codGestao: json['cod_gestao'] as int,
    descricao: json['descricao'] as String,
    abreviatura: json['abreviatura'] as String,
    eS: json['e_s'] as int,
    eSDescricao: json['e_s_descricao'] as String,
    msgSupervisorio: json['msg_supervisorio'] as String,
    cancelae: json['cancelae'] as String,
    cancelas: json['cancelas'] as String,
    peso: json['peso'] as int,
    tipoModalId: json['tipo_modal_id'] as int,
    exigeCartao: json['exige_cartao'] as int,
    gateIdAssociado: json['gate_id_associado'] as int,
    config: GateModel.configFromJson(json['config']),
    cameras: (json['cameras'] as List)
        ?.map((e) =>
            e == null ? null : CameraModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$GateModelToJson(GateModel instance) => <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'gate_id': instance.gateId,
      'cod_gestao': instance.codGestao,
      'descricao': instance.descricao,
      'abreviatura': instance.abreviatura,
      'e_s': instance.eS,
      'e_s_descricao': instance.eSDescricao,
      'msg_supervisorio': instance.msgSupervisorio,
      'cancelae': instance.cancelae,
      'cancelas': instance.cancelas,
      'peso': instance.peso,
      'tipo_modal_id': instance.tipoModalId,
      'exige_cartao': instance.exigeCartao,
      'gate_id_associado': instance.gateIdAssociado,
      'cameras': instance.cameras?.map((e) => e?.toJson())?.toList(),
      'config': GateModel.configToJson(instance.config),
    };
