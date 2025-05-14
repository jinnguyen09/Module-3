
-- Tài khoản người dùng
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    role ENUM('customer', 'admin') DEFAULT 'customer',
    avatar_url VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Nhân viên
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    full_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    position VARCHAR(50),
    salary DECIMAL(12,2),
    working_shift ENUM('morning', 'evening', 'full_day'),
    hired_date DATE
);

-- Bàn ăn
CREATE TABLE tables (
    table_id INT PRIMARY KEY AUTO_INCREMENT,
    table_name VARCHAR(50),
    capacity INT,
    location VARCHAR(100),
    is_vip BOOLEAN DEFAULT FALSE,
    status ENUM('available', 'reserved', 'maintenance') DEFAULT 'available'
);

-- Món ăn
CREATE TABLE menu_items (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT,
    price DECIMAL(10,2),
    category VARCHAR(50),
    image_url VARCHAR(255),
    is_available BOOLEAN DEFAULT TRUE
);

-- Đặt bàn
CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    table_id INT,
    reservation_time DATETIME,
    number_of_people INT,
    note TEXT,
    status ENUM('pending', 'confirmed', 'cancelled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (table_id) REFERENCES tables(table_id)
);

-- Món được chọn trong lúc đặt bàn
CREATE TABLE reservation_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT,
    item_id INT,
    quantity INT,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Đánh giá
CREATE TABLE reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    content TEXT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    is_approved BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Hóa đơn / thanh toán
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    reservation_id INT,
    total_amount DECIMAL(12,2),
    payment_method ENUM('cash', 'credit_card', 'e_wallet'),
    payment_status ENUM('paid', 'unpaid') DEFAULT 'unpaid',
    paid_at TIMESTAMP NULL,
    FOREIGN KEY (reservation_id) REFERENCES reservations(reservation_id)
);

-- Khuyến mãi
CREATE TABLE promotions (
    promo_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    description TEXT,
    discount_percent INT CHECK (discount_percent BETWEEN 1 AND 100),
    valid_from DATE,
    valid_to DATE,
    active BOOLEAN DEFAULT TRUE
);

-- Áp dụng khuyến mãi cho món ăn
CREATE TABLE promo_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    promo_id INT,
    item_id INT,
    FOREIGN KEY (promo_id) REFERENCES promotions(promo_id),
    FOREIGN KEY (item_id) REFERENCES menu_items(item_id)
);

-- Thông báo gửi đến người dùng
CREATE TABLE notifications (
    notify_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    title VARCHAR(100),
    content TEXT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);
