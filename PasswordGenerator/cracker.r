time <- system.time(system("hashcat -a 3 -m 0 /Users/adamjonasson/labbar/utv-projekt/output.txt -1 ?l?u ?1?1?1?1?1 -o cracked.txt"))

print(time)
elapsed_time <- time[["elapsed"]]
print(elapsed_time)