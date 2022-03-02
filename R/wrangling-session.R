# Load up the packages
source(here::here("R/package-loading.R"))

# Briedly glimse the content of dataset
glimpse(NHANES)

usethis::use_r("exercises-wrangling")

# Select one column by its name without quotes
select(NHANES, Age)

select(NHANES, Age, Weight, BMI)

# To exclude a column use minus
select(NHANES, -HeadCirc)

# All columns starting with letters"BP" (blood pressure)
select(NHANES, starts_with("BP"))

# All columns ending with letters "Day"
select(NHANES, ends_with("Day"))

# All columns containing letters "Age"
select(NHANES, contains("Age"))

# Save the selected columns as a new data frame
nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, Education)

# View the new data frame
nhanes_small

# Rename all columns to snake case
nhanes_small <- rename_with(nhanes_small, snakecase::to_snake_case)

# Look at the data frame
nhanes_small

?rename

# Rename the gender column
nhanes_small <- rename(nhanes_small, sex=gender)

# Check the result of the renaming function
nhanes_small

# These two ways are the same (ctrl+shift+M)
colnames(nhanes_small)

nhanes_small %>%
    colnames()

nhanes_small %>%
    select(phys_active) %>%
    rename(physically_active=phys_active)
