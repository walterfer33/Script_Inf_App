#!/bin/bash
sudo yum update -y
sudo yum install git -y
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
#https://stackoverflow.com/questions/54415841/nodejs-not-installed-successfully-in-aws-ec2-inside-user-data
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 7
nvm install node -y
node -e "console.log('Running Node.js ' + process.version)"
#mkdir /tmp/proyecto #Comando para crear carpetas
cd
git clone https://github.com/walterfer33/waiting-list.git
cd /waiting-list
pwd
npm install
npm install -g pm2
pm2 start index.js

sudo amazon-linux-extras list | grep nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum -y install nginx
nginx -v
cd /etc/nginx
sudo aws s3 cp s3://nginx-ceutec-infra/nginx.conf nginx.conf
sudo service nginx restart

