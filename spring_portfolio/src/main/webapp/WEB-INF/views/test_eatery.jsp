<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
<%@ include file="test_header.jsp" %>

   <style>
       footer {position: absolute;left: 0; bottom: 0; width: 100%;}    
</style>
    <div class="eatery_list">
        <p><h2>추가된 식당</h2></p>
        <c:forEach items="${eatery}" var="eatery">
        <a href="eateryview?num=${eatery.num }">
        <ul>
            <li class="eatery_img"><img src="file_room/${eatery.file_name }"></li>
            <li><h2>${eatery.eatery }</h2></li>
        </ul>
        </a>
        </c:forEach>
    </div>
    <aside id="side">
	           <h2 class="title">식당종류</h2>
	           <ul>
	               <li><a href="test_eatery_ko">한식</a></li>
	               <li><a href="test_eatery_ch">중식</a></li>
	               <li><a href="test_eatery_jap">일식</a></li>
	               <li><a href="test_eatery_usa">양식</a></li>
	               <li><a href="test_eatery_etc">기타</a></li>
	           </ul>
	       </aside>
<%@ include file="test_footer.jsp" %>