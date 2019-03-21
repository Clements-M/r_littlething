####################
#   START STEP 1   #
####################

#File name for reading
find_my_file_here <- "~/DigitalAcademy/r_tut/step1/my_notes.txt"

#File name for writing
write_my_file_here <- "~/DigitalAcademy/r_tut/step1/my_page.html"

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

#Temporary
#Display our notes!
print(my_notes_content)