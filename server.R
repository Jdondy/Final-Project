# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(plotly)
library(dplyr)
library("tidyverse")

shinyServer(function(input, output) {

# Page 2 bar chart 
    output$bar_graph <- renderPlotly({
      movie_df <- read.csv("../data/movies.csv")
      movie_df <- mutate(
        movie_df,
        WorldwideBox.Office = as.numeric(gsub('[$,]', '', WorldwideBox.Office))
      )
      top_year_df <- movie_df %>%
        group_by(Year) %>%
        filter(Year > "1989")
      top_year_df <- top_year_df[,-6]
      top_year_df <- top_year_df[,-5]
      top_year_df <- top_year_df[,-1]
      
      top_year_df <- top_year_df %>% 
        arrange(desc(WorldwideBox.Office)) %>% 
        group_by(Year) %>%
        slice(1:5)
      
      top_year_df <- top_year_df %>%
        filter(Year == input$year)
      
      options(scipen=10000)
      
      final_graph <- ggplot(top_year_df, aes(x=Year, y=WorldwideBox.Office, fill= Movie)) +
        geom_bar(stat="identity", width = 1, position="dodge") +
        ggtitle("Top 5 grossing movies worldwide by year") +
        xlab(input$year) +
        ylab("Revenue(dollars)") +
        theme(axis.text.x = element_blank(), axis.ticks = element_blank())
      
      fig <- ggplotly(final_graph)
      
    })
    
# Page 3 scatterplot 
    

    output$scatterplot_graph <- renderPlotly({
      data_3 <- read.csv("../data/movies.csv")
      
      data_3 <- mutate(
        data_3,
        WorldwideBox.Office = as.numeric(gsub('[$,]', '', WorldwideBox.Office)),
        DomesticBox.Office = as.numeric(gsub('[$,]', '', DomesticBox.Office))
      ) 

      data_3 <- data_3 %>%
        filter(Year == input$year1)
      
      options(scipen=10000)
      
      ggplot(data_3, aes(x= WorldwideBox.Office, y= DomesticBox.Office)) + 
        geom_point(size = 2, color = "blue") +
        geom_smooth() +
        ggtitle("Domestic Box Office Revenue vs. Worldwide Box Office Revenue") +
        xlab("Worldwide Box Office Revenue(Dollars)") +
        ylab("Domestic Box Office Revenue(Dollars)")
      
    })
    
    output$info <- renderText({
     paste0("Worldwide Box Office Revenue (dollars) =", input$plot_click$x, "\nDomestic Box Office Revenue (dollars) =", input$plot_click$y)
    })
    
#page 4 treemap
    
    library("readr")
    
    data4 <- read.csv("../data/movies.csv")%>%
      mutate(WorldwideBox.Office = parse_number(WorldwideBox.Office)) %>%
      mutate(WorldwideBox.Office = as.numeric(WorldwideBox.Office))
    
    only_2020 <- data4 %>%
      filter(Year == "2020")
    
    only_2021 <- data4 %>%
      filter(Year == "2021")
    
    since_covid_started <- merge(x = only_2020, y = only_2021, all = TRUE)
    
    #server <- (function(input, output){
      
      treemap2020 <- plot_ly(
        type = "treemap",
        labels=only_2020$Movie,
        parents=only_2020$Year,
        values=only_2020$WorldwideBox.Office,
      )
      treemap2021 <- plot_ly(
        type = "treemap",
        labels=only_2021$Movie,
        parents=only_2021$Year,
        values=only_2021$WorldwideBox.Office
      )
      
      treemapBoth <- plot_ly(
        type = "treemap",
        labels=since_covid_started$Movie,
        parents=since_covid_started$Year,
        values=since_covid_started$WorldwideBox.Office
        
      )
    
      treemaptest <- reactive({
        if ("2020" %in% input$selecty) return(treemap2020)
        if ("2021" %in% input$selecty) return(treemap2021)
        if ("Both Years" %in% input$selecty) return(treemapBoth) 
        
      })
      
      output$treemap <- renderPlotly({
        print(treemaptest())
      }) 
    
})