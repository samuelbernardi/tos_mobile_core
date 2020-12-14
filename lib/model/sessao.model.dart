import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'sessao.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SessaoModel extends BaseModel {
  int sessaoId;
  int gateId;
  Gate gate;
  String dataHoraInicio;
  String dataHoraFim;
  int peso;
  int entradaId;
  int gmoId;
  String integradorId;
  String container;
  String placasOcr;
  int fotoDianteiraId;
  int fotoTraseira1Id;
  int fotoTraseira2Id;
  int fotoContainer1Id;
  int fotoContainer2Id;
  int fotoContainer3Id;
  int fotoContainer4Id;
  bool ocrDianteiraLiberada;
  bool ocrTraseiraLiberada;
  bool ocrContainerLiberada;
  bool bioLiberada;
  FotoDianteira fotoDianteira;
  FotoDianteira fotoContainer1;

  SessaoModel(
      {this.sessaoId,
      this.gateId,
      this.gate,
      this.dataHoraInicio,
      this.dataHoraFim,
      this.peso,
      this.entradaId,
      this.gmoId,
      this.integradorId,
      this.container,
      this.placasOcr,
      this.fotoDianteiraId,
      this.fotoTraseira1Id,
      this.fotoTraseira2Id,
      this.fotoContainer1Id,
      this.fotoContainer2Id,
      this.fotoContainer3Id,
      this.fotoContainer4Id,
      this.ocrDianteiraLiberada,
      this.ocrTraseiraLiberada,
      this.ocrContainerLiberada,
      this.bioLiberada,
      this.fotoDianteira,
      this.fotoContainer1});

  factory SessaoModel.fromJson(Map<String, dynamic> data) =>
      _$SessaoModelFromJson(data);

  Map<String, dynamic> toJson() => _$SessaoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Gate extends BaseModel {
  int gateId;
  String descricao;
  String abreviatura;

  Gate({this.gateId, this.descricao, this.abreviatura});

  factory Gate.fromJson(Map<String, dynamic> data) => _$GateFromJson(data);

  Map<String, dynamic> toJson() => _$GateToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class FotoDianteira extends BaseModel {
  int fotoId;
  String placaOcr;
  String placaUtil;
  String urlFoto;

  FotoDianteira({this.fotoId, this.placaOcr, this.placaUtil, this.urlFoto});

  factory FotoDianteira.fromJson(Map<String, dynamic> data) =>
      _$FotoDianteiraFromJson(data);

  Map<String, dynamic> toJson() => _$FotoDianteiraToJson(this);
}
