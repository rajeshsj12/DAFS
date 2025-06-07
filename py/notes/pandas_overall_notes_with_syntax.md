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
