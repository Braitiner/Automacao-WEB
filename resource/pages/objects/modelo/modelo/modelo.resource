*** Variables ***

&{processo_produtivo}                 iframe=//iframe[contains(@src,'/mgeprod/ProcessoProdutivo')]
...                                   cadastrar_processo=//button[contains(.,'Processo Produtivo')]
...                                   cod_processo=//sk-number-input[@sk-field-name='CODPRC']//input
...                                   campo_descricao=//sk-text-input[@sk-field-name='DESCRABREV']//input
...                                   tipo_nro_lote=//sk-combobox[@sk-label='Tipo do Nro. Lote']
...                                   op_automatico_global=//div[@title='Automático (Global)']
...                                   campo_planta_manufatura=//span[contains(.,'Planta de Manufatura:')]
...                                   cod_planta_manufatura=//sk-pesquisa-input[@sk-label='Planta de Manufatura']//sk-text-input[@sk-value="codeValue"]//input
...                                   desc_planta_manufatura=//sk-typeahead-input[@title='Fabrica']
...                                   btn_salvar=//div[@class='buttons-container']//button[@ng-if="isShowSaveButton()"]
...                                   limpar_filtro=//sk-icon[@tooltip='Limpar filtros']
...                                   campo_ativo=//sk-combobox[@sk-label='Ativo'][contains(.,'Sim')]