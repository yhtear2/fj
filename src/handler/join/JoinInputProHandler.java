package handler.join;

import java.sql.Timestamp;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.join.JoinDao;
import dto.join.JoinDataBean;
import handler.Commandhandler;


@Controller
public class JoinInputProHandler implements Commandhandler {
	
	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping( "/joinInputPro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding( "utf-8" );
	
		JoinDataBean dto = new JoinDataBean();
		
		dto.setEmail( request.getParameter("email") );
		dto.setPasswd( request.getParameter("passwd") );
		dto.setName( request.getParameter("name") );
		dto.setMember_flag( Integer.parseInt( request.getParameter("member_flag") ) );
		dto.setReg_date( new Timestamp( System.currentTimeMillis() ) );

		int result = dao.insertMember( dto );	
		
		request.setAttribute( "result", result );
		
		return new ModelAndView( "/FJ_JOIN/inputPro" );
	}
}









