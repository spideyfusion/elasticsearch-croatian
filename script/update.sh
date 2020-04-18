#!/usr/bin/env bash
set -euf -o pipefail

curl -o dict/hr_HR.aff https://raw.githubusercontent.com/krunose/hunspell-hr/master/hr_HR.aff
curl -o dict/hr_HR.dic https://raw.githubusercontent.com/krunose/hunspell-hr/master/hr_HR.dic
curl -o README_hr_HR.txt https://raw.githubusercontent.com/krunose/hunspell-hr/master/README_hr_HR.txt

echo -e "\e[32mDone!\e[39m"
