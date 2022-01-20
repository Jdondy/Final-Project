library("dplyr")
library("ggplot2")
library("scales")
library("treemapify")
library("reshape2")
library("readr")
movie_df <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCLGW7T4NEF6L2IXGMLDBUCJCI")

only_2020 <- movie_df %>%
  filter(Year == "2020")
 
only_2021 <- movie_df %>%
  filter(Year == "2021")

since_covid_started <- merge(x = only_2020, y = only_2021, all = TRUE) %>%
  mutate(WorldwideBox.Office = parse_number(WorldwideBox.Office))

pl <- ggplot(data = since_covid_started, aes(fill = Movie, area = WorldwideBox.Office, subgroup = Year,
      label = paste0(Movie,"\n" ,prettyNum(WorldwideBox.Office, big.mark = ",")))) +
      geom_treemap() + geom_treemap_subgroup_border(colour = "black", size = 5) +
      geom_treemap_subgroup_text(place = "bottom", grow = T, alpha = 0.5, colour = "black", fontface = "italic", min.size = 0) +
      geom_treemap_text(colour ="white", place = "top", reflow = T) +
      theme(legend.position = "none") +
      labs(title = "Movies with the Highest Worldwide Box Office Revenue Since COVID Started")

