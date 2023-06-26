*** Settings ***
Resource    ${ROOT}/Automacao-WEB/resource/main.robot

*** Keywords ***
Capturar printscreen da tela
    [Documentation]    Keyword responsavel por validar se o elemento esta visivel para 
    ...                capturar a tela como evidencia
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}
    Evidenciar elemento              ${element}