#!/bin/bash
set -e

SCRIPT_NAME=$(basename "$0")
GREEN="\033[32m"
RESET="\033[0m"
BOLD="\033[1m"
RED='\033[0;31m'


# Function to check if a file exists
file_check()
{
	if [ ! -e "$1" ]; then
		echo -e "${RED}Error: File '$1' does not exist${RESET}"
		exit 1
	fi
}

usage()
{
	echo -e "\n		${BOLD}Created by ogorfti${RESET}\n"
	echo -e "${BOLD}Usage:${RESET}"
	echo "  ./$SCRIPT_NAME [OPTIONS] [FILES]"
	echo -e "${BOLD}Arguments:${RESET}"
	echo "  [OPTIONS]           Currently, the only option is to provide a commit message."
	echo "                      More options will be added in future versions."
	echo "  [FILES]             List of files to be staged and committed."
	echo "                      If '.', all files in the current directory will be added."
	echo -e "${BOLD}Examples:${RESET}"
	echo -e "  ${GREEN}./$SCRIPT_NAME:${RESET} 'commit message' [filename1] [filename2] [filename3] ..."
	echo -e "  ${GREEN}./$SCRIPT_NAME:${RESET} \"Add new feature\" file1.txt file2.txt file3.txt"
	echo -e "  ${GREEN}./$SCRIPT_NAME:${RESET} \"Fix bug\" ."
	echo ""
	exit 1
}

if [ $# -lt 2 ]; then
	usage
fi

MESSAGE="$1"
shift
if [ $# -eq 0 ]; then
	usage
elif [ "$1" = "." ]; then
	USE_DOT=true
	shift
else
	USE_DOT=false
	FILES=("$@")
fi

# Check if each file exists and perform Git operations
if [ "$USE_DOT" = false ]; then
	for file in "${FILES[@]}"; do
    file_check "$file"
	done
fi

if [ "$USE_DOT" = true ]; then
	git add .
else
	git add "${FILES[@]}"
fi

git commit -m "$MESSAGE"
git push

echo -e "${GREEN}${BOLD}Success:${RESET} Files staged, committed, and pushed successfully!"