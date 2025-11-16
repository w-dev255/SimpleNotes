## README — SimpleNotes (script: note.sh)

Short description
- Small Bash script to create, list and (attempt to) manage plain-text notes in a directory named `notes`.
- Author: w-dev255
- Script filename: `note.sh`

Prerequisites
- Unix-like system with Bash.
- Permission to create files/directories in the working directory (or home, depending on execution).

Install and run
1. Save the script as `note.sh`.
2. Make it executable:
   ```
   chmod +x note.sh
   ```
3. Run:
   ```
   ./note.sh
   ```

What the script actually does
- Sets variables:
  - creator="w-dev255"
  - code_name="note"
  - date formatted as YYYY-MM-DD-HH_MM_SS
  - note_name="note_$date.txt"
- Attempts to resolve an absolute path for `notes` with `notes=$(realpath notes)`.
- Attempts to list files in `notes` into `note_list` using:
  - `note_list=$(cd "$notes" && ls || echo "There are no notes available to display.")`
- If `notes` path does not exist the script prints messages and runs `mkdir -p notes`.
- Enters a loop that:
  - Clears the screen and prints author, repository and contact info (note: the script contains formatting typos like `Official repository/n...`).
  - Shows the current `note_list`.
  - Prompts the user for input with `read -r -p "note: " str` and repeats until a non-empty string is entered.
- After receiving non-empty input, the script handles the input with conditional checks:
  - If input equals `quit`, `exit` or `q`: prints a message and exits without saving.
  - If input equals `rename`: attempts a rename flow that prompts for an old name and a new name, but the implementation contains logic errors (infinite loops and incorrect command chaining).
  - If input equals `Delete a note`: attempts a delete flow that prompts for the filename to delete, but the implementation contains logic errors (infinite loop, incorrect path `cd /~`, and flawed command chaining).
  - For any other input: attempts to change directory to the user's home then to `notes`, creates the timestamped file with `touch "$note_name"` and writes the input using `echo "$str" > "$note_name"`, then prints a success message.

Limitations, bugs and real behaviors to be aware of
- realpath on a non-existent `notes` may fail and produce errors before the script creates the directory.
- The script mixes relative and absolute path logic inconsistently: `notes` is set to `realpath notes` but subsequent `cd` commands use `cd ~/"$notes"` or `cd "$notes"` inconsistently, which can fail.
- Many command sequences use chained `&&` and `||` without parentheses; this causes unintended execution of later commands even when earlier commands fail.
- note_list is computed before ensuring `notes` exists; when `notes` does not exist that command may error.
- The rename routine:
  - Contains nested infinite `while true` loops that never break properly.
  - Uses `cd ~/"$notes"` which is almost certainly incorrect (double pathing).
  - The `mv` command is chained in a way that may run even when `cd` failed.
  - Uses an undefined variable `$file_name` in a success message.
- The delete routine:
  - Uses the literal `cd /~` (invalid) and similar flawed chaining.
  - Is wrapped in a `while true` that never breaks, so it will loop indefinitely after a delete attempt.
- Saving notes:
  - The script does not reliably change into the `notes` directory before creating the file; the file may be created in an unexpected directory (home or where the script was run).
  - Uses `echo "$str" > "$note_name"` which overwrites; although timestamped filenames reduce collisions, running multiple times within the same second can collide.
  - No sanitization or quoting for filenames entered during rename/delete flows — spaces and special characters can break operations.
- Error handling is minimal: commands like `realpath`, `mkdir`, `mv`, `rm`, `touch` are not properly checked and success/failure messages are unreliable.
- Several user-facing strings contain typos and formatting issues.

Behavior summary (typical run)
1. Script attempts to resolve `notes` and list files.
2. If `notes` missing, it prints messages and creates `notes` (mkdir -p notes).
3. Prompts user repeatedly until a non-empty string is entered.
4. If user enters one of the quit commands — exits.
5. If user enters `rename` or `Delete a note` the script attempts the corresponding flows but these are likely to fail or hang due to bugs.
6. For any other input, the script attempts to create a timestamped file and write the note — but the file location is not reliably `notes/` due to path errors.

Quick fixes to make the script behave correctly (recommended)
- Set and create the notes directory robustly up front:
  ```
  notes="$HOME/notes"
  mkdir -p "$notes" || { echo "failed to create $notes"; exit 1; }
  notes=$(realpath "$notes")
  ```
- Compute note_list after ensuring the directory exists:
  ```
  note_list=$(ls -A "$notes" 2>/dev/null || echo "There are no notes available to display.")
  ```
- Use a clear command dispatcher (case) rather than chained `if` with complex &&/||:
  ```
  case "$str" in
    quit|exit|q) exit 0 ;;
    rename) ... ;;
    "Delete a note") ... ;;
    *) printf '%s\n' "$str" > "$notes/$note_name" ;;
  esac
  ```
- Fix rename/delete flows: validate file existence, use quoted paths, and ensure loops can break.
- Write notes using the explicit directory path: `printf '%s\n' "$str" > "$notes/$note_name"`.
- Sanitize filenames or reject names with problematic characters.
- Add proper error checking and clearer user messages.

Repository and contact
- Repository: https://github.com/w-dev255/SimpleNotes
- Contact info: the script prints a SimpleX Chat link.

