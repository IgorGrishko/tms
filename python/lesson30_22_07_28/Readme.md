### Script 1 (build.py):
- Build java app and create .tar archive.

### Script 1 (deploy.py):
- Deploy Vagrant VM from Python indicating dev or prod environment (example `py deploy.py dev`).
- Used `docker load` to load image built with build.py script.
- Run the conteiner inside VM.

### Note:
- As app was used a simple project java maven app https://github.com/jenkins-docs/simple-java-maven-app.
