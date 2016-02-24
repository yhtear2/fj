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

import custom.CustomUtil;
import dao.comp.CompDao;
import dto.comp.CompDataBean;
import handler.Commandhandler;

@Controller
public class CompInputProHandler implements Commandhandler {

	@Resource(name="compDao")
	private CompDao compDao;

	@RequestMapping("/compInputPro")
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		CompDataBean dto = new CompDataBean();
		dto.setEmail(request.getSession().getAttribute("email").toString());								// 이메일
		dto.setCeo(request.getParameter("ceo"));															// 대표자명
		dto.setComp_type(request.getParameter("comp_type"));												// 기업구분
		dto.setTel(request.getParameter("tel1") + "-" + request.getParameter("tel2"));						// 전화번호
		
		// 임시처리
		String address = request.getParameter("address");
		String zipcode = null;
		
		if(!CustomUtil.isNull(address)){
			zipcode = address.split("/")[0];
			dto.setZipcode(zipcode);																		// 우편번호
			
			
			address = address.split("/")[1] + request.getParameter("address_detail");
			dto.setAddress(address);																		// 주소
		}
		dto.setInfo(request.getParameter("info"));															// 소개
		dto.setCapital(request.getParameter("capital"));													// 자본금
		if(!CustomUtil.isNull(request.getParameter("year_sale"))){											// 연매출
			dto.setYear_sale(Integer.parseInt(request.getParameter("year_sale")));
		}
		if(!CustomUtil.isNull(request.getParameter("emp_count"))){											// 사원수
			dto.setEmp_count(Integer.parseInt(request.getParameter("emp_count")));
		}
		if(!CustomUtil.isNull(request.getParameter("like_count"))){											// 좋아요수
			dto.setLike_count(Integer.parseInt(request.getParameter("like_count")));
		}
		if(!CustomUtil.isNull(request.getParameter("comp_reg_date"))){										// 회사 설립일
			dto.setComp_reg_date(Timestamp.valueOf(request.getParameter("comp_reg_date").toString()));
		}
		
		/*
		private String email;				// 이메일
		private String ceo;					// 대표자명
		private String comp_part;			// 기업구분
		private String tel;					// 전화번호
		private String zipcode;				// 우편번호
		private String address;				// 주소
		private String info;				// 회사 소개
		private String capital;				// 자본금
		private String comp_type;			// 기업 업종
		private int year_sale;				// 연 매출
		private int emp_count;				// 사원 수
		private int like_count;				// 좋아요 수
		private Timestamp comp_reg_date;	// 회사 설립일
		private Timestamp reg_date;			// 등록일
		private Timestamp last_date;		// 수정일
		*/
		
		
		int result = compDao.updateComp(dto);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", "comp");
		map.put("page", "/FJ_COMP/compInputPro");
		map.put("result", result);
		
		
		
		
		
		return new ModelAndView("/FJ_MAIN/main", map);
	}
}
