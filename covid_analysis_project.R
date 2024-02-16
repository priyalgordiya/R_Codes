covid_df <- read.csv(file.choose())
str(covid_df)
library(dplyr)
install.packages("dplyr")
library(dplyr)
covid_df_all_states <- filter(covid_df, Province_State =="All States")
str(covid_df_all_states)
covid_df_all_states_daily_data <- select(covid_df_all_states, Date, Country_Region, active, hospitalizedCurr, daily_tested, daily_positive)
covid_df_all_states_daily_data_sum <- covid_df_all_states_daily_data %>%
  group_by(Country_Region) %>%
  summarise(tested= sum(daily_tested),
            positive = sum(daily_positive),
            active = sum(active),
            hospitalized = sum(hospitalizedCurr)) %>%
  arrange(-tested)
covid_df_all_states_daily_data_sum
covid_top_10 <- head(covid_df_all_states_daily_data_sum, n=10)
covid_top_10
countries <- covid_top_10$Country_Region

tested_cases <- covid_top_10$tested

positive_cases <- covid_top_10$positive

active_cases <- covid_top_10$active

hospitalized_cases <-covid_top_10$hospitalized
names(positive_cases) <- countries

names(tested_cases) <- countries

names(active_cases) <- countries

names(hospitalized_cases) <- countries
positive_against_tested_ratios <-positive_cases / tested_cases

positive_tested_top_3 <- positive_against_tested_ratios > 0.07
positive_tested_top_3
hgh_positive_tested_top_3 <- c("United Kingdom" = 0.11,"United States" = 0.10,"Turkey" = 0.08)
hgh_positive_tested_top_3

united_kingdom <- c(0.11, 1473672, 166909, 0, 0)

united_states <- c(0.10, 17282363, 1877179, 0, 0)

turkey <- c(0.08, 2031192, 163941, 2980960, 0)
covid_matrixx <- rbind(united_kingdom,united_states,turkey)
covid_matrixx
colnames(covid_matrixx) <- c("Ratio", "tested", "positive", "active", "hospitalized")
covid_matrixx

question <- "Which countries have had the highest number of positive cases against the number of tests?"
answer <- c("Positive tested cases" = hgh_positive_tested_top_3)
data_structure_list <- list(covid_df, covid_df_all_states, covid_df_all_states_daily_data, covid_top_10)
data_frames_list
data_matriz_list <- list(covid_matrixx)
vector_list <- list(countries)
names(data_structure_list) <- c("Data Frames", "Matrix", "Vectors")
covid_analysis_list <- list(question, answer, data_structure_list)
covid_analysis_list
