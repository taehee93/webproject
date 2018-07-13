<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="test_header.jsp" %>
<section class="container">
    <h2 id="stitle" class="stitle">${result[1] }</h2>
    <div id="map" style="width:1200px;height:500px;"></div>
    <table class="eatery_cont">
        <tr>
            <th>전화번호</th>
            <td>${result[3] }</td>
        </tr>
        <tr>
            <th>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소</th>
            <td>${result[4] }</td>
        </tr>
        <tr>
            <th>영업시간</th>
            <td>${result[5] }</td>
        </tr>
    </table>
    <div class = "view_contents">
        ${result[2] }
    </div>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33b055bf065b4bbde08dc143ed1a26ed&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch('${result[4] }', function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {
        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${result[1] }</div>'
        });
        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});    
</script>
<%@ include file="test_footer.jsp" %>