library("tidyverse")
data <- read.csv("https://raw.githubusercontent.com/info201b-2021-aut/final-project-vannarys/main/movies.csv?token=AV5GCDQ6I4IOZLRE2WEP74TBUCFL6")
data <- data %>%
  mutate(across(.cols = c("WorldwideBox.Office", "DomesticBox.Office", "InternationalBox.Office"), .fns = parse_number))
data_burger <- data[, c(4:6)] <- sapply(data[, c(4:6)], as.numeric)
data <-as.data.frame(data_burger)
ggplot(data, aes(x= WorldwideBox.Office, y= DomesticBox.Office)) + 
  geom_point(size = 2, color = "blue") +
  geom_smooth() +
  ggtitle("Domestic Box Office Revenue vs. Worldwide Box Office Revenue") +
  xlab("Worldwide Box Office Revenue(Dollars)") +
  ylab("Domestic Box Office Revenue(Dollars)")
