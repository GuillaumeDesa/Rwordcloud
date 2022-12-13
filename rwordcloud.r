# Load required packages
library(shiny)
library(tm)
library(wordcloud)

# Define UI
ui <- fluidPage(
  
  # Application title
  titlePanel("Word Cloud Generator"),
  
  # Sidebar with options to load a text file and specify number of words
  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Choose a text file", accept = c("text/plain", ".txt")),
      sliderInput("num_words", "Number of words to include in word cloud:",
                  min = 50, max = 500, value = 100)
    ),
    
    # Show the word cloud in the main panel
    mainPanel(
      plotOutput("wordcloud", width = "600px", height = "600px")
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Reactive function to process the text file
  process_text <- reactive({
    # Load the text file
    text <- readLines(input$file$datapath)
    
    # Convert the text to lowercase and remove punctuation
    text <- tolower(text)
    text <- gsub("[[:punct:]]", "", text)
    
    # Tokenize the text
    text <- unlist(strsplit(text, "\\s+"))
    
    # Return the processed text
    return(text)
  })
  
  # Generate the word cloud using the processed text
  output$wordcloud <- renderPlot({
    wordcloud(process_text(), max.words = input$num_words)
  })
  
}

# Create the Shiny app by combining UI and server
shinyApp(ui = ui, server = server)
