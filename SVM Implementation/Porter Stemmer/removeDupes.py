f2 = open("vocab2.txt", "r")

f3 = open("vocab3.txt", "w")

vocabList = []

for line in f2:
    if line not in vocabList:
        vocabList.append(line)
    
f3.writelines(vocabList)
    
        
f2.close()
f3.close()