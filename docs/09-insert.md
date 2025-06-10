[回到概覽](overview.md) | [上一章](08-cte.md) | [下一章](10-update.md)

## 9. INSERT
### 9.1. 普通語法
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

### 9.2. INSERT INTO SELECT 語法

```sql
INSERT INTO table_name(column_list)
SELECT
    select_list
FROM
    another_table
WHERE
    condition;
```

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
