## 7. Subquery

### 7.1. 解析順序
以最深層的 Query 為先，再一層一層往外解讀：<br/>
Inner Query > Top Query

### 7.2. COMPARISION 範例 

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

### 7.3. FROM DERIVED TABLE

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

### 7.4. WHERE IN/NOT IN

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

### 7.5. CORRELATED SUBQUERY

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