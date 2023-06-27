*** Settings ***
Resource         ${ROOT}/Automacao-WEB/resource/main.robot

*** Test Cases ***

WEB - Cadastros - Incluir Navio
    [Tags]    WEB-Cadastro-IncluirDeNavio
    [Setup]    Realiza login
    [Teardown]    Close Browser
    Dado que acesso a tela Cadastro de Veiculos - Maritimo - Navio
    Quando incluo um navio e valido se foi incluido com sucesso
    Entao realizo a exclusao do do nacio cadastrado