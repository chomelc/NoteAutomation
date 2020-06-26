# #!/usr/bin/env python3
import sys
import os

class NoteManager:
    folder = ""
    filename = ""
    path = os.getcwd()
    extension = ".md"
    header = False

    def isHeader(self):
        if sys.argv[1] == "-h":
            self.header = True

    def getPath(self):
        return self.path

    def getArguments(self):
        try:
            if self.header:
                self.folder = str(sys.argv[3])
            else:
                self.folder = str(sys.argv[2])
        except Exception:
            self.folder = "./"
        try:
            if self.header:
                self.filename = str(sys.argv[2])
            else:
                self.filename = str(sys.argv[1])
        except Exception:
            print("Name your note.")
            sys.exit()
        self.filename = f"{self.filename}{self.extension}"

    def checkFolder(self):
        if not os.path.isdir(f"{self.path}/{self.folder}"):
            os.makedirs(self.folder)
        self.path = f"{self.path}/{self.folder}"
        os.chdir(self.path)
        
    def findFile(self):
        if not os.path.isfile(f"./{self.filename}"):
            self.path = os.path.join(self.path ,f"{self.filename}")
            open(self.path, "a").close()

    def generateHeader(self):
        # Copy the template
        os.system(f"cp ~/Documents/NoteAutomation/header.md {self.path}")
        print(os.getcwd())
        # Read in the file
        with open('header.md', 'r') as file :
            filedata = file.read()

        # Replace the target strings
        filedata = filedata.replace('%UV%', input('UV: '))
        filedata = filedata.replace('%mail%', input('mail: '))
        filedata = filedata.replace('%NATURE%', input('nature: '))
        filedata = filedata.replace('%INTITULE%', input('intitule: '))
        filedata = filedata.replace('%titre%', input('titre: '))

        # Write the file out again
        with open('header.md', 'w') as file:
            file.write(filedata)

    def openFileinVSCode(self):
        os.system(f"code {self.path}")

if __name__ == "__main__":
    notes = NoteManager()
    notes.isHeader()
    notes.getArguments()
    notes.checkFolder()
    if notes.header:
        notes.generateHeader()
    notes.findFile()
    notes.openFileinVSCode()

    
