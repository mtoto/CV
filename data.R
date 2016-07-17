# timeline data
cv1 <- data.frame(Position = c("Nabit Evangelist", "Planner",
                               "Campaign Analytics", "Digital Analyst"),
                  Group = c("CloudRaker","Tribal DDB","ACHTUNG!","Transavia"),
                  StartDate = c("2011-08-01","2012-08-01","2013-03-01","2015-07-01"),
                  EndDate = c("2012-07-01", "2013-03-1", "2015-03-31", as.character(Sys.Date())))

cv1$StartDate <- as.Date(cv1$StartDate)
cv1$EndDate <- as.Date(cv1$EndDate)

# timeline data
cv2 <- data.frame(Position = c("Bsc. in Communication Sciences","Exchange",
                              "MLitt. in  Management"),
                 Group = c("KU Leuven", "University of Jönköping" ,"University of St. Andrews"),
                 StartDate = c("2006-08-01","2008-07-01", "2009-08-01"),
                 EndDate = c("2009-08-01","2008-12-30", "2010-11-01"))

cv2$StartDate <- as.Date(cv2$StartDate)
cv2$EndDate <- as.Date(cv2$EndDate)



# colchart data
skillz <- data.frame(Skills = c("Web Analytics", "Web Analytics","Web Analytics", 
                              "Online Advertising","Online Advertising","Online Advertising", 
                              "Data Science","Data Science","Data Science", 
                              "Coding", "Coding", "Coding"),
                   Tools = c("Google Analytics", "Adobe SiteCatalyst", "Optimizely",
                             "AdWords", "Facebook Power Editor", "Clang", 
                             "Databricks", "Git", "Jupyter Notebooks", # come up with something else
                             "R","Spark","Python"),
                   Level = c(9,6,7,
                             8,7,6,
                             8,6,7,
                             8,5,4),
                   Years = c(4,1.5,1.75,
                             3.25,2.25,1.25,
                             0.5,0.75,2,
                             1.85,0.75,0.5))

s1 <- subset(skillz, skillz$Skills == "Web Analytics")[,2:3]
s2 <- subset(skillz, skillz$Skills == "Online Advertising")[,2:3]
s3 <- subset(skillz, skillz$Skills == "Data Science")[,2:3]
s4 <- subset(skillz, skillz$Skills == "Coding")[,2:3]

# Sanky plot data
jobsSK <- data.frame(From=c(rep("Digital Analyst",3), rep("Campaign Manager", 3)),
                     To=c(rep(c("Web Analytics", "Online Advertising", 
                                "Data Science"),2)),
                     Weight=c(5,4,7,7,6,2))


