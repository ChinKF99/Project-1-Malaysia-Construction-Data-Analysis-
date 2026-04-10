# Dashboard  
<img width="1398" height="882" alt="image" src="https://github.com/user-attachments/assets/5a1bc5cb-98ea-427d-8909-33536ea0449f" />
<img width="1413" height="882" alt="image" src="https://github.com/user-attachments/assets/2b273ad1-87fa-4b9a-989f-43e84d525a35" />
<img width="1518" height="880" alt="image" src="https://github.com/user-attachments/assets/748d2c7a-4297-4eda-a7ff-bcf5ac9e1ed3" />

## Introduction  
This construction analysis dashboard was created to help identify best performance contractor & project category.

## Dashboard File  
My final dashboard file is in [dashboard.pbix](dashboard.pbix)

## Question to Analyze and why
To understand contractor and project category performance, I ask the following:

### Delay Cost Analysis
1. Does delayed project cost more?

### Contractor Analysis
1. Which Contractor has the highest Cost Overrun
2. Which Contractor has most delays
3. Which Contractor perform best overalls

### Project Category Analysis
1. Which category has the most delays
2. Which project has the worst cost control (Average/Total cost overrun)

Note: All data under with unknown value in Category & Contractor Column is excluded.

After analyzing the above questions, stakeholders can act accordingly. E.g. carry out investigation or studies on worst performance contractor and category to streamline/optimize the overall performance and efficiency.

## SQL Skill Used
- Adopt Medalion Architecture (Bronze, Silver, Gold) for Data Architecture
- Data Cleansing
- Data Standardization
- Data Conversion
- Data Enrichment

## Power BI Used
- Bar Chart
- line Chart
- Card
- Scatter Chart
- Toggle button using view and bookmark panel

## Construction Project Dataset
The dataset use for this project is obtained from Chat GPT (AI) [Construction Project_Dataset](construction_project_dataset_3000_messy.csv)

## Conclusion/Insights 
-Delay dosent necessary result in cost overrun. However the longer the delay, the higher the range that the cost will overrun. From the chart a astounishing 51% cost overrun occured after delay above 150 days, indicating a strong relationship between schedule slippage and financial performance.
-Contractor WCT has the most delay and cost overrun of approximate 7,200 days and RM 19.2 Billion throughout the year, which indicate positive relationship between delay duration and cost overrun. In contrast, SP Setia has the best performance overall with only 6,600 days delay and RN 1.21 billion cost overrun.
-From the scatter chart, Infrastructure project has the best cost efficiency and came by second in term of on time completion just after Residential. In contrast, Industrial project has the worst performance in both cost and time. Hence, studies/investigation should be carried out to optimize it's performance.
-As a individual who has interest in data related skillsets/jobs, I embarked on this project to apply what I've learned throughout the months. I have analyzed the original dataset and validate/filter out columns that are useful and comprehensive. I hope this project serves as a starting portfolio for my data adventure.
