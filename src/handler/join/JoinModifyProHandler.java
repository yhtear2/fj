package handler.join;

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
public class JoinModifyProHandler implements Commandhandler {

	@Resource( name="joinDao" )
	private JoinDao dao;
	
	@RequestMapping( "/joinModifyPro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		JoinDataBean dto = new JoinDataBean();
		dto.setPasswd( request.getParameter( "passwd" ) );
		dto.setEmail( (String) request.getSession().getAttribute( "memId" ) );
			
		int result = dao.updateMember( dto );	

		request.setAttribute( "result", result );
		
		return new ModelAndView( "/FJ_JOIN/modifyPro" );
	}
}










