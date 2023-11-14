<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <title>쉐이디 프렌즈</title>
    <style>
        .text-box{
            resize: none;
        }
        .star { 
            color:crimson;
        }
        @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 300;
    font-style: normal;
}	body {
	font-family: 'Pretendard-Regular';
}	
	a {
  text-decoration: none;
  color: inherit;
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
		.c { text-align:center;
		}
    </style>
   <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
    <%@ include file = "../header_footer/header2.jsp" %>
    <!--   본문 -->
 
     <div class="main_title">
            <h1 style="text-align: center;">민원 수정
       		 <hr></h1></div>
    <div class="container">
        <div class="row mb-3">
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
            <div class="col-lg-8">
            
                 <div class="mb-3" style="text-align: right;">
                        <br>
                        <small ><span class="star">* </span>수정가능</small>
                    </div>
                <hr>
                <form action="/complaints/complaintsInfoModify?CVPL_NO=${pageInfo.CVPL_NO}" method="post">
              
                <!-- 민원종류 / 그늘막 이름 -->
                <div class="row">
                     <div class="col-lg-2">
                        <label for="complaintType" class="form-label">민원 종류</label>
                    </div>
                    <div class="col-lg-4 c">
                        ${pageInfo.CVPL_KND}
                    </div>
                
                    <div class="col-lg-2">
                        <label for="shadeName" class="form-label">그늘막 이름</label>
                    </div>
                    <div class="col-lg-4 c">
                        ${pageInfo.MANAGE_NO}
                    </div>  
                </div>
                <hr>
                 <!-- 작성자 / 작성일 -->
                <div class="row">
                    <div class="col-lg-2">
                        <label for="creator" class="form-label">작성자</label>
                    </div>
                    <div class="col-lg-4 c">
                        ${pageInfo.WRITNG_NM}
                    </div>
                
                    <div class="col-lg-2">
                        <label for="createDate" class="form-label">작성일</label>
                    </div>
                    <div class="col-lg-4 c">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.WRITNG_DT}"/>
                    </div>  
                </div>
                <hr>
                <!-- 제목 / 상태 -->
                <div class="row">
                    <div class="col-lg-2">
                        <label for="title" class="form-label">제목<span class="star"> *</span></label>
                    </div>
                    <div class="col-lg-10">
                        <textarea class="form-control text-box" id="title"  maxlength="50"  rows="1" placeholder="제목을 입력하세요. (최대 50자까지 입력 가능)" name="SJ" style="height:auto;" required><c:out value="${pageInfo.SJ}"/></textarea>
                    </div>
                
                </div>
                <hr>
               
                <!-- 내용 -->
                <div class="row">
                    <div class="col-lg-2">
                        <label for="content" class="form-label">내용<span class="star"> *</span></label>
                    </div>
                    <div class="col-lg-10">
                        <textarea class="form-control text-box" id="content" rows="8" placeholder="내용을 입력하세요. (최대 1,000자까지 입력 가능)" maxlength="1000" style="height: auto;" name="WRITNG_CN" required onclick="calc(this)" onkeyup="calc(this)"><c:out value="${pageInfo.WRITNG_CN}"/></textarea>
                    </div> 
                </div>
                <div style="text-align: right;"><span id="charCount" >0 </span>/ 1000</div>
                <hr>
                
                <!-- 버튼들 -->
                <div class="col-lg-12" style="text-align: right;">
                    <button class="btn btn-primary">등록</button>
                    <a href='/complaints/complaintsInfoDetail?CVPL_NO=<c:out value="${pageInfo.CVPL_NO}"/>' class="btn btn-outline-secondary" role="button">취소</a>
                    <a href="/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all" class="btn btn-outline-secondary" role="button" >목록</a>
                  </div>
                 
            </form>
            <form id="infoForm" action="/complaints/complaintsInfoModify?CVPL_NO=${pageInfo.CVPL_NO}" method="get">
            <input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">   
				<input type="hidden" name="keyword" value="${cri.keyword}">   
            </form>
            </div> 
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
        </div>

    </div>
    

 <!-- 스크립트들 -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>  
<script>function calc(text) {
	const str = text.value.length;
	document.getElementById("charCount").innerHTML = text.value.length
}</script>
<%@ include file = "../header_footer/footer.jsp" %>
</body>
</html>
