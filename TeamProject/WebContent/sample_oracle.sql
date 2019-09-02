-- 데이터베이스: `orcle`
-- USER/PASS : hr/1234

-- 관리자 테이블
-- 테이블 구조 `sam_admin`

CREATE TABLE sam_admin (
  num number NOT NULL,     --  고유번호
  adminid varchar2(20) NOT NULL , --  아이디
  adminpass varchar2(20) NOT NULL , --  비밀번호
  indate date default NULL,              --  등록일자
  rate number(2) default NULL,              --  권한 순위
  PRIMARY KEY  (num)
);
create sequence sam_admin_seq;

insert into sam_admin (num,adminid,adminpass,indate,rate) values (admin_seq.nextval,'admin','1234',sysdate,0);

-- 회원관리 테이블
-- 테이블 구조 `sam_member`

create table sam_member(
	idx number not null primary key ,		-- 기본키 자동증가
	name varchar2(20) not null,			-- 회원이름
	userid varchar2(20) not null,			-- 회원 ID
	passwd varchar2(20) not null,			-- 비밀번호
	gubun varchar2(4)  null,			-- 주소구분(자택/직장)
	zipcode varchar2(7)  null,			-- 우편번호
	addr1 varchar2(200)  null,			-- 주소
	addr2 varchar2(100)  null,			-- 나머지주소
	tel varchar2(4) not null,			-- 전화(지역/핸드폰)
	email varchar2(100),				-- 이메일
	job varchar2(20),				-- 직업
	intro varchar2(2000),				-- 자기소개
	favorite varchar2(255),				-- 관심분야
	first_time date default sysdate,		-- 가입날짜
	last_time date					-- 마지막 로그인날짜
);
create sequence sam_member_seq_idx;

-- 공지사항 테이블
-- 테이블 구조 'sam_notice`

CREATE TABLE sam_notice (
  num number NOT NULL ,				--  고유번호
  subject varchar2(255) NOT NULL ,		--  제목
  contents varchar2(2000) NOT NULL,		--  내용
  indate date default NULL,			--  등록일자
  readcnt number default NULL,			--  조회수
  PRIMARY KEY  (num)
);
create sequence sam_notice_seq_num;

-- 게시판 테이블
-- 테이블 구조 `sam_board`

CREATE TABLE sam_board (
  num number NOT NULL ,				--  고유번호
  pass varchar2(20) NOT NULL ,			--  비밀번호
  name varchar2(20) NOT NULL ,			--  작성자 이름
  indate date default sysdate,			--  작성일자
  subject varchar2(100) NOT NULL,		--  제목
  contents varchar2(2000) NOT NULL,		--  내용
  readcnt number ,				--  조회수
  ip varchar2(20) null,				--  작성자 ip주소
  comments number(3) null,			--  댓글 수
  PRIMARY KEY  (num)
);
create sequence sam_board_seq_num;

- 댓글 테이블 -
create table sam_comments(
   idx number(5) primary key,			-- 고유번호
   parent number(5) not null,			-- 부모글번호
   name varchar2(50) not null,			-- 작성자
   pass varchar2(50) not null,			-- 비번
   comments varchar2(2000) not null,		-- 댓글
   regdate date default sysdate			-- 등록일자
);
create sequence sam_commants_seq_idx;


-- 답변형 게시판 테이블
-- 테이블 구조 `sam_board2`

CREATE TABLE sam_board2 (
  num number NOT NULL ,				--  고유번호
  pass varchar2(20) NOT NULL ,			--  비밀번호
  name varchar2(20) NOT NULL ,			--  작성자 이름
  indate date default sysdate,			--  작성일자
  subject varchar2(100) NOT NULL,		--  제목
  contents varchar2(2000) NOT NULL,		--  내용
  parent number(2) not null,			--  최상위 부모글번호
  realparent number(2) not null,		--  바로 한수준 위의 글번호
  indent number(2) not null,			--  들여쓰기 기준
  depth number(2) not null,			--  답변글의 넘버를 저장하는 필드로 
						--  첫번째 답변글은 1, 두 번째 답변글은 2,
						--  n번째 답변글은 n의 값이 저장
  readcnt number ,				--  조회수
  ip varchar2(20) not null,			--  작성자 ip주소
  PRIMARY KEY  (num)
);
create sequence sam_board_seq_num;

-- 포토 갤러시 테이블
-- 테이블 구조 'sam_gallery`

CREATE TABLE sam_gallery (
  num number NOT NULL ,				--  고유번호
  gubun number(1) NOT NULL ,			--  포토종류(1:/백일/2:돌/3:가족/4:프로필
  subject varchar2(100) NOT NULL ,		--  제목
  photo varchar2(255) NOT NULL ,		--  사진
  indate date default sysdate,			--  등록일자
  PRIMARY KEY  (num)
);
create sequence sam_gallery_seq_num;

-- 파일 업로드용 테이블
-- 테이블 구조 `sam_pds`

CREATE TABLE sam_pds (
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
create sequence sam_pds_seq_num;

-- 방명록 테이블(답변글 없음)
-- 테이블 구조 `sam_guest`

create table sam_guest (
	idx number not null ,			-- 고유번호/자동증가
	name varchar2(50) not null,		-- 작성자
	subject varchar2(100) not null,		-- 제목
	contents varchar2(2000) not null,	-- 내용
	indate date default sysdate,			-- 작성일자
	readcnt number,				-- 조회수
	primary key(idx)			-- 기본키
);
create sequence sam_guest_seq_idx;


-- 설문조사 테이블
-- 테이블 구조 `sam_question'

create table sam_question (
	num number not null ,			-- 고유번호/자동증가
	question varchar2(255) not null,	-- 질문 내용을 저장
	reply1 varchar2(100) ,			-- 답변1(사용자가 답변할 선택사항 1의 내용)
	reply2 varchar2(100) ,			-- 답변2(사용자가 답변할 선택사항 2의 내용)
	reply3 varchar2(100) ,			-- 답변3(사용자가 답변할 선택사항 3의 내용)
	reply4 varchar2(100) ,			-- 답변4(사용자가 답변할 선택사항 4의 내용)
	replynum1 number ,			-- 답변1(답변1의 응답자 수)
	replynum2 number ,			-- 답변2(답변2의 응답자 수)
	replynum3 number ,			-- 답변3(답변3의 응답자 수)
	replynum4 number ,			-- 답변4(답변4의 응답자 수)
	replytot  number ,			-- 전체 응답자 수
	indate date default sysdate,		-- 질문 등록일자
	primary key(num)			-- 기본키
);
create sequence sam_question_seq_num;
