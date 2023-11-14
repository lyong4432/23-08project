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
        .star { 
            color:crimson;
        }
        @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}	body {
	font-family: 'Pretendard-Regular';
}
	.main_title{
    text-align: center;
    margin-top: 1em;
}

		.main_title hr{
		    width:50%;
		    color:rgb(0, 0, 0);
		    border-width: 3px;
		    margin: 0px auto;
		    margin-top: 1em;
		    margin-bottom: 1.0em;
		}
		
    </style>

</head>
<body> 
<%@ include file = "../header_footer/header2.jsp" %>
     <div class="main_title">
            <h1 style="text-align: center;">민원 등록
       		 <hr></h1></div>
    <div class="container">
        <!-- 민원 헤더-->
        
        <div class="row mb-3">
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
            <div class="col-lg-8">
            
                <div class="card border-primary">
                    <div class="card-body">
                        <b><p style="text-align: center;">여러분의 의견과 문제점을 공유해 주시면 더 나은 서비스를 제공하기 위해 노력하겠습니다.</p></b>
                        <div class="row">
                            <div class="col-lg-1" style="visibility: hidden;">hidden</div>
                        <div class="col-lg-10">
                        
                            - 민원 내용은 최대한 구체적으로 작성해 주세요. <br>
                            - 허위 또는 악의적인 내용의 민원은 처리되지 않을 수 있습니다. <br>
                            - 등록된 민원은 운영자가 확인한 후에 처리될 예정입니다. <br>
                            - 관련 정보는 개인 정보 보호 정책에 따라 안전하게 보호됩니다. 
                        </div>
                        
                        <div class="col-lg-1" style="visibility: hidden;">hidden</div>
                        </div>
                    </div>
                </div>
                <form action="/complaints/registerComplaints" method="post">
                   
                    <!-- 민원 종류 선택 / 그늘막 선택 -->
                    <div class="mb-3" style="text-align: right;">
                        <br>
                        <small ><span class="star">*</span> 필수 입력</small>
                    </div>
                    <hr>
                    <div class="mb-3 row">
                        <div class="col-lg-2">
                            <label for="chooseComplaintsType" class="form-label ">민원 종류 <span class="star">*</span></label>
                        </div>
                        <div class="col-lg-4">
                            <select name="CVPL_KND" class="form-select form-select-sm" id="chooseComplaintsType" aria-label="Small select example" required>
                                <option value="고장">고장</option>
                                <option value="추가 설치 요청">추가 설치 요청</option>
                                <option value="기타민원">기타민원</option>
                              </select>
                        </div>
                        <div class="col-lg-2">
                            <label for="chooseShadeName" class="form-label ">그늘막 이름</label>
                        </div>
                        <div class="col-lg-4">
                            <select name="MANAGE_NO" class="form-select form-select-sm" id="chooseShadeName" aria-label="Small select example">
                                <option value="NotSeleted" selected>선택 안 함</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                              </select>
                        </div>
                        

                    </div>
                    <hr>
                    <!-- 제목 / 내용 -->
                    <div class="mb-3 row">
                        <div class="col-lg-2">
                        <label for="title" class="form-label ">제목 <span class="star">*</span></label>
                    </div>
                        <div class="col-lg-10">
                        <input type="text" class="form-control" name="SJ" id="title"  maxlength="50" placeholder="제목을 입력하세요. (최대 50자까지 입력 가능)" required>
                    </div>
                      </div>
                      <hr>
                      <div class="mb-3 row">
                        <div class="col-lg-2">
                            <label for="content" class="form-label ">내용 <span class="star">*</span></label>
                        </div>
                       <div class="col-lg-10">
                        <textarea class="form-control" id="content" name="WRITNG_CN" maxlength="1000" rows="8"  placeholder="내용을 입력하세요. (최대 1,000자까지 입력 가능)"  required
                         onkeyup="calc(this)"></textarea>
                        <div style="text-align: right;"><span id="charCount" >0 </span>/ 1000</div>
                    </div>
                      </div>
                      <hr>
                      <!-- 작성자 / 비밀번호-->
                      <div class="mb-3 row">
                        <div class="col-lg-2">
                            <label for="creator" class="form-label ">작성자 <span class="star">*</span></label>
                        </div>
                        <div class="col-lg-4">
                            <input type="text" name="WRITNG_NM" class="form-control" id="creator" placeholder="작성자" required>
                        </div>
                        <div class="col-lg-2">
                            <label for="inputPassword" class="form-label ">비밀번호 <span class="star">*</span></label>
                        </div>
                        <div class="col-lg-4">
                            <input type="password" name="WRITNG_PASSWORD" id="inputPassword" placeholder="비밀번호" class="form-control" aria-describedby="passwordHelpBlock" pattern=".{4,10}" required>
                            <div id="passwordHelpBlock" class="form-text">
                                Must be 4-10 characters long.
                            </div>
                        </div>
                      </div>
                      <hr>
                      <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate" required>
                        <label class="form-check-label" for="flexCheckIndeterminate">
                          개인정보 수집 및 이용에 동의합니다.
                        </label>
                      </div>
                      <!-- 제출 버튼-->
                      <br>
                      <div class="col-lg-12" style="text-align: right;">
                        <button class="btn btn-primary">등록</button>
                         
                        <a href="/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all" class="btn btn-outline-secondary" role="button">목록</a>

                      </div>
                      </form>
               
            </div>
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
        </div>
    </div>
<!-- 스크립트 -->    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<!-- 글자 수 세기 -->
    <script>
    
	function calc(text) {
	const str = text.value.length;
	document.getElementById("charCount").innerHTML = text.value.length
}
    
    
</script>
<%@ include file = "../header_footer/footer.jsp" %>
</body>
</html>
