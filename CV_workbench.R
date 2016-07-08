# Create data
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

# Factorize tools col
data$Tools <- factor(data$Tools,levels = data$Tools)

# Create CV data
cv <- data.frame(Position = c("Nabit Evangelist at CloudRaker", "Planner at Tribal DDB",
                              "Campaign Manager at ACHTUNG!", "Digital Analyst at Transavia",
                              "Bsc. in Communication Sciences from KULeuven",
                              "MLitt. in  Management from University of St. Andrews"),
                 Group = c("Work","Work","Work","Work","Academics", "Academics"),
                 StartDate = c("2011-08-01","2012-08-01","2013-03-01","2015-07-01",
                               "2006-08-01","2009-08-01"),
                 EndDate = c("2012-07-01", "2013-03-1", "2015-03-31", as.character(Sys.Date()),
                             "2009-08-01", "2010-11-01"))

cv$StartDate <- as.Date(cv$StartDate)
cv$EndDate <- as.Date(cv$EndDate)

# Tooltip function for displaying first var
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

# Bubble chart example
Bubble <- gvisBubbleChart(data, idvar="Tools", 
                          xvar="Years", yvar="Level",
                          colorvar="Skills", sizevar="Level",
                          options=list(
                            hAxis='{minValue:0, maxValue:5}'))
plot(Bubble)

# Timeline chart example
require(timeline)
require(googleVis) 
plot(gvisTimeline(cv, barlabel="Position", rowlabel="Group",
                  start="StartDate", end="EndDate",
                  options=list(
                    timeline="{barLabelStyle:{fontSize:9},
                    showBarLabels: false}", width = 600)))
    

# example ww2
data(ww2)
ww2$Person <- gsub("\\n" ," ", ww2$Person)
plot(gvisTimeline(ww2, barlabel="Person", rowlabel="Group",
                  start="StartDate", end="EndDate",
                  options=list(width=600, heigth = 400), chartid="ww2")
)