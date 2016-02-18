package handler.message;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.message.MessageDao;
import dto.message.MessageDataBean;
import handler.Commandhandler;

@Controller
public class MessageListHandler implements Commandhandler {
	
	@Resource(name="messageDao")
	private MessageDao dao;

	@RequestMapping("/messageList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 변수 선언
		int count = 0;
		//String email = (String)request.getSession().getAttribute("memId");
		String email = "recipient@dsajfkl.com";
		
		// DB접속해서 데이터 받아오기
		count = dao.getCount();
		if( count != 0 ){
			ArrayList<MessageDataBean> list = dao.getList(email);
			map.put("list", list);
		}
		
		map.put("page", "/FJ_MESSAGE/messageList");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
