*** Variables ***
&{pagina_inicial}    login=//H1[.="Login"]
...                  input_user=//input[@formcontrolname="username"]
...                  input_password=//input[@formcontrolname="password"]
...                  btn_entrar=//button[.="Entrar"]
...                  user_logged=//a[@class='fas fa-user']
...                  localizar=//input[@placeholder="Localizar"]
...                  navio=//a[@id="NAVIO"]