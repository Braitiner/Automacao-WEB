*** Settings ***
Resource         ${ROOT}/Automacao-WEB/resource/main.robot
# Test Teardown    Fechar navegador

*** Test Cases ***
Realizar login na aplicacao Flow Cargo
    [Tags]    API-Login-ChecagemDeAcesso
    Quando realiza login com usuario valido com params: ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.NOME} ${AMBIENTES.BASE_MODELO.DADOS_LOGIN.SENHA}
    Entao validar Login foi realizado com sucesso
