-- Original complex query with WHERE and AND
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name,
    p.property_id,
    p.name AS property_name,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2023-01-01' AND p.name IS NOT NULL;

-- Optimized version with same filter
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.total_price,
    u.first_name || ' ' || u.last_name AS user_name,
    p.name AS property_name,
    pay.amount
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id
WHERE b.start_date >= '2023-01-01' AND p.name IS NOT NULL;
