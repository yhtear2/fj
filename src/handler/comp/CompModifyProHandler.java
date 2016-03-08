package handler.comp;

import java.sql.Timestamp;
import java.util.HashMap;
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
public class CompModifyProHandler implements Commandhandler {
	
	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/compModifyPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 맵으로 넘기기 위해서 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 바구니를 만들어 넘기기 위해 바구니 받아오기
		CompDataBean dto = new CompDataBean();
		
		request.setCharacterEncoding("UTF-8");
		// 바구니 셋터에 입력 시작!!
		dto.setEmail(request.getSession().getAttribute("memId").toString());				// 이메일
		dto.setCeo(request.getParameter("ceo"));											// 대표자명
		dto.setComp_part(request.getParameter("comp_part"));								// 기업구분
		dto.setTel(request.getParameter("tel_1") + "-" + request.getParameter("tel_2"));	// 전화번호
		dto.setZipcode(request.getParameter("zipcode"));									// 우편번호
		dto.setAddress(request.getParameter("address"));									// 주소
		dto.setContent(request.getParameter("content"));									// 회사 소개
		dto.setCapital(request.getParameter("capital"));									// 자본금
		dto.setComp_type(request.getParameter("comp_type"));								// 기업업종
		dto.setIncharge(request.getParameter("incharge"));									// 담당자
		dto.setComp_reg_date(request.getParameter("comp_reg_date"));						// 회사 창립일
		dto.setYear_sale(request.getParameter("year_sale"));								// 연매출
		dto.setEmp_count(Integer.parseInt(request.getParameter("emp_count")));				// 사원수
		dto.setLast_date(new Timestamp( System.currentTimeMillis()));						// 수정 날짜
		
		//DB 처리
		int result = compDao.updateComp(dto);
		
		// 페이지로 데이터 넘기기
		map.put("result", result);
		
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compModifyPro");
		return new ModelAndView("/FJ_MAIN/main", map);
	}

}
