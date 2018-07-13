<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="css/reset.css" />	
        <link rel="stylesheet" type="text/css" href="css/testcss.css" />
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">	
         <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
         <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
        <title>맛집탐방</title>
       
    </head>
    <body>
        <header id="search_header">
            <a href="test">태희's 맛집</a>
            <form name="searchfrom">
                <input type="text" name="mainsearch_in" class="search_total" value="${sn }">
                <button class="search_btn">검색</button>
           </form>
        </header>
           <p>검색 결과 ${tc }개</p>
           <c:if test="${reok}">
            <div>
               <p class="search_title">식당</p>
                <ul>
                   <c:forEach items="${eatery}" var="eatery">
                        <a href="eateryview?num=${eatery[3] }" class="go_view">
                            <li><h2>${eatery[0] }</h2></li>
                            <li>${eatery[1] }</li>
                            <li>${eatery[2] }</li>
                        </a>
                    </c:forEach>    
                </ul>
            </div>
            </c:if>
            <c:if test="${rvok}">
            <div>
               <p class="search_title">리뷰</p>
                <ul>
                    <c:forEach items="${review}" var="review">
                        <a href="javascript:void(0)" class="go_view">
                            <li><h2>${review[0] }</h2></li>
                            <li>${review[1] }</li>
                            <li>${review[2] }</li>
                        </a>
                    </c:forEach>
                </ul>
            </div>
            </c:if>
<%@ include file="test_footer.jsp" %>