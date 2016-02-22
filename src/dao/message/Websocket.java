package dao.message;


import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value = "/websocket/chat") //클라이언트가 접속할 때 사용될 URI
public class Websocket {
	// Map<유저memId, 세션> 저장할 공간 마련
    private static final Map<String,Session> sessionMap = new HashMap<String,Session>();
    // 유저memId가 저장될 공간
    private Map<Integer, String> memId = new HashMap<Integer,String>();
    // 클라이언트가 새로 접속할 때마다 한개의 Session 객체가 생성된다.
    // Session 객체를 컬렉션에 보관하여 두고 해당 클라이언트에게 데이터를 전송할 때마다 사용한다
    private Session session;
    
    // 클라이언트가 처음 접속하면 연결(세션 생성)
    @OnOpen
    public void start(Session session) {
    	System.out.println("클라이언트 접속됨 : "+session);
    	// 접속자마다 한개의 세션이 생성되어 데이터 통신수단으로 사용됨
        this.session = session;
        // 세션에서 memId 분리
        String user_memId = session.getRequestURI().toString().substring(25); 
        memId.put(1, user_memId);
        System.out.println("접속유저 MemId : " + user_memId );
        
        sessionMap.put(user_memId, session);
    }

    @OnClose
    public void end() {
        sessionMap.remove(this.session);
    }

    // 현재 세션과 연결된 클라이언트로부터 메시지가 도착할 때마다 새로운 쓰레드가 실행되어 incoming()을 호출함
    @OnMessage
    public void incoming(String message) {
    	
    	String threadName = "Thread-Name:"+Thread.currentThread().getName();
    	System.out.println("메시지 도착:"+threadName+", "+memId);
    	
        if(message==null || message.trim().equals("")) return;
        
        String totalmessage[] = message.split("#");
        String email = totalmessage[0];
        System.out.println("받는사람(email) : " + email);
        
        System.out.println("내 세션에 저장된 아이디(memId) : " + memId);
        
        
        if(memId.equals(email)){
        	System.out.println("여기 들어왔다!!!");
        	sendToOne(message, sessionMap.get(memId));
        	
        }else System.out.println("앗!! 아니다!! ㅠㅠ");
        
        //Guest0의 메시지는 특정 클라이언트(Guest2)에게만 전달하는 경우
        /*
        if(this.memId.equals("Guest0")) {
        	sendToOne(filteredMessage, sessionMap.get("Guest2"));
        }
        else //현재 접속된 모든 클라이언트에게 메시지를 전달하는 경우
        {
        	broadcast(filteredMessage);
        }
        */
    }

    @OnError
    public void onError(Throwable t) throws Throwable {
        System.err.println("오류/세션제거("+memId+"):Chat Error: " + t.toString());
        sessionMap.remove(this.memId);
    }

    // 클라이언트로부터 도착한 메시지를 특정 수신자(Session)에게만 전달한다
    private void sendToOne(String msg, Session ses) {
    	try {
    		ses.getBasicRemote().sendText(msg);
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
    }
}