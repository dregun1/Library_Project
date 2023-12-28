<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/board.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>독후감</title>

</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">열린마당</li>
					<li><span><a href="/board/list">공지사항</a></span></li>
					<li><span><a href="">Q&A</a></span></li>
					<li><span class="keyword"><a href="/report/list">독후감</a></span></li>			
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">열린마당</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>열린마당</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>독후감</span>								
					</div>
				</div>
				<br>
				
				<div class="submenu">
					<a href="/report/register">등록</a>
				</div>
	
				<div class="shareContent">
					<div class="bookInsertWrap">
						<table>
							<tr>
								<td>제목</td>
								<td>작가</td>
					            <td>작성자</td>
					            <td>작성일</td>
					            <td>점수</td>
					            <td>조회수</td>
							</tr>
					
						
							<c:forEach items="${list}" var="report">
								<tr>
									<td><a class='move' href='${report.reportid}'><c:out value="${report.title}"/></a></td>
									<td><c:out value="${report.author}"/></td>
					                <td><c:out value="${report.memberid}"/></td>
									<td><c:out value="${report.createdate}"/></td>
									<td><c:out value="${report.score}"/></td>
					                <td><c:out value="${report.readcnt}"/></td>
								</tr>
							</c:forEach>
						</table>
						<div>
							<div class="paging">
								<ul>
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1}">이전</a></li>
									</c:if>
	
									<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a
											href="${num}">${num}</a></li>
									</c:forEach>
	
									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1}">다음</a></li>
									</c:if>
								</ul>
							</div>
							<div class="searchform">
								<form id='actionform' action="/report/list" method="get">
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
										name='type'>
										<option value="" ${pageMaker.cri.type == null ? 'selected' : '' }>--</option>
							    		<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
							    		<option value="M" ${pageMaker.cri.type eq 'M' ? 'selected' : '' }>작성자</option>
							    		<option value="TM" ${pageMaker.cri.type eq 'TM' ? 'selected' : '' }>제목 또는 작성자</option>
									</select> 
										<input type='text' name='keyword' value="${pageMaker.cri.keyword}" /> 
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> 
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
									<button>검색</button>						
								</form>
							</div>
						<!-- 모달창 -->
						    <div class="myModal2">
						        <div class="modal-body2">
						            <span class="close_button2" onclick="closeModal()">&times;</span>
						            독후감이 등록되었습니다.
						        </div>
						    </div>
						    <!-- 모달창 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>

<script type="text/javascript"> 

//페이지 이동 구현.
var actionForm = $("#actionform");

$(".paginate_button a").on("click", function(e){
	e.preventDefault();
	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	actionForm.submit();
});


$("#actionform button").on("click", function(e){
	
	if(!actionForm.find("option:selected").val()){
		alert("검색종류를 선택하세요.");
		return false;
	}
	if(!actionForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하세요");
		return false;
	}
	
	actionForm.find("input[name='pageNum']").val("1");
	e.preventDefault();
	actionForm.submit();
});

//조회페이지로 갈 때 URL에 pageNum과 amount가 필요해서 action을 바꾸는 방법을 선택.
$(".move").on("click", function(e){
	
	e.preventDefault();
	actionForm.append("<input type='hidden' name='reportid' value='"+$(this).attr("href")+"'>");
	actionForm.attr("action", "/report/get");
	actionForm.submit();
});

var result = '<c:out value="${result}"/>';

checkModal(result);

//result값 보고 모달창 띄우기
function checkModal(a){
    if (result === ''){
        return;
    }
    if (parseInt(result)>0){
        $(".myModal").css("display", "flex");
    }
}

// 닫기 버튼을 누를 때 모달을 숨깁니다.
window.closeModal = function() {
    $(".myModal").css("display", "none");
};





</script>
