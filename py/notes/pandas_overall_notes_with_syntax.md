# Pandas Comprehensive Command Cheatsheet

## 1. Core Data Structures & Creation

* **Import:** `import pandas as pd`
* **Series (1D Array):**
    * From list: `s = pd.Series([1, 2, 3])`
    * With index: `s_idx = pd.Series([10, 20], index=['a', 'b'], name='ValueCol')`
    * From dict: `s_dict = pd.Series({'k1': 100, 'k2': 200})`
    * Scalar: `s_scalar = pd.Series(5, index=[0, 1, 2])`
* **DataFrame (2D Table):**
    * From dict of lists (common): `df = pd.DataFrame({'colA': [1, 2], 'colB': ['X', 'Y']})`
    * From list of dicts: `df_rows = pd.DataFrame([{'a': 1}, {'a': 2, 'b': 3}])`
    * From NumPy array: `df_np = pd.DataFrame(np.random.rand(3, 2), columns=['X', 'Y'])`
    * Empty with columns: `empty_df = pd.DataFrame(columns=['C1', 'C2'])`

## 2. Input/Output (I/O)

* **Read CSV:** `pd.read_csv('file.csv', sep=',', header=0, index_col='id_col', parse_dates=['date_col'], encoding='utf-8')`
* **Write CSV:** `df.to_csv('output.csv', index=False, encoding='utf-8')`
* **Read Excel:** `pd.read_excel('file.xlsx', sheet_name='Sheet1', skiprows=0)`
* **Write Excel:** `df.to_excel('output.xlsx', sheet_name='Data', index=False)`
* **Read JSON:** `pd.read_json('file.json', orient='records')`
* **Write JSON:** `df.to_json('output.json', orient='records', indent=4)`
* **Read SQL:** `pd.read_sql('SELECT * FROM my_table', connection_obj)`
* **Write SQL:** `df.to_sql('new_table', connection_obj, if_exists='replace', index=False)`
* **Read HTML tables:** `pd.read_html('url')` (returns list of DFs)
* **Read Parquet:** `pd.read_parquet('file.parquet')`
* **Write Parquet:** `df.to_parquet('output.parquet', index=False)`
* **Read Feather:** `pd.read_feather('file.feather')`
* **Write Feather:** `df.to_feather('output.feather', index=False)`

## 3. Viewing & Inspection

* **First N rows:** `df.head(n)`
* **Last N rows:** `df.tail(n)`
* **Summary:** `df.info()`
* **Statistics:** `df.describe()`
* **Shape:** `df.shape` (tuple: rows, columns)
* **Column names:** `df.columns` (Index object)
* **Index:** `df.index` (Index object)
* **Data types:** `df.dtypes` (Series of dtypes)
* **Unique values (Series):** `s.unique()` or `df['col'].unique()`
* **Number of unique values (Series):** `s.nunique()`
* **Value counts (Series):** `s.value_counts(normalize=True)` (percentages)
* **Display options:**
    * Max columns: `pd.set_option('display.max_columns', None)`
    * Max rows: `pd.set_option('display.max_rows', None)`
    * Float format: `pd.set_option('display.float_format', '{:.2f}'.format)`
    * Reset all: `pd.reset_option('display.max_columns')` (or 'all')
* **Memory usage:** `df.memory_usage(deep=True)`
* **Correlation matrix:** `df.corr(numeric_only=True)`
* **Covariance matrix:** `df.cov(numeric_only=True)`

## 4. Selection & Indexing

* **Column selection:** `df['col_name']`, `df[['col1', 'col2']]`
* **Row selection by label (.loc):**
    * Single row: `df.loc[row_label]`
    * Multiple rows: `df.loc[[label1, label2]]`
    * Slice (inclusive): `df.loc['start':'end']`
    * Specific cell: `df.loc[row_label, 'col_name']`
    * All rows, specific cols: `df.loc[:, ['c1', 'c2']]`
    * Boolean indexing: `df.loc[df['val_col'] > 10, ['col_to_get']]`
* **Row selection by position (.iloc):**
    * Single row: `df.iloc[row_idx]`
    * Multiple rows: `df.iloc[[idx1, idx2]]`
    * Slice (exclusive end): `df.iloc[start_idx:end_idx]`
    * Specific cell: `df.iloc[row_idx, col_idx]`
    * All rows, specific cols: `df.iloc[:, [0, 2]]`
* **Boolean Filtering:**
    * Single condition: `df[df['col'] > 5]`
    * Multiple conditions: `df[(df['col1'] > X) & (df['col2'] == 'Y')]`
    * `isin` method: `df[df['col'].isin(['val1', 'val2'])]`
    * `~` for negation: `df[~df['col'].isin(['val1'])]`
    * `between`: `df[df['col'].between(lower, upper)]`
    * `str.contains()`: `df[df['text_col'].str.contains('pattern', case=False, na=False)]`
    * `str.startswith()`, `str.endswith()`: `df[df['col'].str.startswith('prefix')]`
    * `query()` (string-based filtering): `df.query('col1 > 10 and col2 == "X"')`
* **`at` and `iat` (for single cell, faster):**
    * Label: `df.at[row_label, 'col_label']`
    * Position: `df.iat[row_idx, col_idx]`

## 5. Adding, Deleting & Modifying Data

* **New column (constant):** `df['new_col'] = value`
* **New column (from existing):** `df['new_col'] = df['col1'] * df['col2']`
* **New column (conditional):** `df['new_col'] = np.where(df['col'] > X, 'TrueVal', 'FalseVal')`
* **Modify existing column:** `df['col'] = df['col'] + 1`
* **Conditional modification:** `df.loc[df['col'] == 'X', 'col_to_change'] = new_value`
* **Delete column:** `df.drop('col_to_drop', axis=1, inplace=True)`
* **Delete multiple columns:** `df.drop(['c1', 'c2'], axis=1, inplace=True)`
* **Delete rows by index:** `df.drop(index=[0, 2], inplace=True)`
* **Rename columns:** `df.rename(columns={'old': 'new'}, inplace=True)`
* **Rename index:** `df.rename(index={0: 'first_row'}, inplace=True)`
* **Assign new columns (method chaining):** `df.assign(new_col=lambda x: x['old_col'] * 2)`

## 6. Handling Missing Data (NaN)

* **Check for nulls:** `df.isnull()`, `df.isna()`
* **Count nulls:** `df.isnull().sum()`, `df.isnull().sum().sum()`
* **Drop rows/columns with nulls:**
    * `df.dropna(axis=0, how='any', inplace=True)` (rows, any NaN)
    * `df.dropna(axis=1, how='all', inplace=True)` (columns, all NaN)
    * `df.dropna(subset=['col1', 'col2'], inplace=True)` (drop if NaN in specific subset)
