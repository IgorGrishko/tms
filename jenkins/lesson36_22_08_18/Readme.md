### Deploy infra:
- Deploy jenkins.
- Deploy local VCS (Gitea).
- Setup integration VCS-jenkins.
- Setup multibranch pipeline.

### Jenkinsfile:
- Create function for parallel job execution.
- Create function for staging.
- Set to keep only three recent jobs.
- Set to check if there were changes in java code.
- Create image (only if branch name is `dev` or `master`).
- Push image to Docker hub (only if branch name is `dev` or `master`).
