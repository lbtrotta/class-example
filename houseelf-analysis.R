##Analysis to determine GC content of DNA in comparison to houseelf ear length
elf_dna<-read.csv("houseelf_earlength_dna_data.csv", header=T)

##Problem 5



##Problem 6

install.packages("stringr")
library("stringr")


content <- function(seq){
  Gs <- str_count(seq, 'G')
  Cs <- str_count(seq, 'C')
  gc_content <- (Gs + Cs) / str_length(seq) * 100 
}

for(seq in elf_dna){
  print(content(seq))
}

??str_to_lower
