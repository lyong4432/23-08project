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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>쉐이디 프렌즈</title>
    <style>
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
.star { 
            color:crimson;
            font-weight:600;
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
	
	.c { text-align:center;}
	.r { text-align:right;}
	.tbl-e {  display: inline-block;
	    max-width: 100%;
	    overflow: hidden;
	    white-space: nowrap;
	    text-overflow: ellipsis;}
    </style>
     <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>
<%@ include file = "../header_footer/header2.jsp" %>
    <div class="main_title c">
            <h1>민원 
       		 <hr></h1></div>
    <div class="container">
    
    	
        <div class="row mb-3">
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
            <div class="col-lg-8">
            
                <!-- 검색어 입력 -->
                <div class="row">
                    <div class="col-lg-6" style="visibility: hidden;">hidden</div>
                    <div class="col-lg-6">
                        <div class="input-group mb-3">
                            <input type="text" class="form-control" id="search" name="keyword" value="${pageMaker.cri.keyword}" placeholder="검색어를 입력하세요. (제목+내용)"> 
                            <button class="btn btn-outline-secondary">검색</button>
                          </div>
                    </div>
                </div>
                <br>
                <!-- 민원 종류 선택 -->
                <div class="col-lg-12" style="text-align: center;">
				 
                    <div class="btn-group " role="group" aria-label="Basic radio toggle button group">
                   		<c:choose>
							    <c:when test="${pageMaker.cri.category eq 'all'}">
									<label class="btn btn-outline-primary active" for="all" >
                    				<input type="radio" class="btn-check" name="category" id="all" value="all" autocomplete="off" >전체</label>
								</c:when>
							    <c:otherwise>
							    	<label class="btn btn-outline-primary" for="all" >
                    				<input type="radio" class="btn-check" name="category" id="all" value="all" autocomplete="off" >전체</label>
							    </c:otherwise>
						</c:choose>
						<c:choose>
							    <c:when test="${pageMaker.cri.category eq '고장'}">
			                    	<label class="btn btn-outline-primary active" for="고장" >
                         			<input type="radio" class="btn-check  " name="category" id="고장" value="고장" autocomplete="off"  >고장</label>
                        		</c:when>
                        		<c:otherwise>
                        			<label class="btn btn-outline-primary" for="고장" >
                         			<input type="radio" class="btn-check  " name="category" id="고장" value="고장" autocomplete="off"  >고장</label>
                        		</c:otherwise>
                       	</c:choose>
                        <c:choose>
							    <c:when test="${pageMaker.cri.category eq '추가 설치 요청'}">
			                    	<label class="btn btn-outline-primary active" for="추가설치요청">
                       				<input type="radio" class="btn-check" name="category" id="추가설치요청" value="추가 설치 요청" autocomplete="off">추가 설치 요청</label>
                        		</c:when>
                        		<c:otherwise>
                        			<label class="btn btn-outline-primary" for="추가설치요청">
                       				<input type="radio" class="btn-check" name="category" id="추가설치요청" value="추가 설치 요청" autocomplete="off">추가 설치 요청</label>
                        		</c:otherwise>
                       	</c:choose>
                       	<c:choose>
							    <c:when test="${pageMaker.cri.category eq '기타민원'}">
			                    	<label class="btn btn-outline-primary active" for="기타민원" >           
                        			<input type="radio" class="btn-check" name="category" id="기타민원" value="기타민원" autocomplete="off">기타민원</label>
                        		</c:when>
                        		<c:otherwise>
	                        		<label class="btn btn-outline-primary" for="기타민원" >           
                        			<input type="radio" class="btn-check" name="category" id="기타민원" value="기타민원" autocomplete="off">기타민원</label>
                        		</c:otherwise>
                       	</c:choose>
                        
                      </div>
                </div>
                <br>
                <p>&nbsp;총&nbsp;<span class="star">${total}</span>건 등록</p>
                <!-- 목록 -->
                <div class="col-lg-12">
                    <table class="table table-hover" style="table-layout: fixed;">
                      <colgroup>
                        <col style="width: 10%;" > 
                        <col style="width: 45%;" > 
                        <col style="width: 30%;" > 
                        <col style="width: 15%;" > 
                      </colgroup>
                        <thead class="table-light">
                          <tr>
                            <th scope="col" class="c">#</th>
                            <th scope="col" class="c" >제목</th>
                            <th scope="col" class="c">작성일</th>
                            <th scope="col" class="c">답변완료여부</th>
                          </tr>
                        </thead>
                         <tbody id="postList">
                        <c:forEach items="${list}" var="list" varStatus="status">
                        
                          <tr>
                       
                            <th scope="row" class="c">${pageMaker.cri.skip + status.index + 1}</th>
                            <td><a class="move tbl-e" href='<c:out value="${list.CVPL_NO}"/>'>
                        <c:out value="${list.SJ}"/>
                    </a></td>
                			<td class="c"><fmt:formatDate value="${list.WRITNG_DT}" pattern="yyyy-MM-dd"/></td>
               				<td class="c">
               				<!-- <c:out value="${list.ANSWER_COMPT_AT}"/> </td> -->
             				<c:choose>
							    <c:when test="${list.ANSWER_COMPT_AT.toString() eq 'Y'}">답변완료</c:when>
							    <c:when test="${list.ANSWER_COMPT_AT.toString() eq 'N'}">대기</c:when>
							</c:choose></td>
                          </tr>
                          </c:forEach>
                        </tbody> 
                      </table>
                      
                </div>
                <!-- 글쓰기 버튼 -->
                <div class="col-lg-12" style="text-align: right;">
                    <a href="/complaints/registerComplaints" class="btn btn-primary" role="button">글쓰기</a>
                </div>
                <!-- 페이지네이션-->
                <div class="col-lg-12" style="display: flex;justify-content: center;">
                    <nav aria-label="Page navigation ">
                        <ul class="pagination" id="pageInfo">
                        <!--  
                        <c:choose>
						    <c:when test="${pageMaker.prev}">
						        <li class="page-item">
						            <a href="?pageNum=${pageMaker.startPage - 1}&amount=${pageMaker.cri.amount}" class="page-link" aria-label="Previous">
						            <span aria-hidden="true" >&laquo;</span></a>
						        </li>
						    </c:when>
						    <c:otherwise>
						        <li class="page-item">
						            <span class="page-link"  aria-hidden="true">&laquo;</span>
						        </li>
						    </c:otherwise>
						</c:choose>
						-->
						<c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
					    <c:choose>
					        <c:when test="${pageNum eq pageMaker.cri.pageNum}">
					            <li class="page-item active" aria-current="page">
					                <a href="?pageNum=${pageNum}&amount=${pageMaker.cri.amount}&keyword=&category=${pageMaker.cri.category}" class="page-link">${pageNum}</a>
					            </li>
					        </c:when>
					        <c:otherwise>
					            <li class="page-item">
					                <a href="?pageNum=${pageNum}&amount=${pageMaker.cri.amount}&keyword=&category=${pageMaker.cri.category}" class="page-link">${pageNum}</a>
					            </li>
					        </c:otherwise>
					    </c:choose>
					</c:forEach>
					<!-- 
					<c:choose>
					    <c:when test="${pageMaker.next}">
					        <li class="page-item">
					            <a href="?pageNum=${pageMaker.endPage + 1}&amount=${pageMaker.cri.amount}" class="page-link" aria-label="Next">
					            <span aria-hidden="true">&raquo;</span></a>
					        </li>
					    </c:when>
					    <c:otherwise>
					        <li class="page-item">
					            <span class="page-link"  aria-hidden="true">&raquo;</span>
					        </li>
					    </c:otherwise>
					</c:choose>  -->
                        </ul>
                      </nav>
                </div>
                <form id="moveForm" method="get">
                      	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
				        <input type="hidden" name="amount" value="${pageMaker.cri.amount }">   
				        <input type="hidden" name="keyword" value=""> <!--  ${pageMaker.cri.keyword} -->
				        <input type="hidden" name="category" value="all">          
                      </form>
                </div>
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>    
    </div>   
    </div>
<!-- 스크립트 -->    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" ></script>
<script>


const searchInput = document.getElementById('search');



 $(document).ready(function() {
        const categoryRadios = $(".btn-group input[type='radio']");

        const moveForm = $("#moveForm");
		
        // 라디오 버튼 클릭 이벤트 핸들러
        categoryRadios.on("click", function(e) {
            e.preventDefault();
            
   
            
            const selectedCategory = $(this).val();
            
           
            moveForm.find("input[name='category']").val(selectedCategory);
            moveForm.find("input[name='pageNum']").val(1);
            moveForm.submit();
            
            
        });
     
    });


 
 
$(".input-group button").on("click", function(e){
    e.preventDefault();
    let val = $("input[name='keyword']").val();
    moveForm.find("input[name='keyword']").val(val);
    moveForm.find("input[name='pageNum']").val(1);
    moveForm.submit();
});


let moveForm = $("#moveForm");

$(".move").on("click", function(e){
    e.preventDefault();
    
    moveForm.append("<input type='hidden' name='CVPL_NO' value='"+ $(this).attr("href")+ "'>");
    moveForm.attr("action", "/complaints/complaintsInfoDetail");
    moveForm.submit();
});

$(document).ready(function(){
    
	let result = '<c:out value="${result}"/>';
    
    checkAlert(result);
    
    function checkAlert(result){
        
        if(result === ''){
            reutrn;
        }
        
        if(result === "enrol success"){
            alert("등록이 완료되었습니다.");
        }
        if(result === "modify success"){
            alert("수정이 완료되었습니다.");
        }
        if(result === "delete success"){
            alert("삭제가 완료되었습니다.");
        }
        if(result === "answer success"){
            alert("답변 등록이 완료되었습니다.");
        }
    }    

});


</script>

<%@ include file = "../header_footer/footer.jsp" %>

</body>
</html>
