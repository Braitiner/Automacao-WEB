*** Settings ***
Resource     ${ROOT}/Automacao-WEB/resource/main.robot
Resource     ${ROOT}/Automacao-WEB/resource/pages/objects/cadastros/cadastro_de_veiculos/maritimo/navio.resource

*** Keywords ***

#Keywords execucao
acesso a tela Cadastro de Veiculos - Maritimo - Navio
    [Documentation]    Keyword responsavel por acessar a tela Navios
    Acessar tela por campo Localizar    Navio    ${pagina_inicial.navio}
    Evidenciar Elemento    ${navio.btn_incluir}

incluo um navio e valido se foi incluido com sucesso
    [Documentation]    Keyword responsavel por preencher o formulario para cadastro do navio
    Verifica, clica no elemento e evidenciar   ${navio.btn_incluir} 
    Verifica, inserir texto e evidenciar     ${navio.input_nome}    TESTE    
    Verifica, inserir texto e evidenciar     ${navio.input_imo}    123456789    
    Verifica, clica no elemento e evidenciar   ${navio.modelo} 
    Verifica, clica no elemento e evidenciar   ${navio.seleciona_modelo}
    Verifica, clica no elemento e evidenciar   ${navio.capacidade_carga}
    Verifica, clica no elemento e evidenciar   ${navio.seleciona_capacidade}
    Verifica, clica no elemento e evidenciar   ${navio.btn_plus}
    Verifica, clica no elemento e evidenciar   ${navio.btn_salvar}
    Evidenciar Elemento    ${navio.msg_salvar}

realizo a exclusao do do nacio cadastrado
    [Documentation]    Keyword responsavel por excluir registro navio cadastrado
    Evidenciar Elemento    ${navio.excluir}
    Verifica, clica no elemento e evidenciar   ${navio.excluir}
    Verifica, clica no elemento e evidenciar   ${navio.btn_sim}
