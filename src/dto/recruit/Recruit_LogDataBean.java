package dto.recruit;

import java.sql.Timestamp;

public class Recruit_LogDataBean {
	
	private int Recruit_id;
	private String Email;
	private String Resome_title;
	private int User_history_id;
	private Timestamp reg_date;
	
	public int getRecruit_id() {
		return Recruit_id;
	}
	public void setRecruit_id(int recruit_id) {
		Recruit_id = recruit_id;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	public String getResome_title() {
		return Resome_title;
	}
	public void setResome_title(String resome_title) {
		Resome_title = resome_title;
	}
	public int getUser_history_id() {
		return User_history_id;
	}
	public void setUser_history_id(int user_history_id) {
		User_history_id = user_history_id;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	

}
