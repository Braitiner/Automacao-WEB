*** Settings ***
Resource     ${ROOT}/Automacao-WEB/resource/main.robot
*** Variables ***
${input_usuario}=   document.querySelector('sankhya-login').shadowRoot
...                .querySelector('input#user')
${input_senha}=     document.querySelector('sankhya-login').shadowRoot
...                .querySelector('input#password')
${btn_prosseguir}=  document.querySelector('sankhya-login').shadowRoot
...                .querySelector('button.account-btn')

*** Keywords ***
realizar Login
    [Documentation]    esta keyword e responsavel por preencher campos do login e clicar em entrar
    [Arguments]    ${user}    ${password}

    Preencher campos de login e senha    ${user}    ${password}
    Verifica, clica no botao e evidenciar           elemento=${home_nao_logado.btn_entrar}    elemento2=${home_logado.campo_pesquisa}    msge_error="Cliquei no botao e estou aguardando carregar pagina

Preencher campos de login e senha
    [Documentation]    Keyword responsavel por preenchere dados do usuario a ser logado
    [Arguments]    ${user}    ${password}
    Verifica, inserir texto e evidenciar             elemento=${home_nao_logado.usuario_input}    texto=${user}       msge_error="Estou aqui login"
    Verifica, inserir senha e evidenciar             elemento=${home_nao_logado.senha_input}    texto=${password}    msge_error="Estou aqui senha"


Realizar login com sankhyaID
    [Documentation]    Keyword responsavel por interagir com elementos em shadow-root
    ...                para realizar o login nas aplicacoes skw.
    [Arguments]    ${user}    ${password}
    Wait Until Element Is Visible    ${home_nao_logado.painel_login}
    Input Text       dom:${input_usuario}    ${user}
    Click Element    dom:${btn_prosseguir}
    Wait Until Element Is Visible    dom:${input_senha} 
    Input Text       dom:${input_senha}     ${password}
    Click Element    dom:${btn_prosseguir}
        TRY  
            Wait For Condition	    return document.readyState == "complete"
            Wait Until Element Is Not Visible    ${Barra_carregar.carregamento}
            Wait Until Element Is Visible    ${home_logado.campo_pesquisa}
            ${web_elemento}    Get WebElement    ${home_logado.campo_pesquisa} 
            Salvando imagem de evidencia
        EXCEPT    AS    ${erro_sistema}
            Criar mensagem de erro    ${home_logado.campo_pesquisa}    ${erro_sistema}    ${msge_error}
        END

        IF  '${home_logado.campo_pesquisa}' != '${EMPTY}'
            TRY
                Wait Until Element Is Visible    ${home_logado.campo_pesquisa}    
            EXCEPT    AS    ${erro_sistema}
                Criar mensagem de erro    ${home_logado.campo_pesquisa}     ${erro_sistema}    ${msge_error}
            END
        END

    
