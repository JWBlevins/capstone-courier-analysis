-- Drop old tables if needed
DROP TABLE IF EXISTS courier_data;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS product;

-- Create new tables
CREATE TABLE customer (
    customer_ID INTEGER PRIMARY KEY,
    gender TEXT,
    customer_care_calls INTEGER,
    customer_rating INTEGER

);

-- Product table
CREATE TABLE product (
    product_ID INTEGER PRIMARY KEY,
    product_importance TEXT,
    cost_of_the_product INTEGER,
    weight_in_gms INTEGER,
    prior_purchases INTEGER
);

-- Courier data (fact table)
CREATE TABLE courier_data (
    ID INTEGER PRIMARY KEY,
    observation_date TIMESTAMP,
    customer_ID INTEGER,
    product_ID INTEGER,
    warehouse_block TEXT,
    mode_of_shipment TEXT,
    discount_offered INTEGER,
    late_indicator INTEGER,
    FOREIGN KEY (customer_ID) REFERENCES customer(customer_ID),
    FOREIGN KEY (product_ID) REFERENCES product(product_ID)
);

-- freight_tsi

CREATE TABLE freight_tsi (
    observation_date TIMESTAMP PRIMARY KEY,
    TSIFRGHT REAL
);