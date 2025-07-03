# TLDScanner

This tool takes a base domain name and identifies the organization behind it using WHOIS data, then scans for matching domains across common TLDs (e.g., .net, .org, .co) to find other domains registered by the same organization. It helps discover related infrastructure owned by the same entity.

## Installation

```bash
git clone https://github.com/j4xx3n/TLDScanner.git

cd TLDScanner

chmod u+x tldscanner.sh

python3 -m venv venv

source venv/bin/activate

pip install python-whois
```
![image](https://github.com/user-attachments/assets/58acfb88-4048-48aa-9948-8e3115086386)
