trimWhiteSpace = function(line){
  gsub("(^ +)|( +$)","",line)
}

splitToWords = function(line){
  unlist(strsplit(line,"[[:space:]]+"))
}

line <- "I am Anant. I"

words <- splitToWords(trimWhiteSpace(line))

for (w in words){
  cat(w,"\t1\n",sep="")
}
