*** Settings ***
Resource    ${ROOT}/Automacao-WEB/resource/main.robot

*** Variables ***
${status}
${xpath_mutavel}    //div[@ng-if="demonstrativos.length != 0"]//md-list-item[contains(.,'{item_da_lista}'){lista_maior_2}]//p
${xpath_maior_que_1}     ${SPACE}or contains(.,'{item_da_lista}')
${numero_repeticao}   ${0}
${pipe_chrome_options}    add_argument("--incognito"); 
...                  add_experimental_option("excludeSwitches", ["enable-logging"]);
...                  add_argument("--headless"); add_argument("--disable-dev-shm-usage"); 
...                  add_argument("--no-sandbox")
${local_chrome_options}    add_argument("--incognito"); 
...                  add_experimental_option("excludeSwitches", ["enable-logging"])

*** Keywords ***
Abrir navegador chrome
    [Documentation]    Keyword responsavel por abrir o navegador definido
    IF  '${ENV}'=='PIPE'
        ${chrome_options}    Set Variable    ${pipe_chrome_options}
    ELSE
        ${chrome_options}    Set Variable    ${local_chrome_options}
    END
    Open Browser    browser=chrome    options=${chrome_options}
    Set Window Position    -8     -8
    Set Window Size        1920    1080

Fechar navegador
    [Documentation]    Keyword responsavel por finalizar o navegador
    Close Browser

Acessar flowcargo
    [Documentation]    esta keyword e responsavel por acessar SkOm
    [Arguments]    ${url}
    Go To    ${url}

Acessar tela por campo pesquisa
    [Documentation]    Keyword responsavel pela acao de clicar no campo de pesquisa
    ...                inserir texto e clicar no card da tela desejada
    [Arguments]    ${text}    ${element}    ${msge_error}=${EMPTY}
    Wait Until Element Is Not Visible    ${home_nao_logado.load_panel}
    Wait Until Element Is Visible    ${home_logado.campo_pesquisa}
    Click Element        ${home_logado.campo_pesquisa}
    Input Text    ${home_logado.campo_pesquisa}    ${text}
    Wait Until Element Is Visible    ${element}
    Click Element       ${element}

Esperar campo conter texto desejado apartir deste elemento:
    [Documentation]    Keyword responsavel pela espera de um texto em um input
    ...                onde realizara tentativas de ate 10 segundos onde cada
    ...                repeticao tem o delay de 1 segundo
    [Arguments]    ${element}    ${text}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${element}    ${msge_error}
    Wait Until Keyword Succeeds    30s    1s    Textfield Should Contain   ${element}    ${text}

Clicar com JS no webelement:
    [Documentation]
    [Arguments]    ${web_element}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${web_element}    ${msge_error}
    ${element_xpath}  Get WebElement    ${web_element}   
    Execute Javascript    arguments[0].click();     ARGUMENTS    ${element_xpath}

Validar lista de elementos web
    [Documentation]    Keyword responsavel por realizar validacoes em listas
    ...                para utilizar deve passar uma lista como parametro de
    ...                comparacao
    [Arguments]    ${elements}    ${validations}
    ${cont}    Set Variable    0
    FOR  ${element}  IN  @{elements}
         ${element_text}    Get Text    ${element}
         Should Be Equal    ${element_text}    ${validations}[${cont}]
         ${cont}    Evaluate    ${cont} + 1
    END

Escrever com delay
    [Documentation]    Keyword responsavel por passar string caracter por caracter simulando a digitacao humana  e verificar se seu preenchimento foi conluido com sucesso, caso negativo
    [Arguments]    ${element}    @{text}    ${msge_error}=${EMPTY}
    @{list_text}    Convert To List     @{text}
     Evidenciar elemento    ${element}    ${msge_error}
    FOR  ${character}  IN  @{list_text}       
        Input Text   ${element}    ${character}    clear=False
        Sleep    200ms
    END

Escolher data web
    [Documentation]    Keyword responsavel por funcao que permite a escolha de data baseada na
    ...                data atual + quantidade de dias desejados
    [Arguments]     ${dias}
    ${date_now}     Auxiliar.Get Current Date  
    ${choosed_date}     Add Time To Date    ${date_now}  ${dias} days   result_format=%d/%m/%Y
    RETURN     ${choosed_date}

