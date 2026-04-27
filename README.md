# 📊 Dashboard  
<img width="1163" height="712" alt="image" src="https://github.com/user-attachments/assets/c92af576-5fa0-447b-b76c-9785057fe170" />
<img width="1413" height="882" alt="image" src="https://github.com/user-attachments/assets/2b273ad1-87fa-4b9a-989f-43e84d525a35" />
<img width="1518" height="880" alt="image" src="https://github.com/user-attachments/assets/748d2c7a-4297-4eda-a7ff-bcf5ac9e1ed3" />

## 📌 Introduction/Project Overview  
This project analyzes construction project data to evaluate the relationship between project delays, cost overruns, contractor performance, and project categories. The goal is to identify key risk factors and improve project efficiency.

## Dashboard File  
My final dashboard file is in [dashboard.pbix](dashboard.pbix)

## 🎯 Question to Analyze and why
To understand relationship between cost & time and performance of respective contractor & category, I ask the following:

### Delay Cost Analysis  
- Do project delays lead to higher cost overruns?  

### Contractor Analysis  
- Which contractors have the highest cost overruns?  
- Which contractors experience the most delays?  
- Which contractors perform best overall?  

### Project Category Analysis  
- Which project categories have the most delays?  
- Which categories have the worst cost control?  

Note: Data with unknown value in Category & Contractor Column is excluded to produce an accurate result.

## ⚙️ Tools & Skills Used

### SQL
- Adopt Medalion Architecture (Bronze, Silver, Gold) for Data Architecture  
- Data cleaning, transformation, and enrichment  

### Power BI
- Scatter plot for relationship analysis  
- Bar and line charts for comparison  
- KPI cards  
- Interactive filtering and dashboard navigation  

## 🗂️ Construction Project Dataset
Synthetic dataset simulating real-world construction project data [Construction Project_Dataset](construction_project_dataset_3000_messy.csv)

## ⚠️ Limitations
- The dataset is synthetic and may not fully reflect real-world complexities.  
- Project size and complexity are not controlled variables, which may influence result.  

## 🔍 Insights
- Project delays do not always result in cost overruns; however, longer delays significantly increase financial risk.  
- Projects delayed by more than 150 days show a 51% higher likelihood of cost overrun.  
- Some contractors consistently experience higher delays and cost overruns.  
- Others demonstrate better cost control and schedule management.  
- Infrastructure projects show better cost efficiency, while Industrial projects perform worst in both cost and time.  

## 💡Business Recommendations
-Monitor and mitigate delays early to reduce risk of cost escalation.  
-Evaluate contractor performance before project assignment.  
-Focus improvement efforts on underperforming project categories.  
-Implement stricter project controls for high-risk categories (e.g., Industrial).  

## ✅ Conclusion
This project demonstrates the use of data analysis to uncover relationships between time and cost in construction projects. It highlights how delay management and contractor performance play a critical role in overall project success.  
