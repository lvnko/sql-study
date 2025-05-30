# Week #028 ~ #029
初探 SQL

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

## 2. ORDER BY 的用法

### 2.1. 解析順序
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

## 4. GROUP BY 與 HAVING 的用法

### 4.1. 解析順序
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

## 5. HAVING 的用法

### 5.1. 解析順序
FROM > WHERE > SELECT > GROUP BY > HAVING > ORDER BY > LIMIT

### 5.2. ``HAVING`` 的使用範例
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

## 6. COLUMN ALIAS 與 TABLE ALIAS 的用法

增加可讀性

```sql
SELECT
    last_name || ' ' || first_name AS `Full Name`
FROM user
ORDER BY `Full Name`;
```

```sql
-- 在以下例子可以看到，u 成為了 TABLE user 的 alias，
-- 在 SELECT 的時候可以在 COLUMN 名稱前面加上 (u.column_name)
-- 這樣當我們在需要 JOIN 多個 TABLE 的資料時便比較不會跟其他 TABLE
-- 的同名 COLUMN 搞混。
SELECT
    u.last_name || ' ' || u.first_name AS `Full Name`
FROM user AS u
ORDER BY `Full Name`;
```

## 7. JOIN

### 7.1. 解析順序
- FROM > INNER JOIN > JOIN CONDITION > SELECT
- FROM > LEFT JOIN > JOIN CONDITION > SELECT
- FROM > RIGHT JOIN > JOIN CONDITION > SELECT

### 7.2 INNER JOIN

```sql
SELECT
    u.user_id, l.user_id, u.name, u.createdAt, l.list_name, l.description
FROM
    user u
INNER JOIN
    list l
    ON u.user_id = l.user_id;
```

```sql
SELECT
    u.name,
    l.list_name,
    s.artist, s.song_name
FROM
    user u
INNER JOIN
    list l
    ON u.user_id = l.user_id
INNER JOIN
    song s
    ON s.list_id = l.list_id
WHERE
    u.name = 'lmnooney';
```

### 7.3 LEFT JOIN

```sql
-- 注意，一些透過以下訪問所拿到的 record 未必擁有由 TABLE song 的值，
-- 原因是這次我們用的是 LEFT JOIN，在 LEFT 的 TABLE 就算有 record
-- 不能在 RIGHT TABLE 找到有相同對應值的 record，還是會顯示，相反，
-- RIGHT TABLE 若有 record 不能在 LEFT TABLE 找到有相同對應值的
-- record，卻不會顯示
SELECT
    l.list_name,
    l.description,
    s.artist, s.song_name
FROM
    list l
LEFT JOIN
    song s
    ON s.list_id = l.list_id;
```

```sql
SELECT
    u.name, u.createdAt,
    l.list_name, l.description,
    s.artist, s.song_name
FROM
    user u
LEFT JOIN
    list l
    ON u.user_id = l.user_id
LEFT JOIN
    song s
    ON s.list_id = l.list_id;
```

```sql
-- 有些時候，我們也可以運用 LEFT JOIN 與 WHERE 來找出
-- 在 RIGHT TABLE 存在空值得 record，如下：
SELECT
    u.name, u.createdAt,
    l.list_name
FROM
    user u
LEFT JOIN
    list l
    ON u.user_id = l.user_id
WHERE
    l.list_name IS NULL;
```

### 7.4 SELF JOIN
SELF 並不是語法，而是一種撰寫 SQL Report 的技法，以下例子顯示如何與同一個 TABLE 相連創造出不同的 column 以製造出一個擁有不同意義的 TABLE。

```sql
-- 在以下的例子，我們想列出所有的長官，
-- 以及他們有哪些下屬：

SELECT
    m.name AS `Manager`, e.name AS `Staff Under`
FROM
    employee e
INNER JOIN
    employee m
    ON e.report_to = m.name
ORDER BY
    `Manager`;

-- 結果如下：
-- Manager       Staff Under  
-- ------------  --------------
-- fivefishes    David chen    
-- fivefishes    Ming Hung Tsai
-- lmnooney      fivefishes    
-- lmnooney      Yi Jing Tsai  
-- tall15421542  997_416       
-- tall15421542  lmnooney 
```

```sql
-- 在以下的例子，我們想要找出誰是幕後老大，
-- 也就是沒有長官 (report_to) 的 record：
SELECT
    e.name AS `Boss`
FROM
    employee e
LEFT JOIN
    employee m
    ON e.report_to = m.name
WHERE
    e.report_to IS NULL
ORDER BY
    `Boss`;

-- 結果如下：
-- Boss        
-- ------------
-- tall15421542

```

