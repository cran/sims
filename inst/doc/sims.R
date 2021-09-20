## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----example------------------------------------------------------------------
library(sims)
set.seed(10)
sims_simulate("a <- runif(1)", nsims = 2L)

## -----------------------------------------------------------------------------
set.seed(10)
sims_simulate("a <- runif(1)", nsims = 2L, save = TRUE, path = tempdir(), exists = NA)
sims_data_files(tempdir())

## -----------------------------------------------------------------------------
sims_data(tempdir())

## -----------------------------------------------------------------------------
sims_info(tempdir())[1:5]

## -----------------------------------------------------------------------------
sims_add(tempdir(), nsims = 3L)
sims_data_files(tempdir())

## -----------------------------------------------------------------------------
sims_copy(path_from = tempdir(), path_to = paste0(tempdir(), "_copy"))

## -----------------------------------------------------------------------------
sims_check(path = paste0(tempdir(), "_copy"))

## ---- error = TRUE------------------------------------------------------------
file.remove(file.path(paste0(tempdir(), "_copy"), "data0000005.rds"))

sims_check(path = paste0(tempdir(), "_copy"))

## ---- echo = FALSE------------------------------------------------------------
unlink(paste0(tempdir(), "_copy"), recursive = TRUE, force = TRUE) # required to clean up detritus

## -----------------------------------------------------------------------------
library(future)
plan(multisession)

## -----------------------------------------------------------------------------
set.seed(10)
sims_simulate("a <- runif(1)", nsims = 2L)

## -----------------------------------------------------------------------------
library(progressr)
with_progress(sims_simulate("a <- runif(1)", nsims = 1000L))

