package dto.recruit;

import java.sql.Timestamp;

public class RecruitDataBean {
	public int recruit_id;			// 채용게시판 ID
	public String email;			// 이메일
	
	public String title;			// 제목
	public String content;			// 내용
	public String name;				// 회사이름			// 추가!!
	public String skill;			// 원하는 기술
	public String gender;			// 성별
	public String edu;				// 학력
	public String work_type;		// 고용형태
	public String work_day;			// 근무요일 (주5일) 등등
	public String work_area;  		// 근무지역 
	public String business_part;	// 담당업무 
	public String incharge;			// 담당자 
	public String tel;				// 연락처 

	public String start_date;		// 채용 시작일
	public String end_date;			// 채용 종료일
	
	public int min_career;			// 최소 경력
	public int max_career;			// 최대 경력
	public int min_age;				// 최소 나이
	public int max_age;				// 최대 나이
	public int min_salary;			// 최소 연봉
	public int max_salary;			// 최대 연봉
	public int people_count;		// 채용인원
	public int readcount;			// 조회수
	
	public Timestamp reg_date;		// 작성일
	public Timestamp last_date;		// 수정일
	
	public int getRecruit_id() {
		return recruit_id;
	}
	public void setRecruit_id(int recruit_id) {
		this.recruit_id = recruit_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEdu() {
		return edu;
	}
	public void setEdu(String edu) {
		this.edu = edu;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getWork_day() {
		return work_day;
	}
	public void setWork_day(String work_day) {
		this.work_day = work_day;
	}
	public String getWork_area() {
		return work_area;
	}
	public void setWork_area(String work_area) {
		this.work_area = work_area;
	}
	public String getBusiness_part() {
		return business_part;
	}
	public void setBusiness_part(String business_part) {
		this.business_part = business_part;
	}
	public String getIncharge() {
		return incharge;
	}
	public void setIncharge(String incharge) {
		this.incharge = incharge;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getMin_career() {
		return min_career;
	}
	public void setMin_career(int min_career) {
		this.min_career = min_career;
	}
	public int getMax_career() {
		return max_career;
	}
	public void setMax_career(int max_career) {
		this.max_career = max_career;
	}
	public int getMin_age() {
		return min_age;
	}
	public void setMin_age(int min_age) {
		this.min_age = min_age;
	}
	public int getMax_age() {
		return max_age;
	}
	public void setMax_age(int max_age) {
		this.max_age = max_age;
	}
	public int getMin_salary() {
		return min_salary;
	}
	public void setMin_salary(int min_salary) {
		this.min_salary = min_salary;
	}
	public int getMax_salary() {
		return max_salary;
	}
	public void setMax_salary(int max_salary) {
		this.max_salary = max_salary;
	}
	public int getPeople_count() {
		return people_count;
	}
	public void setPeople_count(int people_count) {
		this.people_count = people_count;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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
