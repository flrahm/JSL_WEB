package notice;

import java.time.LocalDate;

public class NoticeVO {
	private int idx;
	private String subject;
	private String regdate = LocalDate.now().toString();
	private int readcnt;
	
	
	public NoticeVO(int idx, String subject, int readcnt) {
		super();
		this.idx = idx;
		this.subject = subject;
		this.readcnt = readcnt;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	
}
