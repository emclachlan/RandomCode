mydata=open('/Users/emilymclachlan/Desktop/mpol_december2017.txt')
newfile= open('mpol_strains-to-scan.txt','w')
inputcounter=0
outputcounter=0


for line in mydata:
	inputcounter += 1
	if line[-2]== '1':
	# we are going to the end of the line, because I'm looking at value at the end of the line
		newfile.write(line)
		outputcounter += 1
			
	else:
		print(line[-2])

print(inputcounter, "this is my inputcounter")
print(outputcounter, "this is the output counter")

