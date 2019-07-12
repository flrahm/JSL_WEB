package vo;

public class GroupcodeVO {
	private String gcode;
	private String gname;
	
	
	public String getGcode() {
		return gcode;
	}
	public void setGcode(String gcode) {
		this.gcode = gcode;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	@Override
	public String toString() {
		return "GroupcodeVO [gcode=" + gcode + ", gname=" + gname + ", getGcode()=" + getGcode() + ", getGname()="
				+ getGname() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
	
}
