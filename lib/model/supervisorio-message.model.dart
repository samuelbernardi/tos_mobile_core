import 'package:json_annotation/json_annotation.dart';

part 'supervisorio-message.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SupervisorioMessageModel {
  int peso;
  int gateId;
  String msgSupervisorio;
  String msgDisplay;
  int sessaoId;
  String placa;
  int gateIdEntrada;
  int gateIdSaida;
  int balancaEstavel;
  int sentido;
  int alerta;
  int liberado;
  int confirmar;
  int recusar;
  int gmoId;
  int ocrManual;
  DateTime dataSessao;
  String msgFixa;
  List<StatusCameras> statusCameras;

  SupervisorioMessageModel(
      {this.gateId,
      this.gmoId,
      this.sessaoId,
      this.dataSessao,
      this.alerta,
      this.balancaEstavel,
      this.confirmar,
      this.gateIdEntrada,
      this.gateIdSaida,
      this.liberado,
      this.msgDisplay,
      this.msgFixa,
      this.msgSupervisorio,
      this.ocrManual,
      this.peso,
      this.placa,
      this.recusar,
      this.sentido,
      this.statusCameras});

  factory SupervisorioMessageModel.fromJson(Map<String, dynamic> data) =>
      _$SupervisorioMessageModelFromJson(data);

  Map<String, dynamic> toJson() => _$SupervisorioMessageModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class StatusCameras {
  String descricao;
  int sucesso;
  String ip;

  StatusCameras({this.descricao, this.ip, this.sucesso});

  factory StatusCameras.fromJson(Map<String, dynamic> data) =>
      _$StatusCamerasFromJson(data);

  Map<String, dynamic> toJson() => _$StatusCamerasToJson(this);
}
