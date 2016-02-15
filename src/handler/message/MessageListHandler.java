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
import handler.Commandhandler;

@Controller
public class MessageListHandler implements Commandhandler {
	
	@Resource(name="messageDao")
	private MessageDao dao;

	@RequestMapping("/messageList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int count = 0;
		
		count = dao.getCount();
		
		if( count != 0 ){
			
		}
		map.put("page", "/FJ_MESSAGE/messageList");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
