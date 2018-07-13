package com.myportfolio.myapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.myportfolio.proc.Process;
import com.myportfolio.proc.ToDate;
import com.myportfolio.proc.UtilFile;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	Process proc = new Process();
	ToDate td = new ToDate();
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	//메인
	@RequestMapping("/test")
	public String test(HttpSession session, Model model) {
		String manager_name = (String) session.getAttribute("session_name");
		model.addAttribute("manager_name", manager_name);
		return "test";
	}
	
	//식당 추가폼
	@RequestMapping("/test_addeatery")
	public String test_addeatery() {
		return "test_addeatery";
	}
	
	//데이터베이스에 식당 추가
	@RequestMapping("/eateryinsert")
	public String eateryinsert(HttpServletRequest request,@RequestParam("file1") MultipartFile files) throws IOException {
		UtilFile uf = new UtilFile();
		String file_name = uf.create(files.getOriginalFilename(),files.getBytes());
		String eatery = request.getParameter("title");
		String eatery_kind = request.getParameter("eatery_kind");
		String phon = request.getParameter("phon");
		String business_hours = request.getParameter("business_hours");
		String t_contents = request.getParameter("t_contents");
		String daumaddress = request.getParameter("daumaddress");
		String reg_date = td.todate();
		
		String query = "insert into eaterylist(food_code,eatery,cont,phon,business_hours,address,reg_date,file_name) values(";
		query += " '"+eatery_kind+"', ";
		query += " '"+eatery+"', ";
		query += " '"+t_contents+"', ";
		query += " '"+phon+"', ";
		query += " '"+business_hours+"', ";
		query += " '"+daumaddress+"', ";
		query += " '"+reg_date+"', ";
		query += " '"+file_name+"') ";
		int result = proc.executeInsert(query);
		
		if(result > 0) {
			return "redirect:test";
		}else {
			return "redirect:test_addeatery";
		}
	}
	
	//게시판
	@RequestMapping("/test_news")
	public String test_news() {
		return "test_news";
	}
		
	//사진
	@RequestMapping("/test_poto")
	public String test_poto() {
		return "test_poto";
	}
	
	//관리자 로그인
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	public void login(HttpServletRequest request,HttpSession session,HttpServletResponse response) {
		String manager_id = request.getParameter("user_id");
	    String manager_pw = request.getParameter("user_pw");
	    String personJson="null";
	    
	    if(manager_id.equals("manager") && manager_pw.equals("1234")){
		    session.setAttribute("session_name","manager");
		    session.setMaxInactiveInterval(60*60*3);
		    personJson = "{\"loginok\":\"success\"}";
	   }else {
		   personJson = "{\"loginok\":\"fail\"}";
	   }
	    
	    try {
	        response.getWriter().print(personJson);
	    } catch (IOException e) {
	        e.printStackTrace();
	    }   
	}
	
	@RequestMapping("/logout")
	public void logout(HttpSession session,HttpServletResponse response) throws IOException {
		session.setAttribute("session_name","");
		PrintWriter writer= response.getWriter();
		writer.println("<script type='text/javascript'>");
        writer.println("window.onload = function(){alert('logout'); location.href='test';}");//alert 이후, URL 이동
        writer.println("</script>"); 
        writer.flush();
	}
	
	//식당 페이지
	@RequestMapping("/test_eatery")
	public String test_eatery(Model model) {
		String query= "select file_name,eatery,num from eaterylist order by num desc";
		String[][] result = proc.executeQuerySearch2(query);
		
		model.addAttribute("list", result);
		return "test_eatery";
	}
	
	// 검색 페이지
	@RequestMapping("/test_search")
	public String test_search(HttpServletRequest request,Model model,HttpSession session) {
		String manager_name = (String) session.getAttribute("session_name");
		
		String contents="";
	    int total_count=0;
	    
	    String searchname = request.getParameter("mainsearch_in");
	    if(searchname == null) searchname = request.getParameter("headersearch_in");
	    
	    String query_eatery = "select eatery,left(cont,30),reg_date,num from eaterylist where eatery like '%"+searchname+"%' or cont like '%"+searchname+"%'";
	    String[][] result_eatery = proc.executeQuerySearch2(query_eatery);
	    
	    String query_review = "select title,left(cont,30),reg_date from review where title like '%"+searchname+"%' or cont like '%"+searchname+"%'";
	    String[][] result_review = proc.executeQuerySearch2(query_review);
	    
	    if(result_eatery != null && result_review == null) total_count=result_eatery.length;
	    if(result_eatery == null && result_review != null) total_count=result_review.length;
	    if(result_eatery != null && result_review != null) total_count=result_eatery.length+result_review.length;
	    
	    boolean reok = (result_eatery != null);
	    boolean rvok = (result_review != null);
	    
		model.addAttribute("manager_name", manager_name);
	    model.addAttribute("eatery", result_eatery);
	    model.addAttribute("review", result_review);
	    model.addAttribute("tc", total_count);
	    model.addAttribute("sn", searchname);
	    model.addAttribute("reok", reok);
	    model.addAttribute("rvok", rvok);
		
		return "test_search";
	}
	
	@RequestMapping("/eateryview")
	public String eateryview(HttpServletRequest request,Model model) {
		
		String num = request.getParameter("num");
	    String query= "select file_name,eatery,cont,phon,address,business_hours from eaterylist where num= '"+num+"'";
	    String[] result = proc.executeQuerySearch1(query);
		
	    model.addAttribute("result", result);
		return "eateryview";
	}
	
	@RequestMapping("/test_eatery_ko")
	public String test_eatery_ko(HttpServletRequest request) {
		
		String sel = request.getParameter("sel");
	    String search = request.getParameter("search");
		
		 String query_ko="";
		    if(search == null || search.equals("")) query_ko = "select eatery,cont,file_name,num from eaterylist where food_code='1' order by num desc";
		    else if(sel.equals("1")) query_ko = "select eatery,cont,file_name,num from eaterylist where food_code='1' and eatery like '%"+search+"%' order by num desc";
		    else if(sel.equals("2")) query_ko = "select eatery,cont,file_name,num from eaterylist where food_code='1' and cont like '%"+search+"%' order by num desc";
		    
		    String[][] result = proc.executeQuerySearch2(query_ko);
		
		return "test_eatery_ko";
	}
	
}
