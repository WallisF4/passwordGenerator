system("java -cp /Users/adamjonasson/labbar/utv-projekt/passwordGenerator/bin run.main 6 50 upperLower") 
#time <- system.time(system("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l?u ?1?1?1?1?1 -o cracked.txt"))


elapsed_time <- time[["elapsed"]]

elapsed_time_char <- as.character(elapsed_time)

fileConn <- file("elapsed.txt")
writeLines(elapsed_time_char, fileConn)
close(fileConn)