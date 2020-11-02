```
#!/bin/bash

# Subdomain_Takeover

domain=$1
mkdir -p  subdomain_takeover/$domain subdomain_takeover/subdomains/$domain



subdomain_takeover()

{
echo "subfinder" 
subfinder -d $domain -o subdomain_takeover/subdomains/$domain/subfinder.txt
echo "Assetfinder"
assetfinder -subs-only $domain | tee subdomain_takeover/subdomains/$domain/assetfinder.txt

cat subdomain_takeover/subdomains/$domain/*.txt >subdomain_takeover/$domain/all.txt


echo "subjack"
subjack -w subdomain_takeover/$domain/all.txt -t 100 -timeout 30 -o subdomain_takeover/$domain/takeover.txt -ssl -v
}

subdomain_takeover

```
