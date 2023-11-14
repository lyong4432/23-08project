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
            border:none;
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
 
     <div class="main_title c">
            <h1>민원 상세
       		 <hr></h1></div>
    <div class="container">
        <div class="row mb-3">
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
            <div class="col-lg-8" >
            
                
                 <div class="col-lg-12" style="text-align: center; background-color: rgba(165, 163, 164, 0.479); padding: 10px; margin-buttom: 20px">
                        <h3> 민원</h3>
                    </div>
                    
               
                <div class="col-lg-12" style="margin-top:10px;">
                    <table class="table"> <!--  class="table-light" -->
                      <colgroup>
                        <col style="width: 20%;" > 
                        <col style="width: 30%;" > 
                        <col style="width: 20%;" > 
                        <col style="width: 30%;" > 
                      </colgroup>

                         <tbody >
                        
                        	
                          <tr>
                           <td class="table-light ">민원 종류</td>
                           <td class="c">${pageInfo.CVPL_KND}</td>
                           <td class="table-light ">그늘막 이름</td>
                            <td class="c">${pageInfo.MANAGE_NO}</td>
                          </tr>
                          <tr>
                           <td class="table-light ">작성자</td>
                           <td class="c">${pageInfo.WRITNG_NM}</td>
                           <td class="table-light ">작성일</td>
                            <td  class="c"><fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.WRITNG_DT}"/></td>
                          </tr>
                          <tr>
                           <td class="table-light ">제목</td>
                           <td colspan="3">${pageInfo.SJ}</td>
                           
                          </tr>
                          <!--  <td class="table-light c">답변완료여부</td>
                            <td  class="c">${pageInfo.ANSWER_COMPT_AT}</td> -->
                          <tr>
                        <!--  <td class="table-light c">내용</td>  -->
                           <td colspan="4" style="height:200px; padding:20px; overflow:auto;">
                           ${pageInfo.WRITNG_CN}</td>
                           
                          </tr>
                        </tbody> 
                      </table>
                      
                </div>
                <!--  
                <div class="row">
                    <div class="col-lg-2">
                        <label for="complaintType" class="form-label">민원 종류</label>
                    </div>
                    <div class="col-lg-5">
                        <textarea class="form-control text-box" id="complaintType" rows="1" readonly="readonly" name="CVPL_KND"><c:out value="${pageInfo.CVPL_KND}"/></textarea>
                    </div>
                
                    <div class="col-lg-2">
                        <label for="shadeName" class="form-label">그늘막 이름</label>
                    </div>
                    <div class="col-lg-3">
                        <textarea class="form-control text-box" id="complaintType" rows="1" readonly="readonly" name="MANAGE_NO" ><c:out value="${pageInfo.MANAGE_NO}"/></textarea>
                    </div>  
                </div>
                <hr> -->
                <!-- 제목 / 상태 
                <div class="row">
                    <div class="col-lg-2">
                        <label for="title" class="form-label">제목</label>
                    </div>
                    <div class="col-lg-5">
                        <textarea class="form-control text-box" id="title" rows="1" readonly="readonly" name="SJ"><c:out value="${pageInfo.SJ}"/></textarea>
                    </div>
                
                    <div class="col-lg-2">
                        <label for="answerStatus" class="form-label">답변 완료 여부</label>
                    </div>
                    <div class="col-lg-3">
                        <textarea class="form-control text-box" id="answerStatus" rows="1" readonly="readonly" name="ANSWER_COMPT_AT" style="height:auto;"><c:out value="${pageInfo.ANSWER_COMPT_AT}"/></textarea>
                    </div>  
                </div>
                <hr> -->
                <!-- 작성자 / 작성일
                <div class="row">
                    <div class="col-lg-2">
                        <label for="creator" class="form-label">작성자</label>
                    </div>
                    <div class="col-lg-5">
                        <textarea class="form-control text-box" id="creator" rows="1" readonly="readonly" name="WRITNG_NM" ><c:out value="${pageInfo.WRITNG_NM}"/></textarea>
                    </div>
                
                    <div class="col-lg-2">
                        <label for="createDate" class="form-label">작성일</label>
                    </div>
                    <div class="col-lg-3">
                        <textarea class="form-control text-box" id="createDate" rows="1" readonly="readonly" name="WRITNG_DT"><fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.WRITNG_DT}"/></textarea>
                    </div>  
                </div>
                <hr>  -->
                <!-- 내용
                <div class="row">
                    <div class="col-lg-2">
                        <label for="content" class="form-label">내용</label>
                    </div>
                    <div class="col-lg-10">
                        <textarea class="form-control text-box" id="content" rows="5" readonly="readonly"  name="WRITNG_CN"><c:out value="${pageInfo.WRITNG_CN}"/></textarea>
                    </div> 
                </div>
                -->
                
