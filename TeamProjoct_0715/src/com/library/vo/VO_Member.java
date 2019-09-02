package com.library.vo;

public class VO_Member {
	private String memberid; // 회원ID
	private String memberpasswd; // 회원비밀번호
	private String membername; // 회원이름
	private String email; // 이메일
	private String phone; // 전화번호
	private String grade; // 회원등급

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMemberpasswd() {
		return memberpasswd;
	}

	public void setMemberpasswd(String memberpasswd) {
		this.memberpasswd = memberpasswd;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
}