#    http://shiny.rstudio.com/

library(shiny)
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyverse)

shinyUI(fluidPage(
  navbarPage("My Application",
  
  tabPanel("Project Introduction",
    titlePanel("Home Page"),
      h3("Introduction"),
      p("Movies and TV shows are a prominent piece of many people's lives in today's society. Movies shape and reflect culture, inspire, educate, and of course, entertain. With the fluctuation of the COVID-19 virus, movies have become more and more popular, which is why we decided to involve movies in our topic. Our group took on the challenge of analyzing movie data to answer some of the questions that both movie connoisseur's and the general population may have had lingering in their minds. Such questions include:",  style = "font-family: 'times'; font-si22pt"),
      tags$ul(
      tags$li("What were the highest grossing movies within the last decade?",  style = "font-family: 'times'; font-si22pt"), 
      tags$li("What have been the most successful movies since COVID-19 began?",  style = "font-family: 'times'; font-si22pt"), 
      tags$li("What is the relationship between domestic (United States) and worldwide box office sales?",  style = "font-family: 'times'; font-si22pt")),
      p("Through analysis of the All Time Worldwide Box Office data set, which includes the highest grossing movies in history, along with the year it came out, the domestic, worldwide, and international box office numbers, we were able to answer said questions. In the All Time Worldwide Box Office data set, there are 7 movies from foreign countries that made the list without having any sales domestically. Movies in the data set date all the way from 1939 to 2021. The 595 movies in the data set cumulatively have acquired a whopping $312,316,769,990 in worldwide box office revenue. Answers to these questions are given both in text, and visually with a bar graph, scatter plot, and a tree map.", style = "font-family: 'times'; font-si22pt"),
      tags$img(src = "https://github.com/info201b-2021-aut/final-project-vannarys/blob/fc80b87c48f30a6afd508ecda292247483953a67/forMovie.jpg")),
  
  tabPanel("Bar Chart",
    titlePanel("Interactive Bar Chart"),
      sidebarLayout(
        
          sidebarPanel(
            sliderInput(
              inputId = "year",
              label = "Choose year",
              min = 1990,
              max = 2021,
              value = 2005,
              sep = "")),
         
           mainPanel(
            p("The bar graph below shows the relationship between the top 5 movies in the selected year based off of worldwide box office revenue. Users are able to choose a year from 1990 to 2021 and view the top 5 movie of that year. They can hover over a specific bar and view the exact amount of revenue the movie earned. By looking through the years you are also able to compare the overll success of the box office revenue worldwide of the selected year. From this chart one can conclude that the average worldwide box office revenue has remained consistent at around 500 million."),
            plotlyOutput("bar_graph"))
  )),
  
  tabPanel("Scatterplot",
           
           sidebarPanel(
             sliderInput(
               inputId = "year1",
               label = "Choose year",
               min = 1990,
               max = 2021,
               value = 2005,
               sep = "")),
  
  titlePanel("Interactive Scatterplot"),
  
    mainPanel(
      p("The scatterplot graph belows shows the relationship between domestic box office sales in the U.S. and worldwide box office sales for various movies throughout the 1990s to early 2020s. The scatterplot was created in order to answer the question:'What is the relationship between domestic (United States) and worldwide box office sales?'. Users can also interact with the chart to see the relationship between the domestic and worldwide revenue for movies in a certain year. From the chart, it can be seen that throughout time, the relationship between domestic and worlwide movie sales are relatively linear and positive, signaling a strong relationship between the two variables. This indicates that, throughout time, as domestic box office sales go up, so do worlwide box office sales."),
      plotlyOutput("scatterplot_graph")
      )
      ),
  
  tabPanel("Treemap",
           titlePanel("Treemap"),
           h3("Top Grossing Movies During COVID"),
           p("Since the pandemic started in early 2020, movie theatres have undergone a shut-down phase, with most of them reopening earlier this year.That being said, the film industry definitely slowed down, but did not come to a complete standstill. Movies were still being released in the U.S., and overseas. Lets take a look at the movies with the highest worldwide box office revenue during the pandemic and see if anything stands out. Use the drop-down on the left to select specific years during COVID, or to view the time frame altogether. Hover your cursor over a movie to see the worldwide box office revenue for that movie. While looking at the treemaps, you may notice that many movies are about the same size, indicating they generated similar amounts of worldwide box office revenue. Something to keep in mind is that the movies are ordered so that those with the highest box office sales are positioned towards the left. With that in mind, you may notice that the movies on the left side tend to have foreign titles, which tells us that international movies were at the top of the worldwide box office charts during COVID.
 "),
           
           sidebarLayout(
             sidebarPanel(
               selectInput(inputId = "selecty",
                           label = h3("Select Year"), 
                           choices = list("2020", "2021", "Both Years"),
               )
             ),
             
             mainPanel(
               plotlyOutput("treemap")
             )
           )
  ),
  
  tabPanel("Conclusion",
           titlePanel("Summary"),
           p("After analyzing the All Time Worldwide Box Office data set, our findings for the question, 'What were the highest grossing movies within the last decade?' Looked like this: In 2019, Avengers: Endgame was the highest grossing film in the past decade, earning over $2.7 billion. The second highest grossing film was in 2015 for the movie, Star Wars Ep. VII: The Force Awakens, making over $2 billion as well. The success of these movies could have been due to the long awaited finales of their respective movie series, Avengers and Star Wars. Although, since 2020 there has been a dramatic decline in revenue, with Kimetsu no Yaiba: Mugen Ressha-Hen making over $470 million, possibly due to the Covid-19 pandemic causing many movie theaters to close down.",  style = "font-family: 'times'; font-si22pt"),
           tags$img(src = "https://github.com/info201b-2021-aut/final-project-vannarys/blob/fc80b87c48f30a6afd508ecda292247483953a67/bar.PNG", height="65%", width="65%"),
           p("For the question, 'What have been the most successful movies since COVID-19 began?' Our findings were as follows: The top movies in 2021 take up a bigger proportion of the chart than 2020, meaning that the top movies of 2021 were overall more successful in terms of worldwide box office revenue than 2020. Something worth noting is that the movies that take up the most space on each year of the chart are movies from other countries.", style = "font-family: 'times'; font-si22pt"),
           tags$img(src = "https://github.com/info201b-2021-aut/final-project-vannarys/blob/fc80b87c48f30a6afd508ecda292247483953a67/treemap.PNG", height="65%", width="65%",),
           p("Regarding the question, 'What is the relationship between domestic (United States) and worldwide box office sales?' We found: Per the chart and the best fit line, it seems to be a rather linear relationship, meaning as the worldwide box office revenue increases, the domestic box office revenue increases, nearly proportionally. The curve does seem to flatten out at the end, possibly meaning that as the worldwide box office revenue increases, the majority of the money starts to come from international box office sales.", style = "font-family: 'times'; font-si22pt"),
           tags$img(src = "https://github.com/info201b-2021-aut/final-project-vannarys/blob/fc80b87c48f30a6afd508ecda292247483953a67/relationship.PNG", height="65%", width="65%")
  )
           ),
  
))
