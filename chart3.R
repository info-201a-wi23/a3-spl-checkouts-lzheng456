
library(ggplot2)
library(dplyr)

checkouts <- read.csv("C:/Users/Leo/Desktop/INFO 201/Assignments/A3/2017-2023-10-Checkouts-SPL-Data/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

checkouts_by_subject <- checkouts[checkouts$Subjects != "",] %>% 
  group_by(Subjects) %>% 
  summarize(Total_Checkouts = sum(Checkouts, na.rm = TRUE)) %>% 
  top_n(5)

chart3 <- ggplot(data = checkouts_by_subject) +
  geom_bar(mapping = aes(x = Subjects, 
                         y = Total_Checkouts),
           stat = "identity") +
  labs(title = "Total Checkouts for the Top 5 Most Popular Subjects", 
       x = "Subject", 
       y = "Number of Checkouts") +
  coord_flip()

chart3