<!-- 답변 칸  : 상태 "N"이면 숨김 -->
                <div id="answerContent" class="col-lg-12" style="margin-top: 50px; display: none" > 
                     <div class="col-lg-12" style="text-align: center; background-color: rgba(165, 163, 164, 0.479); padding: 10px; margin-buttom: 20px">
                        <h3> 답변</h3>
                    </div>
                    <div class="col-lg-12" style="margin-top:10px;">
                    <table class="table"> <!--  class="table-light" -->
                      <colgroup>
                        <col style="width: 20%;" > 
                        <col style="width: 30%;" > 
                        <col style="width: 20%;" > 
                        <col style="width: 30%;" > 
                      </colgroup>

                         <tbody >
                        
                        	
                          <tr>
                           <td colspan="4" style="height:200px; padding:20px; overflow:auto;">${pageInfo.ANSWER_CN}</td>
                           
                          </tr>
                          <tr>
                           <td class="table-light c">담당자</td>
                           <td class="c">${pageInfo.ANSWER_NM}</td>
                           <td class="table-light c">답변일</td>
                           <td class="c"><fmt:formatDate value="${pageInfo.ANSWER_DT}" pattern="yyyy-MM-dd"/></td>
                          </tr>
                    
                        </tbody> 
                      </table>
                      
                </div>
                <!--  
                        <textarea class="form-control text-box" id="answer" rows="5" readonly="readonly" style="height: auto;" name="ANSWER_CN"><c:out value="${pageInfo.ANSWER_CN}"/></textarea>
                    
                    <hr>
                    <div class="row">
                        <div class="col-lg-2">
                            <label for="answerName" class="form-label">담당자</label>
                        </div>
                       <div class="col-lg-4">
                        <textarea class="form-control text-box" id="answerName" rows="1"  readonly="readonly"name="ANSWER_NM"><c:out value="${pageInfo.ANSWER_NM}"/></textarea>
                        </div>
                        <div class="col-lg-2">
                            <label for="answerDate" class="form-label">답변일</label>
                        </div>
                       <div class="col-lg-4">
                        <textarea class="form-control text-box" id="answerDate" rows="1"  readonly="readonly" name="ANSWER_DT"><fmt:formatDate pattern="yyyy-MM-dd" value="${pageInfo.ANSWER_DT}"/></textarea>
                        </div>
                </div>
                <hr>
                -->
                </div>
                
                <!-- 버튼들 -->
                <div class="col-lg-12" style="text-align: right;">
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#checkPasswordModal">
                        수정 
                    </button>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#delcheckPasswordModal">
                        삭제 
                    </button>
                    <button id="answerButton" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#answerModal">
                        답변하기 
                    </button>
                    <a href="/complaints/complaintsInfo?pageNum=1&amount=10&keyword=&category=all" class="btn btn-outline-secondary" role="button" >목록</a>
                  </div>
             <!--  폼 정보 전달하려고 만듦 -->    
            <form id="infoForm" action="/complaints/complaintsInfoModify" method="get">
    			<input type="hidden" id="CVPL_NO" name="CVPL_NO" value='<c:out value="${pageInfo.CVPL_NO}"/>'>
    			<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">    
				<input type="hidden" name="keyword" value="${cri.keyword}">  
			</form>
			
            </div> 
            <div class="col-lg-2" style="visibility: hidden;">hidden</div>
        </div>

    </div>
    
