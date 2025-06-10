[回到概覽](overview.md) | [上一章](12-transaction.md)

## 13. ALTER TABLE
### 13.1. 新增 COLUMN
#### 13.1.1. 基本語法
```sql
ALTER TABLE table_name
ADD [COLUMN] column_name column_definition
[FIRST|ALTER existing column];
```
#### 13.1.2. 實例
```sql
ALTER TABLE user
ADD COLUMN city varchar(15) AFTER name,
ADD COLUMN updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
ADD COLUMN bio VARCHAR(255) AFTER email;

DESCRIBE user;
```
### 13.2. 更改 COLUMN (名字/型別)
#### 13.2.1. 基本語法
```sql
ALTER TABLE table_name
MODIFY COLUMN column_name column_definition
[FIRST|ALTER existing column];
```
#### 13.2.2. 實例
```sql
ALTER TABLE user
MODIFY COLUMN name varchar(20);

DESCRIBE user;
```

#### 13.2.3. 修改名字語法
```sql
ALTER TABLE table_name
CHANGE COLUMN original_name new_name column_definition
[FIRST|ALTER column_name];
```
#### 13.2.4. 修改名字實例
```sql
ALTER TABLE user
CHANGE COLUMN name user_name varchar(20);

DESCRIBE user;
```

### 13.3. 丟棄 COLUMN
#### 13.3.1. 基本語法
```sql
ALTER TABLE table_name
DROP [COLUMN] column_name;
```
#### 13.3.2. 實例
```sql
ALTER TABLE user
DROP COLUMN updatedAt;

DESCRIBE user;
```
### 13.4. 改 TABLE 名字
#### 13.4.1. 基本語法
```sql
ALTER TABLE table_name
RENAME TO new_table_name;
```
#### 13.4.2. 實例
```sql
ALTER TABLE user
RENAME TO user_info;

DESCRIBE user_info;
```
### 13.5. 差異
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
