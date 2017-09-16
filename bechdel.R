require(RCurl)
require(readr)
require(dplyr)
require(ggplot2)


#notes about dataset

bechdel <- read_csv("C:\\Users\\leahe\\OneDrive\\Documents\\Data Projects\\data-master\\data-master\\bechdel\\movies.csv")

bechdel$binary <- as.factor(bechdel$binary)
bechdel$domgross <- as.numeric(bechdel$domgross)
bechdel$intgross <- as.numeric(bechdel$intgross) 
bechdel$budget <- as.numeric(bechdel$budget) 


bechdel <- mutate(bechdel, ROI_percent = (domgross + intgross) / budget)

ggplot(data = bechdel, aes(x = budget, y = domgross, col = binary)) + geom_jitter()

bechdel %>% group_by(binary, na.rm = TRUE) %>% 
  summarise(budget_avg = mean(budget), gross_avg = mean(intgross + domgross, na.rm = TRUE), ROI_avg = mean(ROI_percent, na.rm  = TRUE))


