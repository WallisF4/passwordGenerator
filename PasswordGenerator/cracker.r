charLength <- function(x) {
    string <- ""
    for (n in 1:x) {
        string <- paste(string, "?1", sep= "")
    }
    return(string)
}

#system("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main 6 100 lowerUpper") 
#time <- system.time(system("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l?u ?1?1?1?1?1 -o cracked.txt"))
#lower

number <- list()
for (x in 1:10) {
    genCommand <- paste("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main", x, "100 number")
    hashCommand <- paste("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?d", charLength(x), "-o cracked.txt")
    time <- system.time(system(hashCommand))
    number <- append(number, as.character(time[["elapsed"]])) 
    
}
#print(number)

lower <- list()
for (x in 1:7) {
    genCommand <- paste("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main", x, "100 lower")
    hashCommand <- paste("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l", charLength(x), "-o cracked.txt")
    time <- system.time(system(hashCommand))
    lower <- append(lower, as.character(time[["elapsed"]])) 
    
}
#print(lower)

lowerUpper <- list()
for (x in 1:6) {
    genCommand <- paste("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main", x, "100 lowerUpper")
    hashCommand <- paste("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l?u", charLength(x), "-o cracked.txt")
    time <- system.time(system(hashCommand))
    lowerUpper <- append(lowerUpper, as.character(time[["elapsed"]])) 
    
}
#print(lowerUpper)



upperLowerNum <- list()
for (x in 1:5) {
    genCommand <- paste("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main", x, "100 upperLowerNum")
    hashCommand <- paste("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l?u?d", charLength(x), "-o cracked.txt")
    time <- system.time(system(hashCommand))
    upperLowerNum <- append(upperLowerNum, as.character(time[["elapsed"]])) 
    
}
#print(upperLowerNum)

full <- list()
for (x in 1:5) {
    genCommand <- paste("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main", x, "100 full")
    hashCommand <- paste("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?a", charLength(x), "-o cracked.txt")
    time <- system.time(system(hashCommand))
    full <- append(full, as.character(time[["elapsed"]])) 
    
}
print("number")
print(number)
print("lower")
print(lower)
print("lowerUpper")
print(lowerUpper)
print("upperLowerNum")
print(upperLowerNum)
print("full")
print(full)
#system("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/PasswordGenerator/src/ run.main 6 100 lowerUpper")

#lowerUpper

#lowerUpperNum

#full

#elapsed_time <- time[["elapsed"]]
#
#elapsed_time_char <- as.character(elapsed_time)
#
#fileConn <- file("elapsed.txt")
#writeLines(elapsed_time_char, fileConn)
#close(fileConn)
