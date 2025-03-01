library(httr)
library(jsonlite)

# Define the full API URL with https://
url <- "https://api.snooker.org/?rt=MoneyRankings&s=2015"

# Define the required header
headers <- add_headers(`X-Requested-By` = "SilfverbergTraining152")

# Make the GET request
response <- GET(url, headers)

# Check response status
if (status_code(response) != 200) {
  print(content(response, as = "text"))
  stop(paste("Error:", status_code(response)))
}

# Parse the response into JSON
json_data <- content(response, as = "text", encoding = "UTF-8")
parsed_data <- fromJSON(json_data)

# Convert to data.frame (if applicable)
df <- as.data.frame(parsed_data)
head(df)