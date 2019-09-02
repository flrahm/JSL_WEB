-- �����ͺ��̽�: `orcle`
-- USER/PASS : hr/1234

-- ������ ���̺�
-- ���̺� ���� `sam_admin`

CREATE TABLE sam_admin (
  num number NOT NULL,     --  ������ȣ
  adminid varchar2(20) NOT NULL , --  ���̵�
  adminpass varchar2(20) NOT NULL , --  ��й�ȣ
  indate date default NULL,              --  �������
  rate number(2) default NULL,              --  ���� ����
  PRIMARY KEY  (num)
);
create sequence sam_admin_seq;

insert into sam_admin (num,adminid,adminpass,indate,rate) values (admin_seq.nextval,'admin','1234',sysdate,0);

-- ȸ������ ���̺�
-- ���̺� ���� `sam_member`

create table sam_member(
	idx number not null primary key ,		-- �⺻Ű �ڵ�����
	name varchar2(20) not null,			-- ȸ���̸�
	userid varchar2(20) not null,			-- ȸ�� ID
	passwd varchar2(20) not null,			-- ��й�ȣ
	gubun varchar2(4)  null,			-- �ּұ���(����/����)
	zipcode varchar2(7)  null,			-- �����ȣ
	addr1 varchar2(200)  null,			-- �ּ�
	addr2 varchar2(100)  null,			-- �������ּ�
	tel varchar2(4) not null,			-- ��ȭ(����/�ڵ���)
	email varchar2(100),				-- �̸���
	job varchar2(20),				-- ����
	intro varchar2(2000),				-- �ڱ�Ұ�
	favorite varchar2(255),				-- ���ɺо�
	first_time date default sysdate,		-- ���Գ�¥
	last_time date					-- ������ �α��γ�¥
);
create sequence sam_member_seq_idx;

-- �������� ���̺�
-- ���̺� ���� 'sam_notice`

CREATE TABLE sam_notice (
  num number NOT NULL ,				--  ������ȣ
  subject varchar2(255) NOT NULL ,		--  ����
  contents varchar2(2000) NOT NULL,		--  ����
  indate date default NULL,			--  �������
  readcnt number default NULL,			--  ��ȸ��
  PRIMARY KEY  (num)
);
create sequence sam_notice_seq_num;

-- �Խ��� ���̺�
-- ���̺� ���� `sam_board`

CREATE TABLE sam_board (
  num number NOT NULL ,				--  ������ȣ
  pass varchar2(20) NOT NULL ,			--  ��й�ȣ
  name varchar2(20) NOT NULL ,			--  �ۼ��� �̸�
  indate date default sysdate,			--  �ۼ�����
  subject varchar2(100) NOT NULL,		--  ����
  contents varchar2(2000) NOT NULL,		--  ����
  readcnt number ,				--  ��ȸ��
  ip varchar2(20) null,				--  �ۼ��� ip�ּ�
  comments number(3) null,			--  ��� ��
  PRIMARY KEY  (num)
);
create sequence sam_board_seq_num;

- ��� ���̺� -
create table sam_comments(
   idx number(5) primary key,			-- ������ȣ
   parent number(5) not null,			-- �θ�۹�ȣ
   name varchar2(50) not null,			-- �ۼ���
   pass varchar2(50) not null,			-- ���
   comments varchar2(2000) not null,		-- ���
   regdate date default sysdate			-- �������
);
create sequence sam_commants_seq_idx;


-- �亯�� �Խ��� ���̺�
-- ���̺� ���� `sam_board2`

CREATE TABLE sam_board2 (
  num number NOT NULL ,				--  ������ȣ
  pass varchar2(20) NOT NULL ,			--  ��й�ȣ
  name varchar2(20) NOT NULL ,			--  �ۼ��� �̸�
  indate date default sysdate,			--  �ۼ�����
  subject varchar2(100) NOT NULL,		--  ����
  contents varchar2(2000) NOT NULL,		--  ����
  parent number(2) not null,			--  �ֻ��� �θ�۹�ȣ
  realparent number(2) not null,		--  �ٷ� �Ѽ��� ���� �۹�ȣ
  indent number(2) not null,			--  �鿩���� ����
  depth number(2) not null,			--  �亯���� �ѹ��� �����ϴ� �ʵ�� 
						--  ù��° �亯���� 1, �� ��° �亯���� 2,
						--  n��° �亯���� n�� ���� ����
  readcnt number ,				--  ��ȸ��
  ip varchar2(20) not null,			--  �ۼ��� ip�ּ�
  PRIMARY KEY  (num)
);
create sequence sam_board_seq_num;

-- ���� ������ ���̺�
-- ���̺� ���� 'sam_gallery`

CREATE TABLE sam_gallery (
  num number NOT NULL ,				--  ������ȣ
  gubun number(1) NOT NULL ,			--  ��������(1:/����/2:��/3:����/4:������
  subject varchar2(100) NOT NULL ,		--  ����
  photo varchar2(255) NOT NULL ,		--  ����
  indate date default sysdate,			--  �������
  PRIMARY KEY  (num)
);
create sequence sam_gallery_seq_num;

-- ���� ���ε�� ���̺�
-- ���̺� ���� `sam_pds`

CREATE TABLE sam_pds (
  num number NOT NULL ,	--  ������ȣ
  name varchar2(20) NOT NULL ,			--  �ۼ��� �̸�
  pass varchar2(20) NOT NULL ,			--  ��й�ȣ
  email varchar2(100) NOT NULL ,		--  �̸���
  subject varchar2(100) NOT NULL,		--  ����
  contents varchar2(2000) NOT NULL,		--  ����
  indate date default sysdate ,			--  �ۼ�����
  readcnt number(2) ,				--  ��ȸ��
  filename varchar2(255) null,			--  �����̸�
  PRIMARY KEY  (num)
);
create sequence sam_pds_seq_num;

-- ���� ���̺�(�亯�� ����)
-- ���̺� ���� `sam_guest`

create table sam_guest (
	idx number not null ,			-- ������ȣ/�ڵ�����
	name varchar2(50) not null,		-- �ۼ���
	subject varchar2(100) not null,		-- ����
	contents varchar2(2000) not null,	-- ����
	indate date default sysdate,			-- �ۼ�����
	readcnt number,				-- ��ȸ��
	primary key(idx)			-- �⺻Ű
);
create sequence sam_guest_seq_idx;


-- �������� ���̺�
-- ���̺� ���� `sam_question'

create table sam_question (
	num number not null ,			-- ������ȣ/�ڵ�����
	question varchar2(255) not null,	-- ���� ������ ����
	reply1 varchar2(100) ,			-- �亯1(����ڰ� �亯�� ���û��� 1�� ����)
	reply2 varchar2(100) ,			-- �亯2(����ڰ� �亯�� ���û��� 2�� ����)
	reply3 varchar2(100) ,			-- �亯3(����ڰ� �亯�� ���û��� 3�� ����)
	reply4 varchar2(100) ,			-- �亯4(����ڰ� �亯�� ���û��� 4�� ����)
	replynum1 number ,			-- �亯1(�亯1�� ������ ��)
	replynum2 number ,			-- �亯2(�亯2�� ������ ��)
	replynum3 number ,			-- �亯3(�亯3�� ������ ��)
	replynum4 number ,			-- �亯4(�亯4�� ������ ��)
	replytot  number ,			-- ��ü ������ ��
	indate date default sysdate,		-- ���� �������
	primary key(num)			-- �⺻Ű
);
create sequence sam_question_seq_num;
