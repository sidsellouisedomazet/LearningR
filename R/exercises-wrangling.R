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


# Exercise 6.13
# Copy and paste the code below into the exercises-wrangling.R script file.

# 1. BMI between 20 and 40 with diabetes
nhanes_small %>%
    # Format should follow: variable >= number or character
    filter(bmi >= 20 & bmi <= 40 & diabetes == "Yes")

# Pipe the data into mutate function and:
nhanes_modified <- nhanes_small %>% # Specifying dataset
    mutate(
        # 2. Calculate mean arterial pressure
        ___ = ___,
        # 3. Create young_child variable using a condition
        ___ = if_else(___, "Yes", "No")
    )

nhanes_modified
# ----------------------GO BACK FINISH-------------------

# 2. Calculate mean arterial pressure

        mutate(mean_arterial_pressure = ((2*bp_dia_ave)+bp_sys_ave/3)

# 3. Create young_child variable using a condition
        mutate(young_child = if_else(age<6, "Yes", "No")


nhanes_modified

