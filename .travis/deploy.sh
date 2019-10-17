# !/bin/bash

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
echo -e "Host $server_address\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-add .travis/deploy_key
ssh -i .travis/deploy_key lx_zander2@www.seriousandprogamers.com <<EOF
    cd spgsite-webapp && git pull
    cd spgsite-webapp/Frontend
    npm install
    npm run build
    rm -r /web-app/Frontend/*
    rsync -r dist/* /web-app/Frontend/
EOF
