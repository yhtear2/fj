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
	import dto.comp.CompDataBean;
	import handler.Commandhandler;

	@Controller
	public class CompResomeHandler implements Commandhandler {
		
		@Resource(name="compDao")
		private CompDao compDao;

		@RequestMapping("/comp_Resome")
		@Override
		public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			Map<String, Integer> temp = new HashMap<String, Integer>();

			List<CompDataBean> comp_resome1 = compDao.getComp_Resome(temp);
						     
			map.put("comp_resome1", comp_resome1);

			map.put("page", "/FJ_COMP/comp_Resome");
			
			return new ModelAndView("/FJ_MAIN/main", map);
		}
	}

