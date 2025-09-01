#!bin/bash
while true;do
echo "Choose from the options given below:
1. Make a file 
2. Display contents
3. Copy the file
4. Rename the file
5. Delete the file
6. Exit"
read -p "Enter a Choice: " opt
if [[ -z ${opt} ]];then
	echo "No choice entered"
	exit
fi
if [[ ${opt} == 1 ]];then
	read -p "Enter a filename: " f_name
	if [[ -e f_name ]];then
		echo "File already exist"
	else 
		touch ${f_name}
		echo "New file created"
	fi
elif [[ ${opt} == 2 ]];then
	read -p "Enter a filename: " disp_cont
	if [[ -e ${disp_cont} ]];then
		cat ${disp_cont}
	else echo "File doesn't exist"
	fi
elif [[ ${opt} == 3 ]];then
	read -p "Enter the source file: "  source_f
	if [[ -e ${source_f} ]];then
		read -p "Enter destination file: " dest_f
		cp ${source_f} ${dest_f}
	else echo "File doesnt exist"
	fi
elif [[ ${opt} == 4 ]];then
	read -p "Enter previous name: " old_name
	if [[ -e ${old_name} ]];then
		read -p "Enter new name: " new_name
		mv ${old_name} ${new_name}
	else echo "File doesn't exist"
	fi
elif [[ ${opt}	== 5 ]];then
	read -p "Enter file name: " del_file
	if [[ -e ${del_file} ]];then
		rm -rfv ${del_file}
	else echo "File doesn't exist"
	fi
elif [[ ${opt} == 6 ]];then
	exit
else echo "Enter a valid choice"
fi
done

				



