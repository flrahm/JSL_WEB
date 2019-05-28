package expressionLanguage;

public class MemberVO {

	private String name;
	private String userid;
	
	public MemberVO() {};
	
	public MemberVO(String name, String userid) {
		this.name = name;
		this.userid = userid;
	}
	
	@Override
	public String toString() {
		return "MemberVO [name=" + name + ", userid=" + userid + "]";
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

}
