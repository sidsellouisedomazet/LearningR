# Data script (Wrangling)

# Replace the ___ with NHANES

source(here::here("R/package-loading.R"))

# Check column names
colnames(NHANES)

# Look at contents
str(NHANES)
glimpse(NHANES)

# See summary
summary(NHANES)

# Look over the dataset documentation
?NHANES

?select()

# Replace the ___ in the select() function, with the columns bp_sys_ave, and education
nhanes_small %>%
    select(bp_sys_ave, education)

# Rename BP
nhanes_small %>%
    rename(bp_sys = bp_sys_ave,
           bp_dia = bp_dia_ave)

# Re-write this piece of code using the “pipe” operator:
nhanes %>%
    select(nhanes_small, bmi, contains("age")) %>%



# Make the coding smart (in one step)
    blood_pressure <- select(nhanes_small, starts_with("bp_"))
rename(bp_systolic=bp_sys_ave)

# Simplyfied code
nhanes_small %>%
    select(starts_with("bp_")) %>%
    rename(bp_systolic=bp_sys_ave)
