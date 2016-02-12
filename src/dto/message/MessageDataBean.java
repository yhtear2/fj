package dto.message;

import java.sql.Timestamp;

public class MessageDataBean {
	private int MESSAGE_NUM;		// 메시지 글 번호
	private String EMAIL;			// 받는사람 메일
	private String TITLE;			// 제목
	private String CONTENT;			// 내용
	private String TAG;				// 보낸사람 정보
	private int READ_YN;			// 읽은 유,무 확인용
	private Timestamp REG_DATE;		// 보낸날자
	
	public int getMESSAGE_NUM() {
		return MESSAGE_NUM;
	}
	public void setMESSAGE_NUM(int mESSAGE_NUM) {
		MESSAGE_NUM = mESSAGE_NUM;
	}
	public String getEMAIL() {
		return EMAIL;
	}
	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}
	public String getTITLE() {
		return TITLE;
	}
	public void setTITLE(String tITLE) {
		TITLE = tITLE;
	}
	public String getCONTENT() {
		return CONTENT;
	}
	public void setCONTENT(String cONTENT) {
		CONTENT = cONTENT;
	}
	public String getTAG() {
		return TAG;
	}
	public void setTAG(String tAG) {
		TAG = tAG;
	}
	public int getREAD_YN() {
		return READ_YN;
	}
	public void setREAD_YN(int rEAD_YN) {
		READ_YN = rEAD_YN;
	}
	public Timestamp getREG_DATE() {
		return REG_DATE;
	}
	public void setREG_DATE(Timestamp rEG_DATE) {
		REG_DATE = rEG_DATE;
	}
	
	
}
