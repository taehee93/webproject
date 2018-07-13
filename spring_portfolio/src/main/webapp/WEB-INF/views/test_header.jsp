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
     <script type="text/javascript" src="js/test_header.js"></script>
     <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
    <title>맛집탐방</title>
</head>
<body>
    <header>
        <a href="test">태희's 맛집</a>
        <div id="header_menu">
            <ul>
                <li>
                    <a href="test_eatery">식당</a>
                    <ul class="submenu">
                        <li><a href="test_eatery_ko">한식</a></li>
                        <li><a href="#">중식</a></li>
                        <li><a href="#">일식</a></li>
                        <li><a href="#">양식</a></li>
                        <li><a href="#">기타</a></li>
                    </ul>
                </li>
                <li>
                    <a href="test_news">게시판</a>
                    <ul class="submenu">
                        <li><a href="test_news">새소식</a></li>
                        <li><a href="test_review">리뷰</a></li>
                    </ul>
                </li>
                <li>
                    <a href="test_poto">사진</a>
                    <ul class="submenu">
                        <li><a href="test_poto">사진</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="search_menu">
            <form name="hs" action="test_search">
                <input type="text" name="headersearch_in">
                <a href="javascript:test_search_hs()" ><i class="xi-search xi-3x"></i></a>
            </form>
        </div>
        <div id="header_smenu">
            <a href="#" id="search"><i class="xi-search xi-3x"></i></a>
            <a href="#" id="lenguage"><i class="xi-globus xi-3x"></i></a>
            <select name="lenguage_list" class="lenguage_list">
                <option value="total" selected="selected">한국</option>
                <option value="ko">日本</option>
                <option value="ch">中國</option>
                <option value="jap">English</option>
            </select>
            <c:if test="${manager_name ne ''}">
            <a href="#" id="add_eatery"><i class="xi-plus xi-3x"></i></a>
            <ul class="submenu_add">
                <li><a href="test_addeatery">식당추가</a></li>
                <li><a href="test_addpoto.jsp">사진추가</a></li>
                <li><a href="test_addnews.jsp">새소식</a></li>
            </ul>
            </c:if>
        </div>
    </header>
    <%@ include file="test_manager.jsp" %>