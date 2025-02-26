# E-Commerce Website

## Setup Instructions

1. Clone the repository:
    ```sh
    git clone <repository_url>
    ```

2. Import the project into your favorite IDE as a Maven project.

3. Create a MySQL database and import the provided schema:
    ```sql
    CREATE DATABASE ecommerce;

    USE ecommerce;

    CREATE TABLE users (
        id INT AUTO_INCREMENT PRIMARY KEY,
        username VARCHAR(50) NOT NULL UNIQUE,
        password VARCHAR(50) NOT NULL,
        email VARCHAR(100) NOT NULL UNIQUE
    );

    CREATE TABLE products (
        id INT AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(100) NOT NULL,
        price DOUBLE NOT NULL,
        description TEXT NOT NULL,
        imageUrl VARCHAR(255) NOT NULL
    );
    ```

4. Update the database connection settings in `Database.java`:
    ```java
    private static final String URL = "jdbc:mysql://localhost:3306/ecommerce";
    private static final String USER = "root";
    private static final String PASSWORD = "your_database_password";
    ```

5. Build the project using Maven:
    ```sh
    mvn clean install
    ```

6. Deploy the generated WAR file to your favorite servlet container (e.g., Apache Tomcat).

7. Access the application in your web browser:
    ```
    http://localhost:8080/ecommerce
    ```

## Features

- User Registration and Login
- View Products
- Add Products to Cart
- Add Products to Wishlist
- View Cart
- View Wishlist