<!-- 수정 클릭 시 비밀번호 확인 모달 -->
<div class="modal fade" id="checkPasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="checkPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="checkPasswordModalLabel">작성자 확인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="clearFields1()"></button>
                </div>

                <div class="modal-body" style="text-align: center;">
                    <p>글 작성시 입력한 비밀번호를 입력해주세요.</p>
                    <div class="row">
                        <div class="col-lg-1" style="visibility: hidden;">hidden</div>
                        <div class="col-lg-3">
                            <label for="inputPassword1" class="form-label">비밀번호
                                <span class="star">*</span>
                            </label>
                        </div>
                        <div class="col-lg-6">
                            <input type="password" id="inputPassword1"  class="form-control" aria-describedby="passwordHelpBlock" pattern=".{4,10}" required>
                                <div id="passwordHelpBlock" class="form-text">
                                    Must be 4-10 characters long.
                                </div>
                        </div>
                        <div class="col-lg-2" style="visibility: hidden;">hidden</div>
                        </div>

                    </div>
                        <div class="modal-footer">
                            <a onclick="checkPassword1()" href='#'  class="btn btn-primary" role="button">확인</a> <!--  수정 버튼  -->
                            <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="clearFields1()">돌아가기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
  
     <!-- 삭제 클릭 시 비밀번호 확인 모달 -->

<div class="modal fade" id="delcheckPasswordModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="delcheckPasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form>
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="delcheckPasswordModalLabel">작성자 확인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="clearFields2()"></button>
                </div>
                <div class="modal-body" style="text-align: center;">
                    <p>글 작성시 입력한 비밀번호를 입력해주세요.</p>
                    <div class="row">
                        <div class="col-lg-1" style="visibility: hidden;">hidden</div>
                        <div class="col-lg-3">
                            <label for="inputPassword2" class="form-label">비밀번호
                                <span class="star">*</span>
                            </label>
                        </div>
                        <div class="col-lg-6">
                            <input type="password" id="inputPassword2" class="form-control" aria-describedby="passwordHelpBlock" pattern=".{4,10}" required>
                                <div id="passwordHelpBlock" class="form-text">
                                    Must be 4-10 characters long.
                                </div></div>
                        <div class="col-lg-2" style="visibility: hidden;">hidden</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="confirmButton" type="button" class="btn btn-primary"> <!--    data-bs-toggle="modal" data-bs-target="#deleteComModal"  -->
                                확인 
                    </button>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="clearFields2()">돌아가기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
  
    <!-- 삭제 버튼 클릭 후 패스워드 치고 확인 눌렀을 때 진짜 삭제 모달 -->

 
<div class="modal fade" id="deleteComModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="deleteComModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <form>
            <div class="modal-header">
            <h1 class="modal-title fs-5" id="deleteComModalLabel">삭제 확인</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="clearFields2()"></button>
            </div>
            <div class="modal-body" style="text-align: center;">
                <p>정말로 삭제하시겠습니까?</p>
            </div>
    <div class="modal-footer">
      <a class="btn btn-danger" role="button" id="delete_btn">확인</a>  
    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="clearFields2()">돌아가기</button>
     </div>
     </form>
        </div>
        </div>
    </div>

<!-- 답변하기 눌렀을 때 모달  / x나 돌아가기 버튼 누르면 필드 초기화 되서 정적인 모달 사용-->  
<div class="modal fade modal-lg" id="answerModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="answerModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
        
        <div class="modal-header">
        <h1 class="modal-title fs-5" id="answerModalLabel">답변하기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="clearFields3()"></button>
        </div>
            <!-- 담당자 확인-->
            <div class="modal-body" >
            	<form action="/complaints/complaintsInfoDetail?CVPL_NO=${pageInfo.CVPL_NO}" method="post" onsubmit="return validatePassword()"> 
            	
            	<div class="row" style="margin-top:30px;">
            	<div class="col-lg-2"> <label for="manager" class="form-label">담당자 <span class="star">*</span></label>
            	</div>
            	<div class="col-lg-4"> <input type="text" class="form-control" id="manager" placeholder="담당자" required name="ANSWER_NM">
            	</div>
            	<div class="col-lg-2"> <label for="managePassword" class="form-label">담당자 코드 <span class="star">*</span></label>
            	</div>
            	<div class="col-lg-4">  <input type="password" id="managePassword" name="ANSWER_PASSWORD" placeholder="담당자 코드" class="form-control" aria-describedby="passwordHelpBlock" pattern=".{4,10}" required>
                            <div id="passwordHelpBlock" class="form-text">
                                Must be 4-10 characters long.
                            </div>
            	</div>
            	</div>
            	<hr>
                
                
                <!-- 내용 -->
                <div class="row" style="margin-top:30px; margin-bottom:30px;">
                <div class="col-lg-2">
                <label for="answer-content" class="form-label">답변 <span class="star">*</span></label>
                </div>
                <div class="col-lg-10">
                <textarea class="form-control" name="ANSWER_CN" id="answer-content" maxlength="1000" rows="8"  placeholder="답변을 입력하세요. (최대 1,000자까지 입력 가능)"  required></textarea>
                </div>
                </div>
                </div>
                <div class="modal-footer">
                <button class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal" onclick="clearFields3()">돌아가기</button>
                </div>
                </form>
                </div>
                </div>
                </div>

 <!-- 스크립트들 -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>  
 
