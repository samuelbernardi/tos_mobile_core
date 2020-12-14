// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item-acesso.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemAcessoModel _$ItemAcessoModelFromJson(Map<String, dynamic> json) {
  return ItemAcessoModel(
    item: json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
    itens: (json['itens'] as List)
        ?.map((e) => e == null
            ? null
            : ItemAcessoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ItemAcessoModelToJson(ItemAcessoModel instance) =>
    <String, dynamic>{
      'item': instance.item?.toJson(),
      'itens': instance.itens?.map((e) => e?.toJson())?.toList(),
    };

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    itemAcessoId: json['item_acesso_id'] as int,
    itemAcessoPai: json['item_acesso_pai'] as int,
    descricao: json['descricao'] as String,
    actCaption: json['act_caption'] as String,
    actHint: json['act_hint'] as String,
    webUrl: json['web_url'] as String,
    webUrlImage: json['web_url_image'] as String,
    webTarget: json['web_target'] as String,
    filhos: json['filhos'] as String,
    ordem: json['ordem'] as int,
    acoes: json['acoes'] as List,
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'item_acesso_id': instance.itemAcessoId,
      'item_acesso_pai': instance.itemAcessoPai,
      'descricao': instance.descricao,
      'act_caption': instance.actCaption,
      'act_hint': instance.actHint,
      'web_url': instance.webUrl,
      'web_url_image': instance.webUrlImage,
      'web_target': instance.webTarget,
      'filhos': instance.filhos,
      'ordem': instance.ordem,
      'acoes': instance.acoes,
    };
