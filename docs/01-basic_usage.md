[回到概覽](overview.md) | [下一章](02-select_order_by.md)

## 1. SQL 基礎知識

### 1.1. CREATE TABLE 的用法

`CREATE TABLE` 語句用於在資料庫中創建一個新的表格。

```sql
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    salary DECIMAL(10, 2)
);
```

上面的 SQL 語句創建了一個名為 `employees` 的表格，包含 `employee_id`, `name`, `position`, 和 `salary` 四個欄位。

### 1.2. SELECT ... FROM 的用法

`SELECT` 語句用於從資料庫中查詢資料。`FROM` 子句指定要從哪個表格中查詢資料。

```sql
SELECT * FROM employees;
```

上面的 SQL 語句將從 `employees` 表格中選取所有欄位的所有資料。

```sql
SELECT name, salary FROM employees;
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 和 `salary` 欄位的所有資料。

```sql
SELECT name, salary FROM employees WHERE position = 'software engineer';
```

上面的 SQL 語句將從 `employees` 表格中選取 `position` 為 'software engineer' 的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees ORDER BY salary DESC;
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 和 `salary`，並按照 `salary` 降序排列。

```sql
SELECT name, salary FROM employees WHERE salary > 50000 ORDER BY salary ASC;
```

上面的 SQL 語句將從 `employees` 表格中選取 `salary` 大於 50000 的員工的 `name` 和 `salary`，並按照 `salary` 升序排列。

```sql
SELECT COUNT(*) FROM employees;
```

上面的 SQL 語句將計算 `employees` 表格中的總行數。

```sql
SELECT AVG(salary) FROM employees WHERE position = 'software engineer';
```

上面的 SQL 語句將計算 `position` 為 'software engineer' 的員工的平均 `salary`。

```sql
SELECT SUM(salary) FROM employees;
```

上面的 SQL 語句將計算 `employees` 表格中所有員工的總 `salary`。

```sql
SELECT MIN(salary) FROM employees;
```

上面的 SQL 語句將找出 `employees` 表格中最低的 `salary`。

```sql
SELECT MAX(salary) FROM employees;
```

上面的 SQL 語句將找出 `employees` 表格中最高的 `salary`。

```sql
SELECT DISTINCT position FROM employees;
```

上面的 SQL 語句將找出 `employees` 表格中所有不重複的 `position` 值。

```sql
SELECT name, salary FROM employees LIMIT 10;
```

上面的 SQL 語句將從 `employees` 表格中選取前 10 行資料。

```sql
SELECT name, salary FROM employees LIMIT 10 OFFSET 20;
```

上面的 SQL 語句將從 `employees` 表格中選取從第 21 行開始的 10 行資料。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE '%son';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'son' 結尾的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE '%a%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 中包含 'a' 的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE '_a%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 中第二個字母是 'a' 的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J__%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且至少有三個字母的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且以 'a' 結尾的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE '%a%o%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 中包含 'a' 且在 'a' 之後包含 'o' 的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE '_a%o';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 中第二個字母是 'a' 且以 'o' 結尾的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%_a%';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第二個字母的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a_';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第一個字母的員工的 `name` 和 `salary`。


```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a_____________________________________';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第三十八個字母的員工的 `name` 和 `salary`。
