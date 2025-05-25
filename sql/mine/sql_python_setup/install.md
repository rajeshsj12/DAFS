# MySQL Integration with Jupyter and Pandas


This guide explains how to set up **MySQL** in Jupyter Notebook and use it with **pandas**.

## 🚀 Requirements
Install the necessary Python packages:
```bash
pip install pymysql ipython-sql sqlalchemy
```

## 🔹 Running SQL Queries in Jupyter Notebook
1. Load the **SQL magic extension**:
```python
%load_ext sql
```

2. Connect to MySQL:
```python
%sql mysql+pymysql://<username>:<password>@localhost/<database>
```

3. Run SQL queries using magic commands:
```python
%%sql
SHOW DATABASES;
```

## 📌 Fetching Data into Pandas
Import necessary libraries:
```python
from sqlalchemy import create_engine
import pandas as pd
```

Create the connection and load data:
```python
engine = create_engine("mysql+pymysql://root:password@localhost")

df = pd.read_sql("SHOW DATABASES;", engine)

df
```

## Notes
- Ensure MySQL is **running** (`mysqld` service must be active).
- Replace `<username>` and `<password>` with actual credentials.


