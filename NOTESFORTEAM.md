# Senior Design Project 

### Angie's Parsing Notes:
Parsing works as far as i know! :D Sorry it took so long (im gonna fail chem and its 4am, 
prob gonna be late to the meeting, sorry)

Recent updates are on the parse branch. 

Parsing currently works however, take care when deleting rows from the excel file.
When converting the excel file to txt, the deleted rows are still there but the contents 
are removed. 
EX. orig: "Retina, Wavelengths, img, header, info, header, info"
		after delete from excel file: "\n\t\t\t\t\t\t\t\t\t" <- this is how it parses and idk why

More mentions of this in the comments. 

#### Structure
There is a class of Status, Parse, Category, Topic, Subtopic, Card

Status: intended to be the only one with access to the parsed data, includes functions 
				to interact with the parsed information.
Parse: seperates file data and calls status functions
Category: Stores name of category, and list of subtopic objects.
Subtopic: Stores name of subtopic, and list of topic objects.
Topic: Stores name of topic, and list of card objects.
Card: Is technically not a card as the name suggests but it contains the header and the
			information for the header. 

There is a print function in status that prints out the current layout of parsed
items in a hierarchy for debugging purposes. 

### Test Data Files
The data files I used should be in the Information folder inside the project. Currently only
used a file with 3 slides on it (SmallTes).
To run on your computer, save the files and change the path to the file in the csv function 
in Parse.   


### Future thoughts
Ideally we run a program to populate the database of choice (firebase for now I assume?) 
and have the app query from the db instead. Also might need to change some data structures 
around in the future but for right now parsing works enough.



