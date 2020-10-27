```
#!/bin/bash

domain=$1
wordlist="/root/dicc.txt"

domain_enum() {

mkdir -p $domain $domain/sources  $domain/httpx  $domain/data $domain/xss

runBanner "subfinder" 

subfinder -d $domain -o $domain/sources/subfinder.txt

runBanner "Assetfinder"

assetfinder -subs-only $domain | tee $domain/sources/assetfinder.txt



cat $domain/sources/*.txt >$domain/sources/all.txt

runBanner "waybackurls"

cat $domain/sources/all.txt | waybackurls | tee $domain/data/waybackdata.txt

runBanner "gau"

cat $domain/sources/all.txt | gau | tee $domain/data/gaudata.txt

runBanner "dalfox"

cat $domain/data/*.txt | kxss | sed 's/=.*/=/' | sed 's/.*on //g' | dalfox pipe | tee $domain/xss/kxss


runBanner "Subjack"

subjack -w $domain/sources/all.txt -t 100 -timeout 30 -o $domain/results.txt -ssl -v





runBanner "httpx"

cat  $domain/sources/all.txt | httpx -title -content-length -status-code -silent | tee $domain/httpx/final.txt


}
domain_enum

```
