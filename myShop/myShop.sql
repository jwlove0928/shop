create database myShop;

create table Product (
id varchar(20) not null primary key,
title varchar(20) not null,
content varchar(50),
price varchar(10)
);