-- BEFORE adding index (simulated for documentation purposes)
-- Run this before creating the index
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 5;

-- Create indexes
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);
CREATE INDEX idx_property_property_id ON Property (property_id);
CREATE INDEX idx_property_name ON Property (name);
CREATE INDEX idx_booking_start_date ON Booking (start_date);
CREATE INDEX idx_user_user_id ON "User" (user_id);

-- AFTER adding index
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 5;
