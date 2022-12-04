env <- new.env(hash = TRUE)

for( word in words)
{
  if (exists(word, envir = env, inherits = FALSE)) {
    oldcount <- get(word, envir = env)
    assign(word, oldcount + 1, envir = env)
  }
  else assign(word, 1, envir = env)
}
for (w in ls(env, all = TRUE))
  cat(w, "\t", get(w, envir = env), "\n", sep = "")
