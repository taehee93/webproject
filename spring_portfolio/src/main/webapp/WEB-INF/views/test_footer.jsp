<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c' %>
    <footer>
        Copyright TeaHee. ALL RIGHTS REVERSED.
        <c:if test="${manager_name eq ''}">
        <a href="#" class="manager">관리자</a>
        </c:if>
        <c:if test="${manager_name ne ''}">
        <a href="logout" class="managerlogout">관리자로그아웃</a>
        </c:if>
    </footer>
</body>
</html>