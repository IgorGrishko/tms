### Automated web server deploy and creating SSL cert using Vagrant VM
- Create self-signed certificate
- Add cert to web server and setup listening HTTPS
- Redirect HTTP to HTTPS
- Redirect `www.anyname.local` to `anyname.local`

### On host system
- edit hosts file to access web server IP with `anyname.local`
- Copy `scripts` from this repo into Vagrant main directory

### Notes
- Server name `tms.local` was used in the task and must be edited in `cert_info_file.txt` and `ssl.conf` if it needs to be changed.
