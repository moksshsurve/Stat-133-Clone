#WORKOUT 1
#Shiny App: Savings Simulations
# Inputs:
#   initial_amt: principle amt invested
#   annual_contrib: contribution at end of each year
#   ret_rate: return rate
#   gro_rate: growth rate
#   years: number of years
#   facet: yes/no
#
# Outputs:
#   plot: timeline plot of investment
#   table: year on year value of investment

library(shiny)
library(ggplot2)
library(DT)
library(tidyr)



# Define UI for application
ui <- fluidPage(
  
  # Application title
  titlePanel("Investment Modality Simulations"),
  
  # Sidebar  
  #sidebarLayout(
    #sidebarPanel(
      fluidRow
      (  
        column
        (4,
          sliderInput("initial_amt", label = "Intial Amount:", min = 1, max = 100000, value = 1000),
          sliderInput("annual_contrib", label = "Annual Contribution:", min = 0, max = 50000, value = 2000)
        ),
        column
        (4,
          sliderInput("ret_rate", label = "Return Rate (in %):", min = 0, max = 20, value = 5),
          sliderInput("gro_rate", label = "Growth Rate (in %):", min = 0, max = 20, value = 2)
        ),
        column
        (4,
          sliderInput("years", label = "Years:", min = 0, max = 50, value = 10),
          selectInput("facets", label = "Facet?", choices = c("No", "Yes"))
        )
    ),
    
    fluidRow
    (
      column
      (12,
      # Show a plot of the relative frequencies
        h4("Timelines"),
        plotOutput("investment_plot")
      )
    ),
        
    fluidRow
    (
      column
      (12,
        # Output: Header + Table
        h4("Observations"),
        DT::dataTableOutput("data_tbl")
      )
    )
    
  )



# Define server logic required to draw the plot
server <- function(input, output) 
  {
  
  
  # Fill in the spot we created for a plot
  output$data_tbl <- DT::renderDataTable(DT::datatable
  ({
    
    yr <- input$years
    rate <- input$ret_rate/100
    g_rate <- input$gro_rate/100
    tbl <- data.frame("year"=0:yr, "no_contrib"=0:yr, "fixed_contrib"=0:yr, "growing_contrib"=0:yr)
    
    for (i in 1:(yr+1))
    {
      #no_contrib
      fv <- input$initial_amt * ((1 + rate)^(i-1))
      #fixed_contrib
      fva <- (input$initial_amt * ((1 + rate)^(i-1))) + (input$annual_contrib * ( ((1+rate)^(i-1) - 1)/rate ))
      #growing_contrib
      fvga <- (input$initial_amt * ((1 + rate)^(i-1))) + (input$annual_contrib * ( ((1+rate)^(i-1) - (1+g_rate)^(i-1)) / (rate-g_rate)))
      
      #filling up table
      tbl$no_contrib[i] <- fv
      tbl$fixed_contrib[i] <- fva 
      tbl$growing_contrib[i] <- fvga 
    }
    
    tbl


  }))
  
  output$investment_plot <- renderPlot({
    
    yr <- input$years
    rate <- input$ret_rate/100
    g_rate <- input$gro_rate/100
    tbl <- data.frame("year"=0:yr, "no_contrib"=0:yr, "fixed_contrib"=0:yr, "growing_contrib"=0:yr)
    
    for (i in 1:(yr+1))
    {
      #no_contrib
      fv <- input$initial_amt * ((1 + rate)^(i-1))
      #fixed_contrib
      fva <- (input$initial_amt * ((1 + rate)^(i-1))) + (input$annual_contrib * ( ((1+rate)^(i-1) - 1)/rate ))
      #growing_contrib
      fvga <- (input$initial_amt * ((1 + rate)^(i-1))) + (input$annual_contrib * ( ((1+rate)^(i-1) - (1+g_rate)^(i-1)) / (rate-g_rate)))
      
      #filling up table
      tbl$no_contrib[i] <- fv
      tbl$fixed_contrib[i] <- fva 
      tbl$growing_contrib[i] <- fvga 
    }
    
    
    #choosing facetted/or non
    if(input$facets == "No")
    {
      ggplot(data=tbl, aes(year)) + 
        geom_line(aes(y=tbl$no_contrib, color='no_contrib')) + geom_point(aes(y=tbl$no_contrib, color='no_contrib')) +
        geom_line(aes(y=tbl$fixed_contrib, color='fixed_contrib')) + geom_point(aes(y=tbl$fixed_contrib, color='fixed_contrib')) +
        geom_line(aes(y=tbl$growing_contrib, color='growing_contrib'))  + geom_point(aes(y=tbl$growing_contrib, color='growing_contrib')) +
        labs(x='Year', y='Value of Investment ($)', title='Growth of Investment', color="Investing Modality")
    }
    
    else
    {
      new_tbl <- gather(tbl, key='type', value='value', c('no_contrib', 'fixed_contrib', 'growing_contrib'))
      new_tbl$variable = factor(new_tbl$type, levels=c('no_contrib','fixed_contrib','growing_contrib'))
      
      ggplot(data=new_tbl) +
        geom_line(aes(x=year, y=value, color=variable)) + 
        geom_point(aes(x=year, y=value, color=variable)) +
        facet_wrap(. ~variable) + 
        geom_area(aes(x=year, y=value, fill=variable, alpha=0.5)) +
        labs(x='Year', y='Value of Investment ($)', title='Growth of Investment')
    }

  })

}

# Run the application 
shinyApp(ui = ui, server = server)
