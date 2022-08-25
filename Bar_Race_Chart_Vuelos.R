
airlines_pr <- read_csv("bts_rita_pr.csv")

str(airlines_pr)

airlines_year <- select(airlines_pr, "PASSENGERS", "UNIQUE_CARRIER_NAME","YEAR")

grouped_passengers <- airlines_year %>% group_by(YEAR,UNIQUE_CARRIER_NAME) %>% summarise(PASSENGERS = sum(PASSENGERS))

view(grouped_passengers)

head(airlines_year)



Pivoted_wide <- grouped_passengers %>% pivot_wider(names_from = "YEAR","UNIQUE_CARRIER_NAME", values_from = "PASSENGERS")


head(Pivoted_wide)

view(Pivoted_wide)

view(airlines_year)

write.csv(Pivoted_wide,"\\Desktop\\vuelos\\Pivoted.csv", row.names = FALSE)