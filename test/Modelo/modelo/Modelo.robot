*** Settings ***
Resource         ${ROOT}/Automacao-WEB/resource/main.robot

*** Test Cases ***

WEB - Producao - Lancamento de Processo Produtivo de transferencia e producao
    [Tags]    WEB-PRODUCAO-LancamentoDeProcessoProdutivoDeTransferenciaEProducao   #SKQA-134
    [Setup]       Realiza login na PRODUCAO com usuario valido
    [Teardown]    Close Browser
    Dado que acesso a tela Processo Produtivo Nova
    Quando realizo o lancamento do processo produtivo
    Entao realizo a exclusao do proccesso produtivo