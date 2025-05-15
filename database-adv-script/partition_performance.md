# Partition Performance Report

## Objective
To improve query performance on the `Booking` table by partitioning it based on the `start_date` column.

## What Was Done
- Partitioned the `Booking` table using PostgreSQL's `RANGE` partitioning feature.
- Created partitions for years 2022, 2023, and 2024.
- Migrated data from the old table to the partitioned structure.

## Performance Comparison
Using `EXPLAIN ANALYZE`, we observed the following:

- **Before Partitioning**: Full table scan was done for date-based queries.
- **After Partitioning**: Query planner only scanned relevant partition(s), significantly reducing query time.

## Conclusion
Partitioning by `start_date` led to improved performance for date-range queries on large datasets.
