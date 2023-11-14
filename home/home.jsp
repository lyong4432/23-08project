<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>쉐이디 프렌즈</title>
    <style>
    .c_font { text-align: center;}
    /* 글꼴 */
   @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}	body {
	font-family: 'Pretendard-Regular';
}
    </style>
    
</head>
<body> 

<%@ include file = "header_footer/header2.jsp" %>


    
<div class="container" > <!-- style="background-color: rgba(96, 189, 242, 0.151); padding: 30px;" -->
    <div class="row">
        <!-- 1번열 -->
        <div class="col-lg-8">
            <!-- 지도 -->
            <div id="map" style="width:100%;height:600px;" class="card border-light mb-3"></div>
            <!-- 지도 밑 -->
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-4">
                        <div>
                            
                            <p>&nbsp;🔴&nbsp;펼침&nbsp; |&nbsp; 🔵&nbsp;접힘</p>
                        </div>
                    </div>
                    <div class="col-lg-8"  style="margin-bottom: 30px;">
                        <div class="accordion accordion-flush" id="accordionFlushExample"> 
                            <div class="accordion-item">
                              <h2 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                  펼침 기준
                                    </button>
                                </h2>
                                <div id="flush-collapseOne" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                    <div class="accordion-body">

                                        <div class="card border-light mb-3">
                                            <div class="card-body">
                                                <p class="card-text">펼침 :
                                                    <b>
                                                        <span>온도 15 ℃</span>
                                                    </b>
                                                    이상</p>
                                                <p class="card-text">접힘 :
                                                    <b>
                                                        <span>습도 90 %</span>
                                                    </b>
                                                    이상</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- 2번 열 -->
        <div class="col-lg-4">
            
                <div class="card text-bg-light mb-3">

                    <div class="card-header c_font">현재 시간</div>
                    <div class="card-body">
                        <div class="card-text c_font">
                            <span id="current-datetime"></span>
                        </div>
                    </div>
                </div>
                <br>
                    <div class="card text-bg-light mb-3">
                        <div class="card-header c_font">
                             <span id="markerContent" style="display: none;"></span>
                            
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-4" style="visibility: hidden;">hidden</div>
                                <div class="col-lg-4">
                                    <br>
                                    <p>온도 : <span>00</span>&nbsp;℃</p>
                                    <p>습도 : <span>00</span>&nbsp;%</p>
                                        <br>
                                    <p>상태 :
                                        <span>🔴</span>
                                    </p>
                                    <br>
                                </div>
                                <div class="col-lg-4" style="visibility: hidden;">hidden</div>
                            </div>
                            <div class="card mb-3" style="align-items: center;">
                                <div class="small c_font">상세 정보 바로가기</div>
                                <div class="card-body" >
                                  	<div><a href="/board/shade_info_home" class="btn btn-primary " role="button" style="margin: 3px;">그늘막 정보</a>
                                    <a href="/board/shade_hist_home" class="btn btn-success " role="button" style="margin: 3px;">그늘막 이력</a></div>
                                    
                                   <div><a href="/board/shade_info_regist" class="btn btn-danger" role="button" style="margin: 3px;">그늘막 등록</a>
                                    <a href="/complaints/registerComplaints" class="btn btn-warning " role="button" style="margin: 3px;">&nbsp;&nbsp;민원 등록&nbsp;&nbsp;</a></div>
                                 	 </div>
                            </div>
                            
                        </div>
                        <div class="card-footer c_font">
                            ⏱️&nbsp;<span id="rounded-time"></span>&nbsp;기준
                            </div>
                    </div>
                    <div>
                        <!-- 위경도 확인하려고 임시로 만듦-->
                        <p>위도 :
                            <span id="lat"></span>
                        </p>
                        <p>경도 :
                            <span id="lng"></span>
                        </p>
                    </div>
				
                </div>
            </div>
        </div>