* **Fill nulls:**
    * With value: `df.fillna(value=0, inplace=True)`
    * With column mean/median/mode: `df['col'].fillna(df['col'].mean(), inplace=True)`
    * Forward fill: `df.fillna(method='ffill', inplace=True)`
    * Backward fill: `df.fillna(method='bfill', inplace=True)`
    * Interpolate: `df.interpolate(method='linear')`
    * Limit fill: `df.fillna(method='ffill', limit=1)`
* **Check for non-nulls:** `df.notnull()`

## 7. Operations & Functions

* **Apply (element-wise/row-wise/col-wise):**
    * Series: `df['col'].apply(lambda x: x * 2)`
    * DataFrame (row-wise): `df.apply(lambda row: row['c1'] + row['c2'], axis=1)`
    * DataFrame (col-wise): `df.apply(lambda col: col.sum(), axis=0)`
* **`map()` (for Series, element-wise substitution):** `df['col'].map({'old_val': 'new_val'})`
* **`replace()` (for DataFrame/Series, more flexible substitution):**
    * Single: `df.replace('old', 'new', inplace=True)`
    * Multiple: `df.replace(['old1', 'old2'], ['new1', 'new2'], inplace=True)`
    * Regex: `df.replace(r'^\s*$', np.nan, regex=True)` (empty string to NaN)
* **Vectorized operations:** `df['c1'] + df['c2']`, `df['c1'] * 5`, `np.log(df['c1'])`
* **Mathematical functions:** `df.sum()`, `df.mean()`, `df.median()`, `df.min()`, `df.max()`, `df.std()`, `df.var()`, `df.count()`, `df.cumsum()`, `df.cumprod()`
* **Absolute value:** `df['col'].abs()`
* **Rounding:** `df['col'].round(decimals=2)`
* **Clipping (limiting values):** `df['col'].clip(lower=0, upper=100)`
* **Unique/value counts:** `df['col'].unique()`, `df['col'].value_counts()`
* **String methods (on Series/Index of strings):** `df['text_col'].str.lower()`, `.str.upper()`, `.str.strip()`, `.str.contains()`, `.str.split()`, `.str.replace()`, `.str.len()`, `.str.get(0)`

## 8. Grouping & Aggregation (`.groupby()`)

* **Basic group & agg:** `df.groupby('col1')['val_col'].sum()`
* **Group by multiple cols:** `df.groupby(['c1', 'c2'])['val'].mean()`
* **Multiple aggregations:**
    ```python
    df.groupby('col').agg(
        Total_Sales=('Sales', 'sum'),
        Avg_Price=('Price', 'mean'),
        Unique_Customers=('Customer_ID', 'nunique')
    )
    ```
* **Apply arbitrary function to groups:** `df.groupby('col').apply(lambda x: x.sort_values('val', ascending=False).head(1))`
* **Transform (return same shape as original DF):** `df.groupby('col')['val'].transform('mean')` (fills group mean back to original column)
* **Filter (filter groups):** `df.groupby('col').filter(lambda x: len(x) > 5)` (keep groups with more than 5 rows)
* **Iterating over groups:** `for name, group in df.groupby('col'):`

## 9. Merging, Joining & Concatenating

* **`pd.concat()` (stacking):**
    * Rows: `pd.concat([df1, df2], axis=0, ignore_index=True)`
    * Columns: `pd.concat([df1, df2], axis=1)`
* **`pd.merge()` (relational joins):**
    * `inner` (default): `pd.merge(df1, df2, on='key')`
    * `left`: `pd.merge(df1, df2, on='key', how='left')`
    * `right`: `pd.merge(df1, df2, on='key', how='right')`
    * `outer`: `pd.merge(df1, df2, on='key', how='outer')`
    * Different key names: `pd.merge(df1, df2, left_on='key_df1', right_on='key_df2')`
    * Multiple keys: `pd.merge(df1, df2, on=['k1', 'k2'])`
* **`.join()` (index-based join):** `df1.join(df2, lsuffix='_left', rsuffix='_right', how='left')`

## 10. Reshaping Data

* **`pivot_table()` (flexible aggregation/reshaping):** `df.pivot_table(values='val', index='row_col', columns='col_col', aggfunc='sum', fill_value=0)`
* **`pivot()` (simple pivot, no aggregation):** `df.pivot(index='row_col', columns='col_col', values='val')`
* **`melt()` (wide to long format):** `df.melt(id_vars=['ID'], value_vars=['col1', 'col2'], var_name='variable', value_name='value')`
* **`stack()` (pivot columns to rows, creates MultiIndex Series):** `df.stack()`
* **`unstack()` (pivot (multi)index levels to columns):** `s_multiindex.unstack()`
* **`crosstab()` (frequency table):** `pd.crosstab(df['col1'], df['col2'], margins=True)`

## 11. Time Series Functionality

* **Convert to datetime:** `pd.to_datetime(s, errors='coerce', format='%Y-%m-%d')`
* **Create date range:** `pd.date_range(start='2023-01-01', periods=5, freq='D')`
* **Set datetime index:** `df.set_index('date_col', inplace=True)`
* **Access datetime components:** `df.index.year`, `.month`, `.day`, `.dayofweek`, `.day_name()`, `.hour`, `.minute`, `.second`, `.quarter`
* **Resampling:** `df.resample('M').mean()` (D, W, M, Q, Y, H, T (minute), S (second))
* **Shifting:** `df['val'].shift(periods=1, freq='D')`
* **Rolling window:** `df['val'].rolling(window=3, min_periods=1).mean()`
* **Expanding window:** `df['val'].expanding(min_periods=1).sum()`
* **Differencing:** `df['val'].diff(periods=1)`
* **Time zone handling:** `df.tz_localize('UTC').tz_convert('Asia/Kolkata')`

## 12. Categorical Data

* **Convert to category:** `df['col'].astype('category')`
* **Access categories:** `df['cat_col'].cat.categories`
* **Add/remove categories:** `df['cat_col'].cat.add_categories('new_cat')`, `.cat.remove_categories('old_cat')`
* **Set order:** `df['cat_col'].cat.set_categories(['low', 'med', 'high'], ordered=True)`
* **Rename categories:** `df['cat_col'].cat.rename_categories({'old': 'new'})`

## 13. Miscellaneous Utilities & Best Practices

* **Copying DataFrame (critical):** `df_copy = df.copy(deep=True)`
* **Piping methods:** `df.pipe(func1).pipe(func2)`
* **Applying lookup (faster than map for DFs):** `df['new_col'] = df.lookup(df.index, df['col_of_col_names'])`
* **Exploding (for list-like entries):** `df.explode('list_column')`
* **`cut()` (binning data):** `pd.cut(df['age'], bins=[0, 18, 65, 100], labels=['Child', 'Adult', 'Senior'])`
* **`qcut()` (quantile-based binning):** `pd.qcut(df['score'], q=4, labels=['Q1', 'Q2', 'Q3', 'Q4'])`
* **N largest/smallest:** `df.nlargest(n, 'col')`, `df.nsmallest(n, 'col')`
* **Sample rows:** `df.sample(n=5, random_state=42)` (random rows)
* **`clip()` (limit values):** `df['col'].clip(lower=min_val, upper=max_val)`
* **`factorize()` (encode categories to numbers):** `codes, uniques = pd.factorize(df['col'])`
* **`mask()` / `where()` (conditional replacement):**
    * `mask()`: Replace where condition is TRUE. `df['col'].mask(df['col'] > 100, 100)`
    * `where()`: Replace where condition is FALSE. `df['col'].where(df['col'] > 100, 100)`
