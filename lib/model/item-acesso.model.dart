import 'package:json_annotation/json_annotation.dart';

part 'item-acesso.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class ItemAcessoModel {
  Item item;
  List<ItemAcessoModel> itens;

  ItemAcessoModel({this.item, this.itens});

  factory ItemAcessoModel.fromJson(Map<String, dynamic> data) =>
      _$ItemAcessoModelFromJson(data);

  Map<String, dynamic> toJson() => _$ItemAcessoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Item {
  int itemAcessoId;
  int itemAcessoPai;
  String descricao;
  String actCaption;
  String actHint;
  String webUrl;
  String webUrlImage;
  String webTarget;
  String filhos;
  int ordem;
  List<dynamic> acoes;

  Item(
      {this.itemAcessoId,
      this.itemAcessoPai,
      this.descricao,
      this.actCaption,
      this.actHint,
      this.webUrl,
      this.webUrlImage,
      this.webTarget,
      this.filhos,
      this.ordem,
      this.acoes});

  factory Item.fromJson(Map<String, dynamic> data) => _$ItemFromJson(data);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
