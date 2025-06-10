[回到概覽](overview.md) | [上一章](07-subquery.md) | [下一章](09-insert.md)

## 8. CTE - Common Table Expression
### 8.1. 解析順序
CTE > CTE .... CTE > SELECT/INSERT/UPDATE/DELETE/CREATE
### 8.2. 實際例子
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
