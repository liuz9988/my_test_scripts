#!/bin/sh


## 克隆shylocks仓库脚本
if [ ! -d "/shylocks/" ]; then
    echo "未检查到shylocks仓库脚本，初始化下载相关脚本"
    git clone https://github.com/shylocks/Loon /shylocks
    cp -rf /shylocks/jd*.js /scripts/
else
    echo "更新shylocks脚本相关文件"
    git -C /shylocks reset --hard
    git -C /shylocks pull origin main --rebase
    cp -rf /shylocks/jd*.js /scripts/
fi

## 添加shylocks仓库脚本cron
sed -i "/^$/d" /shylocks/docker/crontab_list.sh
cat /shylocks/docker/crontab_list.sh >> /scripts/docker/merged_list_file.sh

## 京喜财富岛
wget -O /scripts/jx_cfd.js https://raw.githubusercontent.com/moposmall/Script/main/Me/jx_cfd.js
echo "# 京喜财富岛" >> /scripts/docker/merged_list_file.sh
echo "1 * * * * node /scripts/jx_cfd.js >> /scripts/logs/jx_cfd.log 2>&1" >> /scripts/docker/merged_list_file.sh
## 京喜财富岛提现
wget -O /scripts/jx_cfdtx.js https://raw.githubusercontent.com/Aaron-lv/JavaScript/master/Task/jx_cfdtx.js
echo "# 京喜财富岛提现" >> /scripts/docker/merged_list_file.sh
echo "0 0 * * * node /scripts/jx_cfdtx.js >> /scripts/logs/jx_cfdtx.log 2>&1" >> /scripts/docker/merged_list_file.sh



## 替换神仙书院助力码
sed -ie "52,53s/^[^\]*/ \`28xIs4YwE5Z7DrHgAFs-KjaagYOeSbbd51XjE1ahzY@35xIs4YwE5Z7HhZmFyW6ru5sXgzPNM9YCN_daEKswRxEdVhjuhXCKP@40xIs4YwE5Z7DsWOzDCOuR5WD3HNJSE5BExrVw8JzahcZB9gDEQ0XoZl3V7eZRt@39xIs4YwE5Z7FSXbOm_AjrIu7i42_qWz_JOg7jq1ig8lmzH9nm03YY9jX5KLY@39xIs4YwE5Z7CPQQ0baz9jNWO6PSZHsNWqfOwWyqScbJBGhg4v7HbuBg63TJ4@27xIs4YwE5Z7FGzJqrMmavC_vWKtbEaJxbz0Vahw@43xIs4YwE5Z7DsWOzDSP_N6WTDnbA0wBjjof6cA9FzcbHMcZB9wE1R3ToSluCgxAzEXQ@43xIs4YwE5Z7DsWOzDSEuRWEOROpnDjMx_VvSs5ikYQ8XgcZB9whEHjDmPKQoL16TZ8w/34xIs4YwE5Z7Dd9A30tnF_g5VVlIkonP1KzzAYZxDmQcG0TwOlqk@43xIs4YwE5Z7DsWOzDSP6lIEISWgGCypI95vuk7NoEdft8cZB9wEUFjjwpxNCM8usaJQ@43xIs4YwE5Z7DsWOzDSFfxVRtbrTkqpZM_6Q1cMm4ezuegcZB9wkMG2jyLTmbR1PTTJQ@43xIs4YwE5Z7DsWOzDSPKB7RvPqDyJGKRLCnBaMhNsWom4cZB9wBdW2j36tyUUSOCvCA@40xIs4YwE5Z7DsWOzDPAtJyWm1EK-N-dumROa6VHh3ZcZB9vxopyke03-Eh06nk@28xIs4YwE5Z7DrHgAFs-KjaagYOeSbbd51XjE1ahzY@35xIs4YwE5Z7HhZmFyW6ru5sXgzPNM9YCN_daEKswRxEdVhjuhXCKP@40xIs4YwE5Z7DsWOzDCOuR5WD3HNJSE5BExrVw8JzahcZB9gDEQ0XoZl3V7eZRt@39xIs4YwE5Z7FSXbOm_AjrIu7i42_qWz_JOg7jq1ig8lmzH9nm03YY9jX5KLY\`/g" /scripts/jd_immortal.js
## 替换炸年兽PK助力码
sed -ie "53,54s/^[^\]*/ \'IgNWdiLGaPaGs0uDAQyh59K4C82oUDFVaj0KSvjCNHk@IgNWdiLGaPaGs0uDAQyh59K4C80tlNXG_oFeCm0Ti6YF8IuyaSE@IgNWdiLGaPaGs0uDAQyh59K4C82uXRtZFndcBsrKXBjXd5V8eEFX@IgNWdiLGaPaGs0uDAQyh59K4C831AXcdYDILR72ONi7xW8OH\`/g" /scripts/jd_nian.js
