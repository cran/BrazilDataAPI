## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(BrazilDataAPI)
library(ggplot2)
library(dplyr)

## ----brazil-rates,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

# Retrieves official interest rates and indexes from the BrazilAPI

brazil_rates_001 <- get_brazil_rates()

print(brazil_rates_001)


## ----brazil-Vehicles,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

# A string indicating the type of vehicle. Must be one of "carros", "motos", or "caminhoes".

brazil_vehicles <- get_brazil_vehicle_brands("motos")

print(brazil_vehicles)


## ----brazil-Municipalities,echo = TRUE,message = FALSE,warning = FALSE,results = 'markup'----

# A two-letter string representing the Brazilian state abbreviation (e.g., "SP", "RJ", "BA").

brazil_Municipalities <- get_brazil_municipalities("SP")

print(brazil_Municipalities)


## ----brazil-femalestats-plot, message=FALSE, warning=FALSE, fig.width=7, fig.height=5----

# Summarize total deaths by age and year
df_plot <- Brasil_females_df %>%
  group_by(year1, age) %>%
  summarise(total_deaths = sum(deaths, na.rm = TRUE), .groups = "drop")

# Plot: Deaths by age group over time
ggplot(df_plot, aes(x = age, y = total_deaths, color = as.factor(year1))) +
  geom_line(size = 1) +
  labs(
    title = "Female Deaths by Age Group in Brazil",
    subtitle = "Aggregated by year (year1)",
    x = "Age",
    y = "Number of Deaths",
    color = "Year"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(face = "bold", size = 14),
    legend.position = "bottom"
  )


