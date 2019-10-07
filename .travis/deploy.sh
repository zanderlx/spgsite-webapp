# !/bin/bash

eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
echo -e "Host $server_address\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config
ssh-add .travis/deploy_key
git remote add spgsite-webapp lx_zander2@www.seriousandprogamers.com:/home/lx_zander2/spgsite-webapp.git
git push spgsite-webapp master
ssh -i .travis/deploy_key lx_zander2@www.seriousandprogamers.com <<EOF
    cd spgsite-webapp/Frontend
    npm install
    npm run build
    rm /web-app/Frontend/*
    rsync -r dist/* /web-app/Frontend/
EOF
