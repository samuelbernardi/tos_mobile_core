// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FotoModel _$FotoModelFromJson(Map<String, dynamic> json) {
  return FotoModel(
    fotoId: json['foto_id'] as int,
    cameraId: json['camera_id'] as int,
    gateId: json['gate_id'] as int,
    sessaoId: json['sessao_id'] as int,
    posicaoId: json['posicao_id'] as int,
    posicao: json['posicao'] as String,
    foto: json['foto'] as String,
    placaOcr: json['placa_ocr'] as String,
    placaUtil: json['placa_util'] as String,
    urlFoto: json['url_foto'] as String,
    url: json['url'] as String,
    ocrOk: json['ocr_ok'] as bool,
  );
}

Map<String, dynamic> _$FotoModelToJson(FotoModel instance) => <String, dynamic>{
      'foto_id': instance.fotoId,
      'camera_id': instance.cameraId,
      'gate_id': instance.gateId,
      'sessao_id': instance.sessaoId,
      'posicao_id': instance.posicaoId,
      'posicao': instance.posicao,
      'foto': instance.foto,
      'placa_ocr': instance.placaOcr,
      'placa_util': instance.placaUtil,
      'url_foto': instance.urlFoto,
      'url': instance.url,
      'ocr_ok': instance.ocrOk,
    };
