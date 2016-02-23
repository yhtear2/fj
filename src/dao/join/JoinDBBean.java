package dao.join;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.ibatis.session.SqlSession;

import dao.SqlMapClient;
import dto.join.JoinDataBean;

public class JoinDBBean implements JoinDao {
private SqlSession sqlSession = SqlMapClient.getSqlSession();
	
	public int insertMember( JoinDataBean dto ) {			
		return sqlSession.insert( "Join.insertMember", dto ); 	
	}
	
	public int checkName( String name ) {
		int result = 0;
		int count = sqlSession.selectOne( "Join.checkName", name );
		if( count == 0 ) {
			// 닉네임이 있다
			result = 0;
		} else {
			// 닉네임이 없다
			result = 1;
		}	
		return result;
	}
		
	public int checkMember( String email ) {
		int result = 0;
		int count = sqlSession.selectOne( "Join.checkEmail", email );
		if( count == 0 ) {
			// 아이디가 없다.
			result = 0;
		} else {
			// 아이디가 있다.
			result = 1;
		}	
		return result;
	}
		
	public int checkMember( String email, String passwd ) {
		int result = 0;
		int count = checkMember( email );
		if( count == 0 ) {
			// 아이디가 없다
			result = -1;
		} else {
			// 아이디가 있다
			JoinDataBean dto = getMember( email );		
			if( passwd.equals( dto.getPasswd() ) ) {
				// 비밀번호가 같다
				result = 1;				
			} else {
				// 비밀번호가 다르다
				result = 0;
			}						
		}			
		return result;
	}
	
	
	
	public int deleteMember( String email ) {
		return sqlSession.delete( "Join.deleteMember", email );
	}
	

	public JoinDataBean getMember( String email ) {
		return sqlSession.selectOne( "Join.getMember", email );
	}

	
	
	public int updateMember( JoinDataBean dto ) {
		return sqlSession.update( "Join.updateMember", dto);
	}
	
	public String emailconfirm( String email ){
		String host = "smtp.gmail.com";//smtp 서버
		String subject = "회원가입 인증메일";
        String from = "credsuk@gmail.com"; //보내는 메일
        String fromName = "관리자";
        String to = email;
        int content =  ((int) (Math.random()*9999)+1000);  // 여기에다 랜덤 함수 적자
        String scontent = String.valueOf(content);
        
        Session mailSession = null;
        Properties props = null;
        
        try{
        	// 프로퍼티 값 인스턴스 생성과 기본세션(SMTP 서버 호스트 지정)
        	props = new Properties();
			
			// G-Mail SMTP 사용시
			props.put("mail.smtp.starttls.enable","true");
	        props.put("mail.transport.protocol", "smtp");
	        props.put("mail.smtp.host", host);
	        props.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.port", "465");
	        // props.put("mail.smtp.user", from);
	        props.put("mail.smtp.auth", "true");
	        
	        String body = "관리자다"+"<br>";
			body += "고맙다"+"<br>";
			body += "아래 인증번호 입력해라"+"<br>";
			body += "인증번호  : <h2>"+content+"</h2><br>";
				
		

			mailSession = Session.getInstance(props,
	        	new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("credsuk@gmail.com", "tkznfk11");
															// 메일게정			비밀번호
				}
			});
			System.out.println("메일계정 가져왔다");
	          
			Message msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName,"UTF-8","B")));//보내는 사람 설정
			
			InternetAddress[] address = {new InternetAddress(to)};
			
			msg.setRecipients(Message.RecipientType.TO, address);//받는 사람설정
			msg.setSubject(subject);// 제목 설정
			msg.setSentDate(new java.util.Date());// 보내는 날짜 설정
			msg.setContent(body,"text/html;charset=euc-kr"); // 내용 설정 (HTML 형식)
			
			Transport.send(msg); // 메일 보내기
			System.out.println("보내는구나");
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		} catch ( Exception e){
			e.printStackTrace();
		} finally {
			if( mailSession != null ) {
				mailSession = null;
				System.out.println("끝이구나");
			}
		}
        
		return scontent;
	}

}
