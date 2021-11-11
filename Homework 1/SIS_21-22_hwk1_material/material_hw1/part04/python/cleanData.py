import re

original_data = 'earthquake_data.txt'
new_data='earthquake_data_parsed.txt'
file_read = open(original_data, 'r')
file_write = open(new_data, "w")

#rex=re.compile("^[0-9][0-9][0-9].[0-9][0-9]$") #Accept lines that only have this format
rex=re.compile("^ [0-9].[0-9][0-9]$")
rex2=re.compile("^[0-9][0-9].[0-9][0-9]$")
rex3=re.compile("^[0-9][0-9][0-9].[0-9][0-9]$")

#Check that each line matches the wanted format

for line in file_read:
    if rex.match(line):
        file_write.write(line)
    elif rex3.match(line):
        file_write.write(line)
    elif rex2.match(line):
        file_write.write(line)
	

file_read.close()
file_write.close()
