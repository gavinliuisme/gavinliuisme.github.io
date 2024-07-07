#!/bin/bash

if [ -z "$1" ]; then
    echo "请传入参数1：端口，参数2：uuid(可选)"
    exit 1
fi

echo '安装pm2'
bash <(curl -s https://raw.githubusercontent.com/k0baya/alist_repl/main/serv00/install-pm2.sh)

cd ~/domains/$USER.serv00.net

echo '安装vless'
git clone https://github.com/qwer-search/serv00-vless && mv -f serv00-vless vless && cd vless && rm -f README.md

echo '安装依赖'
npm install

echo '替换端口'
sed -i '' "s/|| 3000/|| $1/" app.js

if [ -n "$2" ]; then
    echo '替换uuid'
    sed -i '' "s/37a0bd7c-8b9f-4693-8916-bd1e2da0a817/$2/" app.js
fi

echo '启动vless'
~/.npm-global/bin/pm2 start app.js --name vless

echo '保存pm进程'
~/.npm-global/bin/pm2 save
