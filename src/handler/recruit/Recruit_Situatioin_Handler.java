package handler.recruit;
	import java.util.HashMap;
import java.util.List;
import java.util.Map;

	import javax.annotation.Resource;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;

	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.servlet.ModelAndView;

import dao.recruit.RecruitDao;
import dto.recruit.Recruit_LogDataBean;
import handler.Commandhandler;

	@Controller
	public class Recruit_Situatioin_Handler implements Commandhandler{

		 @Resource(name="recruitDao")
		 private RecruitDao recruitDao;
		
		@RequestMapping( "/recruit_situation" )
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			Map<String, Integer> temp = new HashMap<String, Integer>();

			List<Recruit_LogDataBean> recruit_situation = recruitDao.recruit_situation(temp);
						     
			map.put("recruit_situation", recruit_situation);

			map.put("page", "/FJ_RECRUIT/recruit_situation");
			
			return new ModelAndView("/FJ_MAIN/main", map);
		}
	}