```sql
-- 在以下的例子，我們想要找出哪些是基層員工，
-- 也就是沒有下屬的 record，那麼同樣地可以使用
-- LEFT JOIN on e.report_to，
-- 那麼當 e.report_to 是空值的時後，那些就是
-- 基層員工：

SELECT
    m.name AS `Base Staff`
FROM
    employee m
LEFT JOIN
    employee e
    ON e.report_to = m.name
WHERE
    e.name IS NULL
ORDER BY
    `Base Staff`;

-- 結果如下：
-- Base Staff    
-- --------------
-- 997_416       
-- David chen    
-- Ming Hung Tsai
-- Yi Jing Tsai  

```

## 8. Subquery

### 8.1. 解析順序
以最深層的 Query 為先，再一層一層往外解讀：<br/>
Inner Query > Top Query

### 8.2. COMPARISION 範例 

把 subquery 放在 ``WHERE`` 後的條件運算值中：

```sql
SELECT
    name, position, salary
FROM employee
WHERE salary = (
    SELECT MAX(salary)
    FROM employee
);
```
```sql
SELECT
    list_name, description
FROM list
WHERE list_id IN (
    SELECT list_id
    FROM (
        SELECT
            list_id,
            COUNT(song_name) AS num_of_song
        FROM song
        GROUP BY list_id
    )
    WHERE
        num_of_song >= 3
);
```
**比較運算子**
= , >, <, >=, <=

### 8.3. FROM DERIVED TABLE

```sql
SELECT
    l.list_id,
    COUNT(song_name)
FROM
    list AS l
INNER JOIN
    song AS s
    ON s.list_id = l.list_id
GROUP BY
    l.list_id;
```

用 subquery 先來總結一個 Table，然後把它交給另一個 SELECT query 的 FROM 來做篩選。

```sql
SELECT
    id, `list name`, num_of_song
FROM (
    SELECT
        l.list_id AS id,
        l.list_name AS `list name`,
        COUNT(song_name) AS num_of_song
    FROM
        list AS l
    INNER JOIN
        song AS s
        ON s.list_id = l.list_id
    GROUP BY
        l.list_id
) list_sub_table
WHERE list_sub_table.num_of_song >= 3;
```

```sql
SELECT
    name, email, createdAt
FROM (
    SELECT
        user_id,
        MAX(list_count)
    FROM (
        SELECT
            user_id,
            COUNT(user_id) AS list_count
        FROM
            list
        GROUP BY
            user_id
    )
) user_with_max_list_cnt
INNER JOIN
    user
    ON user.user_id = user_with_max_list_cnt.user_id;
```

### 8.4. WHERE IN/NOT IN

```sql
SELECT list_name, description
FROM list
WHERE list_id IN (
    SELECT
        list_id /* 要注意這裡只能選一個欄位，如果輸入多個便會出錯 */
    FROM (
        SELECT
            list_id,
            COUNT(song_name) AS num_of_song
        FROM
            song
        GROUP BY
            list_id
    )
    WHERE
        num_of_song >= 3
);
```

### 8.5. CORRELATED SUBQUERY

一般的 Sub Query 是以自身的邏輯及參數去把值找出來，跟上層的 Query 不會有直接關聯，但當上層 Query 的參數值被 Sub Query 取用，我們便稱這些 Query 做 Sub Query。<br/>
要注意的是，一般的 Sub Query 只執行一次便能把需要的值取出，但像 Correlated Sub Query 因為牽涉到上層 Query 的動態值，這樣它的執行次數便與上層 Query record 數目相等，也讓它效能比沒有 Correlation 的 Sub Query 差。<br/>
因此，當有其他的 Query 方法能獲得同樣的結果，一般不建議用 Correlated Sub Query。

```sql
-- 以下的例子是為列出公司內薪金高於平均水平的員工：
SELECT
    name, position, salary
FROM
    employee e
WHERE
    e.salary > (
        /*
            這個 Sub Query 的目的是篩選出與上層 Query
            當前 record 同 position 的平均薪金水平
        */
        SELECT
            AVG(salary)
        FROM
            employee e2
        WHERE -- 所以在這裡我們把上層 Query record 的 position 帶進來做比較
            e.position = e2.position
    );
```
```sql
-- 以下的例子是為列出公司內職位薪金平均值高於 180 的員工：
SELECT
    name, position
FROM
    employee e1
WHERE EXISTS(
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.position = e2.position
    GROUP BY position HAVING AVG(salary) > 180
);
```
其他常用 SQL 工具指令
```sql
pragma table_info('table_name');
```