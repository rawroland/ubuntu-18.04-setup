parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

if ! `which ansible >/dev/null 2>&1`; then
  echo "#### Install ansible ####"
  apt-get udpate
  apt-get install -y software-properties-common python-minimal python python-pip sshpass
  pip install pip --upgrade --user
  pip install setuptools --upgrade
  pip install pyopenssl ndg-httpsclient pyasn1
  pip install ansible
fi;

mkdir /etc/ansible
touch /etc/ansible/hosts
echo "\n[local]\n127.0.0.1 ansible_connection=local env=dev" | tee /etc/ansible/hosts

ansible-playbook "$parent_path/ansible/playbook.yml"
