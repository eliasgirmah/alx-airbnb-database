-- Index on User ID (commonly used in joins)
CREATE INDEX idx_user_user_id ON "User" (user_id);

-- Index on Booking's user_id and property_id
CREATE INDEX idx_booking_user_id ON Booking (user_id);
CREATE INDEX idx_booking_property_id ON Booking (property_id);

-- Index on Booking start_date for filtering/sorting
CREATE INDEX idx_booking_start_date ON Booking (start_date);

-- Index on Property ID and name
CREATE INDEX idx_property_property_id ON Property (property_id);
CREATE INDEX idx_property_name ON Property (name);
