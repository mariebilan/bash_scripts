#!/usr/bin/env bash
echo "The most requests was from IP address:"
cut -d " " -f 1 apache_logs.txt | sort | uniq -c | sort -nr | head -n 1 
echo "The most requested page was:"
cat apache_logs.txt | grep -Eo "(http|http)://[a-zA-Z0-9./?=_%:-]*" | sort -u | head -n 1
echo "From each IP address, there were this  many requests:"
cut -d " " -f 1 apache_logs.txt | sort | uniq -c | sort -n
echo "The response codes are:"
awk '{print $9}' apache_logs.txt | sort | uniq -c | sort -r
echo "response code 304:"
awk '($9 ~ /304/)' apache_logs.txt | awk '{print $9, $7}' | uniq -c | sort -r
echo "response code 302:"
awk '($9 ~ /302/)' apache_logs.txt | awk '{print $9, $7}' | uniq -c | sort -r
echo "The time when the site gets the most requests:"
awk '{print $4}' apache_logs.txt | sort | uniq -c | sort -nr | head -n 1
echo "This search bots have accessed the site:"
awk -F\" '{print $6}' apache_logs.txt | sort | uniq -c | sort -fr
