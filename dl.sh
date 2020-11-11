#!/bin/sh
echo "Executing pantavisor download script"
deviceToken=`cat ph_autojointoken | jq -r ".token"`
host=`cat ph_api_host`
config=`echo -n -e "configargs=ph_factory.autotok=${deviceToken} ph_creds.host=${host}\0" | base64 -w 0`
url="https://images.apps.pantahub.com/get?device=x64-uefi&config=${config}&channel=release-candidate"
wget "${url}" -q --show-progress -O pantavisor.img.gz
echo "Image downloaded: "
echo "$pwd/pantavisor.img.gz"
