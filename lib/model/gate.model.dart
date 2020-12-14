import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';
import 'package:tos_mobile_core/model/camera.model.dart';
import 'package:tos_mobile_core/model/supervisorio-message.model.dart';

part 'gate.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class GateModel extends BaseModel {
  int gateId;
  int codGestao;
  String descricao;
  String abreviatura;
  int eS;
  String eSDescricao;
  String msgSupervisorio;
  String cancelae;
  String cancelas;
  int peso;
  int tipoModalId;
  int exigeCartao;
  int gateIdAssociado;
  List<CameraModel> cameras;

  @JsonKey(fromJson: configFromJson, toJson: configToJson)
  Map<String, dynamic> config;

  @JsonKey(ignore: true)
  SupervisorioMessageModel cardItem;

  GateModel(
      {this.gateId,
      this.codGestao,
      this.descricao,
      this.abreviatura,
      this.eS,
      this.eSDescricao,
      this.msgSupervisorio,
      this.cancelae,
      this.cancelas,
      this.peso,
      this.tipoModalId,
      this.exigeCartao,
      this.gateIdAssociado,
      this.config,
      this.cameras});

  factory GateModel.fromJson(Map<String, dynamic> data) =>
      _$GateModelFromJson(data);

  Map<String, dynamic> toJson() => _$GateModelToJson(this);

  static configFromJson(value) {
    if (value != null) {
      return json.decode(value);
    }

    return {};
  }

  static configToJson(value) {
    return json.encode(value);
  }
}
