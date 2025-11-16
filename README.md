## Simple Notes — README

**Author:** w-dev255  
**Script name:** Simple-Notes-1-0.sh  
**Official repository:** https://github.com/w-dev255/SimpleNotes

Short description  
Minimal Bash script to quickly create a timestamped text note in a "notes" directory. Includes basic commands for quitting and an attempted (but buggy) rename feature.

Requirements
- Unix-like system with Bash.
- Commands used: bash, date, mkdir, realpath, touch, mv, cd, echo, read.

Installation
1. Download Simple-Notes-1-0.sh into the desired folder.
2. Make it executable:
```
chmod +x Simple-Notes-1-0.sh
```
3. Run:
```
./Simple-Notes-1-0.sh
```

How it works
- Variables set at start:
  - creator="w-dev255"
  - code_name="note"
  - date = current timestamp YYYY-MM-DD-HH_MM_SS
  - note_name = "note_$date.txt"
  - notes = realpath notes
- If "notes" directory does not exist, the script creates it (mkdir -p notes).
- Displays author, repo and contact info.
- Prompts the user for a single-line note (prompt: note: ). Empty input is rejected.
- Special first inputs:
  - "quit", "exit", "q" — script exits.
  - "rename" — enters a rename flow (currently implemented with logical errors; see Known issues).
- For a normal note string, the script writes the string to a timestamped file inside the notes directory (overwrites if the same name exists) and prints the saved filename and path.

Example
1. Run:
   ./Simple-Notes-1-0.sh
2. At prompt:
   note: This is a quick note
3. Result: notes/note_2025-11-16-12_34_56.txt containing the provided text.

Technical notes
- note_name is created once at startup; each run produces a unique filename based on the start timestamp.
- realpath notes is used to resolve an absolute path; if the directory doesn't exist realpath may fail. The script then creates the directory but the notes variable may not hold the expected value.
- The note content is written with:
```
echo "$str" > "$note_name"
```
(single-line write, overwrite mode).
- The rename flow attempts to use mv inside ~/notes.

Known issues and limitations
- realpath notes is called before ensuring the directory exists; this can error and leave notes unset or incorrect.
- Rename implementation contains nested infinite loops (while true) and will not behave correctly. It also reads str2 in a loop without proper exit and uses an undefined variable ($file_name) in its final message.
- cd and touch are combined with incorrect operator precedence:
```
cd ~/"$notes" || echo "..." && touch "$note_name"
```
causing touch to run even if cd failed, and producing wrong paths.
- Input is single-line only; no support for multiline notes or editor invocation.
- No sanitization of filenames for rename (security risk).
- Potential double-path issues (using realpath then cd ~/"$notes").

Suggested improvements (recommended fixes)
- Set notes after creating the directory:
```
mkdir -p notes
notes="$(realpath notes)"
```
- Fix rename flow: remove nested infinite loops, validate inputs, cd to "$notes" (not ~/notes), use correct variables in messages.
- Separate and check cd and touch steps:
```
cd "$notes" || { echo "$code_name : cd failed"; exit 1; }
touch "$note_name"
```
- Offer append mode (>>), multiline input (open $EDITOR), and CLI options (--help, --name, --append).
- Properly quote variables and sanitize filenames.

License
Add an explicit license file (recommended: MIT). Example header:
```
Copyright (c) 2025 w-dev255
Licensed under the MIT License — see LICENSE file.
```
