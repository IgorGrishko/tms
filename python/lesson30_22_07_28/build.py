import argparse
import json
import subprocess
import os

def set_root_dir():
    while os.path.basename(os.getcwd()) != 'tms':
        os.chdir('..')
        if os.getcwd() == os.path.split(os.getcwd())[0]:
            raise Exception('no find root')

def generate_build_name() -> str:
    return subprocess.check_output(['git', 'log', '-1', '--format=\'%ad.%h\'', '--date=format:%Y%m%d-%H%M']).strip().decode("utf-8")[1:-1]

def worker(build_name: str, path: str):
    set_root_dir()
    print(f'BUILD: {build_name}')
    build(build_name, path)
    print(f'FINISH: {build_name}')
    print(f'SAVE IMAGE: {build_name}')
    save(build_name)
    print(f'FINISH SAVE: {build_name}')
    return True

def build(build_name: str, path: str):
    os.system(f"docker build -t {build_name} -f {path}/Dockerfile {path}")

def save(build_name):
    os.mkdir('builds')
    os.system(f"docker save --output builds/{build_name}.tar {build_name}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Build from file.')
    parser.add_argument('-f', '--file', type=str, help='select file with services')
    args = parser.parse_args()
    services = args.file if args.file else 'services.json'

    with open(services, 'r') as services_file:
        apps=json.load(services_file)

    build_name = generate_build_name()

    for app in apps:
        worker(f'{app}_{build_name}', apps[app]['path'])
