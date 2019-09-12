#Read dataset CSV file
Dataset <- read.csv(file="F:/Dissertation/Dataset.csv", header=TRUE, sep=",")

#Set null values to NA
Dataset <- read.csv(file="F:/Dissertation/Dataset.csv", header=T, na.strings=c("","NA"))
Dataset[Dataset =="{}"] <- NA
Dataset[Dataset =="Missing"] <- NA
Dataset[Dataset =="None of these"] <- NA

#Remove unused variables
Dataset$course_id_DI <- NULL
Dataset$userid_DI <- NULL
Dataset$registered <- NULL
Dataset$explored <- NULL
Dataset$grade <- NULL
Dataset$grade_reqs <- NULL
Dataset$completed_. <- NULL
Dataset$course_reqs <- NULL
Dataset$final_cc_cname_DI <- NULL
Dataset$gender <- NULL
Dataset$start_time_DI <- NULL
Dataset$course_start <- NULL
Dataset$course_end <- NULL
Dataset$last_event_DI <- NULL
Dataset$nevents <- NULL
Dataset$ndays_act <- NULL
Dataset$ncontent <- NULL
Dataset$nforum_posts <- NULL
Dataset$course_length <- NULL

#Rename remaining variables
names(Dataset) <- c("SubjectArea", "CourseViewed", "ReasonForStudy", "LearnerType", "StudyHours", "PreviousEducation", "AgeRange")

#Set lappy function on dataset
Dataset[] <- lapply(Dataset, as.character) 

#ReasonForStudy
Dataset[Dataset =="I am curious about MOOCs"] <- 4
Dataset[Dataset =="I am preparing for college for the first time"] <- 3
Dataset[Dataset =="I am preparing to go back to school"] <- 3
Dataset[Dataset =="I enjoy being part of a community of learners"] <- 2
Dataset[Dataset =="I enjoy learning about topics that interest me"] <- 3
Dataset[Dataset =="I hope to gain skills for a new career"] <- 1
Dataset[Dataset =="I hope to gain skills for a promotion at work"] <- 1
Dataset[Dataset =="I hope to gain skills to use at work"] <- 1
Dataset[Dataset =="I like the format (online)"] <- 4
Dataset[Dataset =="I want to try Canvas Network"] <- 4

#LearnerType
Dataset[Dataset =="Active"] <- 1
Dataset[Dataset =="Active participant"] <- 2
Dataset[Dataset =="Drop-in"] <- 3
Dataset[Dataset =="Observer"] <- 4
Dataset[Dataset =="Passive"] <- 5
Dataset[Dataset =="Passive participant"] <- 6

#StudyHours
Dataset[Dataset =="Less than 1 hour"] <- 1
Dataset[Dataset =="Between 1 and 2 hours"] <- 2
Dataset[Dataset =="Between 2 and 4 hours"] <- 3
Dataset[Dataset =="Between 4 and 6 hours"] <- 4
Dataset[Dataset =="Between 6 and 8 hours"] <- 5
Dataset[Dataset =="More than 8 hours per week"] <- 6

#PreviousEducation
Dataset[Dataset =="Completed 2-year college degree"] <- 2
Dataset[Dataset =="Completed 4-year college degree"] <- 2
Dataset[Dataset =="High School or College Preparatory School"] <- 1
Dataset[Dataset =="Master's Degree (or equivalent)"] <- 3
Dataset[Dataset =="Ph.D., J.D., or M.D. (or equivalent)"] <- 4
Dataset[Dataset =="Some college, but have not finished a degree"] <- 2
Dataset[Dataset =="Some graduate school"] <- 3

#AgeRange
Dataset[Dataset =="{19-34}"] <- 1
Dataset[Dataset =="{34-54}"] <- 2
Dataset[Dataset =="{55 or older}"] <- 3
#Dataset[Dataset =="Prefer not to say"] <- 4

#Set NA values to 0
Dataset[is.na(Dataset)] <- 0
Dataset<-Dataset[!(Dataset$PreviousEducation=="0"),]

#Write dataset as CSV file
write.csv(Dataset,"F:/Dissertation/Transcripts/Pre-Processed Dataset.csv", row.names = FALSE)