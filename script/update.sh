#!/usr/bin/env bash
set -euf -o pipefail

curl -o dict/hr_HR.aff https://raw.githubusercontent.com/krunose/hr-hunspell/master/hr_HR.aff
curl -o dict/hr_HR.dic https://raw.githubusercontent.com/krunose/hr-hunspell/master/hr_HR.dic
curl -o README_hr_HR.txt https://raw.githubusercontent.com/krunose/hr-hunspell/master/README_hr_HR.txt

# Apply dictionary specific patches
sed -i -e "$(<src/dic.patch)" dict/hr_HR.dic

echo -e "\e[32mDone!\e[39m"
