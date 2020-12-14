// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pessoa.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PessoaModel _$PessoaModelFromJson(Map<String, dynamic> json) {
  return PessoaModel(
    pessoaId: json['pessoa_id'] as int,
    nome: json['nome'] as String,
    tipoPessoaId: json['tipo_pessoa_id'] as int,
    tipoPessoa: json['tipo_pessoa'] as String,
    dataNascimento: json['data_nascimento'] as String,
    paisId: json['pais_id'] as int,
    paisNome: json['pais_nome'] as String,
    endereco: json['endereco'] as String,
    complemento: json['complemento'] as String,
    bairro: json['bairro'] as String,
    cidadeId: json['cidade_id'] as int,
    cidadeNome: json['cidade_nome'] as String,
    uf: json['uf'] as String,
    ufNome: json['uf_nome'] as String,
    cep: json['cep'] as String,
    telCelular: json['tel_celular'] as String,
    telComercial: json['tel_comercial'] as String,
    telResidencial: json['tel_residencial'] as String,
    email: json['email'] as String,
    grupoAcesso: json['grupo_acesso'] as String,
    observacao: json['observacao'] as String,
    ativo: json['ativo'] as bool,
    autoridade: json['autoridade'] as bool,
    aprovado: json['aprovado'] as int,
    aprovadoDesc: json['aprovado_desc'] as String,
    motivoAprovado: json['motivo_aprovado'] as String,
    presente: json['presente'] as String,
    empresaId: json['empresa_id'] as int,
    cartao: json['cartao'] as String,
    displayName: json['display_name'] as String,
    temFoto: json['tem_foto'] as bool,
    temBio: json['tem_bio'] as bool,
    temCartao: json['tem_cartao'] as bool,
    temDoc: json['tem_doc'] as bool,
    cpf: json['cpf'] as String,
    documentos: (json['documentos'] as List)
        ?.map((e) =>
            e == null ? null : Documentos.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    foto: json['foto'] == null
        ? null
        : Foto.fromJson(json['foto'] as Map<String, dynamic>),
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$PessoaModelToJson(PessoaModel instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'pessoa_id': instance.pessoaId,
      'nome': instance.nome,
      'tipo_pessoa_id': instance.tipoPessoaId,
      'tipo_pessoa': instance.tipoPessoa,
      'data_nascimento': instance.dataNascimento,
      'pais_id': instance.paisId,
      'pais_nome': instance.paisNome,
      'endereco': instance.endereco,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cidade_id': instance.cidadeId,
      'cidade_nome': instance.cidadeNome,
      'uf': instance.uf,
      'uf_nome': instance.ufNome,
      'cep': instance.cep,
      'tel_celular': instance.telCelular,
      'tel_comercial': instance.telComercial,
      'tel_residencial': instance.telResidencial,
      'email': instance.email,
      'grupo_acesso': instance.grupoAcesso,
      'observacao': instance.observacao,
      'ativo': instance.ativo,
      'autoridade': instance.autoridade,
      'aprovado': instance.aprovado,
      'aprovado_desc': instance.aprovadoDesc,
      'motivo_aprovado': instance.motivoAprovado,
      'presente': instance.presente,
      'empresa_id': instance.empresaId,
      'cartao': instance.cartao,
      'display_name': instance.displayName,
      'tem_foto': instance.temFoto,
      'tem_bio': instance.temBio,
      'tem_cartao': instance.temCartao,
      'tem_doc': instance.temDoc,
      'cpf': instance.cpf,
      'documentos': instance.documentos?.map((e) => e?.toJson())?.toList(),
      'foto': instance.foto?.toJson(),
    };

Documentos _$DocumentosFromJson(Map<String, dynamic> json) {
  return Documentos(
    id: json['id'] as int,
    numero: json['numero'] as String,
    validade: json['validade'] as String,
    tipoId: json['tipo_id'] as int,
    tipo: json['tipo'] as String,
    categoria: json['categoria'] as String,
    orgaoEmissor: json['orgao_emissor'] as String,
    paisId: json['pais_id'] as int,
    pais: json['pais'] as String,
  )
    ..operation = json['operation'] as String
    ..dateInsert = json['date_insert'] == null
        ? null
        : DateTime.parse(json['date_insert'] as String)
    ..userInsert = json['user_insert'] as String
    ..userUpdate = json['user_update'] as String
    ..dateUpdate = BaseModel.dateUpdateFromJson(json['date_update']);
}

Map<String, dynamic> _$DocumentosToJson(Documentos instance) =>
    <String, dynamic>{
      'operation': instance.operation,
      'date_insert': instance.dateInsert?.toIso8601String(),
      'user_insert': instance.userInsert,
      'user_update': instance.userUpdate,
      'date_update': instance.dateUpdate?.toIso8601String(),
      'id': instance.id,
      'numero': instance.numero,
      'validade': instance.validade,
      'tipo_id': instance.tipoId,
      'tipo': instance.tipo,
      'categoria': instance.categoria,
      'orgao_emissor': instance.orgaoEmissor,
      'pais_id': instance.paisId,
      'pais': instance.pais,
    };

Foto _$FotoFromJson(Map<String, dynamic> json) {
  return Foto(
    id: json['id'] as int,
    foto: json['foto'] as String,
  );
}

Map<String, dynamic> _$FotoToJson(Foto instance) => <String, dynamic>{
      'id': instance.id,
      'foto': instance.foto,
    };
