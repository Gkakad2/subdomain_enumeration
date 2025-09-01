#!/bin/bash
function help(){
        figlet "Sub Enum" | lolcat
        echo -e "-d DOMAIN\t:\tProvide domain name\n"
        echo -e "-w WORDLIST\t:\tProvide a subdomain wordlist\n"
        echo -e "-h/--help\t:\tPrint help\n"
}       
function runme(){
        while read sub;do
                if host "${sub}.${domain}" &> /dev/null;then
                        echo "${sub}.${domain}"
                fi
	done<${wordlist}
}
counter=0
while [[ ${counter} -le 1 ]]; do
	case ${1} in
		"-d")
			domain=${2}
			if [[ -z ${domain} ]]; then
				echo "Error: Domain is required, use -h/--help"
				exit 128
			fi
			counter=$((counter + 1))
			;;
		"-w")
			wordlist=${2}
			if [[ -z ${wordlist} ]];then
				echo "Error: Wordlist is required. use -h/--help"
				exit 128
			fi
			counter=$((counter + 1))
			;;
		"-h"|"--help")
			help
			exit 0
			;;
		*)
			echo "Error invalid argument:${1} Use -h/--help"
			exit 127
			;;
		esac
		shift 2
	done
	runme "$@"
