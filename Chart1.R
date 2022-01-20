library(knitr)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

main_df <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCLGW7T4NEF6L2IXGMLDBUCJCI")

main_df <- mutate(
  main_df,
  WorldwideBox.Office = as.numeric(gsub('[$,]', '', WorldwideBox.Office))
)

year_df <- main_df %>%
  group_by(Year) %>%
  filter(WorldwideBox.Office == max(WorldwideBox.Office)) %>%
  filter(Year > "2011")

year_df <- year_df[,-6]
year_df <- year_df[,-5]
year_df <- year_df[,-1]

ggplot(year_df, aes(x= Year, y= WorldwideBox.Office, fill= Movie)) + 
  geom_bar(stat="identity", width = .8, position="dodge") +
  geom_text(aes(label = WorldwideBox.Office), size=3, hjust=1.05, vjust = .5, colour = "black", angle=90) +
  ggtitle("Highest Grossing Movie Worldwide Within The Last Decade") +
  xlab("Year") +
  ylab("Revenue(dollars)")