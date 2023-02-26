
library(ggplot2)
library(dplyr)
library(stringr)

checkouts <- read.csv("C:/Users/Leo/Desktop/INFO 201/Assignments/A3/2017-2023-10-Checkouts-SPL-Data/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

fitz <- checkouts %>% 
  mutate(Date = as.Date(paste0(CheckoutYear, "-", CheckoutMonth, "-01"))) %>% 
  filter(str_detect(Creator, "F. Scott"))

checkouts_per_month <- fitz %>% 
  group_by(MaterialType, Date) %>% 
  summarize(TotalCheckouts = sum(Checkouts, na.rm = TRUE))

chart2 <- ggplot(data = checkouts_per_month) +
  geom_line(mapping = aes(x = Date, 
                          y = TotalCheckouts, 
                          color = MaterialType)) +
  labs(title = "Checkouts of F. Scott Fitzgerald's Works by Material", 
       x = "Year", 
       y = "Number of Checkouts", 
       color = "Material")

chart2
