package com.library.vo;

public class VO_MemberGrade {
	private String grade; // 회원등급
	private String membertype; // 유저타입
	private int maxlendnum; // 최대 대출도서량
	private int maxlenddate; // 최대 대출일수

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getMembertype() {
		return membertype;
	}

	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}

	public int getMaxlendnum() {
		return maxlendnum;
	}

	public void setMaxlendnum(int maxlendnum) {
		this.maxlendnum = maxlendnum;
	}

	public int getMaxlenddate() {
		return maxlenddate;
	}

	public void setMaxlenddate(int maxlenddate) {
		this.maxlenddate = maxlenddate;
	}
}