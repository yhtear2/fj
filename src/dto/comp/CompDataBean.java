package dto.comp;

import java.sql.Timestamp;

public class CompDataBean {
	private String email;				// 이메일
	private String ceo;					// 대표자명
	private String comp_part;			// 기업구분
	private String tel;					// 전화번호
	private String zipcode;				// 우편번호
	private String address;				// 주소
	private String content;				// 회사 소개
	private String capital;				// 자본금
	private String comp_type;			// 기업 업종
	private String incharge;			// 담당자(이름)
	private String comp_reg_date;		// 회사 설립일
	private String year_sale;			// 연 매출
	private int emp_count;				// 사원 수
	private int like_count;				// 좋아요 수
	private Timestamp reg_date;			// 등록일
	private Timestamp last_date;		// 수정일
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getComp_part() {
		return comp_part;
	}
	public void setComp_part(String comp_part) {
		this.comp_part = comp_part;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCapital() {
		return capital;
	}
	public void setCapital(String capital) {
		this.capital = capital;
	}
	public String getComp_type() {
		return comp_type;
	}
	public void setComp_type(String comp_type) {
		this.comp_type = comp_type;
	}
	public String getIncharge() {
		return incharge;
	}
	public void setIncharge(String incharge) {
		this.incharge = incharge;
	}
	public String getComp_reg_date() {
		return comp_reg_date;
	}
	public void setComp_reg_date(String comp_reg_date) {
		this.comp_reg_date = comp_reg_date;
	}
	public String getYear_sale() {
		return year_sale;
	}
	public void setYear_sale(String year_sale) {
		this.year_sale = year_sale;
	}
	public int getEmp_count() {
		return emp_count;
	}
	public void setEmp_count(int emp_count) {
		this.emp_count = emp_count;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
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
