import vagrant
from fabric.api import env, execute, task, run
from sys import argv
import os

buildList = os.listdir("../../builds") # to take build name with .tar
fileName = buildList[0][0:-4] # to take build name without .tar

@task # tasks to run on VM
def mytask():
    run('docker load < /tmp/builds/'+buildList[0])
    run('docker run '+fileName)
    # run('docker images')
    # run('docker ps -a')

v_env = argv[1]
if v_env != 'dev' and v_env != 'prod':
    print('Entered environment does not exist.')
    quit()
else:
    print(f'Deployment into {v_env} environment.')

v = vagrant.Vagrant(quiet_stderr=False) # options: quiet_stdout=False, quiet_stderr=False
v.up(v_env)
env.hosts = [v.user_hostname_port(v_env)]
env.key_filename = v.keyfile(v_env)
execute(mytask)

print(f'Deployment into {v_env} environment is completed')