<script>
/* 삭제 버튼 */
 let form = $("#infoForm");
 
$("#delete_btn").on("click", function(e){
    form.attr("action", "/complaints/delete");
    form.attr("method", "post");
    form.submit();
});   

/* 답변 칸 나타나게 하는 코드 */
window.addEventListener("DOMContentLoaded", function() {
           var answerBtn = document.getElementById("answerButton");
            var element = document.getElementById("answerContent");
            var answerComptAt = "${pageInfo.ANSWER_COMPT_AT}";
            if (answerComptAt === "Y") {
                element.style.display = "block"; // 답변 상자 보이게 
                answerBtn.style.display = "none"; // "답변하기" 버튼 숨기기 
            } else {
                element.style.display = "none";  // "N"일 때 요소 숨기기
            }
        });
        
/* 담당자 코드 맞는지 확인 */
  function validatePassword() {
	  var password = document.getElementById("managePassword").value;

	  // 데이터베이스에서 저장된 비밀번호와 비교하는 로직을 추가해야 합니다.
	  var storedPassword = "${pageInfo.ANSWER_PASSWORD}"; // 실제 데이터베이스에서 조회한 비밀번호

	  if (password === storedPassword) {
	    return true; // 비밀번호가 일치하면 폼 전송 허용
	  } else {
	    alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
	    document.getElementById("managePassword").value = "";
	    return false; // 비밀번호가 일치하지 않으면 폼 전송 중지
	    
	  }
	}
/*돌아가기 눌렀을 때 입력필드 초기화 */
function clearFields1() {
	
	
	document.getElementById("inputPassword1").value = "";
	location.reload();
	
}

function clearFields2() {
	
	document.getElementById("inputPassword2").value = "";
	location.reload();
}

function clearFields3() {
	document.getElementById("answer-content").value = "";
	document.getElementById("managePassword").value = "";
	document.getElementById("manager").value = "";
	location.reload();
}

	

  /* 수정 시 비밀번호 맞는지 확인 */
function checkPassword1() {
            // 이전에 등록한 비밀번호를 여기에 설정합니다.
            var storedPassword = "${pageInfo.WRITNG_PASSWORD}";

            var inputPassword = document.getElementById("inputPassword1").value;

            if (inputPassword === storedPassword) {
                // 비밀번호가 일치할 경우 수정페이지 이동 
                window.location.href='/complaints/complaintsInfoModify?CVPL_NO=<c:out value="${pageInfo.CVPL_NO}"/>'
                
                // 여기에 수정 로직을 추가하세요.
            } else {
                // 비밀번호가 일치하지 않을 경우 경고 메시지를 표시합니다.
                alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
                document.getElementById("inputPassword1").value="";
               	// location.reload();
                
                
            }
        }  
/* 삭제 시 비밀번호 맞는지 확인 */ 
document.addEventListener("DOMContentLoaded", function() {
    // 여기에 조건을 체크하는 코드를 작성합니다.
    var openModalButton = document.getElementById("confirmButton");
    
      function checkConditionAndOpenModal() {

        var inputPassword2 = document.getElementById("inputPassword2").value;

	  // 데이터베이스에서 저장된 비밀번호와 비교하는 로직을 추가해야 합니다.
	  var storedPassword2 = "${pageInfo.WRITNG_PASSWORD}"; // 실제 데이터베이스에서 조회한 비밀번호
    if (inputPassword2 === storedPassword2) {
        // 모달을 자동으로 엽니다.
        $('#deleteComModal').modal('show');
    } else {
    	alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
    	document.getElementById("inputPassword2").value=""; 
    }
 }
// 버튼 클릭 시 조건 체크 함수 호출
openModalButton.addEventListener("click", checkConditionAndOpenModal);

});    
</script>
<%@ include file = "../header_footer/footer.jsp" %>
</body>
</html>