Colorir elemento
    [Documentation]    Keyword responsavel por colorir webelement com JS
    [Arguments]    ${locator}
    ${elemento}    Get WebElement    ${locator}
    Execute Javascript    arguments[0].setAttribute('style', 'background: yellow; border: 2px solid red')   ARGUMENTS    ${elemento} 

Descolorir elemento
    [Documentation]    Keyword responsavel por descolorir webelement com JS
    [Arguments]    ${locator}
    ${elemento}    Get WebElement    ${locator}
    Execute Javascript    arguments[0].setAttribute('style', 'background: default; border: 2px default')    ARGUMENTS    ${elemento}

Evidenciar elemento
    [Documentation]   Keyword responsavel executar a verificacao dos elementos bem como verificar rotinar de telas como:
    ...               aguardar carregamento por completo da pagina, verificar se o elemento está disponivel/visivel na tela,
    ...               evidenciar o elemento com uma coloracao, salvar uma imagem deste elemento evidenciado e 
    ...               alertar no terminal algum erro encontrado identificando o elemento em que houve essa "quebra".
    [Arguments]    ${elemento}    ${msge_error}=${EMPTY}    ${texto}=${EMPTY}
        TRY  
            Wait For Condition	    return document.readyState == "complete"
            Wait Until Element Is Visible    ${elemento}
            ${web_elemento}    Get WebElement    ${elemento} 
            Colorir elemento    ${web_elemento}
            Wait Until Page Contains Element      css:*[style*="background: yellow; border: 2px solid red"]
            Salvando imagem de evidencia
            Descolorir elemento    ${web_elemento}
        EXCEPT    AS    ${erro_sistema}
            Criar mensagem de erro    ${elemento}    ${erro_sistema}    ${msge_error}
        END
        IF  '${texto}' != '${EMPTY}'
            Textfield Value Should Be    ${elemento}    ${texto}         
        END

Evidenciar elemento pos acao
    [Documentation]   Keyword responsavel executar a verificacao dos elementos que virao apos execucao do primeiro elemento em tela
    ...               executando as mesmas rotinas do EVIDENCIAR ELEMENTO
    [Arguments]    ${elemento}=${EMPTY}    ${msge_error}=${EMPTY}
    IF  '${elemento}' != '${EMPTY}'
        TRY
            Evidenciar elemento    ${elemento}    ${msge_error}
        EXCEPT    AS    ${erro_sistema}
            Criar mensagem de erro    ${elemento}    ${erro_sistema}    ${msge_error}
        END
    END

Verifica, captura o elemento e evidenciar
    [Documentation]    Keyword responsavel por pegar elemento para evidencia log
    ...                **** KEYWORD EM CONSTRUCAO, NAO UTILIZAR ****
    [Arguments]    ${elemento}    ${atributo}    ${time}=${EMPTY}    ${msge_error}=${EMPTY}
    IF  '${time}' == '${EMPTY}'
        ${time}    pegar horario em numero
        ${end_time}    somar n em horario    5m    ${time}
    END
    Evidenciar elemento    ${elemento}    ${msge_error}
    ${elemento_capturado}    get element attribute    ${elemento}    ${atributo}
    IF  '${elemento_capturado}' == '${EMPTY}'
        IF  ${time} <= ${end_time}
            pegar horario em numero
            Verifica, captura o elemento e evidenciar    ${elemento}    ${atributo}
        ELSE
            Criar mensagem de erro    elemento=${elemento}    msg_console=${EMPTY}    msge_error=Elemento foi localizado, porem mesmo apos 5 minutos interagindo com ele, o atributo localizado veio vazio
        END
    END
    RETURN    ${elemento_capturado}

Clicar elemento com delay
    [Documentation]    Keyword responsavel por realizar click com atraso que e determinado pelo arugmento ${tempo} em "ms"
    ...                aconselhavel nao usar mais que 1000ms
    [Arguments]    ${elemento}    ${tempo}    ${msge_error}=${EMPTY}
    Sleep    ${tempo}ms
    Evidenciar elemento    ${elemento}    ${msge_error}
    Click Element    ${elemento}
    
