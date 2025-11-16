## SimpleNotes README

### Overview
SimpleNotes is a small Bash script for quickly creating and managing timestamped text notes in a local `notes/` directory.

### Features
- Creates a `notes/` directory if it doesn't exist.
- Creates timestamped note files named `note_YYYY-MM-DD-HH_MM_SS.txt`.
- Lists existing notes before creating a new one.
- Basic interactive commands supported while entering a note:
  - `quit`, `exit`, `q` — exit the script
  - `help` — show a short help prompt
  - `rename` — (intended) rename a note
  - `Delete a note` — (intended) delete a note

### Requirements
- Unix-like environment with Bash.
- Standard utilities: date, mkdir, ls, realpath, mv, rm, touch.

### Installation
1. Save the script to a file, e.g. `note`.
2. Make it executable:
   ```
   chmod +x note
   ```
3. Run it:
   ```
   ./note
   ```

### Usage
- Run the script; it will ensure a `notes/` directory exists, then prompt for a note body.
- Enter the note text and press Enter to save it into a timestamped file inside `notes/`.
- Use the simple commands (`help`, `rename`, `Delete a note`, `quit`, `exit`, `q`) at the prompt — note: some commands are partially implemented and may not behave as expected.

### Behavior and file locations
- Notes directory: `./notes` (script creates it relative to where it runs).
- New notes: `notes/note_YYYY-MM-DD-HH_MM_SS.txt`.
- Existing notes are listed before creating a new note.

### License and contact
- Creator: w-dev255
- Repository: https://github.com/w-dev255/SimpleNotes
- Contact: https://smp11.simplex.im/a#J-PywsW697ASOGkg0rafoC0kM5-0ch7QvIpOii2XEqg

