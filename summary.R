
library(dplyr)
library(stringr)

checkouts <- read.csv("C:/Users/Leo/Desktop/INFO 201/Assignments/A3/2017-2023-10-Checkouts-SPL-Data/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Most checkouts of any item
most_checkouts <- checkouts %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(Checkouts)

# Average checkouts of all items
avg_checkouts <- checkouts %>% 
  summarize(Average_Checkouts = mean(Checkouts, na.rm = TRUE)) %>% 
  pull(Average_Checkouts)

# Total checkouts of F. Scott Fitzgerald's works
total_fitz <- checkouts %>% 
  filter(str_detect(Creator, "F. Scott")) %>% 
  summarize(Total_Checkouts = sum(Checkouts, na.rm = TRUE)) %>% 
  pull(Total_Checkouts)

# Month with the most checkouts for The Great Gatsby
month_gatsby <- checkouts %>% 
  filter(str_detect(Title, "Gatsby")) %>% 
  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% 
  pull(CheckoutMonth)

# Year with the highest average checkouts
avg_year <- checkouts %>% 
  group_by(CheckoutYear) %>% 
  summarize(Annual_Checkouts = mean(Checkouts, na.rm = TRUE)) %>% 
  filter(Annual_Checkouts == max(Annual_Checkouts)) %>% 
  pull(CheckoutYear)

# Average checkouts of year with highest average
avg_checkouts_year <- checkouts %>% 
  filter(CheckoutYear == "2020") %>% 
  summarize(Checkouts = mean(Checkouts, na.rm = TRUE)) %>% 
  pull(Checkouts)