Troca e verifica Iframe
    [Documentation]    Keyword responsavel por realizar a troca de iframe, realizando a acao de Unselect Frame
    ...                e entrar em outro iframe com Select Frame.
    [Arguments]    ${iframe}
    Unselect Frame
    Wait Until Element Is Visible    ${iframe}
    Select Frame    ${iframe}

Verifica e seleciona Iframe
    [Documentation]    Keyword responsavel por realizar a troca de iframe, realizando a acao de Unselect Frame
    ...                e entrar em outro iframe com Select Frame.
    [Arguments]    ${iframe}
    Wait Until Element Is Visible    ${iframe}
    Select Frame    ${iframe}

Verifica, clica no botao e evidenciar
    [Documentation]    Keyword responsavel por realizar clicar no elemento e verificar se ele esta ativo, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${elemento2}=${EMPTY}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}
    Click Button    ${elemento}
    Evidenciar elemento pos acao    ${elemento2}

Verifica, clica no elemento e evidenciar
    [Documentation]    Keyword responsavel por realizar clicar no elemento e verificar se ele esta ativo, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${elemento2}=${EMPTY}     ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}
    Click Element    ${elemento}
    Evidenciar elemento pos acao    ${elemento2}

Verifica, inserir texto e evidenciar
    [Documentation]    Keyword responsavel por inserir texto e verificar se seu preenchimento foi conluido com sucesso, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}   ${texto}    ${elemento2}=${EMPTY}   ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}
    Input Text    ${elemento}    ${texto}
    Evidenciar elemento pos acao    ${elemento2}

Verifica, inserir senha e evidenciar
    [Documentation]    Keyword responsavel por inserir senha e verificar se seu preenchimento foi conluido com sucesso, caso negativo
    ...                sera apresentado no logo com coloracao diferenciada.
    [Arguments]    ${elemento}    ${texto}    ${elemento2}=${EMPTY}    ${msge_error}=${EMPTY}
    Evidenciar elemento    ${elemento}    ${msge_error}
    Input Password    ${elemento}    ${texto}
    Evidenciar elemento pos acao    ${elemento2}

Verifica, atualiza a pagina e evidenciar
    [Documentation]    Keyword responsavel por atualiza o navegador e validar se a pagina foi carregada corretamente, em caso negativo
    ...                sera apresentado uma mensagem de erro ao usuario.
    [Arguments]    ${elemento}    ${msge_error}=${EMPTY}
    Reload Page
    Evidenciar elemento    ${elemento}    ${msge_error}

Armazenar value webelement em lista
    [Documentation]    Keyword responsavel por armazenar os valores de documentos em uma lista
    ...                como argumentos passar uma lista de Xpath e a variavel lista que ira armazenar os dados
    ...                para futura comparacao
    [Arguments]    ${elements}
    @{lista}    Create List
    FOR  ${element}  IN  @{elements}
         ${element_text}    Get Text    ${element}
         Append To List    ${lista}    ${element_text}
    END 
    [Return]    @{lista}

armazenar lista de elementos de documento
    [Documentation]    Keyword responsavel por criar listas com nomes especificos e armazenar dados de uma lista de Xpath
    ...                necessario passar como argumento uma lista que contem um ou varios xpaths e passar a mesma quantidade de xpath em uma lista de nomes.
    [Arguments]    ${lista_de_xpaths}    ${lista_nomes}
    IF     len(${lista_de_xpaths}) == len(${lista_nomes})
        ${contador}    Set Variable    ${0}
        FOR    ${nome_da_lista}  IN  @{lista_nomes}
            ${lista_de_elementos}    Get WebElements    ${lista_de_xpaths}[${contador}]
            ${lista}    Armazenar value webelement em lista     ${lista_de_elementos}
            Set Suite Variable  ${${nome_da_lista}}  ${lista}
            ${contador}    Evaluate    ${contador} +1
        END
    ELSE
        Fail     "lista de nome e de xpaths nao tem tamanho igual"
    END
    
Validar documento guias
    [Documentation]    Keyword responsavel por validar a igualdade entre duas listas
    [Arguments]    ${elements}    ${validations}
    ${cont}    Set Variable    0
    FOR  ${element}  IN  @{elements}
         Should Be Equal    ${element}    ${validations}[${cont}]
         ${cont}    Evaluate    ${cont} + 1
    END
    
