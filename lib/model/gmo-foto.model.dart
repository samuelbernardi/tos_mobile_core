import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'gmo-foto.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GmoFotoModel extends BaseModel {
  int gmoId;
  int gmoFotoId;
  String foto;
  String url;
  String descricao;
  String placaOcr;
  String placaUtil;
  int sessaoId;
  int posicaoId;
  String posicao;
  int gateId;
  int fotoId;

  GmoFotoModel(
      {this.gmoId,
      this.gmoFotoId,
      this.foto,
      this.url,
      this.descricao,
      this.placaOcr,
      this.placaUtil,
      this.sessaoId,
      this.posicaoId,
      this.posicao,
      this.gateId,
      this.fotoId});

  factory GmoFotoModel.fromJson(Map<String, dynamic> data) =>
      _$GmoFotoModelFromJson(data);

  Map<String, dynamic> toJson() => _$GmoFotoModelToJson(this);
}
