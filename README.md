## README

### Project Name
**SimpleNotes**

#### Description
**SimpleNotes** is a simple Bash application that allows users to create and manage text notes. The script creates a unique note file with a timestamp, allowing you to quickly save ideas, reminders, or lists without the need for complex graphical interfaces.

### Author
**Creator:** w

### Date of Creation
Last modified: **15 November 2025**

### Project Status
**State:** In development

---

#### Requirements
- Unix-like environment with support for Bash.
- Permissions to run for the script.

### Project Structure
````
SimpleNotes/
├── SimpleNotes.sh # Main Script for note management
└── notes #Directory where notes are saved
````

### Functionality
- Check if the `notes` folder exists; if it doesn't exist, create it.
- Allows the user to enter the text of the note.
- Writes the text to a note file with a current date and time-based name.
- Manages the creation of interactive notes, making sure that the text is not empty.

### Error Handling
- If no text is entered, an error message is displayed. The user must provide a valid input before the note is saved.

#### Instructions for Use
1. **Clone the repository:**
   ```bash
   git clone https://github.com/w-dev255/SimpleNotes.git
   ````

2. **Naviga in the project directory:**
   ```bash
   cd SimpleNotes
   ````

3. **Giving execution permissions to the script:**
   ```bash
   chmod +x SimpleNotes.sh
   ````

4. **Run the script:**
   ```bash
   ./SimpleNotes.sh
   ````

5. **Insert the text of your note when prompted.**

### Example of Use
When the script runs, you’ll see something like this:
````
Software made by w
Notes : Writing a note...
Notes: This is my note.
Notes : Notes saved as note_2023-11-15-12_45_00.txt in /path/to/notes/
````

### Contribute
If you would like to contribute to **SimpleNotes**, suggestions and improvements are welcome. You can open a *issue* or send a *pull request* with your changes.

### License
This project is open source and can be used freely. Make sure you give the right credit to the original authors.

---

### Contacts
For questions or support, contact the author.

https://smp11.simplex.im/a#J-PywsW697ASOGkg0rafoC0kM5-0ch7ch7QvIii2XEqg
---

