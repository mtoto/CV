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

skillz <- data.frame(Skills = c("Web Analytics", "Web Analytics","Web Analytics", 
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

s1 <- subset(skillz, skillz$Skills == "Web Analytics")[,2:3]
s2 <- subset(skillz, skillz$Skills == "Online Advertising")[,2:3]
s3 <- subset(skillz, skillz$Skills == "Data Science")[,2:3]
s4 <- subset(skillz, skillz$Skills == "Coding")[,2:3]


