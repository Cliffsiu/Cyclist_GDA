# Cyclist_GDA
It is one of the case studies from the Google Data Analytics Capstone

##### Scenario
You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director
of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,
your team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives
must approve your recommendations, so they must be backed up with compelling data insights and professional data
visualizations.

##  Problem Statement 
Analysing how defferent between casual riders and annual members use Cyclistic bikes differently; as well as which factors influence the rider to become annual members in order to maximizing the number of annual membership. 

## Preparing

The data can be downloaded on Cyclistic website [link](https://divvy-tripdata.s3.amazonaws.com/index.html). (Notes: According tothe case study, the datasets have a different name because Cyclistic is a fictional company. The data has been made available by Motivate International Inc. under this [license](https://ride.divvybikes.com/data-license-agreement).)

The data is collected monthly by themself, which is reliable, original, and clean. In this case study, I am using the last 12 months from Aug 2021 to Jul 2020.

## Processing
I am using R Studio to clean the data. You can check out the note and code from [script_clearing.R](https://github.com/Cliffsiu/Cyclist_GDA/blob/main/script_clearing.R).

## Analyze and Visualization
I am using R Studio to clean the data. In this phrase we are looking at the following things:
* The average amount of riders for casual and member by the day of week and month.
* The average riding duration for casual riders and members riders by the day of week and month.
* The difference between two types of bikes, electric bikes and non-electric bikes by the day of week and month.
* The population of each station, and find out which one is the most popular.



For Visualization
You can check the [Analyse & Visualization.Rmd](https://github.com/Cliffsiu/Cyclist_GDA/blob/main/Analyse%20%26%20Visualization.Rmd).
Tableau maybe created in the furture under the Cyclist_GDA folder for better visualization.



### Observation
* For casual riders, the average duration is 24mins; while the members have an average duration between 13min. Casual riders have nearly twice the amount of duration as members on both the day of week and monthly.
* Members tend to have a ride throughout the week. On the other hand, casual riders tend to have a ride during the weekend.
* People tend to rent a non-electric bike more then electric bike.
* More people use the bike sharing during the new expansion during last summer, Jun 2021.
* There are nearly 4% of riders start their rental at Clark St(The most popular); while there are only 2% of riders start their rental at Wells St(the second popular). There is more than double amount of the difference.


## Act
### Recommandation
* Offer a weekday discount to casual rider to attract more people to use the bike sharing in order to create a uniform amount of poeple to use the service.
* Offer a discount or hold some events during summer (between May to October) in order to use the service.
* Install more stations to have more easy access to the bike sharing service.
* New advertisment can be put at the popular area to attract more poeple to use the service, such as 'Streeter Dr & Grand Ave', 'Clark Street', 'Wells Steet'. 

----------------------------------------------------
#### End of Case Study



