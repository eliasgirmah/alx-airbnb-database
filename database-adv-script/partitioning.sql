-- Rename original Booking table
ALTER TABLE Booking RENAME TO Booking_old;

-- Create new partitioned Booking table
CREATE TABLE Booking (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    total_price DECIMAL
) PARTITION BY RANGE (start_date);

-- Create partitions by year
CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Copy data from old table
INSERT INTO Booking (booking_id, user_id, property_id, start_date, end_date, total_price)
SELECT booking_id, user_id, property_id, start_date, end_date, total_price
FROM Booking_old;

-- (Optional) Drop old table after verifying
-- DROP TABLE Booking_old;
