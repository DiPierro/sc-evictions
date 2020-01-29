# Description: Read in and process South Carolina cities boundaries data from Eviction Lab.

# Author: Amy DiPierro
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(readr)
library(sf)

# Parameters

## Input file
file_raw_in <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.geojson"

## Raw output file
file_raw_out <- here::here("data-raw/sc_cities_boundaries.rds")

## Clean output file
file_cleaned_out <- here::here("data/sc_cities_boundaries.rds")

## Variable to select and rename

vars_to_rename <- c(geoid = "GEOID", city_name = "n", geometry = "geometry")

#===============================================================================

# Code

file_raw_in %>%
  read_sf() %>%
  write_rds(file_raw_out)

file_raw_in %>%
  read_sf() %>%
  select(!!! vars_to_rename) %>%
  mutate(geoid = as.integer(geoid)) %>%
  write_rds(file_cleaned_out)
