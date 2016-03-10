package dto.user;

import java.sql.Timestamp;

public class UserDataBean {

	private String resome_title;
	private int user_history_id;
	private String email;
	private String eng_name;
	private String kor_name;
	private String tel;
	private String birth;
	private String address;
	private String army;
	private int want_salary;
	private String license;
	private String skill;
	private String photo;
	private Timestamp reg_date;
	private Timestamp last_date;
	private String project;
	private int user_ref;
	private int history_id;
		

	public int getUser_ref() {
		return user_ref;
	}
	public void setUser_ref(int user_ref) {
		this.user_ref = user_ref;
	}
	public int getHistory_id() {
		return history_id;
	}
	public void setHistory_id(int history_id) {
		this.history_id = history_id;
	}

	public String getResome_title() {
		return resome_title;
	}
	public void setResome_title(String resome_title) {
		this.resome_title = resome_title;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public int getUser_history_id() {
		return user_history_id;
	}
	public void setUser_history_id(int user_history_id) {
		this.user_history_id = user_history_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getArmy() {
		return army;
	}
	public void setArmy(String army) {
		this.army = army;
	}
	public int getWant_salary() {
		return want_salary;
	}
	public void setWant_salary(int want_salary) {
		this.want_salary = want_salary;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
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
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	
	
	
}
