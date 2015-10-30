install.packages("stringr")
library("stringr")


##Analysis to determine GC content of DNA in comparison to houseelf ear length

##import data
elf_data <- read.csv("houseelf_earlength_dna_data_1.csv", header=T)



##Problem 6
#function to calculate GC content for sequences regardless of capitalization
content <- function(seq){
  Gs <- str_count(str_to_lower(seq), 'g')
  Cs <- str_count(str_to_lower(seq), 'c')
  gc_content <- (Gs + Cs) / str_length(seq) * 100 
}


##Problem 7
#create empty data frame
output <- data.frame()

#function to classify size class of elf ears, threshold 10
get_size_class <- function(seq){
   #Calculate the GC-content for one or more sequences
   ear_lengths <- ifelse(seq > 10, "large", "small")
   return(ear_lengths)
}

#loop through GC content and size class functions and fill output matrix with 
#results and elf id too
elf <- for(row in 1:nrow(elf_data)){
  ear_length_class <- get_size_class(elf_data[row,]$earlength)
  GC <-content(elf_data[row, ]$dnaseq)
  elf_output <- data.frame(elf_data[row, ]$id, ear_length_class, GC)
  output <- rbind(output, elf_output)
}

#print data.frame
print(output)
  
#export data frame to csv
write.csv(output, file="grangers_analysis_ear_gc_id.csv")
