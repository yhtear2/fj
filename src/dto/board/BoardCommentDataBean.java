package dto.board;

import java.sql.Timestamp;

public class BoardCommentDataBean {
 
	private String email;       // 이메일 
	private String recontent;   // 댓글내용 
	private int mom_board_num;  // 부모 게시판 id (부모글 번호)
	private int board_num;      // 게시판 id (글번호)
	private int recom_count;    // 좋아요 수
	private int re_step;        // 게시글의 구분
	private Timestamp reg_date; // 작성날짜 
	
	
	public int getMom_board_num() {
		return mom_board_num;
	}  
	public void setMom_board_num(int mom_board_num) {
		this.mom_board_num = mom_board_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getRecom_count() {
		return recom_count;
	}
	public void setRecom_count(int recom_count) {
		this.recom_count = recom_count;
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
