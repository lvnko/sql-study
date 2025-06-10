## 5. COLUMN ALIAS 與 TABLE ALIAS 的用法

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