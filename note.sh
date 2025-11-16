#!/bin/bash
creator="w-dev255"

code_name="note"

date=$(date +"%Y-%m-%d-%H_%M_%S")

note_name="note_$date.txt"

notes=$(realpath notes)

note_list=$(cd "$notes" && ls || echo "There are no notes available to display.")

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
echo -e "\n\n-------\n$note_list\n-------\n\n"
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
	elif [[ $str == "help" ]]; then
		while true; do
			echo -e "$code_name : I see you're looking for help.\nRead, this and the list of commands $creator has impolemented.\nhelp\nrename\nDelete a note"
			echo -e "\n$code_name : You understand? Write 'y' to confirm.\n"
			read -r -p "user : " str2
				if [[ $str2 == "y" ]]; then
					break
				else 
					sleep 1
				fi
		done
	elif [[ $str == "rename" ]]; then
		while true; do 
			read -r -p "user : " old
			while true; do
			if [[ -z "$old" ]]; then
				echo "$code_name : Write the name of the file whose name you want to change." 
			else 
				sleep 1
				break
			fi
			done
		done
			read -r -p "user : " new
			while true; do 
				if [[ -z "$new" ]]; then
					echo "$code_name : Write the name you want to rename the file with."
				else
					sleep 1
					break
				fi
			done
		cd ~/"$notes" || echo "$code_name : An unexpected error occurred." && mv "$old" "$new" || echo "$code_name : An unexpected error occurred." && echo "$code_name : $file_name saved as $new"
		break
	elif [[ $str == "Delete a note" ]]; then
		while true; do 
		echo "$code_name : Write the name of the note you want to delete."
		read -r -p "user : " del
			if [[ -z $del ]]; then
				echo "$code_name : You can't not write anything."
			else 
				echo "$code_name : I see you've written something, let me read."
				cd /~ || echo "$code_name : An unexpected error occurred." && cd "$notes" || echo "$code_name : An unexpected error occurred." && rm -f "$del" || echo "$code_name : An unexpected error occurred." && echo "$code_name : $del was successfully cancelled."
			fi
		done
	else
		cd ~ || echo "$code_name : An unexpected error occurred." && cd "$notes" || echo "$code_name : An unexpected error occurred."  && touch "$note_name" && echo "$str" > "$note_name" && echo "$code_name : Note saved as $note_name in $notes/"
		break
	fi 
done


