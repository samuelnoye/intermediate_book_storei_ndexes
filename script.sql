SELECT * FROM customers
LIMIT 10;
SELECT * FROM orders
LIMIT 10;
SELECT * FROM books
LIMIT 10;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';
SELECT *
FROM pg_Indexes
WHERE tablename = 'orders';
SELECT *
FROM pg_Indexes
WHERE tablename = 'books';

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity > 18;

CREATE INDEX customer_id_quantity_idx ON orders (customer_id, quantity);

EXPLAIN ANALYZE SELECT customer_id, quantity FROM orders
WHERE quantity > 18;

ALTER TABLE customers ADD PRIMARY KEY (customer_id);

EXPLAIN ANALYZE SELECT * FROM customers 
WHERE customer_id < 100;

CREATE INDEX customer_id_idx on customers(customer_id)
WHERE customer_id < 100;

EXPLAIN ANALYZE SELECT * FROM customers 
WHERE customer_id < 100;

SELECT *
FROM pg_Indexes
WHERE tablename = 'customers';

CLUSTER customers USING customers_pkey;

CREATE INDEX customer_id_book_id_idx 
ON orders(customer_id, book_id);

DROP INDEX IF EXISTS customer_id_book_id_idx;

CREATE INDEX customer_id_book_id_quantity_idx 
ON orders(customer_id, book_id, quantity);

CREATE INDEX author_title_idx 
ON books(author, title);

EXPLAIN ANALYZE SELECT * FROM orders
WHERE (quantity * price_base) > 100;

CREATE INDEX quantity_price_base_idx ON orders ((quantity * price_base));

EXPLAIN ANALYZE SELECT * FROM orders
WHERE (quantity * price_base) > 100;
/*Execution time reduced from 32ms to 14ms hence it was faster to create an index*/
