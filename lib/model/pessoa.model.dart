import 'package:json_annotation/json_annotation.dart';
import 'package:tos_mobile_core/model/base.model.dart';

part 'pessoa.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class PessoaModel extends BaseModel {
  int pessoaId;
  String nome;
  int tipoPessoaId;
  String tipoPessoa;
  String dataNascimento;
  int paisId;
  String paisNome;
  String endereco;
  String complemento;
  String bairro;
  int cidadeId;
  String cidadeNome;
  String uf;
  String ufNome;
  String cep;
  String telCelular;
  String telComercial;
  String telResidencial;
  String email;
  String grupoAcesso;
  String observacao;
  bool ativo;
  bool autoridade;
  int aprovado;
  String aprovadoDesc;
  String motivoAprovado;
  String presente;
  int empresaId;
  String cartao;
  String displayName;
  bool temFoto;
  bool temBio;
  bool temCartao;
  bool temDoc;
  String cpf;
  List<Documentos> documentos;
  Foto foto;

  PessoaModel(
      {this.pessoaId,
      this.nome,
      this.tipoPessoaId,
      this.tipoPessoa,
      this.dataNascimento,
      this.paisId,
      this.paisNome,
      this.endereco,
      this.complemento,
      this.bairro,
      this.cidadeId,
      this.cidadeNome,
      this.uf,
      this.ufNome,
      this.cep,
      this.telCelular,
      this.telComercial,
      this.telResidencial,
      this.email,
      this.grupoAcesso,
      this.observacao,
      this.ativo,
      this.autoridade,
      this.aprovado,
      this.aprovadoDesc,
      this.motivoAprovado,
      this.presente,
      this.empresaId,
      this.cartao,
      this.displayName,
      this.temFoto,
      this.temBio,
      this.temCartao,
      this.temDoc,
      this.cpf,
      this.documentos,
      this.foto});

  factory PessoaModel.fromJson(Map<String, dynamic> data) =>
      _$PessoaModelFromJson(data);

  Map<String, dynamic> toJson() => _$PessoaModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Documentos extends BaseModel {
  int id;
  String numero;
  String validade;
  int tipoId;
  String tipo;
  String categoria;
  String orgaoEmissor;
  int paisId;
  String pais;

  Documentos(
      {this.id,
      this.numero,
      this.validade,
      this.tipoId,
      this.tipo,
      this.categoria,
      this.orgaoEmissor,
      this.paisId,
      this.pais});

  factory Documentos.fromJson(Map<String, dynamic> data) =>
      _$DocumentosFromJson(data);

  Map<String, dynamic> toJson() => _$DocumentosToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Foto {
  int id;
  String foto;

  Foto({this.id, this.foto});

  factory Foto.fromJson(Map<String, dynamic> data) => _$FotoFromJson(data);

  Map<String, dynamic> toJson() => _$FotoToJson(this);
}
