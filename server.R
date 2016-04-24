library(tm)
#setwd("C:/R_Dat/capstone/shiny_app")
a<-load("trigram.RData")



text_manipulation <- function(input) {
  ################################### 
  # Processing input for prediction #
  ###################################
  
  ### clean the input from special characters
  ### ----------------------------------------
  input <- gsub("[^A-Za-z ]","",input)
  input <- tolower(input)   
  
  ### compose input for prediction
  ### ----------------------------------------
  input <- strsplit(input, " ")                           # split into words
  input <- unlist(input)                                  # extract words out of list into vector
  input <- rev(input)                                     # put in reverse order; need last words to predict
  input3 <- paste(input[3],input[2],input[1],sep = ' ')   # compose last 3 words for trigram 
  input2 <- paste(input[2],input[1],sep = ' ')            # compose last 2 words for bigram
  input1   <- input[1]                                    # get last word
  
  ### predict
  ### ----------------------------------------
  index2      <-grepl(paste0("^",input1,"$"),gram2$input) # index of entry, if bigram exists
  index3      <-grepl(paste0("^",input2,"$"),gram3$input) # index of entry, if trigram exists
  
  if(sum(index3) > 0 )                                    # if trigram exists, then do:
  { 
    pred_word_bi  <-gram2[index2,]                        # get row of bigram
    pred_word_tri <-gram3[index3,]                        # get row of trigram
    
    if((pred_word_bi$s*0.4) > pred_word_tri$s)            # if PROB(.4*bigram) > PROB(trigram) (stupid backoff) then do:  
    {
      return(pred_word_bi$output)                         # output prediction of bigram
    }
    else                                                  # else:
    {
      return(pred_word_tri$output)                        # output prediction of trigram
    }    
  }
  else                                                    # if no trigram exists then do:
  {
    if(sum(index2) > 0)                                   # if bigram exists then do:
    {
      pred_word_bi    <-gram2[index2,]                    # get row of bigram
      return(pred_word_bi$output)                         # output prediction of bigram 
    } 
    else                                                  # if no bigram exists then do
    {
      return(gram1[1]$unigram)                            # output prediction of word
    }
  }
}


shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$input})
    output$manipulated <- renderPrint({text_manipulation(input$input)})
  }
)
