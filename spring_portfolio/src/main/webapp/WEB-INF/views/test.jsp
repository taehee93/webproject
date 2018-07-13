<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="test_header.jsp" %>
    <div id="slider">
        <img src="img/food01.jpg" alt="음식사진1" class="mySlides">
        <img src="img/food02.jpg" alt="음식사진2" class="mySlides">
        <img src="img/food03.jpg" alt="음식사진3" class="mySlides">
    </div>
    <form name="ts" action="test_search">
        <div class="total_search">
            <input type="text" name="mainsearch_in">
            <a href="javascript:test_search()" ><i class="xi-search xi-4x"></i></a>
        </div>
    </form>
    <script>
        var slideIndex = 0;
        carousel();
        function carousel() {
            var i;
            var x = document.getElementsByClassName("mySlides");
            for (i = 0; i < x.length; i++) {
              x[i].style.display = "none"; 
            }
            slideIndex++;
            if (slideIndex > x.length) {slideIndex = 1} 
            x[slideIndex-1].style.display = "block"; 
            setTimeout(carousel, 5000); 
        }
    </script>
<%@ include file="test_footer.jsp" %>
