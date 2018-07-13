<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="test_header.jsp" %>
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote-lite.js"></script>
    <section id="contents">
       <h2 id="stitle" class="stitle">맛집추가</h2>
       <div class="sub-wrap">
           <form name="addeatery" id="eatery" method="post" enctype="multipart/form-data" action="eateryinsert">
              <input type="hidden" name="work_gubun" value="insert">
               <h2 class="hidden">입력은 식당명, 식당 종류,내용, 주소, 첨부파일 입니다.</h2>
               <fieldset>
                   <legend class="hidden">맛집 입력폼</legend>
                   <table class="write">
                       <caption class="hidden">맛집추가</caption>
                       <colgroup>
                           <col width="20%">
                           <col width="*">
                       </colgroup>
                       <tbody>
                           <tr>
                              <th>
                                  <label for="title">식당명</label>
                              </th>
                              <td>
                                  <input type="text" name="title" class="title" id="title">
                              </td>
                           </tr>
                            <tr>
                              <th>
                                  <label for="title">식당 종류</label>
                              </th>
                              <td>
                                <input type="radio" name="eatery_kind" value="1" class = "eatery_kind">한식
                                <input type="radio" name="eatery_kind" value="2" class = "eatery_kind">중식
                                <input type="radio" name="eatery_kind" value="3" class = "eatery_kind">일식
                                <input type="radio" name="eatery_kind" value="4" class = "eatery_kind">양식
                                <input type="radio" name="eatery_kind" value="5" class = "eatery_kind">기타
                              </td>
                           </tr>
                           <tr>
                              <th>
                                  <label for="phon">전화번호</label>
                              </th>
                              <td>
                                  <input type="text" name="phon" class="phon" id="phon">
                              </td>
                           </tr>
                           <tr>
                              <th>
                                  <label for="business_hours">영업시간</label>
                              </th>
                              <td>
                                  <input type="text" name="business_hours" class="business_hours" id="business_hours">
                              </td>
                           </tr>
                           <tr>
                              <th>
                                  <label for="summernote">내용</label>
                              </th>
                              <td>
                                  <div id="summernote" name="t_contents" ></div>
                                  <input type="hidden" name="t_contents">
                              </td>
                           </tr>
                           <tr>
                              <th>
                                  <label for="address">주소</label>
                              </th>
                              <td>
                                  <input type="text" name="daumaddress" id="address" placeholder="주소">
                                  <input type="button" onclick="test_DaumAddress()" value="주소 검색"><br>
                                  <div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
                              </td>
                           </tr>
                           <tr>
                              <th>
                                  <label for="file">첨부파일</label>
                              </th>
                              <td>
                                  <input type="file" name="file1" class="file" id="file">
                              </td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <input type="button" value="추가" class="btn" onClick = "javascript:formcheck()">
                                   <input type="button" value="이전" class="btn" onClick="javascript:history.back()">
                               </td>
                           </tr>
                       </tbody>
                   </table>
               </fieldset>
           </form>
       </div>

   </section>

   <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33b055bf065b4bbde08dc143ed1a26ed&libraries=services"></script>
    <script>
        $('#summernote').summernote({
        placeholder: '내용를 입력하세요.',
        tabsize: 2,
        height: 300,
        lang : 'ko-KR'
    });
       
     var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function test_DaumAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = fullAddr;
                
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open();
    }
       function formcheck(){
           if(addeatery.title.value == ""){
                alert("식당명을 입력해주세요.");
                document.addeatery.title.focus();
                return;
            }
           if(addeatery.daumaddress.value==""){
                alert("주소를 입력해주세요.");
                document.addeatery.daumaddress.focus();
                return;
           }
           var contents = $('#summernote').summernote('code');
            document.addeatery.t_contents.value= contents;
           document.addeatery.submit();
       }
    </script>
<%@ include file="test_footer.jsp" %>




