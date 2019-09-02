create table member(
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
create sequence member_seq_idx;
