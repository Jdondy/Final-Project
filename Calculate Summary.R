
# Summary Information Script
# The first file you should save in your project should store summary information in a list. For example:
#   
#   # A function that takes in a dataset and returns a list of info about it:
#   summary_info <- list()
# summary_info$num_observations <- nrow(my_dataframe)
# summary_info$some_max_value <- my_dataframe %>%
#   filter(some_var == max(some_var, na.rm = T)) %>%
#   select(some_label)

# The file must compute at least 5 different values from your data that you believe are pertinent to share. 

library("dplyr")
library("readr")

movie_data <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCLEGE4Q3TAEHTDUYESDBUFVKG")


#same data but changed the $ values from character type to numeric type so we can work with it better

movies_df <- movie_data %>%
  mutate(WorldwideBox.Office = parse_number(WorldwideBox.Office),
         DomesticBox.Office = parse_number(DomesticBox.Office),
         InternationalBox.Office = parse_number(InternationalBox.Office))


summary_info <- list()

summary_info$number_of_movies <- nrow(movies_df)

summary_info$number_foreign_movies <- sum(is.na(movies_df$DomesticBox.Office))

summary_info$oldest_movie <- min(movies_df$Year)
=======
# Summary Information Script
# The first file you should save in your project should store summary information in a list. For example:
#   
#   # A function that takes in a dataset and returns a list of info about it:
#   summary_info <- list()
# summary_info$num_observations <- nrow(my_dataframe)
# summary_info$some_max_value <- my_dataframe %>%
#   filter(some_var == max(some_var, na.rm = T)) %>%
#   select(some_label)

# The file must compute at least 5 different values from your data that you believe are pertinent to share. 

library("dplyr")
library("readr")

movie_data <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCLEGE4Q3TAEHTDUYESDBUFVKG")


#same data but changed the $ values from character type to numeric type so we can work with it better

movies_df <- movie_data %>%
  mutate(WorldwideBox.Office = parse_number(WorldwideBox.Office),
         DomesticBox.Office = parse_number(DomesticBox.Office),
         InternationalBox.Office = parse_number(InternationalBox.Office))


summary_info <- list()

#1
summary_info$number_of_movies <- nrow(movies_df)

#2
summary_info$number_attributes <- ncol(movies_df)

#3
summary_info$number_foreign_movies <- sum(is.na(movies_df$DomesticBox.Office))

#4
summary_info$oldest_movie_date <- min(movies_df$Year)

#5
placeholder <- (sum(movies_df$WorldwideBox.Office))
summary_info$total_worldwide_box_office <- paste0("$",prettyNum(placeholder, big.mark = ","))


