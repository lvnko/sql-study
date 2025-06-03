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

## 9. CTE - Common Table Expression
## 9.1. 解析順序
CTE > CTE .... CTE > SELECT/INSERT/UPDATE/DELETE/CREATE
## 9.2. 實際例子
```sql
/*
- 格式：
    WITH cte_name (column_list) AS (
        query
    )
    SELECT * FROM cte_name
*/
-- 以下的例子是為列出歌曲等於或超過 3 的歌單之 id：
WITH song_count_for_each_list AS (
    SELECT
        list_id,
        COUNT(song_id) AS num_of_song
    FROM song
    GROUP BY list_id    
)
SELECT list_id
FROM song_count_for_each_list
WHERE num_of_song >= 3;
```

```sql
-- 以下的例子中可以看到，CTE 可以被多次使用，
-- 也可以在 CTE 中使用其他 CTE，這樣可以讓 SQL Report 更加清晰易讀。
WITH list_count_for_each_user AS (
    SELECT
        user_id,
        COUNT(list_id) AS num_of_list
    FROM list
    GROUP BY user_id
),
user_with_max_num_of_list AS (
    SELECT
        user_id,
        num_of_list
    FROM list_count_for_each_user
    WHERE
        num_of_list = (
            SELECT MAX(num_of_list)
            FROM list_count_for_each_user
        )
)
SELECT
    name, email, createdAt, num_of_list
FROM user
INNER JOIN
    user_with_max_num_of_list cte
    ON user.user_id = cte.user_id;

```

```sql
WITH song_count_for_each_list AS (
    SELECT
        list_id,
        count(song_id) AS num_of_song
    FROM song
    GROUP BY list_id
)
SELECT list_id
FROM song_count_for_each_list
WHERE num_of_song >= 3;
```

## 10. INSERT
### 10.1 普通語法
```sql
INSERT INTO table (c1, c2, c3)
VALUES (v1, v2, v3);
-- 在同一個 INSERT sql 中其實也可以插入多筆資料，
-- 只要我們用逗號 (,) 去隔開每一筆的 VALUES 集就可以。
INSERT INTO table (c1, c2, c3)
VALUES
    (v11, v12, v13),
    (v21, v22, v33),
    ...
    (vn1, vn2, vn3);
```
### 10.2 INSERT INTO SELECT 語法
```sql
INSERT INTO table_name(column_list)
SELECT
    select_list
FROM
    another_table
WHERE
    condition;
```

### 10.2 INSERT INTO SELECT 語法

在閱讀 INSERT INTO SELECT 的 sql 時，我們要知道的是 SELECT 的目的是用來收集交給 INSERT 所需要的 VALUES 而寫的，它的結果往往是多筆的資料輸入。

```sql
WITH list_id_to_song_cout AS (
    SELECT
        list_id,
        COUNT(song_name) AS num_of_song
    FROM song
    GROUP BY list_id
)
INSERT OR IGNORE INTO -- 這裏加入 "OR IGNORE" 以免 sql 被 error 中斷
    list_with_song_cnt(
        list_id,
        list_name,
        user_id,
        description,
        count
    )
SELECT
    t1.list_id,
    t1.list_name,
    t1.user_id,
    t1.description,
    IFNULL(t2.num_of_song, 0) AS song_count
FROM list AS t1
LEFT JOIN
    list_id_to_song_cout AS t2
    ON t1.list_id = t2.list_id;

-- 值得注意的是，在 batch INSERT 的場景，
-- 只要有一個 INSERT record 出錯，全條 list
-- 的 INSERT 執行都會被取消。
```

## 11. UPDATE

## 11.1. 格式：
```sql
UPDATE [LOW_PRIORITY] [IGNORE] table_name
SET
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition]; -- 這裏要注意的是：一個沒有給 WHERE condition 的 UPDATE sql 是會對該 Table 的所有 record 進行 update。
```
### 11.2. 解析順序
Table > WHERE > SET

