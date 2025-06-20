
---

### 1. **What is Power BI Desktop?**
Power BI Desktop is a **free Windows application** from Microsoft that lets you:
- Connect to various data sources (Excel, SQL, web, etc.)
- Clean and transform data using Power Query
- Build data models with relationships and DAX formulas
- Create interactive reports and dashboards with visuals
- Publish reports to the Power BI Service for sharing

It’s the main tool used by analysts to design and build Power BI reports before sharing them online.

---

### 2. **Difference Between Table and Matrix**
| Feature         | Table                          | Matrix                          |
|----------------|--------------------------------|---------------------------------|
| Layout          | Flat, row-by-row               | Pivot-style, with rows and columns |
| Hierarchies     | Not supported                  | Supports drill-down hierarchies |
| Subtotals       | Not available                  | Available (row/column totals)   |
| Use Case        | Simple data listing            | Aggregated summaries (like pivot tables) |

---

### 3. **What is Conditional Formatting?**
Conditional formatting in Power BI lets you **dynamically change the appearance** of visuals based on data values. You can:
- Color cells based on thresholds (e.g., red for low sales)
- Add data bars or icons (like arrows or checkmarks)
- Highlight outliers or trends

It’s a powerful way to make insights pop visually.

---

### 4. **Use of Date Dimension Table**
A **Date Dimension Table** (also called a calendar table) is essential for:
- Enabling **time intelligence functions** (like YTD, MTD)
- Ensuring continuous date ranges (even if your data has gaps)
- Supporting slicers and filters for year, month, quarter, etc.

It must include a column with unique dates and be marked as a “Date Table” in Power BI.

---

### 5. **What is Time Intelligence DAX Function?**
Time intelligence functions in DAX help you perform **date-based calculations**, such as:
- `TOTALYTD()`, `TOTALMTD()`, `TOTALQTD()`
- `SAMEPERIODLASTYEAR()`, `DATEADD()`, `DATESYTD()`

These functions require a proper date table and are used to compare performance over time.

---

### 6. **Explain About Calculated Column**
A **calculated column** is a new column you create using DAX that:
- Is stored in the data model
- Is calculated row-by-row
- Can be used in visuals, slicers, and filters

Example:
```DAX
FullName = Customers[FirstName] & " " & Customers[LastName]
```

---

### 7. **What is the Use of Bookmark?**
Bookmarks capture the **current state of a report page**, including:
- Filters and slicers
- Visual visibility
- Drill-down levels

They’re used for:
- Creating navigation buttons
- Storytelling with data
- Resetting filters or toggling visuals

---

### 8. **What is Parameter in Power BI?**
Parameters are **dynamic inputs** that let users or developers:
- Control values in queries (e.g., filter by region or date)
- Create “What-If” scenarios
- Switch between fields or measures in visuals (using field parameters)

They make reports more interactive and flexible.

---

### 9. **Difference Between ALL and ALLSELECTED**
| Function      | Behavior                                                                 |
|---------------|--------------------------------------------------------------------------|
| `ALL()`        | Removes **all filters**, regardless of slicers or visuals               |
| `ALLSELECTED()`| Removes filters **inside the visual**, but respects slicers and filters |

Use `ALL` for total values, and `ALLSELECTED` when you want totals based on user selections.

---

### 10. **When Should I Use Bar, Line, and Card Visuals?**
- **Bar Chart**: Compare categories (e.g., sales by region)
- **Line Chart**: Show trends over time (e.g., monthly revenue)
- **Card**: Display a single KPI (e.g., total profit)

Use them together for a complete story: card for summary, bar for comparison, line for trend.

---

### 11. **What is Power BI?**
Power BI is a **business intelligence platform** by Microsoft that helps you:
- Connect to data from multiple sources
- Transform and model data
- Create interactive reports and dashboards
- Share insights across your organization

It includes Power BI Desktop, Power BI Service, and mobile apps.

---

### 12. **Explain About All Filters Used in Power BI**
Power BI supports several filter types:
- **Visual-level filters**: Apply to one visual only
- **Page-level filters**: Apply to all visuals on a page
- **Report-level filters**: Apply to all pages
- **Drillthrough filters**: Navigate to a detailed page based on selection
- **Cross-filtering**: Filters applied by clicking on visuals
- **Slicers**: Visual filters users can interact with

Each filter type helps control what data is shown and how users explore it.

---

### 13. **What is Aggregate Logical Date DAX Function?**
This refers to **DAX aggregation functions** that work with **date logic**, such as:
- `SUMX`, `AVERAGEX`, `MINX`, `MAXX` over date ranges
- `DATESYTD()`, `DATESMTD()` for aggregating over time
- `CALCULATE()` with `FILTER()` to aggregate based on date logic

Example:
```DAX
SalesYTD = CALCULATE(SUM(Sales[Amount]), DATESYTD('Date'[Date]))
```

These functions are key to building time-based KPIs and comparisons.

---
