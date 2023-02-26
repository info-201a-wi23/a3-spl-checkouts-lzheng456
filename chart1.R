
library(ggplot2)
library(dplyr)

checkouts <- read.csv("C:/Users/Leo/Desktop/INFO 201/Assignments/A3/2017-2023-10-Checkouts-SPL-Data/2017-2023-10-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

usage <- checkouts %>% 
  mutate(Date = as.Date(paste0(CheckoutYear, "-", CheckoutMonth, "-01"))) %>% 
  group_by(UsageClass, Date) %>% 
  summarize(UsageCheckouts = sum(Checkouts))

chart1 <- ggplot(data = usage) +
  geom_line(mapping = aes(x = Date, 
                          y = UsageCheckouts, 
                          color = UsageClass)) +
  labs(title = "Number of Checkouts by Usage Class Between 2017 and 2023", 
       x = "Year", 
       y = "Number of Checkouts", 
       color = "Usage Class")

chart1
