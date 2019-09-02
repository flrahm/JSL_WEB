CREATE TABLE notice (
  num number NOT NULL ,				--  고유번호
  subject varchar2(255) NOT NULL ,		--  제목
  contents varchar2(2000) NOT NULL,             --  내용
  indate date default NULL,			--  등록일자
  readcnt number default NULL,			--  조회수
  PRIMARY KEY  (num)
);
create sequence notice_seq_num;