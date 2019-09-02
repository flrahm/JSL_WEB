CREATE TABLE board (
  num number NOT NULL ,				--  고유번호
  pass varchar2(20) NOT NULL ,			--  비밀번호
  name varchar2(20) NOT NULL ,			--  작성자 이름
  indate date default sysdate,			--  작성일자
  subject varchar2(100) NOT NULL,		--  제목
  contents varchar2(2000) NOT NULL,		--  내용
  readcnt number ,				--  조회수
  ip varchar2(20) null,				--  작성자 ip주소
  comment number(3) null,			--  댓글 수
  PRIMARY KEY  (num)
);
create sequence board_seq_num;

- 댓글 테이블 -
create table comment(
   idx number(5) primary key,			-- 고유번호
   parent number(5) not null,			-- 부모글번호
   name varchar2(50) not null,			-- 작성자
   pass varchar2(50) not null,			-- 비번
   comment varchar2(2000) not null,		-- 댓글
   regdate date default sysdate			-- 등록일자
);
create sequence commant_seq_idx;
