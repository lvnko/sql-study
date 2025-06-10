[回到概覽](overview.md) | [上一章](05-alias.md) | [下一章](07-subquery.md)

## 6. JOIN

### 6.1. 解析順序
- FROM > INNER JOIN > JOIN CONDITION > SELECT
- FROM > LEFT JOIN > JOIN CONDITION > SELECT
- FROM > RIGHT JOIN > JOIN CONDITION > SELECT

### 6.2 INNER JOIN

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

### 6.3 LEFT JOIN

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

### 6.4 SELF JOIN
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
