## README — SimpleNotes (script: note.sh)

Short description
- Simple Bash script to create plain-text notes in a directory named `notes`.
- Author: w-dev255
- Script filename: `note.sh`

Prerequisites
- Unix-like system with Bash.
- Write permission in the user's home or current working directory.

Installation
1. Save the script as `note.sh`.
2. Make it executable:
   ```
   chmod +x note.sh
   ```
3. Run:
   ```
   ./note.sh
   ```

Actual behavior of the code
- On startup it runs `realpath notes` to get an absolute path for `notes`.
- If `notes` does not exist, it attempts to create it with `mkdir -p notes`.
- It builds a note filename using the current date/time: `note_YYYY-MM-DD-HH_MM_SS.txt`.
- It lists files in the `notes` directory (or prints "There are no notes available to display.").
- Prints author info, repository link and contact info.
- Main input loop:
  - Prompts the user for the note text (`note:`). If the input is empty it repeats the prompt.
  - Special commands recognized: `quit`, `exit`, `q` — exit the script without saving.
  - `rename` enters a file rename routine (see Problems section — the implementation is flawed).
  - Any other non-empty input is saved as the note: the script creates the timestamped file and writes the input into it (using `>` which overwrites), then exits.

Usage
- To create a note: type the desired text when prompted; a file named with a timestamp will be created in `notes/`.
- To exit without saving: type `quit`, `exit`, or `q`.
- To rename files: type `rename` (see limitations).

Limitations and known issues (actual behavior)
- `realpath notes` may fail if `notes` does not exist yet.
- Inconsistent use of `cd` and chained `&&`/`||` leads to commands running even when earlier steps fail.
- The `rename` routine contains nested infinite loops and does not properly exit.
- The script sometimes fails to change into the `notes` directory before touching/writing the note, so the file may be created in the current directory or home directory instead of `notes/`.
- Using a timestamp with second precision can lead to collisions if run multiple times in the same second.
- Note contents are written with `>` (overwrite) instead of `>>` (append) — but the timestamped filename should usually prevent overwriting.
- No validation or escaping of filenames or user input (spaces or special characters can break operations).
- Error handling is minimal for `realpath`, `mkdir`, `mv`, `touch`, and `echo`.
- Some informational messages contain formatting/typo issues.

Repository and contact
- Official repository: https://github.com/w-dev255/SimpleNotes
- Author contact: link displayed by the script.
