# Week #028 ~ #029
初探 SQL

## SQL 基礎知識

### CREATE TABLE 的用法

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

### SELECT ... FROM 的用法

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
SELECT name, salary FROM employees WHERE name LIKE 'J%a__';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第三個字母的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a___';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第四個字母的員工的 `name` 和 `salary`。

```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a____';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第五個字母的員工的 `name` 和 `salary`。


```sql
SELECT name, salary FROM employees WHERE name LIKE 'J%a_____________________________________';
```

上面的 SQL 語句將從 `employees` 表格中選取 `name` 以 'J' 開頭且包含 'a' 作為倒數第三十八個字母的員工的 `name` 和 `salary`。

## ORDER BY 的用法

### 解析順序
FROM > SELECT > ORDER BY

```sql
SELECT
    name,
    salary,
    position
FROM
    employee;
```

```sql
SELECT
    name,
    salary,
    position
FROM
    employee
ORDER BY
    salary DESC;
```

```sql
SELECT
    name,
    salary,
    factor,
    salary * factor as true_salary,
    position
FROM
    employee
ORDER BY
    true_salary DESC;
```

```sql
SELECT
    name,
    salary,
    factor,
    salary * factor as true_salary,
    position
FROM
    employee
ORDER BY
    position='software engineer' DESC,
    position='PM' DESC;
```

## WHERE 的用法

### 解析順序
FROM > WHERE > SELECT > ORDER BY

```sql
SELECT name, position FROM employee WHERE position='PM';
SELECT name, salary FROM employee WHERE salary > 200; 
SELECT name, salary, factor FROM employee WHERE salary > 200 AND factor > 1.5;
SELECT name, salary, factor FROM employee WHERE salary > 200 OR factor > 1.5;
SELECT name, factor FROM employee WHERE factor IS NULL;
```

```sql
# 以下兩個訪問結果皆為相同：
SELECT name, salary FROM employee WHERE salary BETWEEN 150 AND 200;
SELECT name, salary FROM employee WHERE salary >= 150 AND salary <= 200;
```

```sql
-- 與其用等號把每一個想要囊括的值都宣告一遍，也可以使用 IN(...)，把想要的值都放到括號裡面：
SELECT name, position FROM employee WHERE position IN('database engineer', 'PM');
```

```sql
-- 以下 SQL 訪問的結果皆不同
SELECT name FROM employee WHERE name LIKE '%_1%';
SELECT name FROM employee WHERE name LIKE 'emp%';
SELECT name FROM employee WHERE name LIKE '%\_1%' ESCAPE '\';
SELECT name FROM employee WHERE name LIKE '%\_1_' ESCAPE '\';
```

組合 ``WHERE`` 與 ``ORDER BY`` 使用
```sql
SELECT
    name, salary
FROM
    employee
WHERE
    name LIKE '%@_%' ESCAPE '@'
ORDER BY
    salary DESC;
```

## GROUP BY 與 HAVING 的用法

### 解析順序
FROM > WHERE > SELECT > GROUP BY > ORDER BY > LIMIT

```sql
-- 這裡可以注意一下，如果我們不用任何 Aggregate function (例：AVG(...))
-- 對 GROUP BY 以外的欄做運算，那預設只會拿那個欄位行數在第一順位的值來顯示
SELECT
    position,
    AVG(salary) AS avg_salary,
FROM
    employee
GROUP BY
    position;
```

## HAVING 的用法

### 解析順序
FROM > WHERE > SELECT > GROUP BY > HAVING > ORDER BY > LIMIT

```sql
SELECT
    position,
    AVG(salary) AS avg_salary,
FROM
    employee
GROUP BY
    position
HAVING
    avg_salary > 100;
```

```sql
SELECT
    position,
    AVG(salary) AS avg_salary,
    AVG(factor) AS avg_factor
FROM
    employee
GROUP BY
    position
HAVING
    avg_salary > 100
    AND avg_factor > 1.4;
```

```sql
-- 需要注意的是，WHERE 在解析順序上在 GROUP BY 之前，
-- 而 HAVING 是針對 GROUP BY 的，所以一些因應 GROUP BY
-- 而總結出來的 field 只能用相對應的步驟 (HAVING) 去處理。
-- 如上理，以下的 SQL 是會有 syntax Error 在的 WHERE 處。
SELECT
    position,
    AVG(salary) AS avg_salary,
FROM
    employee
GROUP BY
    position
WHERE
    avg_salary > 100;
```
