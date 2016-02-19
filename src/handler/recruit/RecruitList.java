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

import custom.CustomUtil;
import dao.recruit.RecruitDao;
import dto.recruit.RecruitDataBean;
import handler.Commandhandler;

@Controller
public class RecruitList implements Commandhandler {

	@Resource(name="recruitDao")
	private RecruitDao recruitDao;

	@RequestMapping("/recruitList")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		int pageSize = 5;			// 페이지 사이즈
		int pageBlock = 3;			// 페이지 블락
		
		int count = 0;				// 글 개수
		int pageNum = 0;			// 현재 페이지
		int start = 0;				// 글 시작 넘버
		int end = 0;				// 글 끝 넘버
		int number = 0;				// 글 넘버
		
		int pageCount = 0;			// 페이지 개수
		int startPage = 0;			// 시작 페이지
		int endPage = 0;			// 끝 페이지

		// 글 전체 개수 구하기
		count = recruitDao.getRecruitCount();
		
		// 현재 페이지 넘버 구하기
		if(CustomUtil.isNull(request.getParameter("pageNum"))){
			pageNum = 1;
		}else{
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		}
		
		// 현재 페이지가 마지막 페이지보다 클 때 현재 페이지를 마지막 페이지로
		pageCount = count / pageSize + (count%pageSize > 0 ? 1: 0);
		if(pageNum > pageCount) pageNum = pageCount;
		
		// 글 넘버 범위
		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;
		
		// 글 넘버링
		number = count - (pageNum - 1) * pageSize;
		
		// 시작, 끝 페이지
		startPage = (pageNum / pageBlock) * pageBlock + 1;
		if(pageNum % pageBlock == 0) startPage -= pageBlock;
		endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) endPage = pageCount;		
		
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("count", count);
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageCount", pageCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(count != 0){
			Map<String, Integer> tempMap = new HashMap<String, Integer>();
			tempMap.put("start", start);
			tempMap.put("end", end);
			List<RecruitDataBean> list = recruitDao.getRecruitList(tempMap);
			
			map.put("list", list);
		}
		
		map.put("menu", "recruit");
		map.put("page", "/FJ_RECRUIT/recruitList");
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
