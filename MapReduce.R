# Mapper
setwd("C:/Users/amishra/Desktop/Data science/Prep")

fd <- file("order.txt",open="r")

trimSpaces <- function(line)
{
  gsub("(^ +)|( +$)","",line)
}

splitWords <- function(line)
{
  unlist(strsplit(line,"[[:space:]]"))
}

while(length(line <- readLines(fd, n = 1, warn = FALSE)) > 0)
{
  line <- trimSpaces(line)
  words <- splitWords(line)
  for (w in words)
  {
    cat(w,"\t1\n")
  }
}
close(fd)



## Reducer
env <- new.env(hash = TRUE)
fd <- file("order.txt",open="r")

while(length(line <- readLines(fd,n = 1, warn = FALSE)) > 0)
{
  line <- trimSpaces(line)
  words <- splitWords(line)
  for(word in words)
  {
    if(exists(word,envir = env, inherits = FALSE))
    {
      oldcount <- get(word,envir = env)
      assign(word,oldcount+1,envir = env)
    }
    else
    {
      assign(word,1,envir = env)
    }
  }
}

for(w in ls(env,all = TRUE))
{
  cat(w, "\t", get(w,envir = env),"\n")
}
close(fd)

