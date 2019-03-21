####################
#   START STEP 1   #
####################

#File name for reading
find_my_file_here <- "~/DigitalAcademy/r_tut/step3/my_notes.txt"

#File name for writing
write_my_file_here <- "~/DigitalAcademy/r_tut/step3/my_page.html"

#File name for the template
use_this_template <- "~/DigitalAcademy/r_tut/static/littlething_template.html"

#Open the input file
fileConn<-file(find_my_file_here)

#Read the contents from the opened file
# http://www.rfaqs.com/reading-writing-data-r
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


####################
#   START STEP 3   #
####################

#Open the template file
fileConn<-file(use_this_template)

# Read the contents from the opened file
# http://www.rfaqs.com/reading-writing-data-r
template = readLines(fileConn)

#Close the file
close(fileConn)

#Great! So we now have a template to work with
#There are place holders in the template that I previously added
todo_placeholder = "[MY_TODOS]" #To Do place holder
content_placeholder = "[MY_CONTENT]" #Content place holder

# Now lets convert our list of To Do into better format.
# Lets use the paste function to go from a list to a string
# and add an HTML <br> tag between each item in the list
# https://stackoverflow.com/a/13973329
my_todos =  paste(my_todos,collapse="<br>") 

#And we'll do the same with the content list
#https://stackoverflow.com/a/13973329
my_content = paste(my_content,collapse="<br>")

#Make an object called output based on the template
output = template

#within the template replace the todo place holder with the todo string we made
#Homework Question: Why do we tell gsub to have fixed set to TRUE? (Google, Hint: '[Text]')
#https://stackoverflow.com/questions/20309876/r-how-to-replace-in-a-string/20310097#20310097
template = gsub(todo_placeholder,  my_todos, template, fixed=TRUE)

#within the template replace the content place holder with the content string we made
template = gsub(content_placeholder,  my_content, template, fixed=TRUE)

#Open the template file
fileConn<-file(write_my_file_here)

#write the template to our output location
#http://www.rfaqs.com/reading-writing-data-r
writeLines(template, fileConn)

#Close the file
close(fileConn)
####################
#    END STEP 3    #
####################