* **`pop()` (extract column as Series and drop):** `col_series = df.pop('col_name')`
* **`to_records()` / `to_dict()` / `to_numpy()` (convert to other formats):**
    * `df.to_records(index=False)`
    * `df.to_dict(orient='list')` (or 'records', 'series', 'split', 'index')
    * `df.to_numpy()` (get underlying NumPy array)



'''
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
'''



To make this useful for you, I'll provide the Pandas commands in two distinct ways, both designed for clarity and fast understanding within a Jupyter Notebook environment:

1.  **Code Cells (for execution):** This will be the actual Python code you can run directly in a Jupyter Notebook **code cell**. I'll include comments to explain each step.
2.  **Markdown Cells (for explanation):** This will be a separate, nicely formatted Markdown section with explanations and brief descriptions for each command, perfect for your **Markdown cells**.

This separation ensures you can run the code and read the explanations seamlessly in your notebook.

---

## Pandas Core Commands for Jupyter Notebook

### Getting Started (Run in a Code Cell)

First, let's import the necessary libraries.

```python
# Run this in a Jupyter Notebook Code Cell
import pandas as pd
import numpy as np
print("Pandas and NumPy imported successfully!")
```

---

### 1. Series Creation (Code Cell Examples)

A **Pandas Series** is a one-dimensional labeled array, like a single column of data.

```python
# Run this in a Jupyter Notebook Code Cell

# From a list
s_list = pd.Series([10, 20, 30, 40, 50], name='MyNumbers')
print("Series from list:\n", s_list)

# With a custom index
s_indexed = pd.Series([100, 200, 300], index=['a', 'b', 'c'])
print("\nSeries with custom index:\n", s_indexed)

# From a dictionary (keys become index, values become data)
s_dict = pd.Series({'apple': 1.0, 'banana': 2.5, 'cherry': 3.0})
print("\nSeries from dictionary:\n", s_dict)
```

---

### 2. DataFrame Creation (Code Cell Examples)

A **Pandas DataFrame** is a two-dimensional labeled data structure, like a spreadsheet or SQL table.

```python
# Run this in a Jupyter Notebook Code Cell

# From a dictionary of lists (most common way)
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David'],
    'Age': [25, 30, 35, 28],
    'City': ['New York', 'London', 'Paris', 'New York']
}
df = pd.DataFrame(data)
print("DataFrame from dictionary:\n", df)

# From a list of dictionaries (each dictionary is a row)
data_rows = [
    {'Product': 'A', 'Price': 10, 'Stock': 100},
    {'Product': 'B', 'Price': 15, 'Stock': 50},
    {'Product': 'C', 'Price': 20, 'Stock': 75}
]
df_rows = pd.DataFrame(data_rows)
print("\nDataFrame from list of dictionaries:\n", df_rows)

# From a NumPy array (specify columns and index if needed)
arr = np.random.randint(1, 10, size=(3, 3))
df_numpy = pd.DataFrame(arr, columns=['ColA', 'ColB', 'ColC'], index=['Row1', 'Row2', 'Row3'])
print("\nDataFrame from NumPy array:\n", df_numpy)

# Creating an empty DataFrame with specified columns
empty_df = pd.DataFrame(columns=['CustomerID', 'OrderDate', 'Amount'])
print("\nEmpty DataFrame with columns:\n", empty_df)

# Reading data from files (uncomment and replace with your file paths to test)
# df_csv = pd.read_csv('your_file.csv')
# df_excel = pd.read_excel('your_file.xlsx', sheet_name='Sheet1')
# df_json = pd.read_json('your_file.json')
# print("\n(To load data from files, uncomment the lines above and provide your file path.)")
```

---

### 3. Viewing and Inspecting Data (Code Cell Examples)

These commands help you quickly understand the structure and content of your DataFrame.

```python
# Run this in a Jupyter Notebook Code Cell

# Using the 'df' DataFrame created previously
print("--- Viewing and Inspecting Data ---")

# Display the first N rows (default is 5)
print("\nFirst 3 rows (df.head(3)):\n", df.head(3))

# Display the last N rows (default is 5)
print("\nLast 2 rows (df.tail(2)):\n", df.tail(2))

# Get a concise summary, including data types and non-null values
print("\nDataFrame Info (df.info()):")
df.info()

# Generate descriptive statistics for numerical columns
print("\nDescriptive Statistics (df.describe()):\n", df.describe())

# Get the shape (rows, columns)
print("\nDataFrame Shape (df.shape):", df.shape)

# Get the column names
print("\nColumn Names (df.columns):\n", df.columns.tolist())

# Get the index
print("\nDataFrame Index (df.index):\n", df.index)

# Get the data types of each column
print("\nData Types (df.dtypes):\n", df.dtypes)

# Get unique values in a specific column
print("\nUnique Cities (df['City'].unique()):", df['City'].unique())

# Get the number of unique values in a column
print("\nNumber of Unique Cities (df['City'].nunique()):", df['City'].nunique())

# Get the count of each unique value in a column
print("\nValue Counts for City (df['City'].value_counts()):\n", df['City'].value_counts())

# Display all columns if DataFrame is wide (temporary setting)
pd.set_option('display.max_columns', None)
print("\nFull DataFrame (all columns visible temporarily):\n", df)
pd.reset_option('display.max_columns') # Reset option to default
```

---

### 4. Selection and Indexing (Code Cell Examples)

Access data using column names, row labels, or integer positions.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Selection and Indexing ---")
print("\nOriginal DataFrame (df):\n", df)

# Select a single column (returns a Series)
name_series = df['Name']
print("\nSelected 'Name' column:\n", name_series)

# Select multiple columns (returns a DataFrame)
name_age_df = df[['Name', 'Age']]
print("\nSelected 'Name' and 'Age' columns:\n", name_age_df)

# .loc (Label-based selection)
# Select row by index label (e.g., row with label 0)
row_0_loc = df.loc[0]
print("\nRow at label 0 (df.loc[0]):\n", row_0_loc)

# Select multiple rows by index labels
rows_0_2_loc = df.loc[[0, 2]]
print("\nRows at labels 0 and 2 (df.loc[[0, 2]]):\n", rows_0_2_loc)

# Select a specific cell (row 1, 'City' column)
city_at_1 = df.loc[1, 'City']
print("\nCity at row 1 (df.loc[1, 'City']):", city_at_1)

# Select all rows, specific columns
all_rows_name_city = df.loc[:, ['Name', 'City']]
print("\nAll rows, 'Name' and 'City' columns (df.loc[:, ['Name', 'City']]):\n", all_rows_name_city)

