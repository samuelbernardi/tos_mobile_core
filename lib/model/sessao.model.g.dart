// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sessao.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessaoModel _$SessaoModelFromJson(Map<String, dynamic> json) {
  return SessaoModel(
    sessaoId: json['sessao_id'] as int,
    gateId: json['gate_id'] as int,
    gate: json['gate'] == null
        ? null
        : Gate.fromJson(json['gate'] as Map<String, dynamic>),
    dataHoraInicio: json['data_hora_inicio'] as String,
    dataHoraFim: json['data_hora_fim'] as String,
    peso: json['peso'] as int,
    entradaId: json['entrada_id'] as int,
    gmoId: json['gmo_id'] as int,
    integradorId: json['integrador_id'] as String,
    container: json['container'] as String,
    placasOcr: json['placas_ocr'] as String,
    fotoDianteiraId: json['foto_dianteira_id'] as int,
    fotoTraseira1Id: json['foto_traseira1_id'] as int,
    fotoTraseira2Id: json['foto_traseira2_id'] as int,
    fotoContainer1Id: json['foto_container1_id'] as int,
    fotoContainer2Id: json['foto_container2_id'] as int,
    fotoContainer3Id: json['foto_container3_id'] as int,
    fotoContainer4Id: json['foto_container4_id'] as int,
    ocrDianteiraLiberada: json['ocr_dianteira_liberada'] as bool,
    ocrTraseiraLiberada: json['ocr_traseira_liberada'] as bool,
    ocrContainerLiberada: json['ocr_container_liberada'] as bool,
    bioLiberada: json['bio_liberada'] as bool,
    fotoDianteira: json['foto_dianteira'] == null
        ? null
        : FotoDianteira.fromJson(
            json['foto_dianteira'] as Map<String, dynamic>),
    fotoContainer1: json['foto_container1'] == null
        ? null
        : FotoDianteira.fromJson(
            json['foto_container1'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SessaoModelToJson(SessaoModel instance) =>
    <String, dynamic>{
      'sessao_id': instance.sessaoId,
      'gate_id': instance.gateId,
      'gate': instance.gate?.toJson(),
      'data_hora_inicio': instance.dataHoraInicio,
      'data_hora_fim': instance.dataHoraFim,
      'peso': instance.peso,
      'entrada_id': instance.entradaId,
      'gmo_id': instance.gmoId,
      'integrador_id': instance.integradorId,
      'container': instance.container,
      'placas_ocr': instance.placasOcr,
      'foto_dianteira_id': instance.fotoDianteiraId,
      'foto_traseira1_id': instance.fotoTraseira1Id,
      'foto_traseira2_id': instance.fotoTraseira2Id,
      'foto_container1_id': instance.fotoContainer1Id,
      'foto_container2_id': instance.fotoContainer2Id,
      'foto_container3_id': instance.fotoContainer3Id,
      'foto_container4_id': instance.fotoContainer4Id,
      'ocr_dianteira_liberada': instance.ocrDianteiraLiberada,
      'ocr_traseira_liberada': instance.ocrTraseiraLiberada,
      'ocr_container_liberada': instance.ocrContainerLiberada,
      'bio_liberada': instance.bioLiberada,
      'foto_dianteira': instance.fotoDianteira?.toJson(),
      'foto_container1': instance.fotoContainer1?.toJson(),
    };

Gate _$GateFromJson(Map<String, dynamic> json) {
  return Gate(
    gateId: json['gate_id'] as int,
    descricao: json['descricao'] as String,
    abreviatura: json['abreviatura'] as String,
  );
}

Map<String, dynamic> _$GateToJson(Gate instance) => <String, dynamic>{
      'gate_id': instance.gateId,
      'descricao': instance.descricao,
      'abreviatura': instance.abreviatura,
    };

FotoDianteira _$FotoDianteiraFromJson(Map<String, dynamic> json) {
  return FotoDianteira(
    fotoId: json['foto_id'] as int,
    placaOcr: json['placa_ocr'] as String,
    placaUtil: json['placa_util'] as String,
    urlFoto: json['url_foto'] as String,
  );
}

Map<String, dynamic> _$FotoDianteiraToJson(FotoDianteira instance) =>
    <String, dynamic>{
      'foto_id': instance.fotoId,
      'placa_ocr': instance.placaOcr,
      'placa_util': instance.placaUtil,
      'url_foto': instance.urlFoto,
    };
