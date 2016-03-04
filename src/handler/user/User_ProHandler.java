package handler.user;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.user.UserDataBean;
import handler.Commandhandler;
import dao.user.UserDao;

@Controller
public class User_ProHandler implements Commandhandler {
	
	@Resource( name="userDao" )
	private UserDao dao;
	
	@RequestMapping( "/resome_Pro" )	
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		Map<String, Object> map = new HashMap<String, Object>();
		
		request.setCharacterEncoding( "utf-8" );
		
		String saveDir = request.getServletContext().getRealPath("/") + "images";
		MultipartRequest multi = new MultipartRequest(request,saveDir,1024*1024*15,"UTF-8",new DefaultFileRenamePolicy());
		String imageFileName = multi.getFilesystemName("input_file");
		String projectFile = multi.getFilesystemName("project");
		
		String resome_title = multi.getParameter("resome_title");
		String email = multi.getParameter("email");
		String eng_name = multi.getParameter("eng_name");
		String kor_name = multi.getParameter("kor_name");
		String birth = multi.getParameter("birth");


		String skill = multi.getParameter("skill");
		int want_salary = Integer.parseInt(multi.getParameter("want_salary"));
		String project = multi.getParameter("project");
		String army = null;
		String army1 =  multi.getParameter("army1");
		String army2 = (String) multi.getParameter("army2");
		String army3 = multi.getParameter("army3");
		String army4 = multi.getParameter("army4");
		String army5 = multi.getParameter("army5");
		String army6 = multi.getParameter("army6");
		String army7 = multi.getParameter("army7");

		
		army = army1 + "/" + army2 + "/" + army3 + "/" + army4 + "/" + army5 + "/" + army6 + "/" + army7;
		
		String address = null;
		String address1 = multi.getParameter("address1");
		String address2 = multi.getParameter("address2");
		
		address = address1 + " " + address2;
		
		UserDataBean dto = new UserDataBean();

		dto.setResome_title(resome_title);
		dto.setEmail(email);
		dto.setEng_name(eng_name);
		dto.setKor_name(kor_name);
		dto.setBirth(birth);
		dto.setAddress(address);
		dto.setSkill(skill);
		dto.setWant_salary(want_salary);
		dto.setProject(project);
		dto.setReg_date(new Timestamp(System.currentTimeMillis()));
		dto.setLast_date(new Timestamp(System.currentTimeMillis()));		
		
		String license = "";

		String license1[] = null;
		String license2[] = null;
		String license3[] = null;

		String lic1[] = multi.getParameterValues("license1");
		String lic2[] = multi.getParameterValues("license2");
		String lic3[] = multi.getParameterValues("license3");

/*		int p = Integer.parseInt( multi.getParameter( "license_cnt" ));

		System.out.println(p);
		
		
		license1 = new String[p];
		license2 = new String[p];
		license3 = new String[p];*/
		
		
		for( int i = 0 ; i <= lic1.length; i++ ){

				license1[i] = (lic1[i]);
				license2[i] = (lic2[i]);
				license3[i] = (lic3[i]);

		}

		for(int i=1; i<=lic1.length; i++) {
			license += license1[i] + "-" +license2[i] + "-" + license3[i] + "/";
		}
		dto.setLicense(license);
		
		// tel
		String tel = null;
		String tel1 = multi.getParameter( "tel1" );
		String tel2 = multi.getParameter( "tel2" );
		String tel3 = multi.getParameter( "tel3" );
		
		if( ! tel1.equals( "" ) && ! tel2.equals( "" ) && ! tel3.equals( "" ) ) {
			tel = tel1 + "-" + tel2 + "-" + tel3;
		}	
		dto.setTel( tel );
				
		dto.setArmy(army);
		
		String resome_image = "library/images/gallery/" + imageFileName;
		dto.setPhoto(resome_image);
	
		String resome_project = "library/portfolio/" + projectFile;
		dto.setProject(resome_project);

		int result = dao.insertArticle( dto );	
		
		map.put("result", result);
		map.put("page", "/FJ_USER/resome_Pro");

		return new ModelAndView("/FJ_MAIN/main", map);
		
	}
}






