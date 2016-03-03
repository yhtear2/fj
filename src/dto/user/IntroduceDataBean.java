package dto.user;

import java.sql.Timestamp;

public class IntroduceDataBean {
	
	private int intro_id;
	private int user_history_id; 
	private String intro_title;
	private String intro_contents;
	private Timestamp intro_reg_date;
	private Timestamp intro_last_date;
	
	public int getIntro_id() {
		return intro_id;
	}
	public void setIntro_id(int intro_id) {
		this.intro_id = intro_id;
	}
	public int getUser_history_id() {
		return user_history_id;
	}
	public void setUser_history_id(int user_history_id) {
		this.user_history_id = user_history_id;
	}
	public String getIntro_title() {
		return intro_title;
	}
	public void setIntro_title(String intro_title) {
		this.intro_title = intro_title;
	}
	public String getIntro_contents() {
		return intro_contents;
	}
	public void setIntro_contents(String intro_contents) {
		this.intro_contents = intro_contents;
	}
	public Timestamp getIntro_reg_date() {
		return intro_reg_date;
	}
	public void setIntro_reg_date(Timestamp intro_reg_date) {
		this.intro_reg_date = intro_reg_date;
	}
	public Timestamp getIntro_last_date() {
		return intro_last_date;
	}
	public void setIntro_last_date(Timestamp intro_last_date) {
		this.intro_last_date = intro_last_date;
	}

	
	
	
}
