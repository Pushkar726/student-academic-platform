# Ansible setup for Student Academic Platform
# Install (once): pip install ansible
# Syntax check: ansible-playbook ansible/playbook.yml --syntax-check
# Dry run: ansible-playbook ansible/playbook.yml -i ansible/inventory.ini --check
# Live run (local, safe): ansible-playbook ansible/playbook.yml -i ansible/inventory.ini
# Notes:
# - Docker tasks use community.docker; install with `ansible-galaxy collection install community.docker` if needed.
# - Tasks use ignore_errors where Docker may be unavailable so the playbook documents intent without failing submission environments.
# - Never store SSH keys, passwords, or tokens in git. Use Ansible Vault for secrets.
