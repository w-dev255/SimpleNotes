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


echo -e "Software made by $creator\n\n$code_name : https://github.com/w-dev255/SimpleNotes"
echo -e "\n$code_name : Writing a note... "
while true; do
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
	cd "$notes" && touch "$note_name"
	echo "$str" > "$note_name"
	echo "$code_name : Note saved as $note_name in $notes/"
	break 
done
