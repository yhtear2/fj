package handler.comp;

	import java.util.HashMap;
import java.util.List;
import java.util.Map;

	import javax.annotation.Resource;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import org.springframework.stereotype.Controller;
	import org.springframework.web.bind.annotation.RequestMapping;
	import org.springframework.web.servlet.ModelAndView;
	import dao.comp.CompDao;
import dao.recruit.RecruitDao;
import dto.comp.CompDataBean;
import dto.recruit.RecruitDataBean;
import dto.recruit.Recruit_LogDataBean;
import handler.Commandhandler;

	@Controller
	public class CompResomeHandler implements Commandhandler {
		
		@Resource(name="recruitDao")
		private RecruitDao recruitDao;
		
		@RequestMapping("/comp_Resome")
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			Map<String, Integer> temp = new HashMap<String, Integer>();

			List<RecruitDataBean> comp_resome = recruitDao.getComp_Resome(temp);
						     
			map.put("comp_resome", comp_resome);

			map.put("page", "/FJ_COMP/comp_Resome");
			
			return new ModelAndView("/FJ_MAIN/main", map);
		}
	}

