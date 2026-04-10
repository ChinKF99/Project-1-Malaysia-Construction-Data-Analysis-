# Dashboard  
<img width="1163" height="712" alt="image" src="https://github.com/user-attachments/assets/c92af576-5fa0-447b-b76c-9785057fe170" />
<img width="1413" height="882" alt="image" src="https://github.com/user-attachments/assets/2b273ad1-87fa-4b9a-989f-43e84d525a35" />
<img width="1518" height="880" alt="image" src="https://github.com/user-attachments/assets/748d2c7a-4297-4eda-a7ff-bcf5ac9e1ed3" />

## Introduction  
This construction analysis dashboard was created to help identify relationship between cost & time and performance of contractor & project category.

## Dashboard File  
My final dashboard file is in [dashboard.pbix](dashboard.pbix)

## Question to Analyze and why
To understand relationship between cost & time and performance of respective contractor & category, I ask the following:

### Delay Cost Analysis
1. Does delayed project cost more?

### Contractor Analysis
1. Which Contractor has the highest Cost Overrun
2. Which Contractor has most delay
3. Which Contractor perform best overall

### Project Category Analysis
1. Which category has the most delay
2. Which category has the worst cost control (Average/Total cost overrun)

Note: Data with unknown value in Category & Contractor Column is excluded to produce an accurate result.

After analyzing the above questions, stakeholders can act accordingly. E.g. carry out investigation or studies on worst performance contractor and category to streamline/optimize the overall performance and efficiency.

## SQL Skills Used
- Adopt Medalion Architecture (Bronze, Silver, Gold) for Data Architecture
- Data Cleansing
- Data Standardization
- Data Conversion
- Data Enrichment

## Power BI Skills Used
- Bar Chart
- line Chart
- Card
- Scatter Chart
- Toggle button using view and bookmark panel

## Construction Project Dataset
The dataset use for this project is obtained from Chat GPT (AI) [Construction Project_Dataset](construction_project_dataset_3000_messy.csv)

## Insights
-Delay dosent necessary result in cost overrun. However the longer the delay, the higher the risk of significant cost overrun. From the chart a astounishing 51% cost overrun occured after delay above 150 days, indicating a strong relationship between schedule slippage and financial performance.  
-Contractor WCT has the most delay and cost overrun of approximate 7,200 days and RM 19.2 Billion throughout the year. In contrast, SP Setia has the best performance overall with only 6,600 days delay and RM 1.21 billion cost overrun.  
-From the scatter chart, Infrastructure project has the best cost efficiency and came by second in term of on time completion just after Residential. In contrast, Industrial project has the worst performance in both cost and time.  

## Conclusion
As a individual who has interest in data related skillsets/jobs, I embarked on this project to apply what I've learned throughout the months. E.g. validate original dataset, create new column metrics and ensure data standardization/consistency. I hope this project serves as a strong starting portfolio for my data adventure.  
