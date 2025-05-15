
md
Copy
Edit
# Index Performance Report

## 1. Before Adding Indexes

**Query:**
```sql
SELECT * FROM Booking WHERE user_id = 5;
Execution Plan:

nginx
Copy
Edit
Seq Scan on Booking  (cost=0.00..128.00 rows=5 width=...)
A sequential scan was used — slow for large datasets.

2. After Adding Indexes
Query:

sql
Copy
Edit
SELECT * FROM Booking WHERE user_id = 5;
Execution Plan:

arduino
Copy
Edit
Index Scan using idx_booking_user_id on Booking  (cost=0.14..8.20 rows=5 width=...)