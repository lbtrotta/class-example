install.packages("stringr")
library("stringr")


##Analysis to determine GC content of DNA in comparison to houseelf ear length
elf_data <- read.csv("houseelf_earlength_dna_data_1.csv", header=T)
elf_dna <- elf_data$dnaseq




##Problem 6

str_to_upper(elf_dna)
content <- function(seq){
  Gs <- str_count(str_to_lower(seq), 'g')
  Cs <- str_count(str_to_lower(seq), 'c')
  gc_content <- (Gs + Cs) / str_length(seq) * 100 
}

for(seq in elf_dna){
  print(content(seq))
}

??str_to_lower

get_size_class <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}
