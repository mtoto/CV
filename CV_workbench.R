data <- data.frame(Skills = c("Web Analytics", "Web Analytics","Web Analytics", 
                              "Online Advertising","Online Advertising","Online Advertising", 
                              "Data Science","Data Science","Data Science", 
                              "Coding", "Coding", "Coding"),
                   Tools = c("Google Analytics", "Adobe SiteCatalyst", "Optimizely",
                             "AdWords", "Facebook Power Editor", "Clang", 
                             "Jupyter Notebooks", "Databricks", "RStudio",
                             "R","Python","Spark"),
                   Level = c(9,6,7,
                             8,7,6,
                             7,6,9,
                             8,4,6),
                   Years = c(4,1.5,1.75,
                             3.25,2.25,1.25,
                             0.5,0.75,2,
                             1.85,0.75,0.5))


data$Tools <- factor(data$Tools,levels = data$Tools)

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  paste0(names(x)[1], ": ", format(x)[1], collapse = "<br />")
}

# Nice but hover wont work in html
library(ggvis)
data %>% ggvis(x = ~Tools, y = ~Level, fill =~Skills,
               fillOpacity := 0.2, fillOpacity.hover := .5) %>%
  layer_bars() %>%
  scale_numeric("y", domain = c(0, 10), nice = FALSE) %>%
  add_axis("y", title = "Level of Mastery") %>%
  hide_legend("fill") %>%
  add_tooltip(all_values, "hover") %>%
  add_axis("x", title ="",
           properties = axis_props(labels = list(angle = 55, align = "left")))

Bubble <- gvisBubbleChart(data, idvar="Tools", 
                          xvar="Years", yvar="Level",
                          colorvar="Skills", sizevar="Level",
                          options=list(
                            hAxis='{minValue:0, maxValue:5}'))
plot(Bubble)

base <- mtcars %>% ggvis(x = ~wt, y = ~mpg) %>%
  layer_points()
base %>% add_tooltip(all_values, "hover")
base %>% add_tooltip(all_values, "click")


library(ggvis)
data$id <- 1:nrow(data)

all_values <- function(x) {
  if(is.null(x)) return(NULL)
  row <- data[data$id == x$id, ]
  paste0(names(row), ": ", format(row), collapse = "<br />")
}

mtc %>% ggvis(x = ~wt, y = ~mpg, key := ~id) %>%
  layer_points() %>%
  add_tooltip(all_values, "hover")