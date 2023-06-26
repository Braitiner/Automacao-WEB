*** Settings ***
Resource     ${ROOT}/Automacao-WEB/resource/main.robot
Resource     ${ROOT}/Automacao-WEB/resource/pages/objects/producao/processo_produtivo/lancamento_processo_produtivo.resource

*** Keywords ***

#Keywords execucao
acesso a tela Processo Produtivo Nova
    [Documentation]    Keyword responsavel por acessar a tela Processo Produtivo - Nova
    Acessar tela por campo pesquisa    Processo Produtivo - Nova    ${home_logado.op_processo_produtivo}
    Verifica e seleciona Iframe    ${processo_produtivo.iframe}

realizo o lancamento do processo produtivo
    [Documentation]    Keyword responsavel por realizar o cadastro do processo produtivo 
    Verifica, clica no elemento e evidenciar     ${processo_produtivo.limpar_filtro}
    Verifica, clica no elemento e evidenciar     ${processo_produtivo.cadastrar_processo}
    Verifica, inserir texto e evidenciar         ${processo_produtivo.cod_processo}    14032023
    Verifica, inserir texto e evidenciar         ${processo_produtivo.campo_descricao}    Processo Produtivo DT Atual
    Verifica, clica no elemento e evidenciar     ${processo_produtivo.tipo_nro_lote}
    Verifica, clica no elemento e evidenciar     ${processo_produtivo.op_automatico_global}
    Scroll Element Into View                     ${processo_produtivo.campo_planta_manufatura}
    Verifica, inserir texto e evidenciar         ${processo_produtivo.cod_planta_manufatura}    1
    Press Keys       None     TAB
    Evidenciar Elemento    ${processo_produtivo.desc_planta_manufatura}
    Scroll Element Into View    ${processo_produtivo.cod_processo}
    Verifica, clica no elemento e evidenciar     ${processo_produtivo.btn_salvar}
    Evidenciar elemento    ${processo_produtivo.campo_ativo}

realizo a exclusao do proccesso produtivo
    [Documentation]    Keyword responsavel por realizar os seguintes processos via API: 
    ...                1 - Realiza login na base de Producao
    ...                2 - Consulta o numero do ID processo 
    ...                3 - Realiza a exclusao do Processo Produtivo criado via WEB
    Login_API.realiza login na aplicacao com usuario e senha: ${LOGIN.producao.payload.user} ${LOGIN.producao.payload.password} ${AMBIENTES.producao.base_url}
    Login_API.Configurar jSession da sessao
    Consultar_Processo.consulto processo produtivo ${COMPOSICAO.params.consultar.processo_prod}
    Excluir_Processo.Excluir processo produtivo ${EXCLUIR.params.remover.service_name}