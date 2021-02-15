DROP DATABASE IF EXISTS app_ventas;
CREATE DATABASE IF NOT EXISTS app_ventas;

USE app_ventas;

DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users
(
    id int AUTO_INCREMENT primary key not null,
    name varchar(50) not null,
    user varchar(25) not null,
    pass varchar(255) not null,
    role enum('ADMIN','VENDEDOR') DEFAULT 'VENDEDOR',
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users
ADD CONSTRAINT UQ_user UNIQUE(user);



DROP TABLE IF EXISTS clients;
CREATE TABLE IF NOT EXISTS clients
(
    id int AUTO_INCREMENT primary key not null,
    name varchar(50) not null,
    phone varchar(20) default null,
    dni varchar(20) not null,
    id_user int  NOT NULL,
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP

);

ALTER TABLE clients
ADD CONSTRAINT `UQ_dni` UNIQUE(dni),
ADD CONSTRAINT `Fk_clients_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);



DROP TABLE IF EXISTS providers;
CREATE TABLE IF NOT EXISTS providers
(
    id int AUTO_INCREMENT primary key not null,
    name varchar(50) not null,
    phone varchar(20) default null,
    dni varchar(20) not null,
    id_user int  NOT NULL,
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE providers
ADD CONSTRAINT `UQ_name` UNIQUE(name),
ADD CONSTRAINT `Fk_providers_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);



DROP TABLE IF EXISTS products;
CREATE TABLE IF NOT EXISTS products
(
    id int AUTO_INCREMENT primary key not null,
    code varchar(25) not null,
    description varchar(50) default null,
    price float not null,
    cost float not null,
    stock int not null,
    id_user int NOT NULL,
    id_provider int  NOT NULL,
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE products
ADD CONSTRAINT `UQ_code` UNIQUE(code),
ADD CONSTRAINT `Fk_products_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
ADD CONSTRAINT `Fk_products_provider` FOREIGN KEY (`id_provider`) REFERENCES `providers` (`id`);


DROP TABLE IF EXISTS sales;
CREATE TABLE IF NOT EXISTS sales
(
    id int AUTO_INCREMENT primary key not null,
    id_client int not null,
    id_product int not null,
    id_user int not null,
    price_by_unit float not null,
    cand float not null,
    total float not null,
    sale_number int not null,
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP
    
);

ALTER TABLE sales
ADD CONSTRAINT `UQ_sale_number` UNIQUE(sale_number),
ADD CONSTRAINT `Fk_sale_client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
ADD CONSTRAINT `Fk_sale_product` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
ADD CONSTRAINT `Fk_sale_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

DROP TABLE IF EXISTS saleHeaders;
CREATE TABLE IF NOT EXISTS saleHeaders
(
    id int AUTO_INCREMENT primary key not null,
    id_client int not null,
    id_user int not null,
    total float not null,
    sale_number int NOT NULL,
    create_at datetime DEFAULT CURRENT_TIMESTAMP,
    edited_at datetime DEFAULT CURRENT_TIMESTAMP
    
);

ALTER TABLE saleHeaders
ADD CONSTRAINT `UQ_sale_number` UNIQUE(sale_number),
ADD CONSTRAINT `Fk_saleHeader_client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
ADD CONSTRAINT `Fk_saleHeader_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
ADD CONSTRAINT `Fk_saleHeader_saleNumber` FOREIGN KEY (`sale_number`) REFERENCES `sales` (`sale_number`);