# .iloc (Integer-position based selection)
# Select row by integer position (e.g., first row, index 0)
row_0_iloc = df.iloc[0]
print("\nRow at integer position 0 (df.iloc[0]):\n", row_0_iloc)

# Select multiple rows by integer positions
rows_0_2_iloc = df.iloc[[0, 2]]
print("\nRows at integer positions 0 and 2 (df.iloc[[0, 2]]):\n", rows_0_2_iloc)

# Select a specific cell (row 1, column 2 - 'City')
city_at_1_iloc = df.iloc[1, 2]
print("\nCity at integer position [1, 2] (df.iloc[1, 2]):", city_at_1_iloc)

# Select all rows, first column only
all_rows_first_col = df.iloc[:, 0]
print("\nAll rows, first column (df.iloc[:, 0]):\n", all_rows_first_col)

# Boolean Indexing (Filtering Data)
# Rows where 'Age' is greater than 30
adults = df[df['Age'] > 30]
print("\nRows where Age > 30:\n", adults)

# Rows where 'City' is 'New York' AND 'Age' is less than 30
ny_young_residents = df[(df['City'] == 'New York') & (df['Age'] < 30)]
print("\nRows from New York and Age < 30:\n", ny_young_residents)

# Rows where 'City' is 'London' or 'Paris'
london_paris_residents = df[df['City'].isin(['London', 'Paris'])]
print("\nRows from London or Paris:\n", london_paris_residents)
```

---

### 5. Adding, Deleting, and Modifying Columns (Code Cell Examples)

Learn how to manipulate DataFrame columns.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Adding, Deleting, and Modifying Columns ---")
df_mod = df.copy() # Work on a copy to preserve the original 'df'

print("\nOriginal DataFrame (df_mod):\n", df_mod)

# Add a new column with a constant value
df_mod['Status'] = 'Active'
print("\nAfter adding 'Status' column:\n", df_mod)

# Add a new column based on calculations from existing columns
df_mod['Age_in_Months'] = df_mod['Age'] * 12
print("\nAfter adding 'Age_in_Months' column:\n", df_mod)

# Modify an existing column directly
df_mod['Age'] = df_mod['Age'] + 1 # Increase all ages by 1
print("\nAfter increasing all ages by 1:\n", df_mod)

# Conditional modification of a column using .loc
df_mod.loc[df_mod['City'] == 'New York', 'Status'] = 'Local'
print("\nAfter conditionally modifying 'Status' for 'New York':\n", df_mod)

# Delete a column using .drop() (returns a new DataFrame by default)
df_without_age_months = df_mod.drop('Age_in_Months', axis=1) # axis=1 for columns
print("\nAfter dropping 'Age_in_Months' (new DataFrame):\n", df_without_age_months)

# Delete a column in-place using .drop(inplace=True)
df_mod.drop('Status', axis=1, inplace=True)
print("\nAfter dropping 'Status' (in-place):\n", df_mod)

# Rename columns
df_mod.rename(columns={'Name': 'Full_Name', 'City': 'Location'}, inplace=True)
print("\nAfter renaming 'Name' and 'City' columns:\n", df_mod)
```

---

### 6. Handling Missing Data (NaN) (Code Cell Examples)

Dealing with `NaN` (Not a Number) values is crucial for clean data.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Handling Missing Data (NaN) ---")

# Create a DataFrame with missing values for demonstration
df_nan = pd.DataFrame({
    'A': [1, 2, np.nan, 4, 5],
    'B': [np.nan, 2, 3, np.nan, 5],
    'C': [1, 2, 3, 4, np.nan],
    'D': [np.nan, np.nan, np.nan, np.nan, 5]
})
print("\nDataFrame with NaNs (df_nan):\n", df_nan)

# Check for missing values (returns boolean DataFrame)
print("\nIs Null (df_nan.isnull()):\n", df_nan.isnull())

# Count missing values per column
print("\nMissing values count per column (df_nan.isnull().sum()):\n", df_nan.isnull().sum())

# Total missing values in the DataFrame
print("\nTotal missing values in DataFrame (df_nan.isnull().sum().sum()):", df_nan.isnull().sum().sum())

# Drop rows with ANY missing values
df_dropna_any_rows = df_nan.dropna(axis=0, how='any')
print("\nDataFrame after dropping rows with any NaN:\n", df_dropna_any_rows)

# Drop columns with ALL missing values
df_dropna_all_cols = df_nan.dropna(axis=1, how='all')
print("\nDataFrame after dropping columns with all NaN:\n", df_dropna_all_cols)

# Fill missing values with a specific value (e.g., 0)
df_fill_zero = df_nan.fillna(value=0)
print("\nDataFrame after filling NaNs with 0:\n", df_fill_zero)

# Fill missing values in a column with its mean
df_fill_mean = df_nan.copy()
df_fill_mean['A'].fillna(df_fill_mean['A'].mean(), inplace=True)
print("\nDataFrame after filling 'A' NaNs with its mean:\n", df_fill_mean)

# Forward fill (propagates last valid observation forward)
df_ffill = df_nan.fillna(method='ffill')
print("\nDataFrame after forward fill (method='ffill'):\n", df_ffill)

# Backward fill (propagates next valid observation backward)
df_bfill = df_nan.fillna(method='bfill')
print("\nDataFrame after backward fill (method='bfill'):\n", df_bfill)

# Interpolate missing values (e.g., linear interpolation)
df_interpolate = df_nan.interpolate(method='linear')
print("\nDataFrame after linear interpolation:\n", df_interpolate)
```

---

### 7. Operations and Functions (Code Cell Examples)

Perform mathematical operations and apply custom functions.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Operations and Functions ---")
df_ops = pd.DataFrame({'value1': [10, 20, 30, 40], 'value2': [1, 2, 3, 4], 'category': ['A', 'B', 'A', 'B']})
print("\nOriginal DataFrame (df_ops):\n", df_ops)

# Element-wise addition
df_ops['sum_cols'] = df_ops['value1'] + df_ops['value2']
print("\nDataFrame after element-wise addition:\n", df_ops)

# Element-wise multiplication
df_ops['value1_x2'] = df_ops['value1'] * 2
print("\nDataFrame after element-wise multiplication:\n", df_ops)

# Applying a lambda function to a Series (column)
df_ops['value1_half'] = df_ops['value1'].apply(lambda x: x / 2)
print("\nDataFrame after applying lambda to 'value1':\n", df_ops)

# Applying a custom function row-wise (axis=1)
def calculate_score(row):
    return (row['value1'] * 0.1) + row['value2']

df_ops['score'] = df_ops.apply(calculate_score, axis=1)
print("\nDataFrame after applying custom function row-wise:\n", df_ops)

# Common aggregation functions
print("\nSum of 'value1':", df_ops['value1'].sum())
print("Mean of 'value2':", df_ops['value2'].mean())
print("Maximum of 'value1':", df_ops['value1'].max())
print("Minimum of 'value2':", df_ops['value2'].min())
print("Standard Deviation of 'value1':", df_ops['value1'].std())

# Apply multiple aggregations at once using .agg()
print("\nMultiple aggregations on 'value1' and 'value2':\n",
      df_ops[['value1', 'value2']].agg(['sum', 'mean', 'min', 'max']))
```