### 11.3. 一般實例
```sql
UPDATE user
SET
    createAt = datetime('now')
WHERE user_id = 1;
```
```sql
UPDATE user
SET
    name='threefishes',
    email='threefishes@sqlite.com',
    createdAt=datetime('now')
WHERE user_id=1;
```
### 11.4. REPLACE
```sql
UPDATE user
SET
    email = REPLACE(email, '@sqlite.com', '@gmail.com');
```
### 11.5. UPDATE JOIN
利用第二個表格 (TABLE) 的資料做為輔助或參考，決定如何更新本來表格中的值。
<br/>
這個功能在 Sqlite 上並不支援。
### 11.5.1. 解析順序
TABLE > JOIN TABLE > WHERE > SET 
### 11.5.2. 實例
```sql
UPDATE song
INNER JOIN
    list
    ON song.list_id = list.list_id
SET
    song.song_name = CONCAT(list.list_name, '-', song.song_name)
WHERE
    list.list_id = 0;
``` 
```sql
UPDATE list
LEFT JOIN
    song ON
    list.list_id = song.list_id
SET
    list.list_name = CONCAT('Empty - ', list.list_name)
WHERE
    song.song_name IS NULL;
```


## 12. DELETE
## 12.1. 普通語法
```sql
DELETE FROM table_name
WHERE condition;
```
```sql
DELETE FROM song
WHERE song_id = 20;
```
```sql
DELETE FROM song
ORDER BY song_name
LIMIT 3;
-- 當你在 sqlite 上執行以上的 DELETE SQL，你會獲得 syntax error。
-- 但如果你用 Sub Query 也可以獲得同樣的結果，如下：
DELETE FROM song
WHERE
    song.song_id IN (
        SELECT song.song_id
        FROM song
        ORDER BY song_name
        LIMIT 3
    );
```

## 12.2. ON DELETE CASCADE
[ user ] -> [ list ] -> [ song ]
<br/>
如上 user Table 與 list Table 的關係，list 的 record 透過 FOREIGN KEY, user_id, 去指定它所屬的 user record，但當我們 DELETE 任一在 list TABLE 擁有相連 user_id 的 user TABLE record，那麼剩下在 list TABLE 中的這些 record 就會變得沒有意義，因為它們將會是沒有所屬 user record 的 list record，為了避免這種情況，在創建 list TABLE 時我們會在指定 FOREIGN KEY 時加上 ON DELETE CASCADE 的語法，如下：
```sql
CREATE TABLE list (
    list_id INT PRIMARY KEY,
    list_name VARCHAR,
    user_id INT,
    description VARCHAR,
    FOREIGN KEY(user_id)
        REFERENCES user(user_id)
        ON DELETE CASCADE -- 這裏指定，若所屬的 user record 被 DELETE 掉，在這個 TABLE 相連的 record 也會被 DELETE
);
```
同理，若我們在 song TABLE 也做出同樣的設定 (ON DELETE CASCADE)，那麼當我們 DELETE user TABLE record 的時候，是有機會觸發另外兩個 TABLE 中的一些相連 record 被 DELETE 的。

## 12.3. DELETE JOIN
### 12.3.1 格式
```sql
DELETE FROM t1, t2
FROM t1
INNER JOIN t2 ON t1.key = t2.key
WHERE condition;
```
### 12.3.2 解析順序
TABLE > JOIN TABLE > WHERE
<br/>
要留意的是 DELETE JOIN 不能在 sqlite 上使用。

### 12.3.3 INNER JOIN 實例
```sql
DELETE list, song
FROM list
INNER JOIN song
ON list.list_id = song.list_id
WHERE list.list_id = 0;
```

### 12.3.3 LEFT JOIN 實例
```sql
DELETE list
FROM list
LEFT JOIN song
ON list.list_id = song.list_id
WHERE song.song_id IS NULL;
```

