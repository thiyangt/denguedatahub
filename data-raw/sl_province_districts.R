library(tibble)
sl_province_districts <- 
          tibble::tribble(
            ~province, ~district,
            "Western", "Colombo",
            "Western", "Gampaha",
            "Western", "Kalutara",
            "Central", "Kandy",
            "Central", "Matale",
            "Central", "NuwaraEliya",
            "Southern", "Galle",
            "Southern", "Hambanthota",
            "Southern", "Matara",
            "Northern", "Jaffna",
            "Northern", "Kilinochchi",
            "Northern", "Mannar",
            "Northern", "Vavuniya",
            "Northern", "Mullaitivu",
            "Eastern", "Batticaloa",
            "Eastern", "Ampara",
            "Eastern", "Trincomalee",
            "North-Western", "Kurunegala",
            "North-Western", "Puttalam",
            "North-Central", "Anuradhapura",
            "North-Central", "Polonnaruwa",
            "Uva", "Badulla",
            "Uva", "Monaragala",
            "Sabaragamuwa", "Ratnapura",
            "Sabaragamuwa", "Kegalle",
            "Eastern", "Kalmune"
          )

usethis::use_data(sl_province_districts, overwrite = TRUE)
