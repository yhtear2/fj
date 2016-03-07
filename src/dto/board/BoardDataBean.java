package dto.board;

import java.sql.Timestamp;

public class BoardDataBean {
	  
	private String email;   // 이메일 
	private String subject; // 글제목 
	private String content; // 글내용
	private String hstag;   // 해쉬태그      
	private String recontent; // 댓글내용 
	private int board_num;  // 게시판 id (글번호)
	private int mom_board_num; // 부모 게시판 id (부모글 번호)
	private int re_count;   // 리플의 수   
	private int scrap_count; // 스크랩 수
	private int recom_count;    // 좋아요 수 
	private int bad_count;   // 싫어요 수 
	private int read_count;  // 읽은 수 
	private int re_step;    // 게시글의 구분
	private String category;   // 카테고리
	private Timestamp reg_date; // 작성날짜 
	 
	  
	public int getMom_board_num() {
		return mom_board_num;
	}
	public void setMom_board_num(int mom_board_num) {
		this.mom_board_num = mom_board_num;
	}
	public String getRecontent() { 
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getCategory() {
		return category;
	} 
	public void setCategory(String category) {
		this.category = category;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getHstag() {
		return hstag; 
	}
	public void setHstag(String hstag) {
		this.hstag = hstag;
	} 
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getRe_count() {
		return re_count;
	}
	public void setRe_count(int re_count) {
		this.re_count = re_count;
	}
	public int getScrap_count() {
		return scrap_count;
	}
	public void setScrap_count(int scrap_count) {
		this.scrap_count = scrap_count;
	}
	public int getRecom_count() {
		return recom_count;
	}
	public void setRecom_count(int recom_count) {
		this.recom_count = recom_count;
	}
	public int getBad_count() {
		return bad_count;
	}
	public void setBad_count(int bad_count) {
		this.bad_count = bad_count;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public int getRe_step() {
		return re_step;
	}
	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}
	
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
	