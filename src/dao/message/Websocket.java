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
    private String memId;
    // 클라이언트가 새로 접속할 때마다 한개의 Session 객체가 생성된다.
    // Session 객체를 컬렉션에 보관하여 두고 해당 클라이언트에게 데이터를 전송할 때마다 사용한다
    private Session session;

    @OnOpen
    public void start(Session session) {
    	System.out.println("클라이언트 접속됨 : "+session);
    	// 접속자마다 한개의 세션이 생성되어 데이터 통신수단으로 사용됨
        this.session = session;
        //nickname = session.getRequestParameterMap().get("id").get(0);
        memId = session.getRequestURI().toString().substring(25); 
        System.out.println("User MemId : " + memId );
        
        sessionMap.put(memId, session);
        String message = String.format("* %s %s", memId, "has joined.");
        broadcast(message);
    }

    @OnClose
    public void end() {
        sessionMap.remove(this.session);
        String message = String.format("* %s %s", memId, "has disconnected.");
        broadcast(message);
    }

    // 현재 세션과 연결된 클라이언트로부터 메시지가 도착할 때마다 새로운 쓰레드가 실행되어 incoming()을 호출함
    @OnMessage
    public void incoming(String message) {
    	
    	String threadName = "Thread-Name:"+Thread.currentThread().getName();
    	System.out.println("메시지 도착:"+threadName+", "+memId);
        if(message==null || message.trim().equals("")) return;
        String filteredMessage = String.format("%s: %s", memId, message);
        
        //Guest0의 메시지는 특정 클라이언트(Guest2)에게만 전달하는 경우
        if(this.memId.equals("Guest0")) {
        	sendToOne(filteredMessage, sessionMap.get("Guest2"));
        }
        else //현재 접속된 모든 클라이언트에게 메시지를 전달하는 경우
        {
        	broadcast(filteredMessage);
        }
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
    
    // 클라이언트로부터 도착한 메시지를 모든 접속자에게 전송한다
    private void broadcast(String msg) {
    	
    	Set<String> keys = sessionMap.keySet();
    	Iterator<String> it = keys.iterator();
    	while(it.hasNext()){
    		String key = it.next();
    		Session s = sessionMap.get(key);
    		try{
    			s.getBasicRemote().sendText(msg);
    		}catch(IOException e) {
    			sessionMap.remove(key);
    			try {
					s.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
    			String message = String.format("* %s %s",
                        key, "has been disconnected.");
                broadcast(message);
    		}
    	}
    }
}