
## Case Study: Cyclistic bike-share analysis   

### Course: Google Data Analytics Capstone: Complete a Case Study at [Coursera](https://www.coursera.org/learn/google-data-analytics-capstone)

### Scenario
In this case study I am a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director
of marketing believes the company’s future success depends on maximizing the number of annual memberships. Therefore,
the team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
the team will design a new marketing strategy to convert casual riders into annual members.  

### Question
As a jr. data analyst I was assigned you to answer the question:  
**How do annual members and casual riders use Cyclistic bikes differently?**


### Prepate Data  
[SQL Prepare Code](./01_prepare_data.sql)      
I downloaden 12 most recent datasets (july 2022 - june 2023) from a Cyclistic’s historical trip data (provided by the course in .CSV format).  
In  MySQL Workbench I created a database *cyclistic*, a table *trips* and
loaded 12 .csv files in order to combine all datasets into one file.

### Process Data 
[SQL Process Code](./02_process_data.sql)  
At frist I explored the data:   
- counted total amount of rows;  
- checked if there are any duplicates;  
- checked if there are any missing values;  
- counted total rows, total rows with missing values, their difference and percentage;  
- counted total missing values per column;  
- checked if all dates are in the correct range of time;  
- counted how many trips are shorter than 1 minute;
- and longer than 48 hours (weekend).  

Next, I createed a view with extra columns: ride length in minutes, day of week and month 
with exception of trips that have duration shorter than 1 minute and longer than 48 hours  

### Analyze Data
[SQL Analyze Code](./03_analyze_data.sql)  
Count how many trips were made by annual and casual members;  
Customers bike preferences;  
Average ride length in minutes;  
Average ride length in minutes per type of bike;
Number of trips depending on weekday;
Average trip length per weekday;  
Number of trips depending on month;  
Average trip length per month;  
Top 5 most populair start stations for members;  
Top 5 most populair start stations for casual.

### Share Data


### Conclussion
In this case study I had an opportunity to analyze historical bicycle trip data in order to identify trends. 
Understanding how casual riders behave differently from riders with paid memberships is important. 
This analysis will help executives to make decisions about marketing programs and strategies to convert casual riders to riders with annual memberships.
