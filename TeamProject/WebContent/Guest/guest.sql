create table guest (
	idx number not null ,			-- 고유번호/자동증가
	name varchar2(50) not null,		-- 작성자
	subject varchar2(100) not null,		-- 제목
	contents varchar2(2000) not null,	-- 내용
	indate date default sysdate,			-- 작성일자
	readcnt number,				-- 조회수
	primary key(idx)			-- 기본키
);
create sequence guest_seq_idx;