---

### 8. Grouping and Aggregation (`groupby()`) (Code Cell Examples)

This is a powerful feature for summarizing data by categories.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Grouping and Aggregation (groupby()) ---")
df_sales = pd.DataFrame({
    'Region': ['East', 'West', 'East', 'West', 'North', 'East'],
    'Product': ['Laptop', 'Mouse', 'Keyboard', 'Laptop', 'Mouse', 'Laptop'],
    'Sales': [1000, 150, 200, 1200, 100, 1100],
    'Units': [10, 5, 8, 12, 4, 11]
})
print("\nOriginal Sales DataFrame:\n", df_sales)

# Group by one column and calculate sum of Sales
sales_by_region = df_sales.groupby('Region')['Sales'].sum()
print("\nTotal Sales by Region:\n", sales_by_region)

# Group by multiple columns and calculate mean of Units
mean_units_by_product_region = df_sales.groupby(['Region', 'Product'])['Units'].mean()
print("\nMean Units by Region and Product:\n", mean_units_by_product_region)

# Apply multiple aggregation functions after grouping
multi_agg = df_sales.groupby('Product').agg(
    Total_Sales=('Sales', 'sum'),
    Average_Units=('Units', 'mean'),
    Num_Transactions=('Sales', 'count')
)
print("\nProduct-wise summary (multiple aggregations):\n", multi_agg)

# Resetting index after groupby (turns grouped columns back into regular columns)
reset_index_example = df_sales.groupby('Region')['Sales'].sum().reset_index()
print("\nTotal Sales by Region (with reset index):\n", reset_index_example)
```

---

### 9. Merging, Joining, and Concatenating (Code Cell Examples)

Combine DataFrames in various ways.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Merging, Joining, and Concatenating ---")

df_users = pd.DataFrame({
    'user_id': [1, 2, 3, 4],
    'name': ['Alice', 'Bob', 'Charlie', 'David']
})

df_orders = pd.DataFrame({
    'order_id': [101, 102, 103, 104, 105],
    'user_id': [2, 1, 3, 1, 5], # User 5 doesn't exist in df_users
    'amount': [50, 75, 120, 30, 200]
})

df_addresses = pd.DataFrame({
    'user_id': [1, 2, 3],
    'city': ['NY', 'LA', 'Paris']
})

print("\nUsers DataFrame:\n", df_users)
print("\nOrders DataFrame:\n", df_orders)
print("\nAddresses DataFrame:\n", df_addresses)

# Concatenate (stacking rows) - useful for combining DataFrames with same columns
df_more_users = pd.DataFrame({'user_id': [5, 6], 'name': ['Eve', 'Frank']})
df_combined_users = pd.concat([df_users, df_more_users], ignore_index=True)
print("\nConcatenated Users DataFrame (rows):\n", df_combined_users)

# Merge (like SQL JOINs)
# Inner Merge (default): Only includes rows where 'user_id' exists in BOTH DataFrames
merged_inner = pd.merge(df_users, df_orders, on='user_id', how='inner')
print("\nInner Merge (users and orders):\n", merged_inner)

# Left Merge: Includes all rows from the left DataFrame (df_users), and matching rows from the right
merged_left = pd.merge(df_users, df_orders, on='user_id', how='left')
print("\nLeft Merge (all users, their orders if any):\n", merged_left)

# Right Merge: Includes all rows from the right DataFrame (df_orders), and matching rows from the left
merged_right = pd.merge(df_users, df_orders, on='user_id', how='right')
print("\nRight Merge (all orders, their users if any):\n", merged_right)

# Outer Merge: Includes all rows from both DataFrames, filling NaNs where no match
merged_outer = pd.merge(df_users, df_orders, on='user_id', how='outer')
print("\nOuter Merge (all users AND all orders):\n", merged_outer)

# Merging on multiple keys
df_prod_sales = pd.DataFrame({'year': [2022, 2022, 2023], 'product': ['A', 'B', 'A'], 'sales': [100, 150, 120]})
df_prod_costs = pd.DataFrame({'year': [2022, 2023], 'product': ['A', 'A'], 'cost': [50, 60]})
merged_multi_key = pd.merge(df_prod_sales, df_prod_costs, on=['year', 'product'], how='left')
print("\nMerge on multiple keys (year, product):\n", merged_multi_key)

# Join (index-based merging - common for time series)
df_users_idx = df_users.set_index('user_id')
df_addresses_idx = df_addresses.set_index('user_id')
joined_df = df_users_idx.join(df_addresses_idx) # Default is left join on index
print("\nJoined DataFrame (index-based, users and addresses):\n", joined_df)
```

---

### 10. Reshaping Data (Code Cell Examples)

Transform the layout of your DataFrame for different analyses.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Reshaping Data ---")

# Pivot Table: Summarize data based on values, index, and columns
df_data_pivot = pd.DataFrame({
    'Date': ['2023-01-01', '2023-01-01', '2023-01-02', '2023-01-02'],
    'City': ['New York', 'London', 'New York', 'London'],
    'Temperature': [30, 10, 32, 12],
    'Humidity': [70, 85, 72, 80]
})
print("\nOriginal DataFrame for Pivot:\n", df_data_pivot)

# Pivot table: average temperature by date for each city
pivot_temp = df_data_pivot.pivot_table(
    values='Temperature',
    index='Date',
    columns='City',
    aggfunc='mean'
)
print("\nPivot Table (Average Temperature by Date and City):\n", pivot_temp)

# Melt: Unpivot a DataFrame from wide to long format
df_sales_wide = pd.DataFrame({
    'Month': ['Jan', 'Feb', 'Mar'],
    'East_Sales': [100, 120, 150],
    'West_Sales': [80, 90, 110]
})
print("\nWide Sales Data for Melt:\n", df_sales_wide)

df_sales_long = df_sales_wide.melt(
    id_vars=['Month'],
    value_vars=['East_Sales', 'West_Sales'],
    var_name='Region_Sales_Type', # New column for original column names
    value_name='Sales_Value'       # New column for original values
)
print("\nMelted Sales Data (Long Format):\n", df_sales_long)

# Stack/Unstack (for MultiIndex Series/DataFrames)
# Example with a MultiIndex DataFrame
idx = pd.MultiIndex.from_product([['A', 'B'], ['x', 'y']], names=['Level1', 'Level2'])
df_multi_index = pd.DataFrame(np.random.randint(1, 10, size=(4, 2)),
                              index=idx, columns=['Val1', 'Val2'])
print("\nMultiIndex DataFrame:\n", df_multi_index)

