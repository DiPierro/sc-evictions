# Description: Read in and process South Carolina cities data from Eviction Lab.

# Author: Amy DiPierro
# Version: 2020-01-28

# Libraries
library(tidyverse)
library(readr)

# Parameters

## Input file
file_raw_in <- "https://eviction-lab-data-downloads.s3.amazonaws.com/SC/cities.csv"

## Raw output file
file_raw_out <- here::here("data-raw/sc_cities.csv")

## Clean output file
file_cleaned_out <- here::here("data/sc_cities.rds")

## Variables to read in

vars <-
  cols_only(
    "GEOID" = col_integer(),
    "year" = col_integer(),
    "name" = col_character(),
    "evictions" = col_double()
  )

## Variable to rename

var_to_rename <- c(geoid = "GEOID")

#===============================================================================

# Code

file_raw_in %>%
  read_csv() %>%
  write_csv(file_raw_out)

file_raw_in %>%
  read_csv(col_types = vars) %>%
  rename(!!! var_to_rename) %>%
  filter(year == 2016) %>%
  write_rds(file_cleaned_out)
