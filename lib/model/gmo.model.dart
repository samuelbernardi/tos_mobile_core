import 'package:json_annotation/json_annotation.dart';

part 'gmo.model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class GmoModel {
  int gmoId;
  String cotaUsuario;
  int qtde;
  String janelaDhi;
  String janelaDhf;
  String janela;
  String dataHoraChegada;
  String dataHoraEntrada;
  String dataHoraSaida;
  String dataHoraCancelamento;
  int transportadoraPais;
  String transportadoraCnpj;
  String transportadoraNome;
  int motoristaId;
  int motoristaPais;
  String motoristaCpf;
  String motoristaCnh;
  String motoristaNome;
  double pesoEntrada = 0.0;
  String pesoEntradaDataHora;
  String pesoEntradaBalanceiro;
  String pesoEntradaBalanca;
  bool pesoEntradaLiberado;
  double pesoSaida;
  String pesoSaidaDataHora;
  String pesoSaidaBalanceiro;
  String pesoSaidaBalanca;
  bool pesoSaidaLiberado;
  bool ocrEntradaLiberado;
  bool ocrSaidaLiberado;
  bool bioEntradaLiberado;
  bool bioSaidaLiberado;
  int origemBruto;
  int origemTara;
  String cartao;
  bool retido;
  int situacaoId;
  int eventoId;
  String codSeguranca;
  String observacao;
  String dateInsert;
  String userInsert;
  String dateUpdate;
  String userUpdate;
  int tipoMovtoId;
  String tipoMovto;
  int tipoOperacaoId;
  String tipoOperacao;
  int qtdePesagens;
  String unegocio;
  int pbt;
  String placas;
  String containers;
  String lacres;
  String motoristaAprovado;
  String veiculoAprovado;
  String msgPortaria;
  double pesoLiquido;
  String usuarioEntrada;
  String usuarioSaida;
  bool saidaManual;
  bool refugado;
  String motivoRefugado;
  bool pesagemManual;
  bool noshow;
  String codIntegrador;
  String codTrizy;
  List<GmoUt> gmoUt;
  List<GmoUcModel> gmoUc;
  Cliente cliente;
  Cliente remetente;
  Situacao situacao;
  Evento evento;
  VeiculoCategoria veiculoCategoria;
  VeiculoClassificacao veiculoClassificacao;
  List<DoctoFiscal> doctoFiscal;

  GmoModel(
      {this.gmoId,
      this.cotaUsuario,
      this.qtde,
      this.janelaDhi,
      this.janelaDhf,
      this.janela,
      this.dataHoraChegada,
      this.dataHoraEntrada,
      this.dataHoraSaida,
      this.dataHoraCancelamento,
      this.transportadoraPais,
      this.transportadoraCnpj,
      this.transportadoraNome,
      this.motoristaId,
      this.motoristaPais,
      this.motoristaCpf,
      this.motoristaCnh,
      this.motoristaNome,
      this.pesoEntrada,
      this.pesoEntradaDataHora,
      this.pesoEntradaBalanceiro,
      this.pesoEntradaBalanca,
      this.pesoEntradaLiberado,
      this.pesoSaida,
      this.pesoSaidaDataHora,
      this.pesoSaidaBalanceiro,
      this.pesoSaidaBalanca,
      this.pesoSaidaLiberado,
      this.ocrEntradaLiberado,
      this.ocrSaidaLiberado,
      this.bioEntradaLiberado,
      this.bioSaidaLiberado,
      this.origemBruto,
      this.origemTara,
      this.cartao,
      this.retido,
      this.situacaoId,
      this.eventoId,
      this.codSeguranca,
      this.observacao,
      this.dateInsert,
      this.userInsert,
      this.dateUpdate,
      this.userUpdate,
      this.tipoMovtoId,
      this.tipoMovto,
      this.tipoOperacaoId,
      this.tipoOperacao,
      this.qtdePesagens,
      this.unegocio,
      this.pbt,
      this.placas,
      this.containers,
      this.lacres,
      this.motoristaAprovado,
      this.veiculoAprovado,
      this.msgPortaria,
      this.pesoLiquido,
      this.usuarioEntrada,
      this.usuarioSaida,
      this.saidaManual,
      this.refugado,
      this.motivoRefugado,
      this.pesagemManual,
      this.noshow,
      this.codIntegrador,
      this.codTrizy,
      this.gmoUt,
      this.gmoUc,
      this.cliente,
      this.remetente,
      this.situacao,
      this.evento,
      this.veiculoCategoria,
      this.veiculoClassificacao,
      this.doctoFiscal});

  factory GmoModel.fromJson(Map<String, dynamic> data) =>
      _$GmoModelFromJson(data);

  Map<String, dynamic> toJson() => _$GmoModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GmoUt {
  int gmoUtId;
  String placa;
  int veiculoId;
  int posicao;
  String observacao;
  bool tracao;

  GmoUt(
      {this.gmoUtId,
      this.placa,
      this.veiculoId,
      this.posicao,
      this.observacao,
      this.tracao});

  factory GmoUt.fromJson(Map<String, dynamic> data) => _$GmoUtFromJson(data);

  Map<String, dynamic> toJson() => _$GmoUtToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class GmoUcModel {
  int gmoUcId;
  int gmoId;
  String identificacao;
  String observacao;
  String ordemCarga;
  int armadorId;
  String coletaEntrega;
  int tipoMovtoId;
  int clienteId;
  int bookingId;
  bool cheio;
  int tipoOperacaoUcId;
  String tipoOperacaoUc;
  Armador armador;
  int containerId;

  GmoUcModel(
      {this.gmoUcId,
      this.gmoId,
      this.identificacao,
      this.observacao,
      this.ordemCarga,
      this.armadorId,
      this.coletaEntrega,
      this.tipoMovtoId,
      this.clienteId,
      this.bookingId,
      this.cheio,
      this.tipoOperacaoUcId,
      this.tipoOperacaoUc,
      this.armador,
      this.containerId});

  factory GmoUcModel.fromJson(Map<String, dynamic> data) =>
      _$GmoUcModelFromJson(data);

  Map<String, dynamic> toJson() => _$GmoUcModelToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Armador {
  int pessoaId;
  String nome;
  String cnpjCpfCuit;

  Armador({this.pessoaId, this.nome, this.cnpjCpfCuit});

  factory Armador.fromJson(Map<String, dynamic> data) =>
      _$ArmadorFromJson(data);

  Map<String, dynamic> toJson() => _$ArmadorToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Cliente {
  int pessoaId;
  String nome;
  String cnpjCpfCuit;
  String uf;

  Cliente({this.pessoaId, this.nome, this.cnpjCpfCuit, this.uf});

  factory Cliente.fromJson(Map<String, dynamic> data) =>
      _$ClienteFromJson(data);

  Map<String, dynamic> toJson() => _$ClienteToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Situacao {
  int situacaoId;
  String descricao;

  Situacao({this.situacaoId, this.descricao});

  factory Situacao.fromJson(Map<String, dynamic> data) =>
      _$SituacaoFromJson(data);

  Map<String, dynamic> toJson() => _$SituacaoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Evento {
  int eventoId;
  String descricao;
  String etapa;

  Evento({this.eventoId, this.descricao, this.etapa});

  factory Evento.fromJson(Map<String, dynamic> data) => _$EventoFromJson(data);

  Map<String, dynamic> toJson() => _$EventoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class VeiculoCategoria {
  int veiculoCategoriaId;
  String descricao;
  int qtdePlaca;

  VeiculoCategoria({this.veiculoCategoriaId, this.descricao, this.qtdePlaca});

  factory VeiculoCategoria.fromJson(Map<String, dynamic> data) =>
      _$VeiculoCategoriaFromJson(data);

  Map<String, dynamic> toJson() => _$VeiculoCategoriaToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class VeiculoClassificacao {
  int veiculoClassificacaoId;
  String descricao;
  String pbt;
  bool exigeAet;

  VeiculoClassificacao(
      {this.veiculoClassificacaoId, this.descricao, this.pbt, this.exigeAet});

  factory VeiculoClassificacao.fromJson(Map<String, dynamic> data) =>
      _$VeiculoClassificacaoFromJson(data);

  Map<String, dynamic> toJson() => _$VeiculoClassificacaoToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class DoctoFiscal {
  int doctoFiscalId;
  String numDocumento;
  String serie;
  String subserie;
  String modelo;
  String nfeChave;
  String nfeProtocolo;
  String dataEmissao;
  String dataSaida;
  String dataEntrada;
  int pesoLiquido;
  double diferencaPeso;

  DoctoFiscal(
      {this.doctoFiscalId,
      this.numDocumento,
      this.serie,
      this.subserie,
      this.modelo,
      this.nfeChave,
      this.nfeProtocolo,
      this.dataEmissao,
      this.dataSaida,
      this.dataEntrada,
      this.pesoLiquido,
      this.diferencaPeso});

  factory DoctoFiscal.fromJson(Map<String, dynamic> data) =>
      _$DoctoFiscalFromJson(data);

  Map<String, dynamic> toJson() => _$DoctoFiscalToJson(this);
}
