/*  Таблица Customers */
CREATE TABLE customers (
    id INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    timestamp TIMESTAMP NOT NULL,
    delivery_address TEXT NOT NULL
);

/* Таблица Products */
CREATE TABLE products (
    id VARCHAR(255) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    price DOUBLE PRECISION NOT NULL CHECK (price > 0)
);

/* Таблица Orders. */
CREATE TABLE orders (
    code INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_sum DOUBLE PRECISION NOT NULL CHECK (total_sum > 0),
    is_paid BOOLEAN NOT NULL,
    CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(id)
);

/* Таблица Order_items */
CREATE TABLE order_items (
    order_code INT NOT NULL,
    product_id VARCHAR(255) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    CONSTRAINT fk_items_order FOREIGN KEY (order_code) REFERENCES orders(code),
    CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(id)
);

