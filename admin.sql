create table admin(adminid varchar(10) not null, Password varchar(15) not null , dateofcreation  timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, primary key(adminid));

insert into admin values('raja','rahul','2008-01-01 00:00:01');
 