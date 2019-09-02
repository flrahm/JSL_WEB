package com.library.vo;

public class VO_BookList {
	private String bookno; // 도서번호
	private String bookname; // 도서이름
	private String bookgenre; // 도서 분류명
	private String booktype; // 도서분류
	private String writer; // 저자
	private String regdate; // 등록일자
	private int lend; // 대출상태
	private int lendcnt; // 대출횟수
	private String publisher; // 출판사
	private String bookimg; // 책이미지

	public VO_BookList() {
	}

	public String getBookno() {
		return bookno;
	}

	public void setBookno(String bookno) {
		this.bookno = bookno;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getBookgenre() {
		return bookgenre;
	}

	public void setBookgenre(String bookgenre) {
		this.bookgenre = bookgenre;
	}

	public String getBooktype() {
		return booktype;
	}

	public void setBooktype(String booktype) {
		this.booktype = booktype;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getLend() {
		return lend;
	}

	public void setLend(int lend) {
		this.lend = lend;
	}

	public int getLendcnt() {
		return lendcnt;
	}

	public void setLendcnt(int lendcnt) {
		this.lendcnt = lendcnt;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getBookimg() {
		return bookimg;
	}

	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}

}
