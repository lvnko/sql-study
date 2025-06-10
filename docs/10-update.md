## 10. UPDATE

### 10.1. 格式
```sql
UPDATE [LOW_PRIORITY] [IGNORE] table_name
SET
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition]; -- 這裏要注意的是：一個沒有給 WHERE condition 的 UPDATE sql 是會對該 Table 的所有 record 進行 update。
```
### 10.2. 解析順序
Table > WHERE > SET

### 10.3. 一般實例
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
### 10.4. REPLACE
```sql
UPDATE user
SET
    email = REPLACE(email, '@sqlite.com', '@gmail.com');
```
### 10.5. UPDATE JOIN
利用第二個表格 (TABLE) 的資料做為輔助或參考，決定如何更新本來表格中的值。
<br/>
這個功能在 Sqlite 上並不支援。

#### 10.5.1. 解析順序
TABLE > JOIN TABLE > WHERE > SET 

#### 10.5.2. 實例
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