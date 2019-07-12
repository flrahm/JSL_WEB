package net.hrdkorea.model;

public class InsaVO {
	private String id; // 사원번호 4
	private String name; // 사원명 30
	private String dept; // 소속부서 20
	private String position; // 직급 1
	private String duty; // 직책 20
	private String phone; // 연락처 14
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "InsaVO [id=" + id + ", name=" + name + ", dept=" + dept + ", position=" + position + ", duty=" + duty
				+ ", phone=" + phone + "]";
	}
	
	
	
	
}
