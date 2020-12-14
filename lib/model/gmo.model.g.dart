// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gmo.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GmoModel _$GmoModelFromJson(Map<String, dynamic> json) {
  return GmoModel(
    gmoId: json['gmo_id'] as int,
    cotaUsuario: json['cota_usuario'] as String,
    qtde: json['qtde'] as int,
    janelaDhi: json['janela_dhi'] as String,
    janelaDhf: json['janela_dhf'] as String,
    janela: json['janela'] as String,
    dataHoraChegada: json['data_hora_chegada'] as String,
    dataHoraEntrada: json['data_hora_entrada'] as String,
    dataHoraSaida: json['data_hora_saida'] as String,
    dataHoraCancelamento: json['data_hora_cancelamento'] as String,
    transportadoraPais: json['transportadora_pais'] as int,
    transportadoraCnpj: json['transportadora_cnpj'] as String,
    transportadoraNome: json['transportadora_nome'] as String,
    motoristaId: json['motorista_id'] as int,
    motoristaPais: json['motorista_pais'] as int,
    motoristaCpf: json['motorista_cpf'] as String,
    motoristaCnh: json['motorista_cnh'] as String,
    motoristaNome: json['motorista_nome'] as String,
    pesoEntrada: (json['peso_entrada'] as num)?.toDouble(),
    pesoEntradaDataHora: json['peso_entrada_data_hora'] as String,
    pesoEntradaBalanceiro: json['peso_entrada_balanceiro'] as String,
    pesoEntradaBalanca: json['peso_entrada_balanca'] as String,
    pesoEntradaLiberado: json['peso_entrada_liberado'] as bool,
    pesoSaida: (json['peso_saida'] as num)?.toDouble(),
    pesoSaidaDataHora: json['peso_saida_data_hora'] as String,
    pesoSaidaBalanceiro: json['peso_saida_balanceiro'] as String,
    pesoSaidaBalanca: json['peso_saida_balanca'] as String,
    pesoSaidaLiberado: json['peso_saida_liberado'] as bool,
    ocrEntradaLiberado: json['ocr_entrada_liberado'] as bool,
    ocrSaidaLiberado: json['ocr_saida_liberado'] as bool,
    bioEntradaLiberado: json['bio_entrada_liberado'] as bool,
    bioSaidaLiberado: json['bio_saida_liberado'] as bool,
    origemBruto: json['origem_bruto'] as int,
    origemTara: json['origem_tara'] as int,
    cartao: json['cartao'] as String,
    retido: json['retido'] as bool,
    situacaoId: json['situacao_id'] as int,
    eventoId: json['evento_id'] as int,
    codSeguranca: json['cod_seguranca'] as String,
    observacao: json['observacao'] as String,
    dateInsert: json['date_insert'] as String,
    userInsert: json['user_insert'] as String,
    dateUpdate: json['date_update'] as String,
    userUpdate: json['user_update'] as String,
    tipoMovtoId: json['tipo_movto_id'] as int,
    tipoMovto: json['tipo_movto'] as String,
    tipoOperacaoId: json['tipo_operacao_id'] as int,
    tipoOperacao: json['tipo_operacao'] as String,
    qtdePesagens: json['qtde_pesagens'] as int,
    unegocio: json['unegocio'] as String,
    pbt: json['pbt'] as int,
    placas: json['placas'] as String,
    containers: json['containers'] as String,
    lacres: json['lacres'] as String,
    motoristaAprovado: json['motorista_aprovado'] as String,
    veiculoAprovado: json['veiculo_aprovado'] as String,
    msgPortaria: json['msg_portaria'] as String,
    pesoLiquido: (json['peso_liquido'] as num)?.toDouble(),
    usuarioEntrada: json['usuario_entrada'] as String,
    usuarioSaida: json['usuario_saida'] as String,
    saidaManual: json['saida_manual'] as bool,
    refugado: json['refugado'] as bool,
    motivoRefugado: json['motivo_refugado'] as String,
    pesagemManual: json['pesagem_manual'] as bool,
    noshow: json['noshow'] as bool,
    codIntegrador: json['cod_integrador'] as String,
    codTrizy: json['cod_trizy'] as String,
    gmoUt: (json['gmo_ut'] as List)
        ?.map(
            (e) => e == null ? null : GmoUt.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gmoUc: (json['gmo_uc'] as List)
        ?.map((e) =>
            e == null ? null : GmoUcModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cliente: json['cliente'] == null
        ? null
        : Cliente.fromJson(json['cliente'] as Map<String, dynamic>),
    remetente: json['remetente'] == null
        ? null
        : Cliente.fromJson(json['remetente'] as Map<String, dynamic>),
    situacao: json['situacao'] == null
        ? null
        : Situacao.fromJson(json['situacao'] as Map<String, dynamic>),
    evento: json['evento'] == null
        ? null
        : Evento.fromJson(json['evento'] as Map<String, dynamic>),
    veiculoCategoria: json['veiculo_categoria'] == null
        ? null
        : VeiculoCategoria.fromJson(
            json['veiculo_categoria'] as Map<String, dynamic>),
    veiculoClassificacao: json['veiculo_classificacao'] == null
        ? null
        : VeiculoClassificacao.fromJson(
            json['veiculo_classificacao'] as Map<String, dynamic>),
    doctoFiscal: (json['docto_fiscal'] as List)
        ?.map((e) =>
            e == null ? null : DoctoFiscal.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GmoModelToJson(GmoModel instance) => <String, dynamic>{
      'gmo_id': instance.gmoId,
      'cota_usuario': instance.cotaUsuario,
      'qtde': instance.qtde,
      'janela_dhi': instance.janelaDhi,
      'janela_dhf': instance.janelaDhf,
      'janela': instance.janela,
      'data_hora_chegada': instance.dataHoraChegada,
      'data_hora_entrada': instance.dataHoraEntrada,
      'data_hora_saida': instance.dataHoraSaida,
      'data_hora_cancelamento': instance.dataHoraCancelamento,
      'transportadora_pais': instance.transportadoraPais,
      'transportadora_cnpj': instance.transportadoraCnpj,
      'transportadora_nome': instance.transportadoraNome,
      'motorista_id': instance.motoristaId,
      'motorista_pais': instance.motoristaPais,
      'motorista_cpf': instance.motoristaCpf,
      'motorista_cnh': instance.motoristaCnh,
      'motorista_nome': instance.motoristaNome,
      'peso_entrada': instance.pesoEntrada,
      'peso_entrada_data_hora': instance.pesoEntradaDataHora,
      'peso_entrada_balanceiro': instance.pesoEntradaBalanceiro,
      'peso_entrada_balanca': instance.pesoEntradaBalanca,
      'peso_entrada_liberado': instance.pesoEntradaLiberado,
      'peso_saida': instance.pesoSaida,
      'peso_saida_data_hora': instance.pesoSaidaDataHora,
      'peso_saida_balanceiro': instance.pesoSaidaBalanceiro,
      'peso_saida_balanca': instance.pesoSaidaBalanca,
      'peso_saida_liberado': instance.pesoSaidaLiberado,
      'ocr_entrada_liberado': instance.ocrEntradaLiberado,
      'ocr_saida_liberado': instance.ocrSaidaLiberado,
      'bio_entrada_liberado': instance.bioEntradaLiberado,
      'bio_saida_liberado': instance.bioSaidaLiberado,
      'origem_bruto': instance.origemBruto,
      'origem_tara': instance.origemTara,
      'cartao': instance.cartao,
      'retido': instance.retido,
      'situacao_id': instance.situacaoId,
      'evento_id': instance.eventoId,
      'cod_seguranca': instance.codSeguranca,
      'observacao': instance.observacao,
      'date_insert': instance.dateInsert,
      'user_insert': instance.userInsert,
      'date_update': instance.dateUpdate,
      'user_update': instance.userUpdate,
      'tipo_movto_id': instance.tipoMovtoId,
      'tipo_movto': instance.tipoMovto,
      'tipo_operacao_id': instance.tipoOperacaoId,
      'tipo_operacao': instance.tipoOperacao,
      'qtde_pesagens': instance.qtdePesagens,
      'unegocio': instance.unegocio,
      'pbt': instance.pbt,
      'placas': instance.placas,
      'containers': instance.containers,
      'lacres': instance.lacres,
      'motorista_aprovado': instance.motoristaAprovado,
      'veiculo_aprovado': instance.veiculoAprovado,
      'msg_portaria': instance.msgPortaria,
      'peso_liquido': instance.pesoLiquido,
      'usuario_entrada': instance.usuarioEntrada,
      'usuario_saida': instance.usuarioSaida,
      'saida_manual': instance.saidaManual,
      'refugado': instance.refugado,
      'motivo_refugado': instance.motivoRefugado,
      'pesagem_manual': instance.pesagemManual,
      'noshow': instance.noshow,
      'cod_integrador': instance.codIntegrador,
      'cod_trizy': instance.codTrizy,
      'gmo_ut': instance.gmoUt,
      'gmo_uc': instance.gmoUc,
      'cliente': instance.cliente,
      'remetente': instance.remetente,
      'situacao': instance.situacao,
      'evento': instance.evento,
      'veiculo_categoria': instance.veiculoCategoria,
      'veiculo_classificacao': instance.veiculoClassificacao,
      'docto_fiscal': instance.doctoFiscal,
    };

GmoUt _$GmoUtFromJson(Map<String, dynamic> json) {
  return GmoUt(
    gmoUtId: json['gmo_ut_id'] as int,
    placa: json['placa'] as String,
    veiculoId: json['veiculo_id'] as int,
    posicao: json['posicao'] as int,
    observacao: json['observacao'] as String,
    tracao: json['tracao'] as bool,
  );
}

Map<String, dynamic> _$GmoUtToJson(GmoUt instance) => <String, dynamic>{
      'gmo_ut_id': instance.gmoUtId,
      'placa': instance.placa,
      'veiculo_id': instance.veiculoId,
      'posicao': instance.posicao,
      'observacao': instance.observacao,
      'tracao': instance.tracao,
    };

GmoUcModel _$GmoUcModelFromJson(Map<String, dynamic> json) {
  return GmoUcModel(
    gmoUcId: json['gmo_uc_id'] as int,
    gmoId: json['gmo_id'] as int,
    identificacao: json['identificacao'] as String,
    observacao: json['observacao'] as String,
    ordemCarga: json['ordem_carga'] as String,
    armadorId: json['armador_id'] as int,
    coletaEntrega: json['coleta_entrega'] as String,
    tipoMovtoId: json['tipo_movto_id'] as int,
    clienteId: json['cliente_id'] as int,
    bookingId: json['booking_id'] as int,
    cheio: json['cheio'] as bool,
    tipoOperacaoUcId: json['tipo_operacao_uc_id'] as int,
    tipoOperacaoUc: json['tipo_operacao_uc'] as String,
    armador: json['armador'] == null
        ? null
        : Armador.fromJson(json['armador'] as Map<String, dynamic>),
    containerId: json['container_id'] as int,
  );
}

Map<String, dynamic> _$GmoUcModelToJson(GmoUcModel instance) =>
    <String, dynamic>{
      'gmo_uc_id': instance.gmoUcId,
      'gmo_id': instance.gmoId,
      'identificacao': instance.identificacao,
      'observacao': instance.observacao,
      'ordem_carga': instance.ordemCarga,
      'armador_id': instance.armadorId,
      'coleta_entrega': instance.coletaEntrega,
      'tipo_movto_id': instance.tipoMovtoId,
      'cliente_id': instance.clienteId,
      'booking_id': instance.bookingId,
      'cheio': instance.cheio,
      'tipo_operacao_uc_id': instance.tipoOperacaoUcId,
      'tipo_operacao_uc': instance.tipoOperacaoUc,
      'armador': instance.armador,
      'container_id': instance.containerId,
    };

Armador _$ArmadorFromJson(Map<String, dynamic> json) {
  return Armador(
    pessoaId: json['pessoa_id'] as int,
    nome: json['nome'] as String,
    cnpjCpfCuit: json['cnpj_cpf_cuit'] as String,
  );
}

Map<String, dynamic> _$ArmadorToJson(Armador instance) => <String, dynamic>{
      'pessoa_id': instance.pessoaId,
      'nome': instance.nome,
      'cnpj_cpf_cuit': instance.cnpjCpfCuit,
    };

Cliente _$ClienteFromJson(Map<String, dynamic> json) {
  return Cliente(
    pessoaId: json['pessoa_id'] as int,
    nome: json['nome'] as String,
    cnpjCpfCuit: json['cnpj_cpf_cuit'] as String,
    uf: json['uf'] as String,
  );
}

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'pessoa_id': instance.pessoaId,
      'nome': instance.nome,
      'cnpj_cpf_cuit': instance.cnpjCpfCuit,
      'uf': instance.uf,
    };

Situacao _$SituacaoFromJson(Map<String, dynamic> json) {
  return Situacao(
    situacaoId: json['situacao_id'] as int,
    descricao: json['descricao'] as String,
  );
}

Map<String, dynamic> _$SituacaoToJson(Situacao instance) => <String, dynamic>{
      'situacao_id': instance.situacaoId,
      'descricao': instance.descricao,
    };

Evento _$EventoFromJson(Map<String, dynamic> json) {
  return Evento(
    eventoId: json['evento_id'] as int,
    descricao: json['descricao'] as String,
    etapa: json['etapa'] as String,
  );
}

Map<String, dynamic> _$EventoToJson(Evento instance) => <String, dynamic>{
      'evento_id': instance.eventoId,
      'descricao': instance.descricao,
      'etapa': instance.etapa,
    };

VeiculoCategoria _$VeiculoCategoriaFromJson(Map<String, dynamic> json) {
  return VeiculoCategoria(
    veiculoCategoriaId: json['veiculo_categoria_id'] as int,
    descricao: json['descricao'] as String,
    qtdePlaca: json['qtde_placa'] as int,
  );
}

Map<String, dynamic> _$VeiculoCategoriaToJson(VeiculoCategoria instance) =>
    <String, dynamic>{
      'veiculo_categoria_id': instance.veiculoCategoriaId,
      'descricao': instance.descricao,
      'qtde_placa': instance.qtdePlaca,
    };

VeiculoClassificacao _$VeiculoClassificacaoFromJson(Map<String, dynamic> json) {
  return VeiculoClassificacao(
    veiculoClassificacaoId: json['veiculo_classificacao_id'] as int,
    descricao: json['descricao'] as String,
    pbt: json['pbt'] as String,
    exigeAet: json['exige_aet'] as bool,
  );
}

Map<String, dynamic> _$VeiculoClassificacaoToJson(
        VeiculoClassificacao instance) =>
    <String, dynamic>{
      'veiculo_classificacao_id': instance.veiculoClassificacaoId,
      'descricao': instance.descricao,
      'pbt': instance.pbt,
      'exige_aet': instance.exigeAet,
    };

DoctoFiscal _$DoctoFiscalFromJson(Map<String, dynamic> json) {
  return DoctoFiscal(
    doctoFiscalId: json['docto_fiscal_id'] as int,
    numDocumento: json['num_documento'] as String,
    serie: json['serie'] as String,
    subserie: json['subserie'] as String,
    modelo: json['modelo'] as String,
    nfeChave: json['nfe_chave'] as String,
    nfeProtocolo: json['nfe_protocolo'] as String,
    dataEmissao: json['data_emissao'] as String,
    dataSaida: json['data_saida'] as String,
    dataEntrada: json['data_entrada'] as String,
    pesoLiquido: json['peso_liquido'] as int,
    diferencaPeso: (json['diferenca_peso'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DoctoFiscalToJson(DoctoFiscal instance) =>
    <String, dynamic>{
      'docto_fiscal_id': instance.doctoFiscalId,
      'num_documento': instance.numDocumento,
      'serie': instance.serie,
      'subserie': instance.subserie,
      'modelo': instance.modelo,
      'nfe_chave': instance.nfeChave,
      'nfe_protocolo': instance.nfeProtocolo,
      'data_emissao': instance.dataEmissao,
      'data_saida': instance.dataSaida,
      'data_entrada': instance.dataEntrada,
      'peso_liquido': instance.pesoLiquido,
      'diferenca_peso': instance.diferencaPeso,
    };
