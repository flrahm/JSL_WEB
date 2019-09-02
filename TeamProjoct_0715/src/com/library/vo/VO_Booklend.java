package com.library.vo;

public class VO_Booklend {

	private String lendno; // 대출번호
	private String bookno; // 도서번호(외래키)
	private String bookname; // 책 이름
	private String bookimg; // 책 이미지;
	private String lendid; // 대여자
	private String lenddate; // 대출일자
	private String lenddue; // 반납에정일자
	private String returndate; // 반납일자
	private String renewal; // 반납 확인
	
	public String getRenewal() {
		return renewal;
	}

	public void setRenewal(String renewal) {
		this.renewal = renewal;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getBookimg() {
		return bookimg;
	}

	public void setBookimg(String bookimg) {
		this.bookimg = bookimg;
	}

	public String getLendno() {
		return lendno;
	}

	public void setLendno(String lendno) {
		this.lendno = lendno;
	}

	public String getBookno() {
		return bookno;
	}

	public void setBookno(String bookno) {
		this.bookno = bookno;
	}

	public String getLendid() {
		return lendid;
	}

	public void setLendid(String lendid) {
		this.lendid = lendid;
	}

	public String getLenddate() {
		return lenddate;
	}

	public void setLenddate(String lenddate) {
		this.lenddate = lenddate;
	}

	public String getLenddue() {
		return lenddue;
	}

	public void setLenddue(String lenddue) {
		this.lenddue = lenddue;
	}

	public String getReturndate() {
		return returndate;
	}

	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}
}
