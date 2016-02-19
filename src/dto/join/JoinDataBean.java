package dto.join;

import java.sql.Timestamp;

public class JoinDataBean {
	private String email;
	private String passwd;
	private String name;
	private Timestamp reg_date;
	private int member_flag;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public int getMember_flag() {
		return member_flag;
	}
	public void setMember_flag(int member_flag) {
		this.member_flag = member_flag;
	}
}