# Stack: Pivots the innermost column level to the innermost row level (creates a Series)
df_stacked = df_multi_index.stack()
print("\nStacked DataFrame (to Series):\n", df_stacked)

# Unstack: Pivots the innermost row level to the innermost column level
df_unstacked = df_stacked.unstack()
print("\nUnstacked Series (back to DataFrame):\n", df_unstacked)
```

---

### 11. Time Series Functionality (Code Cell Examples)

Pandas has robust tools for working with dates and times.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Time Series Functionality ---")

# Convert column to datetime objects
df_time = pd.DataFrame({'date_str': ['2023-01-01', '2023-01-02', '2023-01-03', '2023-01-04', '2023-01-05'],
                        'value': [10, 12, 15, 11, 13]})
df_time['date'] = pd.to_datetime(df_time['date_str'])
print("\nDataFrame with converted 'date' column:\n", df_time)
print("Dtype of 'date':", df_time['date'].dtype)

# Set date column as index (important for time series operations)
df_ts = df_time.set_index('date')
print("\nDataFrame with 'date' as index (df_ts):\n", df_ts)

# Resampling (e.g., daily data to weekly sum)
# 'W' for weekly, 'M' for monthly, 'D' for daily, 'H' for hourly, etc.
weekly_sum = df_ts['value'].resample('W').sum()
print("\nWeekly sum of 'value':\n", weekly_sum)

# Shifting data (for previous/next period comparisons)
df_ts['prev_day_value'] = df_ts['value'].shift(1) # Shift by 1 period (previous day)
df_ts['next_day_value'] = df_ts['value'].shift(-1) # Shift by -1 period (next day)
print("\nDataFrame with shifted values:\n", df_ts)

# Rolling window calculations (e.g., 2-day rolling mean)
df_ts['rolling_mean_2d'] = df_ts['value'].rolling(window=2).mean()
print("\nDataFrame with 2-day rolling mean:\n", df_ts)

# Expanding window calculations (e.g., cumulative mean)
df_ts['expanding_mean'] = df_ts['value'].expanding().mean()
print("\nDataFrame with expanding mean (cumulative):\n", df_ts)

# Extracting date components
df_ts['year'] = df_ts.index.year
df_ts['month'] = df_ts.index.month
df_ts['day'] = df_ts.index.day
df_ts['day_name'] = df_ts.index.day_name()
print("\nDataFrame with extracted date components:\n", df_ts)
```

---

### 12. Input/Output (I/O) (Code Cell Examples)

How to read and write data from/to various file formats.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Input/Output (I/O) ---")

# Example DataFrame to save
df_save = pd.DataFrame({
    'ID': [1, 2, 3],
    'Item': ['Pen', 'Notebook', 'Eraser'],
    'Price': [1.5, 3.0, 0.75]
})
print("\nDataFrame to save (df_save):\n", df_save)

# Writing to CSV
# Creates 'output_data.csv' in your current working directory
df_save.to_csv('output_data.csv', index=False) # index=False prevents writing DataFrame index
print("\nDataFrame saved to 'output_data.csv' (check your directory).")

# Reading from CSV (assuming 'output_data.csv' exists now)
df_read_csv = pd.read_csv('output_data.csv')
print("\nDataFrame read from 'output_data.csv':\n", df_read_csv)

# Writing to Excel
# Creates 'output_data.xlsx'
df_save.to_excel('output_data.xlsx', sheet_name='Products', index=False)
print("\nDataFrame saved to 'output_data.xlsx' (check your directory).")

# Reading from Excel
df_read_excel = pd.read_excel('output_data.xlsx', sheet_name='Products')
print("\nDataFrame read from 'output_data.xlsx':\n", df_read_excel)

# Writing to JSON
# Creates 'output_data.json'
df_save.to_json('output_data.json', orient='records', indent=4) # orient='records' for list of dicts
print("\nDataFrame saved to 'output_data.json' (check your directory).")

# Reading from JSON
df_read_json = pd.read_json('output_data.json', orient='records')
print("\nDataFrame read from 'output_data.json':\n", df_read_json)

# Note: SQL I/O requires additional libraries (e.g., SQLAlchemy, psycopg2 for PostgreSQL)
# and database connection setup. It's more complex than file I/O for a quick example.
# Example (requires SQLAlchemy and a database):
# from sqlalchemy import create_engine
# try:
#     engine = create_engine('sqlite:///my_database.db') # SQLite example
#     # df_save.to_sql('my_products', engine, if_exists='replace', index=False)
#     # df_read_sql = pd.read_sql('SELECT * FROM my_products', engine)
#     # print("\nSQL Read (example if DB is set up):\n", df_read_sql)
# except ImportError:
#     print("\nSQLAlchemy not installed. Skipping SQL I/O examples.")
# except Exception as e:
#     print(f"\nCould not perform SQL I/O: {e}")
```

---

### 13. Miscellaneous Utility (Code Cell Examples)

Handy functions for common data cleaning and manipulation tasks.

```python
# Run this in a Jupyter Notebook Code Cell

print("--- Miscellaneous Utility ---")
df_misc = pd.DataFrame({
    'Value': [30, 10, 40, 10, 50, 20],
    'Category': ['C', 'A', 'D', 'A', 'E', 'B'],
    'Has_Flag': [True, False, True, False, True, False]
})
print("\nOriginal Miscellaneous DataFrame:\n", df_misc)

# Sorting values by a column
df_sorted_val = df_misc.sort_values(by='Value', ascending=True)
print("\nDataFrame sorted by 'Value' (ascending):\n", df_sorted_val)

# Sorting by multiple columns
df_sorted_multi = df_misc.sort_values(by=['Category', 'Value'], ascending=[True, False])
print("\nDataFrame sorted by 'Category' (asc) then 'Value' (desc):\n", df_sorted_multi)

# Resetting index (useful after filtering or sorting)
df_filtered = df_misc[df_misc['Value'] > 20]
df_reset = df_filtered.reset_index(drop=True) # drop=True prevents old index from becoming a column
print("\nDataFrame after filtering and resetting index:\n", df_reset)

# Dropping duplicates
df_dup = pd.DataFrame({'A': [1, 2, 1, 3], 'B': ['x', 'y', 'x', 'z']})
print("\nDataFrame with duplicates:\n", df_dup)
df_no_dup = df_dup.drop_duplicates()
print("\nDataFrame after dropping all duplicates:\n", df_no_dup)
df_no_dup_subset = df_dup.drop_duplicates(subset=['A'], keep='first') # Keep first occurrence based on 'A'
print("\nDataFrame after dropping duplicates on 'A' (keeping first):\n", df_no_dup_subset)

# Mapping values from one set to another
category_mapping = {'A': 'Group1', 'B': 'Group1', 'C': 'Group2', 'D': 'Group2', 'E': 'Group3'}
df_misc['Mapped_Category'] = df_misc['Category'].map(category_mapping)
print("\nDataFrame with 'Category' mapped:\n", df_misc)

