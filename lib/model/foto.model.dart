import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'foto.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FotoModel extends BaseModel {
  int fotoId;
  int cameraId;
  int gateId;
  int sessaoId;
  int posicaoId;
  String posicao;
  String foto;
  String placaOcr;
  String placaUtil;
  String urlFoto;
  String url;
  bool ocrOk;

  FotoModel({
    this.fotoId,
    this.cameraId,
    this.gateId,
    this.sessaoId,
    this.posicaoId,
    this.posicao,
    this.foto,
    this.placaOcr,
    this.placaUtil,
    this.urlFoto,
    this.url,
    this.ocrOk,
  });

  factory FotoModel.fromJson(Map<String, dynamic> data) =>
      _$FotoModelFromJson(data);

  Map<String, dynamic> toJson() => _$FotoModelToJson(this);
}