<!-- 스크립트들 -->    
<!-- 부트스트랩-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey={api키}"></script>
                    <script>
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = { 
                            center: new kakao.maps.LatLng(36.80027555059013, 127.07492944979029 ), // 지도의 중심좌표 : 선문대 
                            level: 3 // 지도의 확대 레벨
                        };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption); 
                    </script>
                    <!-- 지도에서 위도 , 경보 얻기 -->
                    <script>
                        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
            
                        // 클릭한 위도, 경도 정보를 가져옵니다 
                        var latlng = mouseEvent.latLng;
                        
                        var message1 = latlng.getLat();
                        var message2 = latlng.getLng();
                        
                        var resultDiv1 = document.getElementById('lat'); 
                        var resultDiv2 = document.getElementById('lng'); 
                        resultDiv1.innerHTML = message1;
                        resultDiv2.innerHTML = message2;
                        
                    });
                    </script>
<!-- 시계 -->
<script>
    function updateDateTime() {
      var currentDateTime = new Date();
      var currentDate = currentDateTime.toLocaleDateString();
      var currentHours = currentDateTime.getHours();
      var currentMinutes = currentDateTime.getMinutes();
      var currentSeconds = currentDateTime.getSeconds();

      var ampm = currentHours >= 12 ? '오후' : '오전';
      var twelveHours = currentHours % 12 || 12;

      var currentTimeString = ampm + ' ' +twelveHours.toString().padStart(2, '0') + ':' +
                             currentMinutes.toString().padStart(2, '0') + ':' +
                             currentSeconds.toString().padStart(2, '0');
  
   
      var roundedMinutes = Math.floor(currentMinutes / 10) * 10;
      var roundedTimeString = ampm + ' ' +twelveHours.toString().padStart(2, '0') + ':' +
                             roundedMinutes.toString().padStart(2, '0') ;
  
      document.getElementById('current-datetime').innerHTML = currentDate + ' ' + currentTimeString;
      document.getElementById('rounded-time').innerHTML = roundedTimeString;
    }
  
    // 1초마다 현재 날짜와 시간, 10분 단위 시간 갱신
    setInterval(updateDateTime, 1000);
  </script>
 <!-- 마커 표시 -->
 <script>
 var positions = [
 {
     content: '<div>선문대학교 원화관</div>', 
     latlng: new kakao.maps.LatLng(36.80015698035271, 127.07715917352613)
 },
 {
     content: '<div>선문대학교 본관</div>', 
     latlng: new kakao.maps.LatLng(36.800284540527635, 127.0749630742706)
 },
 {
     content: '<div>삼봉산</div>', 
     latlng: new kakao.maps.LatLng(36.803708906138844, 127.07474229704742)
 },
 {
     content: '<div>다이소</div>',
     latlng: new kakao.maps.LatLng(36.79723678695774, 127.06284771821201)
 },
 {
     content: '<div>탕정중학교</div>',
     latlng: new kakao.maps.LatLng(36.80278251434578, 127.06401202972974)
 },
 {
     content: '<div>스타벅스</div>',
     latlng: new kakao.maps.LatLng(36.79864038051847, 127.05820439144942)
 }




];

for (var i = 0; i < positions.length; i ++) {
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     map: map, // 마커를 표시할 지도
     position: positions[i].latlng // 마커의 위치
 });

// 클로저를 활용하여 해당 마커의 content를 페이지의 다른 부분에 표시합니다.
kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i].content));
  }

  // 클로저 함수를 생성하여 해당 content를 페이지의 다른 부분에 표시하는 함수
  function makeClickListener(content) {
    return function () {
      // content를 페이지의 다른 부분에 표시합니다.
      var markerContentElement = document.getElementById('markerContent');
      markerContentElement.innerHTML = content;
      markerContentElement.style.display = 'block';
    };
  }
</script>



<%@ include file = "header_footer/footer.jsp" %>
</body>
</html>
