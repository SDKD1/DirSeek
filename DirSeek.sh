#!/bin/bash 
#########################
# DIRSEEK |  SDKD1 #
#########################

COR_VERDE='\033[0;32m'
COR_AMARELA='\033[0;33m'
COR_VERMELHA='\033[0;31m'
COR_RESET='\033[0m'

if [ $# -ne 1 ]; then
    echo -e "${COR_AMARELA}++++++++++++++++++++++++++++++++++++++++++${COR_RESET}"
    echo -e "${COR_AMARELA}+ ${COR_RESET}${COR_VERDE}DIRSEEK - SDKD1 | www.InfraSec.com   ${COR_AMARELA}  +${COR_RESET}"
    echo -e "${COR_AMARELA}+----------------------------------------+${COR_RESET}"
    echo -e "${COR_AMARELA}+${COR_RESET} ${COR_VERMELHA}Modo de uso:${COR_RESET} $0 ${COR_VERDE}<URL>${COR_AMARELA}          +${COR_RESET}"
    echo -e "${COR_AMARELA}+${COR_RESET} ${COR_VERMELHA}Exemplo uso:${COR_RESET} $0  example.com ${COR_AMARELA}  +${COR_RESET}"
    echo -e "${COR_AMARELA}++++++++++++++++++++++++++++++++++++++++++${COR_RESET}"
    exit 1
fi

PORT="80"

#ALTERE AQUI CASO QUEIRA USAR OUTRA WORDLIST
for lista in $(cat /usr/share/wordlists/dirb/big.txt)
do
	exec 3<>/dev/tcp/$1/$PORT
	echo -e "GET /$lista HTTP/1.1\r\nHost: $1\r\nUser-Agent: DirSeek\r\nConnection: Close\r\n\r\n" >&3
	response=$(cat <&3)
	exec 3<&-
	exec 3>&-

	if [[ $response == *"HTTP/1.1 200 OK"* ]]
	then
		echo -e "${COR_VERDE}Diretório encontrado: $lista${COR_RESET}"
	fi
done

