drop database if exists mountaineering;
create database mountaineering;
use mountaineering;

create table country (
	id int not null primary key auto_increment,
    name varchar(30) not null unique
);

create table region (
	id int not null primary key auto_increment,
    name varchar(30) not null,
    country_id int not null
);

create table sponsor (
	id int not null primary key auto_increment,
    name varchar(30) not null,
    country_id int not null
);

alter table region add foreign key (country_id)
	references country(id);
    
alter table sponsor add foreign key (country_id)
	references country(id);
    
create table mountain_range (
	id int not null primary key auto_increment,
    name varchar(50) not null,
    region_id int not null
);

alter table mountain_range add foreign key (region_id)
	references region(id);

create table mountain_type (
	id int not null primary key auto_increment,
    name varchar(15) not null unique,
    description text
);

create table mountaineer (
	id int not null primary key auto_increment,
    first_name varchar(30) not null,
    last_name varchar(40) not null,
    country_id int not null,
    sponsor_id int not null,
    mountain_id int not null
);

create table mountain (
	id int not null primary key auto_increment,
    name varchar(30) not null,
    altitide int not null,
    description text,
    mountain_range_id int not null,
    mountain_type_id int not null,
    mountaineer_id int not null    
);

alter table mountaineer add foreign key (country_id)
	references country(id);
    
alter table mountaineer add foreign key (sponsor_id)
	references sponsor(id);
    
alter table mountaineer add foreign key (mountain_id)
	references mountain(id);
    
alter table mountain add foreign key (mountain_range_id)
	references mountain_range(id);

alter table mountain add foreign key (mountain_type_id)
	references mountain_type(id);

alter table mountain add foreign key (mountaineer_id)
	references mountaineer(id);








