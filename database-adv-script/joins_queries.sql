-- INNER JOIN: Retrieve all bookings and the respective users who made those bookings
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    u.user_id,
    u.first_name,
    u.last_name
FROM 
    Booking b
INNER JOIN 
    "User" u ON b.user_id = u.user_id;

-- LEFT JOIN: Retrieve all properties and their reviews, including properties without reviews, ordered by property name
SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment
FROM 
    Property p
LEFT JOIN 
    Review r ON p.property_id = r.property_id
ORDER BY 
    p.name;  -- This will order the properties by their name

-- FULL OUTER JOIN: Retrieve all users and all bookings, even if unmatched
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.total_price
FROM 
    "User" u
FULL OUTER JOIN 
    Booking b ON u.user_id = b.user_id;
