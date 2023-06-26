*** Settings ***
#BIBLIOTECAS
Library    SeleniumLibrary    run_on_failure=None    timeout=0:01:00
Library    RequestsLibrary
Library    OperatingSystem
Library    DateTime
Library    Collections
Library    String
Library    BuiltIn
Library    RPA.PDF

#IMPORT MAIN API PROJECT
Resource    ${ROOT}/Automacao-API/resource/main.robot

#VARIAVEIS YAML
Variables    ${ROOT}/Automacao-WEB/resource/data/data_config_web_test.yaml

#HELPERS
Resource    ${ROOT}/Automacao-WEB/resource/helpers/helpers.resource
Resource    ${ROOT}/Automacao-WEB/resource/helpers/setup_teardown.resource

#PAGE - OBJECTS GLOBAIS
Resource     ${ROOT}/Automacao-WEB/resource/pages/objects/home/home_objects.resource

#LOGS
Resource    ${ROOT}/Automacao-WEB/resource/log/console_log.resource
Resource    ${ROOT}/Automacao-WEB/resource/log/evidencias.resource

#PAGE - ACTIONS + BASICS(KEYWORDS DE TESTES)
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/Basics.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/home/Login_Actions.resource
Resource    ${ROOT}/Automacao-WEB/resource/pages/actions/keywords/Cadastros/cadastro_de_veiculos/maritimo/Navio.resource
