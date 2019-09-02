CREATE TABLE pds (
  num number NOT NULL ,	--  고유번호
  name varchar2(20) NOT NULL ,			--  작성자 이름
  pass varchar2(20) NOT NULL ,			--  비밀번호
  email varchar2(100) NOT NULL ,		--  이메일
  subject varchar2(100) NOT NULL,		--  제목
  contents varchar2(2000) NOT NULL,		--  내용
  indate date default sysdate ,			--  작성일자
  readcnt number(2) ,				--  조회수
  filename varchar2(255) null,			--  파일이름
  PRIMARY KEY  (num)
);
create sequence pds_seq_num;