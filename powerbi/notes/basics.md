
---

### **1. What is Power BI?**  
Power BI is a **business intelligence (BI) tool** developed by Microsoft that allows users to visualize and analyze data from various sources. It enables users to create interactive reports and dashboards, helping businesses make data-driven decisions. Power BI consists of:
- **Power BI Desktop** (for creating reports)
- **Power BI Service** (cloud-based for sharing and collaboration)
- **Power BI Mobile** (for accessing reports on mobile devices)
- **Power BI Report Server** (for on-premises reporting)  
[Learn more](https://learn.microsoft.com/en-us/power-bi/fundamentals/power-bi-overview)

---

### **2. What is Power Query Editor?**  
Power Query Editor is a **data transformation tool** within Power BI that allows users to clean, reshape, and prepare data before loading it into the data model. It enables:
- **Connecting to multiple data sources**
- **Filtering and transforming data**
- **Merging and appending tables**
- **Creating calculated columns**
- **Removing duplicates and handling missing values**  
[Learn more](https://learn.microsoft.com/en-us/power-query/power-query-ui)

---

### **3. What is a Measure in Power BI?**  
A **measure** is a dynamic calculation created using **DAX (Data Analysis Expressions)**. Measures are used to perform aggregations such as **SUM, AVERAGE, COUNT, MAX, MIN**, and more. Unlike calculated columns, measures are evaluated **only when used in a report visualization**.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-measures)

---

### **4. What is DAX?**  
DAX is a **formula language** used in Power BI, Power Pivot, and Analysis Services to create custom calculations. It includes:
- **Aggregate functions** (SUM, AVERAGE, COUNT)
- **Logical functions** (IF, SWITCH)
- **Time intelligence functions** (YEAR, MONTH, DATEADD)
- **Filter functions** (FILTER, ALL, CALCULATE)  
[Learn more](https://learn.microsoft.com/en-us/dax/)

---

### **5. Explain about Views in Power BI**  
Power BI has three primary views:
1. **Report View** – Used to create and design reports with visualizations.
2. **Data View** – Displays the raw data tables loaded into Power BI.
3. **Model View** – Shows relationships between tables in a **data model**.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/connect-data/desktop-data-view)

---

### **6. What is Data Modeling?**  
Data modeling is the process of **structuring data** to create meaningful relationships between tables. It involves:
- **Fact and dimension tables**
- **Normalization and denormalization**
- **Star and snowflake schema**
- **Creating relationships using primary and foreign keys**  
[Learn more](https://www.geeksforgeeks.org/data-modelling-in-powerbi/)

---

### **7. What is Filter DAX Function?**  
Filter functions in DAX allow users to **control the data displayed** in reports. Common filter functions include:
- **FILTER** – Returns a subset of a table based on a condition.
- **ALL** – Removes filters from a column or table.
- **CALCULATE** – Modifies the filter context of a measure.
- **KEEPFILTERS** – Retains existing filters while applying new ones.  
[Learn more](https://learn.microsoft.com/en-us/dax/filter-function-dax)

---

### **8. What is the Use of Slicer in Power BI?**  
A **slicer** is a visual filter that allows users to interactively filter data in a report. It can be used to:
- Filter data by **date, category, or region**.
- Allow **multi-selection** for better analysis.
- Improve **user experience** by providing easy filtering options.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-visualization-slicers)

---

### **9. When Should You Use Bar Chart and Line Chart?**  
- **Bar Chart** – Used for comparing categorical data.
- **Line Chart** – Used for showing trends over time.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/visuals/power-bi-line-chart)

---

### **10. What Are the Data Files Supported in Power BI?**  
Power BI supports various file formats:
- **Excel (.xlsx, .xlsm)**
- **CSV (.csv)**
- **Power BI Desktop (.pbix)**
- **JSON, XML, PDF**
- **SQL Server, Azure, SharePoint**  
[Learn more](https://learn.microsoft.com/en-us/power-bi/connect-data/service-get-data-from-files)

---

### **11. Explain Aggregate DAX Functions**  
Aggregate functions perform calculations on a column or table. Examples include:
- **SUM** – Adds all values in a column.
- **AVERAGE** – Calculates the mean value.
- **COUNT** – Counts the number of rows.
- **MAX/MIN** – Finds the highest or lowest value.  
[Learn more](https://learn.microsoft.com/en-us/dax/aggregation-functions-dax)

---

### **12. Difference Between MAX and MAXX**  
- **MAX** – Returns the highest value in a column.
- **MAXX** – Evaluates an expression for each row and returns the maximum result.  
[Learn more](https://community.fabric.microsoft.com/t5/Desktop/MAX-vs-MAXA-vs-MAXX-in-DAX/td-p/1872627)

---

### **13. Explain SWITCH DAX Function**  
The **SWITCH** function is used to replace multiple **IF statements**. It evaluates an expression and returns different results based on predefined conditions.  
Example:
```DAX
CategoryType = SWITCH(
    TRUE(),
    [Sales] > 1000, "High",
    [Sales] > 500, "Medium",
    "Low"
)
```  
[Learn more](https://learn.microsoft.com/en-us/dax/switch-function-dax)

---

### **14. Explain Cardinality in Power BI**  
Cardinality refers to the **relationship type** between tables:
- **One-to-One (1:1)** – Each row in one table matches exactly one row in another.
- **One-to-Many (1:M)** – One row in a table relates to multiple rows in another.
- **Many-to-Many (M:M)** – Multiple rows in both tables relate to each other.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-create-and-manage-relationships)

---

### **15. What is Fact and Dimension Table?**  
- **Fact Table** – Stores transactional data (e.g., sales, revenue).
- **Dimension Table** – Contains descriptive attributes (e.g., product details, customer information).  
[Learn more](https://kumopartners.com/fact-vs-dimension-tables-in-power-bi/)

---

### **16. What is Normalization and Denormalization?**  
- **Normalization** – Organizing data to reduce redundancy (splitting tables).
- **Denormalization** – Combining tables to improve query performance.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/guidance/star-schema)

---

### **17. What is a Measure?**  
A **measure** is a dynamic calculation created using **DAX** that is evaluated only when used in a report visualization.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-measures)

---

### **18. When Should You Use a Card in Power BI?**  
A **card visual** is used to display a **single numeric value**, such as total sales, revenue, or customer count.  
[Learn more](https://www.spguides.com/power-bi-add-calculated-column/)

---

### **19. What is Star Schema and Snowflake Schema?**  
- **Star Schema** – A central fact table connected to dimension tables (simpler, faster queries).
- **Snowflake Schema** – Dimension tables are further normalized (reduces redundancy but increases complexity).  
[Learn more](https://www.geeksforgeeks.org/difference-between-star-schema-and-snowflake-schema/)

---

### **20. What is a Calculated Column in Power BI?**  
A **calculated column** is a new column created using DAX formulas. Unlike measures, calculated columns are **stored in the data model** and evaluated at the time of data refresh.  
[Learn more](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-tutorial-create-calculated-columns)

---

### **21. Difference Between Power Query Editor and Power BI Desktop**  
- **Power Query Editor** – Used for **data transformation** (cleaning, shaping).
- **Power BI Desktop** – Used for **report creation** (visualizations, modeling).  
[Learn more](https://learn.microsoft.com/en-us/power-bi/transform-model/desktop-query-overview)

---
