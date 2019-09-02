CREATE TABLE gallery (
  num number NOT NULL ,				--  고유번호
  gubun number(1) NOT NULL ,			--  포토종류(1:/백일/2:돌/3:가족/4:프로필
  subject varchar2(100) NOT NULL ,		--  제목
  photo varchar2(255) NOT NULL ,		--  사진
  indate date default sysdate,			--  등록일자
  PRIMARY KEY  (num)
);
create sequence gallery_seq_num;