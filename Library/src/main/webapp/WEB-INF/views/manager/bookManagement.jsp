<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bookmanagement.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>도서관리</title>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">관리자 페이지</li>
                    <li><span><a href="/manager/bookInsert">도서등록</a></span></li>
                    <li><span  class="keyword"><a href="/manager/bookManagement">도서관리</a></span></li>
                    <li><span><a href="/manager/reservationManagement">예약관리</a></span></li>
                    <li><span><a href="/manager/rentalManagement">대여관리</a></span></li>
                    <li><span><a href="/manager/GeneralMember">회원정보</a></span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">도서관리</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>관리자 페이지</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>도서관리</span>
						 <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>도서목록</span>
						
					</div>
				</div>
				
				<div class="submenu">
					<table>
						<tr>
							<th class="selectmenu"><a href="/manager/bookManagement">도서목록</a></th>
							<th><a href="/manager/overdueList">연체목록</a></th>
						</tr>
					</table>
				</div>
				
				<div class="shareContent">
					<div class="bookInsertWrap">
						<table>
							<tr>
								<td>ISBN</td>
								<td>제목</td>
								<td>도서분류</td>
								<td>저자</td>
								<td>출판사</td>
								<td>총수량</td>
								<td>현재수량</td>
								<td>대여수량</td>
								<td>예약수량</td>
							</tr>
					
						
							<c:forEach items="${list}" var="book">
								<tr>
									<td><a class='move' href="${book.isbn}"><c:out value="${book.isbn}" /></a></td>
									<td><c:out value="${book.title}" /></td>
									<td><c:out value="${book.genrecrawled}" /></td>
									<td><c:out value="${book.author}" /></td>
									<td><c:out value="${book.publisher}" /></td>
									<td><c:out value="${book.totbookcnt}" /></td>
									<td><c:out value="${book.curbookcnt}" /></td>
									<td><c:out value="${book.rentedbookcnt}" /></td>
									<td><c:out value="${book.reservation_quantity}" /></td>
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
								<form id='actionform' action="/manager/bookManagement" method="get">
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
										name='type'>
										<option value=""
											${pageMaker.cri.type == null ? 'selected' : '' }>--</option>
										<option value="T"
											${pageMaker.cri.type eq 'T' ? 'selected' : '' }>제목</option>
										<option value="P"
											${pageMaker.cri.type eq 'P' ? 'selected' : '' }>출판사</option>
										<option value="A"
											${pageMaker.cri.type eq 'A' ? 'selected' : '' }>저자</option>
										<option value="G"
											${pageMaker.cri.type eq 'G' ? 'selected' : '' }>분류</option>
									</select> 
										<input type='text' name='keyword' value="${pageMaker.cri.keyword}" /> 
										<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}" /> 
										<input type="hidden" name="amount" value="${pageMaker.cri.amount}" />
									<button>검색</button>						
								</form>
							</div>
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
	actionForm.append("<input type='hidden' name='isbn' value='"+$(this).attr("href")+"'>");
	actionForm.attr("action", "/manager/bookDetailManagement");
	actionForm.submit();
});

</script>
