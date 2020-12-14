// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'supervisorio-message.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupervisorioMessageModel _$SupervisorioMessageModelFromJson(
    Map<String, dynamic> json) {
  return SupervisorioMessageModel(
    gateId: json['gate_id'] as int,
    gmoId: json['gmo_id'] as int,
    sessaoId: json['sessao_id'] as int,
    dataSessao: json['data_sessao'] == null
        ? null
        : DateTime.parse(json['data_sessao'] as String),
    alerta: json['alerta'] as int,
    balancaEstavel: json['balanca_estavel'] as int,
    confirmar: json['confirmar'] as int,
    gateIdEntrada: json['gate_id_entrada'] as int,
    gateIdSaida: json['gate_id_saida'] as int,
    liberado: json['liberado'] as int,
    msgDisplay: json['msg_display'] as String,
    msgFixa: json['msg_fixa'] as String,
    msgSupervisorio: json['msg_supervisorio'] as String,
    ocrManual: json['ocr_manual'] as int,
    peso: json['peso'] as int,
    placa: json['placa'] as String,
    recusar: json['recusar'] as int,
    sentido: json['sentido'] as int,
    statusCameras: (json['status_cameras'] as List)
        ?.map((e) => e == null
            ? null
            : StatusCameras.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SupervisorioMessageModelToJson(
        SupervisorioMessageModel instance) =>
    <String, dynamic>{
      'peso': instance.peso,
      'gate_id': instance.gateId,
      'msg_supervisorio': instance.msgSupervisorio,
      'msg_display': instance.msgDisplay,
      'sessao_id': instance.sessaoId,
      'placa': instance.placa,
      'gate_id_entrada': instance.gateIdEntrada,
      'gate_id_saida': instance.gateIdSaida,
      'balanca_estavel': instance.balancaEstavel,
      'sentido': instance.sentido,
      'alerta': instance.alerta,
      'liberado': instance.liberado,
      'confirmar': instance.confirmar,
      'recusar': instance.recusar,
      'gmo_id': instance.gmoId,
      'ocr_manual': instance.ocrManual,
      'data_sessao': instance.dataSessao?.toIso8601String(),
      'msg_fixa': instance.msgFixa,
      'status_cameras':
          instance.statusCameras?.map((e) => e?.toJson())?.toList(),
    };

StatusCameras _$StatusCamerasFromJson(Map<String, dynamic> json) {
  return StatusCameras(
    descricao: json['descricao'] as String,
    ip: json['ip'] as String,
    sucesso: json['sucesso'] as int,
  );
}

Map<String, dynamic> _$StatusCamerasToJson(StatusCameras instance) =>
    <String, dynamic>{
      'descricao': instance.descricao,
      'sucesso': instance.sucesso,
      'ip': instance.ip,
    };
