<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="test_header.jsp" %>
<%
    String sel = pwk.checkNull(request.getParameter("sel"));
    String search = pwk.checkNull(request.getParameter("search"));
    
    String tdCount = "4";
    int is_count = 5;
   
%>
<%@ include file="page_technique/page_var.jsp" %>
<div class="sub-contents">
       
	       <section id="contents">
	           <h2 id="stitle" class="stitle">한식</h2>
	           <div class="sub-wrap">
                   <div class="board-count">
                       <p>전체<span class="color">
                       <%
                       if(result != null) out.print(result.length);
                       else out.print("0");
                       %>건</span>&nbsp;&nbsp;현제페이지 <span class="color"><%=current_page%> / <%=total_page%></span></p>
                   </div>
                   <div class="board-search">
                       <form name="search_ko" action="test_eatery_ko">
                           <fieldset>
                               <legend class="hidden">검색</legend>
                               <label for="sel" class="hidden">검색종류선택</label>
                               <select name="sel" id="sel" class="sel">
                                   <option value="1">식당명</option>
                                   <option value="2">내용</option>
                               </select>
                               <label for="prosearch" class="hidden">검색단어입력</label>
                               <input type="text" name="search" id="prosearch"><a href="javascript:search_ko.submit();" class="btn-search"><i class="xi-search xi-1x"></i><span>검색버튼</span></a>
                           </fieldset>
                       </form>
                   </div>
                   <div class="board-list">
                       <ul>
                          <%@ include file="page_technique/page_top.jsp" %>
                           <li>
                           <a href='eateryview?num=<%=result[k][3]%>'><p><img src='file_room/<%=result[k][2]%>'></p><span class='title'><%=result[k][0]%></span><span class='txt'><%=result[k][1]%></span></a>
                           </li>
                          <%@ include file="page_technique/page_bottom.jsp" %> 
                       </ul>
                   </div>
	           </div>
	           
	       </section>
	       
	       <aside id="side">
	           <h2 class="title">식당종류</h2>
	           <ul>
	               <li class="active"><a href="test_eatery_ko">한식</a></li>
	               <li><a href="test_eatery_ch">중식</a></li>
	               <li><a href="test_eatery_jap">일식</a></li>
	               <li><a href="test_eatery_usa">양식</a></li>
	               <li><a href="test_eatery_etc">기타</a></li>
	           </ul>
	       </aside>
	       
	    </div>

<%@ include file="test_footer.jsp" %>