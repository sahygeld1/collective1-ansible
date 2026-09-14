Deploy project in 2 lines 

sudo apt install -y ansible python3-pip

ansible-playbook -i inventory.ini deploy.yml


chmod +x /home/yc/collective1-ansible/deploy.sh

deploy.sh