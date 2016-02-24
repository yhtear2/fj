package handler.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



import handler.Commandhandler;

@Controller
public class User_comfirm_skillHandler implements Commandhandler{

	@RequestMapping( "/confirm_skill" )
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return new ModelAndView( "/FJ_USER/confirm_skill" );
	}
}
