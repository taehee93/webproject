<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<div id="mask"></div>
<div class="window">
    <form name="login" id="login" method="get" action="login">
        <fieldset>
            <legend class="hidden">로그인</legend>
            <h2>로그인</h2>
            <label for="id">관리자&nbsp;I&nbsp;D </label>
            <input type="text" name="id" id="id" placeholder="아이디입력">
            <label for="pw">관리자&nbsp;P&nbsp;W</label>
            <input type="password" name="pw" id="pw" placeholder="password입력">
            <a href="login" id="loginok">로그인</a>
        </fieldset>
    </form>
    <input type="button" value="X" class="close">
</div>