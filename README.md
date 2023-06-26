# Projeto de automação de WEB

* Projeto destinado à criação das automações de WEB que a __Sankhya__ utiliza na sua maioria dos clientes para garantia dos serviços prestados aos mesmos.
Neste documento falaremos sobre o projeto como um todo, desde as arquiteturas que temos até as configurações iniciais para rodar o projeto na sua máquina.

1. Instalações necessárias:
    * Python 3 - https://www.python.org/downloads/
    * Visual Studio Code - https://code.visualstudio.com/download
    * Git - https://git-scm.com/downloads
    * Extenções utilizadas no Visual Studio Code
        * Python (Microsoft)
        * Cucumber (Gherkin) Full Support (Alexander Krechik)
        * GitLens — Git supercharged (GitKraken)
        * Jupyter (Microsoft)
        * Jupyter Cell Tags (Microsoft)
        * Jupyter Keymap (Microsoft)
        * Jupyter Notebook Renderers (Microsoft)
        * Jupyter Slide Show (Microsoft)
        * Live Share (Microsoft)
        * Path Intellisense (Christian Kohler)
        * Project Manager (Alessandro Fragnani)
        * Pylance (Microsoft)
        * Robot Code Daniel Biehl
        * Snippets and Syntax Highlight for Gherkin (Cucumber) (Euclidity)
        * vscode-icons (VSCode Icons Team)

2. Clonando projeto:

    * acessar gitlab: https://git.sankhya.com.br/plataforma-w/qa-at/robotframework-at/automacao_web

    * No gitlab navegar até clone >> Clone with HTTP e copiar link

    * Criar uma pasta destinada para salvar o projeto

    * Abrir terminal de sua preferência (cmd, powershell, bash) na pasta do projeto comando:  
        ```
        cd 'pasta-do-projeto' 
        ```

    * Rodar comando:
  
        ```
        git clone 'informar-link-projeto'
        ```

    * informar e*mail e senha gitlab da sankhya

    * __obs__: Com o projeto clonado abri-lo na raiz (a pasta que foi clonada no terminal abrir a pasta do projeto (comando: cd 'pasta-do-projeto') e rodar o comando:
        ```
            code .
        ```

3. Configurando o projeto
    * Criando ambiente virtual
        * __Venv__ comando:
            ```
            python -m venv ./venv-web
            ```

          obs: após instalar você pode ativar a venv com comando

          cmd
          ~~~cmd
          .\venv-web\Scripts\activate.bat
          ~~~

          powershel
          ~~~powershell
           .\venv-web\Scripts\Activate.ps1 
           ~~~



    * Instalando Dependencias do projeto
        * Obs: comando deve ser rodado com a venv aberto
        * __Requirements__ comando: 
            ```
            pip install -r .\requirements.txt
            ```
          __Poetry__ comando: 
            ``` 
            pip install poetry 
            ```

    * Configurando Pluging __RobotCode__
    No vs code navegar Extensions >> Robot Code >> Manage >> Extension Settings >> aba Workspace >> Robotcode > Robot: Variables >> Edit in settings.json
    Com o arquivo settings.json aberto informar o diretório que está o projeto
        
        Ex: 
        ```
        {
            "robotcode.robot.variables": {
                "ROOT": "C:\\Users\\maquina\\Desktop\\robot-web\\automacao_web"
            }
        }
        ```

4. Validando instalação
    * No Vs code com o projeto e venv abertos rodar o comando: 
        ```
        poetry run web -i WEB-CONFIGURACOES-LoginChecagemDeAcesso 
        ```

5. Arquitetura do projeto
    * Entendendo a arquitetura
        * Dados utilizados no projeto
        * Keywords e seus propósitos
        * Resource
        * Testes
    * Padrão de escrita
    * Como criar um componente novo
    * Como trabalhar com massa de dados
        * Testes
    * Padrão de escrita
    * Como criar um componente novo
    * Como trabalhar com massa de dados