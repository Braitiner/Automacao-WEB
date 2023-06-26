*** Settings ***
Resource     ${ROOT}/Automacao-WEB/resource/main.robot
*** Keywords ***
realiza login com usuario valido com params: ${user} ${password}
    [Documentation]    Keyword responsavel por realizar login na base Modelo 
    Abrir navegador chrome
    Go To    ${AMBIENTES_WEB.BASE_MODELO.URL}
    Evidenciar elemento    ${pagina_inicial.login}
    Verifica, inserir texto e evidenciar             ${pagina_inicial.input_user}    texto=${user}
    Verifica, inserir texto e evidenciar             ${pagina_inicial.input_password}    texto=${password}
    Verifica, clica no elemento e evidenciar         ${pagina_inicial.btn_entrar}


validar Login foi realizado com sucesso
    Evidenciar elemento    ${pagina_inicial.user_logged}
    Evidenciar elemento    ${pagina_inicial.localizar}
    