Montagem xpath customizado
    [Documentation]    Keyword responsavel por montar xpath customizado para realizar validacoes finais calculo rescisao, sendo necessario
    ...                passar a lista com os itens necessarios para a montagem do xpath.
    [Arguments]    @{lista_de_itens}
    ${count}    Set Variable     ${1}
    FOR    ${item}    IN    @{lista_de_itens}
        IF  len(${lista_de_itens}) == 1
             ${Xpath_formatado}    Format String    ${xpath_mutavel}
             ...                          item_da_lista=${item}
             ...                          lista_maior_2=${EMPTY}
              Return From Keyword    ${Xpath_formatado}
        ELSE IF    ${count}==1 and len(${lista_de_itens}) > 1
            ${Xpath_formatado}    Format String    ${xpath_mutavel}
             ...                          item_da_lista=${item}
             ...                           lista_maior_2={lista_maior_2}
        ELSE IF    ${count} < len(${lista_de_itens})
            ${xpath_configurado}    Format String    ${xpath_maior_que_1}
            ...                          item_da_lista=${item}
            ${Xpath_formatado}    Format String    ${Xpath_formatado}
            ...                          lista_maior_2=${xpath_configurado}{lista_maior_2}
        ELSE
            ${xpath_configurado}    Format String    ${xpath_maior_que_1}
            ...                          item_da_lista=${item}
            ${Xpath_formatado}    Format String    ${Xpath_formatado}
            ...                          lista_maior_2=${xpath_configurado}
            Return From Keyword    ${Xpath_formatado}
        END
        ${count}    Set Variable    ${count + 1}
    END

validar documento baixado com o nome: ${nome_arquivo}
    [Documentation]    Keyword responsavel por validar que o arquivo foi baixado com sucesso.
    ...                passar tambem a extensao do arquivo Ex: .zip, .png., .jpg etc...
    ${user_home}=    Get Environment Variable     UserProfile
    Set Global Variable    ${user_home}
    ${download_arquivo}    Catenate    ${user_home}/Downloads/${nome_arquivo}
    Wait Until Keyword Succeeds    50x    1s    File Should Exist    ${download_arquivo}
    Excluir arquivo ${nome_arquivo}

Criar xpath com base na data atual
    [Documentation]    Keyword responsavel por extrair e concatenar a data atual junto ao xpath
    ...                para selecionar o dia correto do evento na agenda de recursos
    ${dia_atual}     Auxiliar.Get Current Date    result_format=%d
    ${dia_atual}    Convert to Integer    ${dia_atual}
    ${mes_atual}    Auxiliar.Get Current Date    result_format=%m
    ${mes_atual}    Convert to Integer    ${mes_atual}    
    ${mes_atual}     Evaluate    ${mes_atual}-int(1)
    ${ano_atual}    Auxiliar.Get Current Date       result_format=%Y 
    ${data_formatada}    Catenate     ${dia_atual}-${mes_atual}-${ano_atual}
    ${xpath_data}    Catenate    //div[contains(@class,'day-item day-${data_formatada}')]
    Set Global Variable   ${xpath_data}

Trocar de Aba no navegador
    [Documentation]    Keyword responsavel por verificar a quantidades de abas abertas no navegador (momento em que e chamada),
    ...                executar uma repeticao ate que a quantidade de abas abertas seja superior a inicial,
    ...                Selecionar uma das abas abertas por "nome", ou seja o elemento que ela recebe e o nome da aba em que ha a necessidade de troca.
    [Arguments]    ${elemento}
    ${todas_abas}=    Get Window Handles
    ${numeroAba}=    Get Length    ${todas_abas}
    
    ${numero_repeticao}    Set Variable   ${numero_repeticao+1}  
    Set Suite Variable     ${numero_repeticao}  
    IF   ${numeroAba} == 1
            IF   ${numero_repeticao} >= 50
            Fail   \nNao foi possivel encontrar a segunda Aba: ${elemento}
            END
            ${todas_abas}=    Get Window Handles
            ${numeroAba}=    Get Length    ${todas_abas}
        Trocar de Aba no navegador    ${elemento}
    ELSE IF  ${numeroAba} == 2
        FOR    ${index}    IN RANGE    0    ${numeroAba}
        Switch Window    ${todas_abas[${index}]}
        ${title}=    Get Title
        END
        Switch Window    ${elemento}
        ${title}=    Get Title
    END

