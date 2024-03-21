library(dplyr)
library(tidyr)
library(datasets)  
data(iris)
pivot_table <- iris %>%
  group_by(Species, Sepal.Length.Cate = cut(Sepal.Length, breaks = c(4, 5, 6, 7))) %>%
  summarise(Count = n())
print(pivot_table)