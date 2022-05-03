library(dplyr)

movie_df <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCDQ6I4IOZLRE2WEP74TBUCFL6")

movie_df <- mutate(
  movie_df,
  WorldwideBox.Office = as.numeric(gsub('[$,]', '', WorldwideBox.Office)),
  DomesticBox.Office = as.numeric(gsub('[$,]', '', DomesticBox.Office)),
  InternationalBox.Office = as.numeric(gsub('[$,]', '', InternationalBox.Office))
)

movie_table <- movie_df %>%
  group_by(Year) %>%
  summarize(Box_Office_Total = sum(WorldwideBox.Office, DomesticBox.Office, InternationalBox.Office, na.rm=TRUE)) %>%
  distinct() 
 



  
  
  