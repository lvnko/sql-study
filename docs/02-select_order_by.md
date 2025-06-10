[回到概覽](overview.md) | [上一章](01-basic_usage.md) | [下一章](03-select_where.md)

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
