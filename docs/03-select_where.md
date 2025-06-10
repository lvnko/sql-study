[回到概覽](overview.md) | [上一章](02-select_order_by.md) | [下一章](04-group_and_having.md)

## 3. WHERE 的用法

### 3.1. 解析順序
FROM > WHERE > SELECT > ORDER BY

### 3.2. ``WHERE`` 的使用範例
```sql
SELECT name, position FROM employee WHERE position='PM';
SELECT name, salary FROM employee WHERE salary > 200; 
SELECT name, salary, factor FROM employee WHERE salary > 200 AND factor > 1.5;
SELECT name, salary, factor FROM employee WHERE salary > 200 OR factor > 1.5;
SELECT name, factor FROM employee WHERE factor IS NULL;
```

```sql
-- 以下兩個訪問結果皆為相同：
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

### 3.3. 組合 ``WHERE`` 與 ``ORDER BY`` 使用範例
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
