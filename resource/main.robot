*** Settings ***
#BIBLIOTECAS
Library    SeleniumLibrary    run_on_failure=None    timeout=0:01:00
Library    RequestsLibrary
Library    OperatingSystem
Library    DateTime
Library    Collections
Library    String
Library    BuiltIn
Library    RPA.PDF

#IMPORT MAIN API PROJECT
Resource    ${ROOT}/Automacao-API/resource/main.robot

#VARIAVEIS YAML
Variables    ${ROOT}/Automacao-WEB/resource/data/data_config_web_test.yaml

#Folha YAML
Variables    ${ROOT}/Automacao-WEB/resource/data/folha/lancamento_movimento.yaml
Variables    ${ROOT}/Automacao-WEB/resource/data/folha/calculos.yaml
Variables    ${ROOT}/Automacao-WEB/resource/data/folha/geracao_de_guias.yaml
Variables    ${ROOT}/Automacao-WEB/resource/data/folha/gerenciador_de_folhas.yaml

#Comercial YAML
Variables    ${ROOT}/Automacao-WEB/resource/data/comercial/lancamento_pedido.yaml

#METAS E ORCAMENTOS YAML
Variables    ${ROOT}/Automacao-WEB/resource/data/metas_e_orcamentos/dados.yaml

#HELPERS
Resource    ${ROOT}/Automacao-WEB/resource/helpers/helpers.resource

#PAGE - OBJECTS GLOBAIS
Resource     ${ROOT}/Automacao-WEB/resource/pages/objects/home/home_objects.resource

#LOGS
Resource    ${ROOT}/Automacao-WEB/resource/log/console_log.resource
Resource    ${ROOT}/Automacao-WEB/resource/log/evidencias.resource

#PAGE - ACTIONS + BASICS(KEYWORDS DE TESTES)
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/Basics.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/home/Login_Actions.resource

#PAGE - ACTIONS - COMERCIAL
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/comercial/central_de_compras/Central_De_Compras.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/comercial/portal_de_compras/Portal_De_Compras.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/comercial/central_de_vendas/Central_De_Vendas.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/comercial/portal_de_vendas/Portal_De_Vendas.resource

#PAGE - ACTIONS - FINANCEIRO
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/financeiro/movimentacao_financeira/Movimentacao_Financeira.resource

#PAGE - ACTIONS - LANCAMENTO MOVIMENTO
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/Lancamento_Movimento.resource

#PAGE - ACTIONS - CALCULOS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/Calculos.resource

#PAGE - ACTION - VALIDADORES FOLHA
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/dbexplorer/Validadores_Dbe.resource

#PAGE - ACTIONS - GERACAO DE GUIAS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/Geracao_De_Guias.resource

#PAGE - ACTIONS - CARGA HORARIA
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/carga_horaria/Carga_Horaria.resource

#PAGE - ACTIONS - CARGO
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/cargo/Cargo.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/eventos/Eventos.resource

#PAGE - ACTIONS - GERENCIADOR DE FOLHAS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/Gerenciador_De_Folhas.resource

#PAGE - ACTIONS - FUNCIONARIOS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/funcionario/Funcionario.resource

#PAGE - ACTIONS - PAINEL DE CONFIGURACOES
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/painel_de_configuracoes/Painel_De_Configuracoes.resource

#PAGE - ACTIONS - GERENCIADOR DE DP
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/gerenciador_dp/Gerenciador_DP.resource

#PAGE - ACTIONS - REGISTRO DE ENTRADA
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/registro_entrada/Registro_Entrada.resource

#PAGE - ACTIONS - REGISTRO DE SAIDA
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/registro_saida/Registro_Saida.resource

#PAGE - ACTIONS - MDFE
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/viagens de transporte(MDF-e)/Mdfe.resource

#PAGE - ACTIONS - EFD REINF
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/efd_reinf/Efd_Reinf.resource

#PAGE - ACTIONS - EFD CONTRIBUICOES PIS/COFINS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/efd_contribuicoes_pis_cofins/Efd_Contribuicoes_Pis_Cofins.resource

#PAGE - ACTIONS - GERACAO DE ICMS IPI 
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/geracao_icms_ipi/Geracao_Icms_Ipi.resource
 
#PAGE - ACTIONS - CADASTRO LIVRO FISCAL ICMS IPI 
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/cadastro_livro_fiscal_icms_ipi/Cadastro_Livro_Fiscal_Icms_Ipi.resource

#PAGE - ACTIONS - AGENDA DE RECURSOS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contratos_e_servicos/agenda_de_recursos/Agenda_De_Recursos.resource

#PAGE - ACTIONS - REAJUSTE DE CONTRATOS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contratos_e_servicos/reajuste_de_contratos/Reajuste_De_Contratos.resource

#PAGE - ACTIONS - CENTRAL DO ESOCIAL
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/central_do_esocial/Central_Do_Esocial.resource