## 13. TRANSACTION
## 13.1. 基本語法
```sql
BEGIN TRANSACTION;
-- 如果在 MySQL 應該用的指令應該是：START TRANSACTION;

Update song_1
Update song_2
Update song_3

COMMIT/ROLLBACK
```

```sql
BEGIN TRANSACTION;
UPDATE song SET song_name = 'update - ' || song_name WHERE song_id = 0;
UPDATE song SET song_name = 'update - ' || song_name WHERE song_id = 1;
COMMIT;

BEGIN TRANSACTION;
UPDATE song SET song_name = 'update - ' || song_name WHERE song_id = 2;
UPDATE song SET song_id = 2 WHERE song_id = 3; -- Error: UNIQUE constraint failed: song-song_id
ROLLBACK; -- 當執行到上一隻 UPDATE SQL 的時候，因為遇到了 Error，這時我們可以用 ROLLBACK 指令，取消所有 UPDATE 指令，讓 DB 回到執行前的樣子。
```

## 14. ALTER TABLE
## 14.1. 新增 COLUMN
## 14.1.1. 基本語法
```sql
ALTER TABLE table_name
ADD [COLUMN] column_name column_definition
[FIRST|ALTER existing column];
```
## 14.1.2. 實例
```sql
ALTER TABLE user
ADD COLUMN city varchar(15) AFTER name,
ADD COLUMN updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD COLUMN bio VARCHAR(255) AFTER email;

DESCRIBE user;
```
## 14.2. 更改 COLUMN (名字/型別)
## 14.2.1. 基本語法
```sql
ALTER TABLE table_name
MODIFY COLUMN column_name column_definition
[FIRST|ALTER existing column];
```
## 14.2.2. 實例
```sql
ALTER TABLE user
MODIFY COLUMN name varchar(20);

DESCRIBE user;
```

## 14.2.3. 修改名字語法
```sql
ALTER TABLE table_name
CHANGE COLUMN original_name new_name column_definition
[FIRST|ALTER column_name];
```
## 14.2.4. 修改名字實例
```sql
ALTER TABLE user
CHANGE COLUMN name user_name varchar(20);

DESCRIBE user;
```

## 14.3. 丟棄 COLUMN
## 14.3.1. 基本語法
```sql
ALTER TABLE table_name
DROP [COLUMN] column_name;
```
## 14.3.2. 實例
```sql
ALTER TABLE user
DROP COLUMN updatedAt;

DESCRIBE user;
```
## 14.4. 改 TABLE 名字
## 14.4.1. 基本語法
```sql
ALTER TABLE table_name
RENAME TO new_table_name;
```
## 14.4.2. 實例
```sql
ALTER TABLE user
RENAME TO user_info;

DESCRIBE user_info;
```
## 14.5 差異
|   | MySQL | SQLite |
| --- | --- | --- |
| Rename Table | ✓ | ✓ |
| Rename Column | ✓ | ✓ |
| Add Column | ✓ | ✓ / ✗ if column is Primary Key nor Unique |
| Modify Column | ✓ | ✗ |
| Drop Column | ✓ | ✗ |

由上表可見，在 SQLite 上有一些操作是不支援的，例如更改或刪除 Column。解決方法如下：
1. 創建一個新的 Table，而這個 Table 的 Column 應該要符合你想要改的要求
2. 把舊 Table 的資料複製過到新 Table
3. 刪除舊 Table
4. 把新 Table 的名稱改成舊 Table 的名稱
注意！為免上述一連串的指令中途有失敗，我們應該把它們都放在 TRANSACTION 裡面執行。

## 15. 其他常用 SQL 工具指令
```sql
pragma table_info('table_name'); -- 在 Sqlite 上列出 Table 的所有欄目及其型別
Describe table_name; -- 在 MySQL 上列出 Table 的所有欄目及其型別
SHOW TABLES;
DELETE FROM table; -- 刪除 Table 內所有 record
```