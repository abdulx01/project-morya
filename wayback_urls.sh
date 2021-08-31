#!/bin/bash

printf "=================" | notify --silent
printf "Collecting waybackurls" | notify --silent
sleep 2
printf "=================" | notify --silent

cd ${RUNNING_PATH}
mkdir wayback
cd wayback

cat ${RUNNING_PATH}/subdomains/subdomains.txt | waybackurls | anew wayback.txt
wc -l wayback.txt | awk '{print $1 " URLS are founded by waybackurls"}' | notify --silent

cat ${RUNNING_PATH}/subdomains/subdomains.txt | gauplus | tee gau.txt
wc -l gau.txt | awk '{print $1 " URLS are founded by gau"}' | notify --silent

cat wayback.txt gau.txt | sort -u | tee urls.txt
wc -l urls.txt | awk '{print $1 " total URLS are founded by wayback and gauplus"}' | notify --silent

printf "=================" | notify --silent
printf "Waybackurls are collected" | notify --silent
sleep 2
printf "=================" | notify --silent
