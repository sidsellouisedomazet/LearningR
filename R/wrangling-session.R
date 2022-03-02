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
nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, BPDiaAve, Education)

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

# Add diastolic blood pressure to the data frame (for the exercise 6.9)
# nhanes_small <- select(NHANES, Age, Gender, BMI, Diabetes, PhysActive, BPSysAve, BPDiaAve, Education)

# Filter
nhanes_small %>%
    filter(phys_active=="No")

# Participants who are physical active

nhanes_small %>%
    filter(phys_active !="No")

# Participants who have a BMI equal to 25
nhanes_small %>%
    filter(bmi==25)

# Participants who have a BMI equal to or more than 25
nhanes_small %>%
    filter(bmi>=25)

TRUE & TRUE
TRUE & FALSE
FALSE & FALSE

TRUE | TRUE
TRUE | FALSE
FALSE | FALSE

# Find participants with BMI equal to 25 AND physical activity is "No"
nhanes_small %>%
    filter(bmi==25 & phys_active=="No")

# When BMI equal to 25 OR the phys_active is "No"
nhanes_small %>%
    filter(bmi==25 | phys_active=="No")

# Arrange data by age in ascending order
nhanes_small %>%
    arrange(age)

nhanes_small %>%
    arrange(education)

nhanes_small %>%
    arrange(desc(age))

levels(nhanes_small$education)

# Arranging data by education then age in ascending order
nhanes_small %>%
    arrange(education, age)

# Modify the age variable
age=age*12

nhanes_small %>%
    mutate(age=age*12)

nhanes_small %>%
    mutate(logged_bmi = log(bmi))

nhanes_small %>%
    mutate(age = age * 12,
           logged_bmi = log(bmi))

# View function (to see the data frame after the restriction)
nhanes_small %>%
    mutate(old = if_else(age>=30, "Yes", "No")) %>% View

# Summarize function
nhanes_small %>%
    summarise(max_bmi=max(bmi, na.rm = TRUE),
              min_bmi=min(bmi, na.rm = TRUE))

nhanes_small %>%
    filter(!is.na(diabetes)) %>%
    group_by(diabetes, phys_active) %>%
    summarise(mean_age=mean(age, na.rm = TRUE),
              mean_bmi=mean(bmi, na.rm = TRUE)) %>%
    ungroup()

