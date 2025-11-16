## README — SimpleNotes (script: note.sh)

Short description
- Small Bash script to write, list and attempt to manage plain-text notes in a directory named `notes`.
- Author: w-dev255
- Script filename: `note.sh`

Prerequisites
- Unix-like system with Bash.
- Permission to create files/directories in the working directory or the user’s home.

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
- Sets main variables:
  - creator="w-dev255"
  - code_name="note"
  - date formatted as YYYY-MM-DD-HH_MM_SS
  - note_name="note_$date.txt"
- Attempts to get an absolute path for `notes` with `notes=$(realpath notes)`.
- Attempts to list files in `notes` into `note_list` using:
  - `note_list=$(cd "$notes" && ls || echo "There are no notes available to display.")`
- If the `notes` directory does not exist, prints messages and creates it with `mkdir -p notes`.
- Enters a loop that:
  - Clears the screen and prints author, repository and contact info (the script contains formatting typos like `Official repository/n...`).
  - Shows the current `note_list`.
  - Prompts the user for the note text (`note:`) and repeats until a non-empty string is entered.
- After receiving non-empty input, the script evaluates the input:
  - `quit`, `exit`, `q` → prints a message and exits without saving.
  - `rename` → enters a rename routine that prompts for old and new names (implementation contains logic errors: nested infinite loops and incorrect command chaining).
  - `Delete a note` → enters a delete routine that prompts for the filename to delete (implementation contains logic errors: invalid `cd /~`, possible infinite loop and incorrect chaining).
  - Any other non-empty input → attempts to change directory (home then notes), create the timestamped file, write the input using `echo "$str" > "$note_name"`, and print a success message.

Limitations and known issues (actual behavior)
- `realpath notes` may fail if `notes` does not exist at script start.
- `note_list` is computed before ensuring the `notes` directory exists.
- Inconsistent path usage: the script mixes `realpath notes`, `cd ~/"$notes"` and `cd "$notes"` incorrectly.
- Many commands are chained with `&&` and `||` without clear precedence, causing later commands to run even when earlier ones fail.
- Rename routine:
  - Contains nested infinite `while` loops that do not exit properly.
  - Uses `cd ~/"$notes"` (likely incorrect).
  - `mv` may run even if `cd` failed.
  - Success message references an undefined variable `$file_name`.
- Delete routine:
  - Uses invalid `cd /~` and flawed chaining.
  - Can be trapped in a loop that doesn't terminate after delete attempts.
- Saving notes:
  - The script does not reliably ensure the current directory is `notes`; the created file may end up in the home or invocation directory.
  - Timestamp filenames have only second precision; running multiple times in the same second can overwrite.
  - Uses `>` to write the note (overwrite), though timestamped filenames normally prevent collisions.
- No validation or escaping for filenames entered during rename/delete — spaces and special characters can break operations.
- Minimal error handling for `realpath`, `mkdir`, `mv`, `rm`, `touch`, etc.
- Several user-facing strings contain typos and formatting issues.

Typical flow
1. Script attempts to resolve `notes` and list files.
2. If `notes` is missing, it creates the directory.
3. Prompts the user until a non-empty note is entered.
4. If the user enters `quit`/`exit`/`q`, the script exits.
5. If the user enters `rename` or `Delete a note`, the script enters the respective routine — these are likely to fail or hang due to bugs.
6. For any other string, the script attempts to create a timestamped file and write the note — but the save location is not guaranteed.

Repository and contact
- Repository: https://github.com/w-dev255/SimpleNotes
- Contact: SimpleX Chat link shown by the script.
