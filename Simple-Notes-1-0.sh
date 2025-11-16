#!/bin/bash
creator="w-dev255"

code_name="note"

date=$(date +"%Y-%m-%d-%H_%M_%S")

note_name="note_$date.txt"

notes=$(realpath notes)

if [[ -e "$notes" ]]; then
        sleep 1
else
        echo "$code_name : notes not exists."
        echo "$code_name : Generation in progress..."
	mkdir -p notes
fi

while true; do 
clear
echo -e "Software made by $creator\n\nOfficial repository/nhttps://github.com/w-dev255/SimpleNotes\n\\n\n$creator official contact\n\nSimpleX Chat\nhttps://smp11.simplex.im/a#J-PywsW697ASOGkg0rafoC0kM5-0ch7QvIpOii2XEqg"
echo -e "\n\n$code_name : Writing a note... "
read -r -p "note: " str
	if [[ -z "$str" ]]; then
		echo "$code_name : You should add a text..."
	else
		echo "$code_name : The string is not empy..."
		sleep 1
		break
	fi
done

while true; do
	if [[ $str == "quit" ]]; then
		echo "$code_name : As you wish."
		exit
	elif [[ $str == "exit" ]]; then
		echo "$code_name : As you wish."
		exit
	elif [[ $str == "q" ]]; then
		echo "$code_name : As you wish."
		exit
	elif [[ $str == "rename" ]]; then
		while true; do 
			read -r -p "user : " str2
			while true; do
			if [[ -z "$str2" ]]; then
				echo "$code_name : Write the name of the file whose name you want to change." 
			else 
				sleep 1
				break
			fi
			done
		done
			read -r -p "user : " str3
			while true; do 
				if [[ -z "$str3" ]]; then
					echo "$code_name : Write the name you want to rename the file with."
				else
					sleep 1
					break
				fi
			done
		cd ~/notes || echo "$code_name : An unexpected error occurred." 
		mv "$str2" "$str3"
		echo "$code_name : $file_name saved as $str3"
	else
		cd  ~/"$notes" || echo "$code_name : An unexpected error occurred." && touch "$note_name"
		echo "$str" > "$note_name"
		echo "$code_name : Note saved as $note_name in $notes/"
		break
	fi 
done

