## 4. GROUP BY 與 HAVING 的用法

### 4.1. ``GOUP BY`` 解析順序
FROM > WHERE > SELECT > GROUP BY > ORDER BY > LIMIT

### 4.2. ``GROUP BY`` 的使用範例
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
### 4.3. ``HAVING`` 的解析順序
FROM > WHERE > SELECT > GROUP BY > HAVING > ORDER BY > LIMIT

### 4.4. ``HAVING`` 的使用範例
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
需要注意的是，WHERE 在解析順序上在 GROUP BY 之前，而 HAVING 是針對 GROUP BY 的，所以一些因應 GROUP BY 而總結出來的 field 只能用相對應的步驟 (HAVING) 去處理。

```sql
-- 如上理，以下的 SQL 是會有 syntax Error 在的 WHERE 處。
SELECT
    position,
    AVG(salary) AS avg_salary,
FROM
    employee
GROUP BY
    position
WHERE -- <- 這一行會有 Error
    avg_salary > 100;
```