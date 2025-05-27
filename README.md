# Week #028 ~ #029
初探 SQL

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