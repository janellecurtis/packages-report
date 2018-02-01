## create a data frame from data/installed-packages.csv
## with, e.g., readr::read_csv() or read.csv()

instPack <- read.csv(file = here("data", "installed-packages.csv"))

## filter out packages in the default library
## keep variables Package and Built

instPackEdit <- instPack %>%
  filter(LibPath == .libPaths()[1]) %>%
  select(Package, Built)

## write this new, smaller data frame to data/add-on-packages.csv

write.csv(instPackEdit, file = here("data", "add-on-packages.csv"),
          quote = FALSE, row.names = FALSE)

## make a frequency table of package by the version in Built
packFreqTable <- instPackEdit %>%
  count(Built) %>%
  mutate(prop = n / sum(n))


## write this data frame to data/add-on-packages-freqtable.csv
## YES overwrite the files that are there now
## they came from me (Jenny)
## they are just examples

write.csv(packFreqTable, file = here("data", "add-on-packages-freqtable.csv"),
          quote = FALSE, row.names = FALSE)

## when this script works, stage & commit it and the csv files
## PUSH!
