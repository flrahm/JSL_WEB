

create table board(
num number primary key,
name varchar2(30) not null,
pass varchar2(10) not null,
email varchar2(100),
indate date default sysdate,
subject varchar2(100) not null,
contents varchar2(4000) not null,
readcnt number default 0,
ip varchar2(30) );


create sequence board_num_seq
increment by 1 start with 1;

insert into board(num,name,pass,email,subject,contents,ip) values(board_num_seq.nextval,'SEOL',
'123123','shss2216@gmail.com','subject1','aaaa','0.0.0.1');

commit;
