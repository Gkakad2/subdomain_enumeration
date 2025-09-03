#!/bin/bash
check_tool(){
        command -v "$1" >/dev/null 2>&1
}

#Function to install_tools
function install_tools(){
        echo "Choose an installation option for you:
        1. Manual Installation
        2. Auto Installation"
        read -p "Enter choice 1/2: " choice
        if [[ ${choice} == 1 ]];then
                echo "Run the following commands manually:"
                if ! check_tool figlet ;then
		echo "sudo apt update
sudo apt install figlet -y"
		fi
	        if ! check_tool lolcat ;then
		echo "sudo apt update	
sudo apt install lolcat -y"
		fi
		exit
        elif [[ ${choice} == 2 ]];then
                echo "Installing Tools Automatically "
                sudo apt update
                sudo apt install figlet -y
                sudo apt install lolcat -y
                echo "Installation Complete

The active subdomains are: "
	
		sleep 3
        else
                echo "Error: Invalid Choice. Exiting"
        fi
}
missing=()
if ! check_tool figlet;then
        echo "Error: Figlet not found"
	 missing+=("Figlet")
fi

if ! check_tool lolcat;then
        echo "Error: Lolcat not found"
        missing+=("Lolcat")
fi

if [[ ${#missing[@]} -ne 0 ]];then
        echo "The following command are missing: ${missing[*]}"
        install_tools
fi

#Subdomain Enumeration
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