# Replacing specific values
df_replace = df_misc.copy()
df_replace['Value'].replace(10, 100, inplace=True)
print("\nDataFrame after replacing 10 with 100 in 'Value':\n", df_replace)

# Sampling rows (randomly select rows)
print("\nSample 2 random rows (df_misc.sample(n=2)):\n", df_misc.sample(n=2, random_state=42)) # random_state for reproducibility

# Type Conversion
df_types = pd.DataFrame({'str_num': ['10', '20', '30'], 'bool_str': ['True', 'False', 'True']})
df_types['int_num'] = df_types['str_num'].astype(int)
df_types['bool_val'] = df_types['bool_str'].astype(bool)
print("\nDataFrame after type conversion:\n", df_types.dtypes)
print(df_types)

# Categorical data type (memory efficient and useful for specific operations)
df_types['Category_Type'] = df_misc['Category'].astype('category')
print("\nDataFrame with 'Category_Type' as categorical:\n", df_types.dtypes)
print(df_types['Category_Type'].cat.categories)

# Explode (for list-like entries in a column)
df_explode_example = pd.DataFrame({'ID': [1, 2], 'Tags': [['python', 'pandas'], ['data', 'analysis', 'ml']]})
print("\nDataFrame before explode:\n", df_explode_example)
df_exploded = df_explode_example.explode('Tags')
print("\nDataFrame after explode on 'Tags':\n", df_exploded)

# Pipe (for chaining custom functions)
def add_five(df_col):
    return df_col + 5
def multiply_by_two(df_col):
    return df_col * 2

df_pipe_example = pd.DataFrame({'Num': [1, 2, 3]})
piped_result = df_pipe_example['Num'].pipe(add_five).pipe(multiply_by_two)
print("\nResult of piping functions (add 5, then multiply by 2):\n", piped_result)

# Clip (limit values to a specified range)
df_clip_example = pd.DataFrame({'Scores': [50, 70, 90, 110, 130]})
df_clip_example['Clipped_Scores'] = df_clip_example['Scores'].clip(lower=70, upper=100)
print("\nDataFrame with clipped scores (min 70, max 100):\n", df_clip_example)
```

---

### How to Use This in Jupyter Notebook:

1.  **Create a New Notebook:** Open Jupyter Notebook and create a new Python 3 notebook.
2.  **Copy-Paste into Code Cells:** Copy each ````python` block (including the `import pandas as pd` at the very beginning) and paste it into separate **Code cells** in your Jupyter Notebook.
3.  **Run Cells:** Execute each code cell by pressing `Shift + Enter`.
4.  **Add Explanations (Optional but Recommended):** For better understanding and documentation, you can copy the corresponding **Markdown text** (like the headings `### 1. Series Creation (Code Cell Examples)` and the descriptions) and paste them into separate **Markdown cells** in your Jupyter Notebook. Then, run these Markdown cells (`Shift + Enter`) to render them beautifully.















Below is a comprehensive Markdown document that outlines many of the most common Pandas commands with their syntax and examples. You can save this text to a file (for example, `Pandas_Cheat_Sheet.md`) and refer to it as you learn Pandas. Note that while Pandas is an extremely extensive library, this cheat sheet covers many of the day‐to‐day operations that you’re likely to use.

---

```markdown
# Pandas Commands Cheat Sheet with Syntax

This document presents a comprehensive list of common Pandas commands along with syntax examples. It serves as a quick reference for data manipulation and analysis tasks using the Pandas library.

## Table of Contents
1. [Getting Started](#1-getting-started)
2. [Creating Data Structures](#2-creating-data-structures)
   - [Series](#series)
   - [DataFrame](#dataframe)
3. [Reading and Writing Data (I/O)](#3-reading-and-writing-data-io)
4. [Exploring and Inspecting Data](#4-exploring-and-inspecting-data)
5. [Selecting, Indexing, and Filtering Data](#5-selecting-indexing-and-filtering-data)
6. [Modifying DataFrames](#6-modifying-dataframes)
7. [Merging, Concatenating, and Joining](#7-merging-concatenating-and-joining)
8. [Aggregation, Grouping, and Pivoting](#8-aggregation-grouping-and-pivoting)
9. [Handling Missing Data](#9-handling-missing-data)
10. [Reshaping and Transforming Data](#10-reshaping-and-transforming-data)
11. [Working with Dates and Times](#11-working-with-dates-and-times)
12. [Advanced Data Manipulation](#12-advanced-data-manipulation)
13. [Visualization with Pandas](#13-visualization-with-pandas)
14. [Additional Useful Commands](#14-additional-useful-commands)
15. [Final Thoughts](#15-final-thoughts)

---

## 1. Getting Started

Import Pandas and check its version.

```python
import pandas as pd
print(pd.__version__)
```

---

## 2. Creating Data Structures

### Series

A **Series** is a one-dimensional labeled array.

```python
s = pd.Series([10, 20, 30, 40], index=['a', 'b', 'c', 'd'])
print(s)
```

### DataFrame

A **DataFrame** is a two-dimensional table with labeled rows and columns. It can hold different data types.

```python
data = {
    'Name': ['Alice', 'Bob', 'Charlie'],
    'Age': [25, 30, 35],
    'Salary': [50000, 60000, 70000]
}
df = pd.DataFrame(data)
print(df)
```

### Index

Pandas indexes hold the axis labels of a DataFrame.

```python
print(df.index)
```

---

## 3. Reading and Writing Data (I/O)

### CSV Files

```python
# Reading from a CSV file:
df_csv = pd.read_csv('data.csv')

# Writing to a CSV file:
df.to_csv('output.csv', index=False)
```

### Excel Files

```python
# Reading from an Excel file:
df_excel = pd.read_excel('data.xlsx', sheet_name='Sheet1')

# Writing to an Excel file:
df.to_excel('output.xlsx', sheet_name='Sheet1', index=False)
```

### JSON Files

```python
# Reading JSON:
df_json = pd.read_json('data.json')

# Writing JSON:
df.to_json('output.json')
```

### SQL Databases

```python
import sqlite3
conn = sqlite3.connect('database.db')
df_sql = pd.read_sql('SELECT * FROM table_name', conn)
```

### HTML Tables

```python
# Extracting all tables from a webpage (returns a list of DataFrames):
dfs = pd.read_html('https://example.com/table_page.html')
```

---

## 4. Exploring and Inspecting Data

```python
print(df.head())          # First 5 rows
print(df.tail())          # Last 5 rows
print(df.shape)           # DataFrame dimensions (rows, columns)
df.info()                 # Summary of the DataFrame (data types, non-null counts)
print(df.describe())      # Statistical summary for numerical columns
print(df.columns)         # List of columns
```

---

## 5. Selecting, Indexing, and Filtering Data

### Selecting Columns

```python
age_series = df['Age']             # Single column as a Series
subset = df[['Name', 'Salary']]      # Multiple columns as a DataFrame
```

### Selecting Rows

#### Label-based selection with `loc`

```python
row_label = df.loc[0]                    # Row by label
subset_loc = df.loc[0:2, ['Name', 'Salary']]  # Row slicing by labels with selected columns
```

#### Position-based selection with `iloc`

```python
row_position = df.iloc[0]              # Row by integer position
subset_iloc = df.iloc[0:3, 0:2]         # Row and column slicing by integer positions
```

### Boolean Indexing

```python
filtered_df = df[df['Age'] > 30]
complex_filter = df[(df['Age'] > 25) & (df['Salary'] > 55000)]
```

### Accessing Single Values

```python
# Fast scalar access by label:
value_at = df.at[0, 'Age']

