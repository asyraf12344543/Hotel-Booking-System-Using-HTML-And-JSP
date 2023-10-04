create table ReserveDetails(
Reserve_ID varchar(12) not null,
No_Of_Adult number not null,
No_Of_Children number not null,
Reserve_Date varchar2(10), 
Checkin_Date varchar2(10) NOT NULL,
Checkout_Date varchar2(10) NOT NULL, 
Reserve_Time varchar(5) not null,
Special_Req varchar(300));

create table RoomDet(
Reserve_ID varchar(12) not null,
Room_No varchar(8) not null,
Price number not null,
Bed_Qty number not null,
Availability varchar(3) not null,
Description varchar(300));

create table Hotel_Employee(
job_ID varchar2 (6) NOT NULL,
ID varchar2 (20) NOT NULL,
firstname varchar2 (50),
lastname varchar2 (50) NOT NULL,
gender varchar2 (50),
phone_num varchar2 (50) NOT NULL,
address varchar2 (50) NOT NULL,
email varchar2 (50),
vacc_type varchar2 (50) NOT NULL,
vacc_first varchar2 (10) NOT NULL,
vacc_second varchar2 (10) NOT NULL,
hire_date varchar2 (10) NOT NULL,
salary number NOT NULL,
password1 varchar2 (8)
);

create table items(
item_id varchar2(10)not null,
item_name varchar2(50),
item_price varchar2(10),
  PRIMARY KEY (item_id));

create table payment(
bill_no number GENERATED BY DEFAULT ON NULL AS IDENTITY,
reserve_id varchar2(10),
guest_id varchar2(10),
item_id1 varchar2(10),
item_id2 varchar2(10),
item_id3 varchar2(10),
discount varchar2(10),
payment_date date,
payment_mode varchar2(50),
PRIMARY KEY (bill_no),
total_payment varchar2(15));


CREATE TABLE GUEST(

    first_name      varchar2(50),
    last_name       varchar2(50),
    ic_no           number(30),
    passport_no     number(30),
    address         varchar2(100),
    email           varchar2(50),
    mobile_no       number(30),
    guest_id        number(30));

drop table reservedetails cascade constraints;
drop table roomdet cascade constraints;
drop table items cascade constraints;
drop table payment cascade constraints;
drop table guest cascade constraints;
drop table Hotel_Employee cascade constraints;