create table books(id int(10) not null auto_increment, bookno varchar(100) not null, bookname varchar(100) not null,author varchar(100) not null, publisher varchar(100) not null, publication_year int(10) not null, language varchar(10) not null,bcategoryid varchar(100) not null,isbn_no varchar(15),qoh int(100) not null,issued int(100) not null default 0,bookprice int(10) not null ,bdeleted varchar(1) default "n", added_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,primary key(id))ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;
insert into books values(1,'BK1','Bhagvad Geeta','Krishna Dev Vashudeva','Geet Press Gorakhpur',1999,'Hindi','Religous','2',5,0,1500,'n','2008-01-01 00:00:01');

insert into books values(2,'BK2','Guliver','Marvels','Infinity Wars',2019,'English','Science/Fiction','2',5,0,100,'n','2008-01-01 00:00:01');

insert into books values(3,'BK3','Anna Karenina','Leo Tolstoy','Jaico Publishing Houses',2019,'English','Coding','2',5,0,1000,'n','2008-01-01 00:00:01');

insert into books values(4,'BK4','Madame Bovary','Gustave Flaubert','Westland Publications',2019,'English','Health','2',5,0,200,'n','2008-01-01 00:00:01');

insert into books values(5,'BK5','War and Peace','Leo Tolstoy','Rupa Publications',2019,'English','Motivational','2',5,0,250,'n','2008-01-01 00:00:01');