# Fast scalar access by integer position:
value_iat = df.iat[0, 1]
```

---

## 6. Modifying DataFrames

### Adding and Renaming Columns

```python
# Adding a new column:
df['Bonus'] = df['Salary'] * 0.1

# Renaming columns:
df.rename(columns={'Age': 'Years'}, inplace=True)
```

### Dropping Columns and Rows

```python
# Dropping a column:
df.drop('Bonus', axis=1, inplace=True)

# Dropping a row:
df.drop(0, axis=0, inplace=True)
```

### Changing Data Types

```python
df['Years'] = df['Years'].astype(float)
```

---

## 7. Merging, Concatenating, and Joining

### Concatenating DataFrames

```python
# Vertical concatenation (stacking rows):
df_combined = pd.concat([df, df], axis=0)

# Horizontal concatenation (side-by-side):
df_combined_cols = pd.concat([df, df], axis=1)
```

### Merging DataFrames

```python
# Merging (joining) DataFrames on a key column:
merged_df = pd.merge(df, df, on='Name', how='inner', suffixes=('_left', '_right'))
```

### Joining DataFrames

```python
# Joining using the DataFrame method:
df_joined = df.join(df.set_index('Name'), on='Name', lsuffix='_left')
```

---

## 8. Aggregation, Grouping, and Pivoting

### Grouping

```python
# Group by a column and compute the mean for another column:
grouped = df.groupby('Name')['Salary'].mean()

# Counting entries per group:
group_count = df.groupby('Name')['Salary'].count()
```

### Pivot Tables

```python
# Creating a pivot table. For example, with columns "Department", "Gender", "Salary":
pivot_table = df.pivot_table(values='Salary', index='Department', columns='Gender', aggfunc='mean')
```

### Common Aggregation Functions

```python
total = df.sum()
average = df.mean()
minimum = df.min()
maximum = df.max()
count = df.count()
std_dev = df.std()
```

---

## 9. Handling Missing Data

### Detection

```python
# Check for missing values:
missing_values = df.isnull()

# Alternatively, detect non-null values:
not_missing = df.notnull()
```

### Dropping Missing Data

```python
# Drop any row with missing values:
df_clean = df.dropna()

# Drop columns with missing values:
df_clean_cols = df.dropna(axis=1)

# Drop rows where a specific column has missing values:
df_clean_subset = df.dropna(subset=['Age'])
```

### Filling Missing Data

```python
# Replace all missing values with a constant:
df_filled = df.fillna(0)

# Fill missing values in a column with the mean:
df['Age'].fillna(df['Age'].mean(), inplace=True)
```

---

## 10. Reshaping and Transforming Data

### Melting Data

Convert wide data to long format.

```python
df_melted = pd.melt(df, id_vars=['Name'], value_vars=['Years', 'Salary'])
```

### Pivoting (Unmelting) Data

Convert long data back to wide format.

```python
df_pivot = df_melted.pivot(index='Name', columns='variable', values='value')
```

### Stacking and Unstacking

```python
# Stacking: Pivot columns into the index
stacked = df.stack()

# Unstacking: Pivot the index back into columns
unstacked = stacked.unstack()
```

### Resetting and Setting the Index

```python
# Reset the index (convert index to a column):
df_reset = df.reset_index()

# Set a column as the index:
df.set_index('Name', inplace=True)
```

---

## 11. Working with Dates and Times

```python
# Convert a column to datetime:
df['date'] = pd.to_datetime(df['date'])

# Set the datetime column as the index:
df.set_index('date', inplace=True)

# Resample time-series data (for example, monthly averages):
df_resampled = df.resample('M').mean()
```

---

## 12. Advanced Data Manipulation

### Query and Eval

```python
# Use query to filter data:
filtered_query = df.query('Salary > 50000')

# Use eval to compute expressions efficiently:
result_eval = df.eval('Salary * 1.1')
```

### Apply, Map, and Replace Functions

```python
# Apply a function element-wise:
df['Salary_adjusted'] = df['Salary'].apply(lambda x: x * 1.1)

# Map values in a Series using a replacement dictionary:
df['Category'] = df['Category'].map({'A': 'Group1', 'B': 'Group2'})

# Replace specific values in a column:
df['Name'].replace({'Alice': 'Alicia'}, inplace=True)
```

### Handling Duplicates

```python
# Identify duplicate rows:
duplicates = df.duplicated()

# Drop duplicate rows:
df.drop_duplicates(inplace=True)
```

### Rolling Window Calculations

```python
# Calculate rolling mean with a window size of 2:
df['rolling_mean'] = df['Salary'].rolling(window=2).mean()
```

### Working with Categorical Data

```python
# Convert a column to a categorical type:
df['Category'] = df['Category'].astype('category')
```

---

## 13. Visualization with Pandas

Leverage Pandas’ built-in plotting (which uses Matplotlib under the hood) for quick visualization.

```python
import matplotlib.pyplot as plt

df['Salary'].plot(kind='bar', color='skyblue')
plt.title('Salary Distribution')
plt.xlabel('Index')
plt.ylabel('Salary')
plt.show()
```

---

## 14. Additional Useful Commands

### Value Counts and Unique Values

```python
# Count occurrences of unique values:
value_counts = df['Salary'].value_counts()

# Get unique values in a column:
unique_values = df['Name'].unique()
```

### Arithmetic and Vectorized Operations

```python
# Adding 10 to every numeric element:
df_plus_10 = df.select_dtypes(include=[np.number]) + 10

# Multiplying every numeric element by 2:
df_times_2 = df.select_dtypes(include=[np.number]) * 2
```

### Iterating Over Rows (Less Efficient)

```python
# Iterate over rows (for small DataFrames only):
for index, row in df.iterrows():
    print(f"Index: {index}, Name: {row['Name']}")
```

### Check Memory Usage

```python
print(df.memory_usage())
```

---

## 15. Final Thoughts

This cheat sheet covers many essential Pandas commands and operations for data exploration, manipulation, and analysis. Pandas is a vast library, so always refer to the [Official Pandas Documentation](https://pandas.pydata.org/docs/) for deeper insights and new features.

Happy coding and data exploring!
```

---

### Next Steps

Feel free to use and modify this Markdown document as your reference while you learn Pandas. You can enhance it further by adding more commands, examples, or notes as you dive deeper into data analysis projects.

Enjoy your Pandas journey!

