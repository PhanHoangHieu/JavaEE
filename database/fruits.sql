create database fruits;
use fruits;
SELECT * FROM roles;
insert into roles(code,name) values('ADMIN','ADMIN');
insert into roles(code,name) values('USER','USER');
CREATE TABLE roles(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

create table users(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  username VARCHAR(150) NOT NULL,
  password VARCHAR(150) NOT NULL,
  fullname VARCHAR(150) NULL,
  photo	VARCHAR(150),
  email VARCHAR(150),
  activated int,
  -- activated == 1 đã activated  --
  -- activated == 0 chưa activated  --
  roleid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);
ALTER TABLE users ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES roles(id);

CREATE TABLE categories (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  code VARCHAR(255) NOT NULL,
  image VARCHAR(255) Null,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

create table products(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  name VARCHAR(255) NOT NULL,
  unitprice double NOT NULL,
  image VARCHAR(255) NOT NULL,
  available bit,
  -- available == 1  đã  available --
  -- available == 0 chưa available --
  quantity int not null,
  description text not null,
  discount double not null,
  viewcount int not null,
  special bit not null,
  -- special == 1  sản phẩm   special --
  -- special == 0 không phải sp special --
  status bit not null,
  -- status == 1  sản phẩm còn hạn sử dụng --
  -- status == 0 sản phẩm hết hạn sử dụng --
  categoryid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE products ADD CONSTRAINT fk_category_product FOREIGN KEY (categoryid) REFERENCES categories(id);

create table orders(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  address VARCHAR(255) NOT NULL,
  amount double not null,
  description text not null,
  approve bit not null,
  -- approve == 1  đơn hàng đã được duyệt  --
  -- approve == 0 đơn hàng chưa được duyệt   --
  status bit not null,
  -- status == 1  đã giao hàng --
  -- status == 0 chưa giao hàng --
  userid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE orders ADD CONSTRAINT fk_user_order  FOREIGN KEY (userid) REFERENCES users(id);

create table orderDetails( 
  id bigint NOT NULL PRIMARY KEY auto_increment,
  unitprice double not null,
  quantity int not null,
  discount double not null,
  orderid bigint NOT NULL,
  productid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE orderDetails ADD CONSTRAINT fk_orderDetail_order  FOREIGN KEY (orderid) REFERENCES orders(id);
ALTER TABLE orderDetails ADD CONSTRAINT fk_orderDetail_product FOREIGN KEY (productid) REFERENCES products(id);

create table comments (
  id bigint NOT NULL PRIMARY KEY auto_increment,
  content text not null,
  userid bigint NOT NULL,
  productid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE comments ADD CONSTRAINT fk_comment_user  FOREIGN KEY (userid) REFERENCES users(id);
ALTER TABLE comments ADD CONSTRAINT fk_comment_product FOREIGN KEY (productid) REFERENCES products(id);

create table ratings(
  id bigint NOT NULL PRIMARY KEY auto_increment,
  star int not null,
  userid bigint NOT NULL,
  productid bigint NOT NULL,
  createddate TIMESTAMP NULL,
  modifieddate TIMESTAMP NULL,
  createdby VARCHAR(255) NULL,
  modifiedby VARCHAR(255) NULL
);

ALTER TABLE ratings ADD CONSTRAINT fk_rating_user  FOREIGN KEY (userid) REFERENCES users(id);
ALTER TABLE ratings ADD CONSTRAINT fk_rating_product FOREIGN KEY (productid) REFERENCES products(id);