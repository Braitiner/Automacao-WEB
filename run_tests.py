import os, sys, pytz
from datetime import datetime

def robot_local_exe():
    config_helper_path =  '-V ./resource/utils/config_path.py'
    
    SET_ENV= get_env()
    config_env = '-v ENV:' + SET_ENV

    # set the timezone to Brasilia
    br_tz = pytz.timezone('America/Sao_Paulo')
    now = datetime.now(br_tz)
    CURRENT_TIME= now.strftime("%d-%m-%y_%H-%M-%S")
    
    os.environ["OUTPUT_FOLDER"] = CURRENT_TIME
    with open("export_output_folder.sh", "w") as f:
        f.write(f"export OUTPUT_FOLDER='{CURRENT_TIME}'\n")
    
    result_path = f'results/{CURRENT_TIME}/logs'
    result_name = 'junit_result'
    
    tags = config_tags()
    
    os.system(f"echo ==============================================================================")
    os.system(f"echo DADOS DA EXECUÇÃO")
    os.system(f"echo ==============================================================================")
    os.system(f"echo Sessão: {SET_ENV}")
    os.system(f"poetry run robot --suitestatlevel 3 -L trace -d {result_path} -x {result_name} {config_helper_path} {config_env} {tags} ./test")

def config_tags():
    args = sys.argv[1:]
    argumento = ' '.join(str(arg) for arg in args)
    return argumento

def get_env():
    var_name = 'SET_ENV'
    if var_name in os.environ:
        SET_ENV = os.environ[var_name]
    else:
        SET_ENV = 'LOCAL'
    return SET_ENV