Rolar Barra de Rolagem para o:
    [Documentation]    Keyword responsavel por realizar a rolagem da barra ate o elemento da tela.
    ...                sera executado ate o elemento estar visivel no centro da tela ou aparente.
    [Arguments]    ${elemento}
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${elemento}
    Run Keyword If    not ${is_visible}    Scroll Element Into View    ${elemento} 

Tranformar o mes numerico para escrito em portugues
    [Documentation]    Keyword responsavel por realizar a conversao do mes atual numerico para mes por extenso em portugues BR.
    ...                Basta chamar esta funcao e utilizar as variaveis que ja estao global.
    ${data_atual} =    Auxiliar.Get Current Date
    ${mes_numero}=    Convert Date    ${data_atual}    result_format=%m
    ${mes_numero}=    Convert To Integer    ${mes_numero}
    ${meses_portugues}=    Create List    Janeiro    Fevereiro    Março    Abril    Maio    Junho    Julho    Agosto    Setembro    Outubro    Novembro    Dezembro
    ${nome_mes}=    Set Variable    ${meses_portugues}[${mes_numero-1}]
    Set Global Variable    ${nome_mes}
    Set Global Variable    ${mes_numero}
    
Data referencia mes e ano atual
    [Documentation]    Keyword responsavel por pegar a data atual subistituir o dia por 01 
    ...                exemplo 13/01/2023 ficara 01/01/2023
    ${date_now}     Auxiliar.Get Current Date    result_format=%m/%Y
    ${data_referencia}    Catenate    SEPARATOR=/    01    ${date_now}
    RETURN    ${data_referencia}

Extrair primeiro e ultimo dia do mes atual
    [Documentation]    Keyword responsavel por concatenar o primeiro e o ultimo dia, de acordo com cada mes, onde avalia se o mesmo possui 30 ou 31 dias
    ...                e se o ano e bissexto ou nao
    ${dicionario}     Create Dictionary   Fev=28    FevBissexto=29      
    ${hoje}    Auxiliar.Get Current Date    result_format=%d/%m/%Y
    ${ano}     Set Variable    ${hoje.split('/')[2]}
    ${mes}     Set Variable    ${hoje.split('/')[1]}
    IF         '${mes}' == '02'
        ${ano%4}      Evaluate    ${ano} % 4
        ${ano%400}    Evaluate    ${ano} % 400
        ${ano%100}    Evaluate    ${ano} % 100
        IF    '${ano%4}' == '0' and '${ano%100}' != '0' or '${ano%400}' == '0'
            ${ultimo_dia}=    Catenate    ${dicionario.FevBissexto}/${mes}/${ano} 
        ELSE     
            ${ultimo_dia}=    Catenate    ${dicionario.Fev}/${mes}/${ano}
        END
    ELSE IF    '${mes}' in '[04, 06, 09, 11]'
        ${ultimo_dia}=    Catenate     30/${mes}/${ano}  
    ELSE IF   '${mes}' in '[01, 03, 05, 07, 08, 10, 12]'  
        ${ultimo_dia}=    Catenate    31/${mes}/${ano}
    END
    ${primeiro_dia}=    Catenate    01/${mes}/${ano}
    Set Global Variable    ${primeiro_dia}
    Set Global Variable    ${ultimo_dia}
    
Data referencia ano anterior
    [Documentation]    Keyword responsavel por pegar a data atual subistituir ultimo dia do ano anterior ao presente
    ...                exemplo 13/01/2023 ficara 31/12/2022
    ${data_atual}    Auxiliar.Get Current Date    result_format=%Y-%m-%d
    ${data_anterior}    Subtract Time From Date    ${data_atual}    365 days    result_format=%Y-%m-%d
    ${ano_anterior}    Convert Date    ${data_anterior}    result_format=%Y
    ${data_referencia}    Catenate    SEPARATOR=/    31/12    ${ano_anterior}
    RETURN    ${data_referencia}