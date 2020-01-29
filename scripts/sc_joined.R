# Description: Join cities to boundaries data.

# Author: Amy DiPierro
# Version: 2020-01-29

# Libraries
library(tidyverse)
library(readr)
library(sf)

# Parameters

## Input files

cities_in <- here::here("data/sc_cities.rds")

boundaries_in <- here::here("data/sc_cities_boundaries.rds")

## Read in the data

cities <- read_rds(cities_in)

boundaries <- read_rds(boundaries_in)

## Raw output file
joined <- here::here("data/sc_joined.rds")

#===============================================================================

# Code

cities %>%
  left_join(boundaries, by = "geoid") %>%
  write_rds(joined)
