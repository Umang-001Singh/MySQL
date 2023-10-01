use temp;

select * from customer;

insert into customer
values(1252, 'Ram Kumar Singh', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

create table Order_details (
	Order_id int primary key,
    delivery_date date,
    cust_id int, 
    foreign key(cust_id) references customer(id) on update cascade on delete cascade
    );
    
    insert into order_details 
    values(1, '2019-03-11', 246);
    
insert into order_details
values(2, '2019-04-25', 500);

select * from Order_details;

update customer set pincode = null where id = 210;

update customer set id = 246 where id = 245;

-- switiching safe updates off;
set sql_safe_updates = 0;

-- updating multiple rows at once requires safe updates to be off;
update customer set pincode = null;

set sql_safe_updates = 1;

-- deleting from customer will automatically delete from order_details;
delete from customer where id = 500;

insert into customer
values(500, 'Rohan Arora', 'Ashok Nagar', 'M', 'Jalandhar', 140051);

-- update will just update, if row is not present, it will do nothing, whereas REPLACE will create the row if it is not present;
replace into customer(id, cname, addresss, gender, city, pincode) values(501, 'Ram Singh', 'Dilbagh Nagar', 'M', 'Jalandhar', 140051);

alter table customer change column addresss address varchar(255); 

replace into customer(id, cname, address, gender, city, pincode) values(502, 'Umang Singh', "Ragnagar", "M", "Patna", 801503);

alter table customer add phone int not null;

alter table customer modify phone varchar(255);

update customer set phone = '7667783560' where id = 502;

replace into customer 
values( 505, 'Gaurav Singh', "Rajnagar", "M", "Patna", 801503, "7033840652");

replace into customer(id, cname, address)
values(504, 'Mark', 'Dallas');

-- if primary key is already present, then REPLACE will replace that primary key values.
replace into customer(id, cname, address, gender, city, pincode, phone)
values(504, 'Neelam Singh', 'Rajnagar', "F", 'Patna', 801503, 9431417474);

replace into customer(id, cname, address, gender, city, pincode, phone)
values(502, 'Umang Singh', "Rajnagar", "M", "Patna", 801503, 7667783560);
