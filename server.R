
source("ezcaret.R")


server <- function(input, output, session) {
  observeEvent(input$file, {
    #テーブルにて表示
    csv_file <- reactive({read.csv(input$file$datapath)})
    output$table <- renderTable({head(csv_file(), n = 30)})
    
    #目的変数を選択
    output$ydata <- renderUI({ 
      selectInput("ydata", "Purpose variable", 
                  choices = colnames(csv_file()))
    })
  })
  

  
  
  observeEvent(input$ydata, {
    csv_file <- reactive({read.csv(input$file$datapath)})
    
    #説明変数を選択
    output$xdata <- renderUI({
      checkboxGroupInput("xdata", 
                         label = "Explanatory variable",
                         choices = colnames(csv_file()))
      })
    #手法を選択
    output$method <- renderUI({
      selectInput("method", "Method", choices = method.vec)
    })
  })


  observeEvent(input$submit, {

    csv_file <- reactive({read.csv(input$file$datapath)})
    

    
    print(input$ydata)
    result <- reactive({train(form = chr2formula(y = input$ydata, x = input$xdata), 
                                       data = csv_file(),
                                       method = input$method)})
    
    
    output$plot <- renderPlot({plot(result())})
    output$sum <- renderPrint({(result())})
    
    
    
    observeEvent(input$newfile, {
      #テーブルにて表示
      csv_newfile <- reactive({read.csv(input$newfile$datapath)})
      pred.vec <- reactive({predict(result(), csv_newfile())})
      csv_writefile <- reactive({data.frame(csv_newfile(), Predict = pred.vec())})
      

      #予測値ダウンロード
      output$downloadData = downloadHandler(
        filename = "caret_predict.csv",
        content = function(filename) {write.csv(csv_writefile(), filename)}
      )
      
    })

    


  })
    
}





