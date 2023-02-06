### Docker-compose:
- Deploy Jenkins master
- Deploy Jenkins dev
- Deploy Jenkins prod

### Jenkinsfile:
- Set to keep only two recent jobs.
- Create option to select `dev` or `prod` environent.
- Authenticate to pull packages from storage (creds to caccess `ghcr.io` must be set in Jenkins).
- Deploy packages into selected environent.
