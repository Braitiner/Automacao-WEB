*** Settings ***
Resource         ${ROOT}/Automacao-WEB/resource/main.robot
Test Setup       Abrir navegador chrome
Test Teardown    Fechar navegador

*** Test Cases ***
Realiza login na base do COMERCIAL com usuario valido
    [Tags]    WEB-CONFIGURACOES-LoginChecagemDeAcesso    #SKQA-192
    Acessar Sankhya OM    ${WEB_SITE.COMERCIAL.URL}
    Realizar login com sankhyaID    ${WEB_SITE.COMERCIAL.USER_DATA.NAME}     ${WEB_SITE.COMERCIAL.USER_DATA.PASSWORD}

Realiza login na FOLHA com usuario valido
    [Tags]    WEB-CONFIGURACOES-LoginChecagemDeAcesso    #SKQA-192
    Acessar Sankhya OM    ${WEB_SITE.FOLHA.URL}
    Realizar login com sankhyaID    ${WEB_SITE.FOLHA.USER_DATA.NAME}     ${WEB_SITE.FOLHA.USER_DATA.PASSWORD}

Realiza login na CONTRATOS e SERVICOS com usuario valido
    [Tags]    WEB-CONFIGURACOES-LoginChecagemDeAcesso        #SKQA-192
    Acessar Sankhya OM    ${WEB_SITE.CONTRATOSESERVICOS.URL}
    Realizar login com sankhyaID    ${WEB_SITE.CONTRATOSESERVICOS.USER_DATA.NAME}     ${WEB_SITE.CONTRATOSESERVICOS.USER_DATA.PASSWORD}

