CREATE DATABASE product_catalog;
USE product_catalog;

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    category VARCHAR(255),
    image VARCHAR(255) -- Store image URL or path
);

INSERT INTO products (name, description, price, category, image) VALUES
('Laptop', 'High-performance laptop', 999.99, 'Electronics', 'laptop.jpg'),
('Smartphone', 'Latest smartphone model', 699.99, 'Electronics', 'phone.jpg'),
('T-shirt', 'Cotton T-shirt', 19.99, 'Clothing', 'tshirt.jpg'),
('Sneakers', 'Running shoes', 59.99, 'Footwear', 'shoes.jpg');