#PAGE - ACTIONS - FATURAMENTO DE PARCELAS ADICIONAIS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contratos_e_servicos/faturamento_de_parcelas_adicionais/Faturamento_De_Parcelas_Adicionais.resource

#PAGE - ACTIONS - FATURAMENTO DE CONTRATOS
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contratos_e_servicos/faturamento_de_contratos/Faturamento_De_Contratos.resource

#PAGE - ACTIONS - FORMULAS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/formulas/Formulas.resource

#PAGE - ACTIONS - EMPRESAS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/empresas/Empresas.resource

#PAGE - ACTIONS - REGISTRO FISCAL
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/registro_fiscal/Registro_Fiscal.resource

#PAGE - ACTIONS - EFD FISCAL ICMS/IPI
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/efd_fiscal_icms_ipi/Efd_Fiscal_Icms_Ipi.resource

#PAGE - ACTIONS - PAINEL DE LIDERANCAS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/painel_liderancas/Painel_Liderancas.resource

#PAGE - ACTIONS - REGRAS DE CALCULO
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/regras_de_calculo/Regras_De_Calculo.resource

#PAGE - ACTIONS - REGRAS DE CALCULO
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/atestado_de_saude_ocupacional_aso/Atestado_De_Saude_Ocupacional_Aso.resource

#PAGE - ACTIONS - METAS E ORCAMENTOS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/metas_e_orcamentos/lancamento_do_planejado/Lancamento_Do_Planejado.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/metas_e_orcamentos/central_de_compras/Central_De_Compras.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/metas_e_orcamentos/validacao_lancamento_orcamentario/Validacao_Lancamento_Orcamentario.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/metas_e_orcamentos/liberacao_limites_orcamentarios/Liberacao_Limites_Orcamentarios.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/metas_e_orcamentos/atualizacao_do_realizado/Atualizacao_Do_Realizado.resource

#PAGE - ACTIONS - WMS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/recebimento_de_mercadorias/Recebimento_De_Mercadorias.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/transferencia_entre_enderecos/Transferencia_Entre_Enderecos.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/expedicao_de_mercadorias/Expedicao_De_Mercadorias.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/inventarios/Inventarios.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/geracao_de_tarefas_de_contagem/Geracao_De_Tarefas_De_Contagem.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/ajuste_de_estoque_por_inventario/Ajuste_De_Estoque_Por_Inventario.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/wms/consulta_estoque_com_ocorrencias/Consulta_Estoque_Com_Ocorrencias.resource

#PAGE - ACTIONS - PRODUCAO
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/producao/desvio_producao/Desvio_Producao.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/producao/processo_produtivo_nova/Processo_Produtivo_Nova.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/producao/ordens_de_producao_nova/Ordens_De_Producao_Nova.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/producao/operacoes_de_producao/Operacoes_De_Producao.resource

#PAGE - ACTIONS - CONTABIL
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contabil/lotes_contabeis/Lotes_Contabeis.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contabil/checagem_lancamentos_contabeis/Checagem_Lancamentos_Contabeis.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contabil/excluir_lancamentos_contabeis/Excluir_Lancamentos_Contabeis.resource
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/contabil/plano_de_contas/Plano_De_Contas.resource

#PAGE - ACTIONS - FOLHA - TABELA DE FAIXAS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/tabela_de_faixas/Tabela_De_Faixas.resource

#PAGE - ACTIONS - FOLHA - SINDICATO
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/folha/sindicato/Sindicato.resource

#PAGE - ACTIONS - FISCAL - REGISTRO DE APURACAO DO ICMS
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/registro_apuracao_icms/Registro_Apuracao_Icms.resource

#PAGE - ACTIONS - FISCAL - PORTAL DE IMPORTACAO DE XML
Resource     ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/fiscal/portal_importacao_xml/Importacao_Xml_Compras_Ref_Pedido.resource

#KEYWORD SETUP TEAR_DOWN
Resource    ${ROOT}/Automacao-WEB/resource/helpers/setup_teardown.resource

#DADOS - VALIDACAO - FOLHA
Resource    ${ROOT}/Automacao-WEB/resource/data/folha/validadores.resource

#DADOS - VALIDACAO - FINENCEIRO
Resource    ${ROOT}/Automacao-WEB/resource/data/financeiro/validadores.resource

#DADOS - VALIDACAO - WMS
Resource    ${ROOT}/Automacao-WEB/resource/data/wms/validadores.resource

#DADOS - VALIDACAO - CONTRATOS E SERVICOS
Resource    ${ROOT}/Automacao-WEB/resource/data/contratos_e_servicos/validadores.resource

#DADOS - VALIDACAO - METAS E ORCAMENTOS
Resource    ${ROOT}/Automacao-WEB/resource/data/metas_e_orcamentos/validadores.resource

#DADOS - VALIDACAO - PRODUCAO
Resource    ${ROOT}/Automacao-WEB/resource/data/producao/validadores.resource

#DADOS - VALIDACAO - CONTABIL
Resource    ${ROOT}/Automacao-WEB/resource/data/contabil/validadores.resource