import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'camera.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CameraModel extends BaseModel {
  int cameraId;
  String descricao;
  int tipoOcrId;
  String urlGravacao;
  String ip;
  int porta;
  int marcaId;
  int posicaoId;
  String servidor;
  String urlSnapshot;
  String urlStream;
  int sentido;
  int gateId;
  String abreviatura;

  CameraModel(
      {this.cameraId,
      this.descricao,
      this.tipoOcrId,
      this.urlGravacao,
      this.ip,
      this.porta,
      this.marcaId,
      this.posicaoId,
      this.servidor,
      this.urlSnapshot,
      this.urlStream,
      this.sentido,
      this.gateId,
      this.abreviatura});

  factory CameraModel.fromJson(Map<String, dynamic> data) =>
      _$CameraModelFromJson(data);

  Map<String, dynamic> toJson() => _$CameraModelToJson(this);
}
