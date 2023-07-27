create table member(
member_id varchar(20) PRIMARY KEY,
member_password varchar(64),
member_name varchar(20)
);

create table card(
card_id int PRIMARY KEY,
card_company_name varchar(64),
card_employee varchar(20),
card_phone varchar(11),
card_email varchar(64),
card_memo varchar(128),
card_file_name varchar(45),
card_register_date datetime,
card_view_count int,
card_ip varchar(32),
card_member_id varchar(20),
CONSTRAINT con1 FOREIGN KEY (card_member_id) REFERENCES member(member_id)
);
