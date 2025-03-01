library(httr)

# Define the API URL
url <- "https://api.example.com/data"

# Define the headers
headers <- add_headers(Authorization = "Bearer YOUR_API_KEY",
                       CustomHeader = "YourHeaderValue")

# Make the GET request
response <- GET(url, headers)

# Parse the response
content <- content(response, as = "text", encoding = "UTF-8")
json_data <- jsonlite::fromJSON(content)

# Print the JSON data
print(json_data)