create table mem(id int(10) not null auto_increment, memid varchar(100) not null, mname varchar(50) not null, maddress varchar(100) not null, mcontact varchar(10) not null, memail varchar(40) not null, mcity varchar(30) not null, memtyp varchar(15) not null,superviser_name varchar(50) not null,superviser_emailid varchar(40) not null,mdoj   timestamp not null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, mdeleted varchar(1) default "n",mcount int(10) default 0,mReturn int(11) default 0,mPending int(11) default 0, primary key(id));

insert into mem values(1,'ATCMEM1','Aditya Narang','Vikas Vihar','9911328263','aditya@americantower.com','Dwarka','Permanent','Aman Malhotra','aman@americantower.com','2008-01-01 00:00:01','n',0,0,0);

insert into mem values(2,'ATCMEM2','Aayushi Singh','Sikandar Pur','8146582353','aayushi@americantower.com','Mumbai','Permanent','Aakash Singh','aakashsingh@americantower.com','2008-01-01 00:00:01','n',0,0,0);

insert into mem values(3,'ATCMEM3','Rohan Chandra',' ','9810541189','rohan@americantower.com','','Contract','Amrinder Singh','amrinder@americantower.com','2008-01-01 00:00:01','n',0,0,0);

insert into mem values(4,'ATCMEM4','Sonal Ranjan',' ','9810541189','sonal@americantower.com','','Contract','Rohit Singh','rohit@americantower.com','2008-01-01 00:00:01','n',0,0,0);

insert into mem values(5,'ATCMEM5','Karan Thakur',' ','9717097707','karan@americantower.com','','Permanent','Rahul Chandra','rahul@americantower.com','2008-01-01 00:00:01','n',0,0,0);

insert into mem values(6,'ATCMEM6','Nikhil Thomas',' ','9876543210','nikhil@americantower.com','','Contract','Subhashree Singh','subhashree@americantower.com','2008-01-01 00:00:01','n',0,0,0);



