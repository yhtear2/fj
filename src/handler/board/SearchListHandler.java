package handler.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.board.BoardDao;
import dto.board.BoardDataBean;
import handler.Commandhandler;

@Controller
public class SearchListHandler implements Commandhandler {

	@Resource(name="boardDao")
	private BoardDao boardDao; 
	
	@RequestMapping("/searchboardlist") 
	@Override
	public ModelAndView process(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		Map<String, Object> map = new HashMap<String, Object>();
		
		request.setCharacterEncoding("utf-8");
		
		String category = request.getParameter("category");		// 카테고리 검색
		String tag = request.getParameter("tag");				// 태그를 누르면 검색
		String search = request.getParameter("search");			// 검색입력을 통한 검색
		String sort = request.getParameter("sort");				// 최신, 추천, 댓글 ,조회 검색
		
		int pageSize = 10;     // 페이지 레코드 수 
		int pageBlock = 3;     // 페이지 번호 수 
	
		int count = 0;
		String pageNum = null;
		int currentPage = 0;
		int start = 0;
		int end = 0;
		int number = 0;
		
		int pageCount = 0;
		int startPage = 0;
		int endPage = 0;
	 
		count = boardDao.getCount(); 
		
		pageNum = request.getParameter( "pageNum" );
		if( pageNum == null ) 
		{
			pageNum = "1";
		}
		
		currentPage = Integer.parseInt( pageNum );
		pageCount = count / pageSize + ( count%pageSize > 0 ? 1 : 0 );
		if( currentPage > pageCount ) 
		{
			currentPage = pageCount;
			pageNum = String.valueOf( pageCount );
		}
		
		start = ( currentPage - 1 ) * pageSize + 1;
		end = start + pageSize - 1;
		  
		number = count - ( currentPage - 1 ) * pageSize;
			
		startPage = ( currentPage / pageBlock ) * pageBlock + 1;
					//  ( 19 / 10 ) * 10 + 1		11
					
		if( currentPage % pageBlock == 0 ) startPage -= pageBlock;				
		endPage = startPage + pageBlock - 1;
					// 	11 + 10 - 1					20
					      
		if( endPage > pageCount ) endPage = pageCount;			
	
		 
		
		if( count != 0 ) {  
			// BoardDBBean 의 getArticles 부분에서 int 값이 두개이상이므로 매핑을 건다 
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put( "start", start );
			map2.put( "end", end );  
			
			
			if( category != null){
				map2.put("category", category);
				List<BoardDataBean> list =  boardDao.getCategorySearchArticles(map2);
				map.put( "list", list );
			} else if ( tag != null){
				tag = "%" + tag + "%";
				map2.put("tag", tag);
				List<BoardDataBean> list =  boardDao.getTagSearchArticles(map2);
				map.put( "list", list );
			} else if ( search != null){
				search = "%" + search + "%";
				map2.put("search", search);
				List<BoardDataBean> list =  boardDao.getSearchSearchArticles(map2);
				map.put( "list", list );
			} else if ( sort != null ){
				if( sort.equals("board_num")){
					List<BoardDataBean> list =  boardDao.getBoard_numSearchArticles(map2);
					map.put( "list", list );	
				} else if( sort.equals("recom_count")){
					List<BoardDataBean> list =  boardDao.getRecom_countSearchArticles(map2);
					map.put( "list", list );
				} else if( sort.equals("re_count")){
					List<BoardDataBean> list =  boardDao.getRe_countSearchArticles(map2);
					map.put( "list", list );
				} else if( sort.equals("read_count")){
					List<BoardDataBean> list =  boardDao.getRead_countSearchArticles(map2);
					map.put( "list", list );
				}
			}
		}
		
		map.put( "sort", sort );
		map.put( "pageBlock", pageBlock );
		map.put( "count", count );
		map.put( "number", number );
		map.put( "pageNum", pageNum );
		map.put( "currentPage", currentPage );
		map.put( "startPage", startPage );
		map.put( "endPage", endPage );
		map.put( "pageCount", pageCount );
		map.put( "tag", tag );
		
		
		map.put("menu", "board");
		map.put("page", "/FJ_BOARD/searchboardlist");  
		return new ModelAndView("/FJ_MAIN/main", map); 

	}

}
