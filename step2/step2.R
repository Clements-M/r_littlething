####################
#   START STEP 1   #
####################

#File name for reading
find_my_file_here <- "~/DigitalAcademy/r_tut/step2/my_notes.txt"

#File name for writing
write_my_file_here <- "~/DigitalAcademy/r_tut/step2/my_page.html"

#File name for the template
use_this_template <- "~/DigitalAcademy/r_tut/static/littlething_template.html"

#Open the input file
fileConn<-file(find_my_file_here)

#Read the contents from the opened file
my_notes_content <- readLines(fileConn)

#Close the input file
close(fileConn)

####################
#    END STEP 1    #
####################


####################
#   START STEP 2   #
####################

#Make an empty list of tasks we want to do
my_todos = NULL

#Make an empty list of general notes
my_content = NULL

#Time to populate our empty lists!

#For each of the lines in the notes file
for(line in my_notes_content) {
  #make a copy of the line with all lower case letters
  lower = tolower(line)
  
  #if the lower case line contains the text "todo", then...
  #Homework Question: What does grepl do? (Google)
  if(grepl("todo", lower) == TRUE){
    #we add the original line to our list of things to do
    my_todos = append(my_todos, line)
  }
  #if the lower case line does not contain the text "todo", then...
  else{
    #we add the original line to our list of general notes
    my_content = append(my_content, line)
  }
}

####################
#    END STEP 2    #
####################

#Temporary
#Display our todos!
print("My TODOs:")
print(my_todos)

#Display our content!
print("My content:")
print(my_content)