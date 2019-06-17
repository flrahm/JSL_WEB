
create table pds(
num number primary key,
name varchar2(20) not null,
pass varchar2(20) not null,
subject varchar2(100) not null,
contents varchar2(2000),
indate date default sysdate,
readcnt number default 0,
filename varchar2(100)
);

create sequence pds_num_seq
start with 1;


insert into pds values(pds_num_seq.nextval,'123','123','13','123',sysdate,0,'123')
