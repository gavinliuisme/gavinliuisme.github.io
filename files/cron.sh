status=$(/home/$USER/.npm-global/bin/pm2 info vless | grep "status" | awk '{print $4}')
if [ "$status" == "stopped" ]; then
    /home/$USER/.npm-global/bin/pm2 restart vless
elif [ "$status" == "" ]; then
    /home/$USER/.npm-global/bin/pm2 resurrect
fi
/home/$USER/.npm-global/bin/pm2 ls
