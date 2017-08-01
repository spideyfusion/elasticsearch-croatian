#!/usr/bin/env bash
set -euf -o pipefail

# Source directory which contains all the files required for building
SRC_DIR=../src

# Location of the Hunspell dictionary files
DICT_DIR=../dict

# File which we're going to modify so it becomes compatible with Elasticsearch
AFF_FILE=hr_HR.aff

# Who doesn't like pretty debugging messages?
function print_debug {
    printf -v MESSAGE_BUFFER "$@"
    printf "[%s] %s\n" "`date +"%Y-%m-%d %H:%M:%S"`" "${MESSAGE_BUFFER}"
}

mkdir -p .build && cd .build

rm -rf $(ls)
print_debug "Cleared the build directory so we can start fresh"

cp -t . ${DICT_DIR}/hr_HR.aff ${DICT_DIR}/hr_HR.dic ${SRC_DIR}/settings.yml
print_debug "Copied required files"

cp -t . ../CHANGELOG.md ../LICENSE.md ../README_hr_HR.txt ../README.md
print_debug "Copied documentation files"

ICONV_DEF_NUM=$(grep -m 1 'ICONV' ${AFF_FILE} | awk '{print $NF}')
print_debug "Found existing number of ICONV definitions: %d" ${ICONV_DEF_NUM}

ICONV_DEF_NUM_SRC=$(wc -l < ${SRC_DIR}/iconv.def)
print_debug "Number of extra ICONV definitions from source: %d" ${ICONV_DEF_NUM_SRC}

mapfile -t ICONV_DEF_LOCS < <(grep -n 'ICONV' ${AFF_FILE} | cut -f1 -d: | sed -n '1p;$p')
print_debug "Located ICONV definition locations: start => %d, end => %d" ${ICONV_DEF_LOCS[0]} ${ICONV_DEF_LOCS[1]}

MERGED_ICONV_LENGTH=$((${ICONV_DEF_NUM} + ${ICONV_DEF_NUM_SRC}))

sed -i "$(printf "%ds/ICONV %d/ICONV %d/" ${ICONV_DEF_LOCS[0]} ${ICONV_DEF_NUM} ${MERGED_ICONV_LENGTH})" ${AFF_FILE}
print_debug "Modified the ICONV definition count"

sed -i "$(printf "%d r ${SRC_DIR}/iconv.def" ${ICONV_DEF_LOCS[1]})" ${AFF_FILE}
print_debug "Appended extra ICONV definitions from source"

sed -i '/^[[:blank:]]*#/d;s/#.*//' ${AFF_FILE}
print_debug "Removed all the comments from the final file"

test $(grep 'ICONV' ${AFF_FILE} | wc -l) -eq $((${MERGED_ICONV_LENGTH} + 1))
print_debug "Verified the final version of the file to have the current number of ICONV definitions"

zip package $(ls)
print_debug "Prepared the package for the final release"

echo -e "\e[32mDone!\e[39m"
