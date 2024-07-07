#!/bin/bash

if [ -z "$1" ]; then
    echo "第一个参数不能为空"
    exit 1
fi

bash <(curl -s https://raw.githubusercontent.com/k0baya/alist_repl/main/serv00/install-pm2.sh)

cd ~/domains/$USER.serv00.net

git clone https://github.com/qwer-search/serv00-vless && mv -f serv00-vless vless && cd vless && rm -f README.md

npm install

sed -i '' "s/|| 3000/|| $1/" app.js

if [ -n "$2" ]; then
    sed -i '' "s/37a0bd7c-8b9f-4693-8916-bd1e2da0a817/$2/" app.js
fi

~/.npm-global/bin/pm2 start app.js --name vless

~/.npm-global/bin/pm2 save
