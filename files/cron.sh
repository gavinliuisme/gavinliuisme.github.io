process_count=$(pm2 list | grep "vless" | wc -l)
if [ "$process_count" -gt 1 ]; then
    echo "The process count for 'vless' is $process_count"
else
    status=$(/home/$USER/.npm-global/bin/pm2 info vless | grep "status" | awk '{print $4}')
    if [ "$status" == "stopped" ]; then
        /home/$USER/.npm-global/bin/pm2 restart vless
    elif [ "$status" == "" ]; then
        /home/$USER/.npm-global/bin/pm2 resurrect
    fi
fi
