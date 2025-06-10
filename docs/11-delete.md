[回到概覽](overview.md) | [上一章](10-update.md) | [下一章](12-transaction.md)

## 11. DELETE
### 11.1. 普通語法
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

### 11.2. ON DELETE CASCADE
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

### 11.3. DELETE JOIN
#### 11.3.1. 格式
```sql
DELETE FROM t1, t2
FROM t1
INNER JOIN t2 ON t1.key = t2.key
WHERE condition;
```
#### 11.3.2. 解析順序
TABLE > JOIN TABLE > WHERE
<br/>
要留意的是 DELETE JOIN 不能在 sqlite 上使用。

#### 11.3.3. INNER JOIN 實例
```sql
DELETE list, song
FROM list
INNER JOIN song
ON list.list_id = song.list_id
WHERE list.list_id = 0;
```

#### 11.3.4. LEFT JOIN 實例
```sql
DELETE list
FROM list
LEFT JOIN song
ON list.list_id = song.list_id
WHERE song.song_id IS NULL;
```
