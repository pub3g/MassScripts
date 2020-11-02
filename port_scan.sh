```

#!/bin/bash
#Performs port scan using nmap

domain=$1
wordlist="/root/basic_recon/basic_recon.sh/$domain/sources/all.txt"
port_scan=$2

mkdir -p  port_scan port_scan/$domain
scan_port() {
        
        echo "Scanning ports for $1...."
        nmap -T4 $domain  | tee port_scan/$domain/T4_result.txt
\n\n
echo "subfinder" 

\n\n

subfinder -d $domain -o port_scan/$domain/subfinder.txt
\n\n

echo "Assetfinder"
\n\n

assetfinder -subs-only $domain | tee port_scan/$domain/assetfinder.txt
cat port_scan/$domain/*.txt >port_scan/$domain/all.txt

\n\n
echo "Running nmap on all the subdomains" \n\n

nmap -iL -T4  port_scan/$domain/all.txt | tee port_scan/$domain/Wordlist_result.txt




}

scan_port
```
