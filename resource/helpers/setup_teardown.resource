*** Settings ***
Resource    ${ROOT}/Automacao-WEB/resource/main.robot

*** Keywords ***
Realiza login
    [Documentation]    Keyword responsavel por realizar login 
    realiza login com usuario valido com params: ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.NOME} ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.SENHA}
    validar Login foi realizado com sucesso