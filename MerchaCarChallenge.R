# import library

library(dplyr)
library(tidyverse)
library(readr)

# Deliverable 1 Linear Regression to Predict MPG (Miles per Gallon)
# Import read CSV MechaCar

mecha_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Perform linear regression using lm function 
results <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data= mecha_mpg)

car_summary (lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data= mecha_mpg))
lm(mpg ~ vehicle_length + ground_clearance , data=mecha_mpg)
lm(formula = mpg ~ vehicle_length + ground_clearance, data=mecha_mpg)


# Deliverable 2: Summary Statistics on Suspension Coils
# Import read CSV Suspension_Coil

suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#Create summary table with multiple columns
total_sumary <- suspension_coil %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups ='keep')

#Create lot summary
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarise(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups ='keep')

# Deliverable 3: T-Test on Suspension Coils
#T Test for Lot 1
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot1"),mu=mean(suspension_coil$PSI))

#T Test for Lot 2
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot2"),mu=mean(suspension_coil$PSI))

#T Test for Lot 3
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot== "Lot3"),mu=mean(suspension_coil$PSI))