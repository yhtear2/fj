package dto.user;

import java.sql.Timestamp;

public class SchoolDataBean {
	
	private int school_id;
	private int user_history_id; 
	private String school_kind;
	private String school_start_date;
	private String school_last_date;
	private String school_college1;
	private String school_college2;
	private String school_college_high;
	private String school_name;
	private String school_name_kind;
	private String school_major;
	private String school_rank;
	private Timestamp reg_date;
	private Timestamp last_date;
	
		
	public String getSchool_college_high() {
		return school_college_high;
	}
	public void setSchool_college_high(String school_college_high) {
		this.school_college_high = school_college_high;
	}
	public int getSchool_id() {
		return school_id;
	}
	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}
	public int getUser_history_id() {
		return user_history_id;
	}
	public void setUser_history_id(int user_history_id) {
		this.user_history_id = user_history_id;
	}
	public String getSchool_kind() {
		return school_kind;
	}
	public void setSchool_kind(String school_kind) {
		this.school_kind = school_kind;
	}
	public String getSchool_start_date() {
		return school_start_date;
	}
	public void setSchool_start_date(String school_start_date) {
		this.school_start_date = school_start_date;
	}
	public String getSchool_last_date() {
		return school_last_date;
	}
	public void setSchool_last_date(String school_last_date) {
		this.school_last_date = school_last_date;
	}
	public String getSchool_college1() {
		return school_college1;
	}
	public void setSchool_college1(String school_college1) {
		this.school_college1 = school_college1;
	}
	public String getSchool_college2() {
		return school_college2;
	}
	public void setSchool_college2(String school_college2) {
		this.school_college2 = school_college2;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getSchool_name_kind() {
		return school_name_kind;
	}
	public void setSchool_name_kind(String school_name_kind) {
		this.school_name_kind = school_name_kind;
	}
	public String getSchool_major() {
		return school_major;
	}
	public void setSchool_major(String school_major) {
		this.school_major = school_major;
	}
	public String getSchool_rank() {
		return school_rank;
	}
	public void setSchool_rank(String school_rank) {
		this.school_rank = school_rank;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public Timestamp getLast_date() {
		return last_date;
	}
	public void setLast_date(Timestamp last_date) {
		this.last_date = last_date;
	}	

}
