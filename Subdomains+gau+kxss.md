```
#!/bin/bash

domain=$1
wordlist="/root/dicc.txt"

domain_enum() {

mkdir -p $domain $domain/sources  $domain/httpx  $domain/data $domain/xss

echo "subfinder" 

subfinder -d $domain -o $domain/sources/subfinder.txt

echo "Assetfinder"

assetfinder -subs-only $domain | tee $domain/sources/assetfinder.txt



cat $domain/sources/*.txt >$domain/sources/all.txt

echo "gau"

cat $domain/sources/all.txt | gau | tee $domain/data/gaudata.txt

echo "dalfox"

cat $domain/data/gaudata.txt | kxss | sed 's/=.*/=/' | sed 's/.*on //g' | dalfox pipe | tee $domain/xss/kxss


echo "Subjack"

subjack -w $domain/sources/all.txt -t 100 -timeout 30 -o $domain/results.txt -ssl -v





echo "httpx"

cat  $domain/sources/all.txt | httpx -title -content-length -status-code -silent | tee $domain/httpx/final.txt


}
domain_enum

```
