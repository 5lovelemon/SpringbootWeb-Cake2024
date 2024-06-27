--建立用戶
CREATE TABLE user (
    userid SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(10) NOT NULL,
    birthday DATE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--建立 蛋糕商品
CREATE TABLE product (
    cakeid SERIAL PRIMARY KEY,
    cakename VARCHAR(100) NOT NULL,
    cakeprice INT NOT NULL,
    cakeimage VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

--訂單 # 因order在mysql是關鍵字，所以要加上反引號" ` "
CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    userid INT NOT NULL,
    cakeid INT NOT NULL,
    quantity INT NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    total_price INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (userid) REFERENCES user (userid),
    FOREIGN KEY (cakeid) REFERENCES cake (cakeid)
);

--付款
CREATE TABLE payment (
    paymentid SERIAL PRIMARY KEY,
    orderid INT NOT NULL,
    payment_method VARCHAR(50) NOT NULL,
    amount INT NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_time TIMESTAMP,
    transaction_id VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (orderid) REFERENCES order (orderid)
);