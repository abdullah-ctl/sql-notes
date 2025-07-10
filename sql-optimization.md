# SQL query optimization

Optimizing SQL queries is essential for performance, especially as your database grows. Here's a **step-by-step guide** with practical tips to help you optimize SQL queries effectively:

---

## ✅ 1. **Use `EXPLAIN` or `EXPLAIN ANALYZE`**

* Understand how the query is executed (table scan, index use, etc.).

```sql
EXPLAIN SELECT * FROM users WHERE email = 'test@example.com';
```

---

## ✅ 2. **Use Proper Indexing**

* Index columns used in `WHERE`, `JOIN`, `ORDER BY`, and `GROUP BY`.

**Examples:**

```sql
-- Index for faster lookup
CREATE INDEX idx_users_email ON users(email);

-- Composite index for multiple columns
CREATE INDEX idx_orders_user_status ON orders(user_id, status);
```

**Tip:** Avoid indexing columns with high cardinality **and** frequent updates unless necessary.

---

## ✅ 3. **Avoid SELECT \*\*\* (Only select the columns you need)**

```sql
-- Bad
SELECT * FROM users;

-- Good
SELECT id, name, email FROM users;
```

---

## ✅ 4. **Avoid N+1 Query Problem**

* **Laravel Example**: Use `with()` to eager load relationships.

```php
// Bad
foreach ($posts as $post) {
    echo $post->user->name;
}

// Good
$posts = Post::with('user')->get();
```

---

## ✅ 5. **Use `LIMIT` for Large Data Queries**

```sql
SELECT * FROM logs ORDER BY created_at DESC LIMIT 100;
```

---

## ✅ 6. **Avoid Functions on Indexed Columns in WHERE**

```sql
-- Bad (index won't be used)
WHERE DATE(created_at) = '2024-07-10'

-- Good (uses index)
WHERE created_at >= '2024-07-10 00:00:00' AND created_at < '2024-07-11 00:00:00'
```

---

## ✅ 7. **Use Joins Instead of Subqueries (when applicable)**

```sql
-- Bad (correlated subquery)
SELECT name FROM users WHERE id IN (SELECT user_id FROM orders);

-- Good
SELECT u.name FROM users u JOIN orders o ON u.id = o.user_id;
```

---

## ✅ 8. **Use EXISTS Instead of IN (for large subqueries)**

```sql
-- Faster
SELECT name FROM users u
WHERE EXISTS (
    SELECT 1 FROM orders o WHERE o.user_id = u.id
);
```

---

## ✅ 9. **Archive or Partition Large Tables**

* Split large tables (e.g., logs, events) by month/year or user.
* Use **table partitioning** or move old data to archive tables.

---

## ✅ 10. **Use Caching for Expensive Queries**

* Use Redis, Memcached, or application-layer caching.
* Laravel: `Cache::remember('top_users', 60, fn() => DB::table('users')->where(...)->get());`

---

## ✅ Bonus Tips

* Avoid `OR` when possible; use `UNION` or break into multiple queries.
* Watch for implicit data type conversion (`WHERE user_id = '123'` vs `123`).
* Use covering indexes when needed (all selected columns are in the index).
* Use pagination (`LIMIT`, `OFFSET`) wisely; for deep pagination, consider cursor-based approach.
