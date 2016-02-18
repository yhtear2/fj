package dto.message;

import java.sql.Timestamp;

public class MessageDataBean {
	private int message_num;		// 메시지 글 번호
	private String email;			// 받는사람 이메일
	private String sender;			// 보낸사람 이메일
	private String title;			// 제목
	private String content;			// 내용
	private int tag;				// 메시지 분류 (1:채용공고  // 2:공지사항 // 3:일반쪽지)
	private int read_yn;			// 읽은 유,무 확인용 (0:읽지 않음 // 1:읽음)
	private Timestamp reg_date;		// 보낸날자
	
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
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
	public int getTag() {
		return tag;
	}
	public void setTag(int tag) {
		this.tag = tag;
	}
	public int getRead_yn() {
		return read_yn;
	}
	public void setRead_yn(int read_yn) {
		this.read_yn = read_yn;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	
	
	
}
