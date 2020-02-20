# Introduction ====
# Examples used for live coding demonstrations
# Sections of code can be run by highlighting
# the code section and pressing (Cmd/Ctrl + Return)
#


# Reading data into R ====
# Examples of reading formatted text files into R
# Run the example code, and pay attention to the output in the console
# Inspect the resulting data frame -- does everything look as expected?
library(tidyverse)

# Example 1 (csv file)
ex_dat_1 <- read_csv("01_read_example.csv")
ex_dat_1

# Example 2 (tsv file)
ex_dat_2 <- read_tsv("02_read_example.tsv")
ex_dat_2

# Example 3 (csv file... or is it?)
ex_dat_3 <- read_csv("03_read_example.csv")
ex_dat_3


# Working with Atomic Vectors ====
library(tidyverse)

# create a vector of numbers
vec1 <- c(2,4,6,8,10)
vec1

# Index the vector with an integer
# IMPORTANT: R indices start at 1 !!!!
vec1[1]
vec1[5]
# if you give an index of 0, you get back a 0 length vector
vec1[0]

# You can perform standard operations on vectors
length(vec1)
min(vec1)
max(vec1)
mean(vec1)

# Many operations in R are vectorized, typically performed element by element
vec1 < 5
vec1 + vec1
vec1 * vec1 # this is NOT matrix multiplication...

# You can index with logical values & expressions
vec1[vec1 < 5]



# Data Frame Examples ====
library(tidyverse)

# When you read a data file into R (e.g. csv), you will
# (usually) get data frame back
my_dat <- read_csv("01_read_example.csv")
my_dat

# You can get basic info about a data frame
nrow(my_dat)
ncol(my_dat)
dim(my_dat) # number of rows and columns
head(my_dat)
View(my_dat)

# you can get any column of data using the $ operator
# the result is an atomic vector (just like above)
# Notice that you don't "" the column name
make_models <- my_dat$make_model
length(make_models)

#... we'll see how to manipulate data frames more below


# DPLYR example ====
library(tidyverse)

# dplyr examples using the 'storms' data set
library(dplyr)

# We’ll use the dplyr built in ‘storms’ data set
storms

# Example dplyr pipeline
mean_stats <- storms %>%
  group_by(year) %>%
  summarize(mean_wind_speed = mean(wind),
            mean_air_pressure = mean(pressure)) %>%
  arrange(desc(mean_wind_speed))

mean_stats



# ggplot2 examples ====
library(tidyverse)

# Using the iris data set as an example
iris

# basic scatter plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) +
  geom_point()

# lets add some color (based on the data!)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point()

# make the points bigger (not based on the data)
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 4)

# A more complex plot
ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point() +
  geom_smooth(method = "lm") +
  facet_wrap(~Species)

