*** Settings ***
Resource    ${ROOT}/Automacao-WEB/resource/main.robot

*** Keywords ***
Realiza login com usuario valido
    [Documentation]    Keyword responsavel por realizar login na base da folha
    Abrir navegador chrome
    Acessar Sankhya OM    ${AMBIENTES.BASE_MODELO.URL}
    Realizar login com sankhyaID     ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.NOME}    ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.SENHA}