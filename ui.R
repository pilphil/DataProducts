library(shiny)
library(ggplot2)
library(Ecdat)
shinyUI(pageWithSidebar(
  headerPanel("Diamond Prices in Singapore"),
  sidebarPanel(
    p("The Diamond dataset from the Ecdat package has price information for diamnonds along with  their weight (in carats), their colour
      (either D, E, F, G, H or I) and clarity (either IF, VVS1, VVS2, VS1 or VS2). Of interest is the relative worth of the different grades
      of colour and clarity and whether differences in prices can be
      attributed to the 3 different certification bodies (either GIA, IGI or HRD). See summary and sample rows from the dataset on the right."),
    p("Source:  Chu, Singfat (2001), Pricing the C's of Diamond Stones, Journal of Statistics Education Volume 9, Number 2 (2001)"),
    p("Please pick the attributes for X, Y  axes and also a third attribute for the color). Also pick either Jitter or Smooth depending on the type of graph you want to generate."),
    
    br(),

    selectInput('x', 'X', names(Diamond)),
    selectInput('y', 'Y', names(Diamond)),
    selectInput('color', 'Color', names(Diamond)),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth')
  ),
  mainPanel(
    verbatimTextOutput('summary'),
    tableOutput('view'),
    plotOutput('plot')
  )
))