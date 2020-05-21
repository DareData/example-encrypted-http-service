Always execute this first: 
```openssl genrsa 4096 > keys/acme-account.key```

ansible-galaxy install felixfontein.acme_certificate

First time it is run for the setup you need to run all
the playboooks:

```bash
ansible-playbook -i hosts machine-initial-setup.yml
ansible-playbook -i hosts install-nginx-and-certs.yml
ansible-playbook -i hosts install-app.yml
```
