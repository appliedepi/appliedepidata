#' Search and Filter Datasets Available in appliedepidata
#'

#' @details
#' Launches an interactive Shiny application that allows users to filter and 
#' search a dataset. 
#' Users can select a language from a dropdown menu and enter a search query to 
#' filter the data displayed in a reactive table.
#' 
#' @return A Shiny application object. This function will open the Shiny app in a web browser when executed.
#'
#' @examples
#' \dontrun{
#' # Launch the interactive data search application
#' search_data()
#' }
#' 
#' @import shiny
#' @import reactable
#' @import dplyr
#' @import rio
#' @export

# Define the function for interactive data search
search_data <- function() {
  # Define the Shiny app
  shinyApp(
    # User interface
    ui = fluidPage(
      titlePanel("Select Language for the Dataset Table"),
      sidebarLayout(
        sidebarPanel(
          uiOutput("language_selector"),
          textInput("search_query", "Search:", "")
        ),
        mainPanel(
          reactableOutput("table")
        )
      )
    ),
    
    # Server logic
    server = function(input, output, session) {
      # Load the data
      table_of_tables <- rio::import(system.file("extdata", "tableoftables.xlsx", 
                                                 package = "appliedepidata"))
      
      # Group by unique_identifier to combine languages
      find_langs <- table_of_tables |>
        dplyr::group_by(unique_identifier) |>
        dplyr::summarize(language = paste(unique(language), collapse = ", "), 
                         .groups = 'drop')
      
      # Dynamically generate available languages based on the dataset
      available_languages <- unique(table_of_tables$language)
      
      # Update language dropdown choices dynamically
      output$language_selector <- renderUI({
        selectInput("selected_language", 
                    "Choose a language:", 
                    choices = available_languages, 
                    selected = available_languages[1])
      })
      
      # Reactive expression to filter and prepare data based on the selected language and search query
      filtered_data <- reactive({
        table_of_tables |>
          dplyr::filter(language == input$selected_language) |>
          dplyr::filter(grepl(input$search_query, name, ignore.case = TRUE)) |>
          dplyr::select(unique_identifier, name, description, group_identifier) |>
          dplyr::left_join(find_langs, by = "unique_identifier") |>
          dplyr::select(name, description, language, group_identifier)
      })
      
      # Render the reactable table based on the selected language and search query
      output$table <- renderReactable({
        reactable(filtered_data(), 
                  searchable = TRUE, 
                  pagination = TRUE, 
                  defaultPageSize = 10)
      })
    }
  )
}
