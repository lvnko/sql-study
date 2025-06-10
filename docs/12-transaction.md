## 12. TRANSACTION
### 12.1. 基本語法
```sql
BEGIN TRANSACTION;
-- 如果在 MySQL 應該用的指令應該是：START TRANSACTION;

Update song_1
Update song_2
Update song_3

COMMIT/ROLLBACK
```
### 12.2. 實例
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