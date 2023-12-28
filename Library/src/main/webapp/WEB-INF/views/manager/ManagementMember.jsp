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
<title>대여관리</title>
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
                    <li><span><a href="/manager/bookManagement">도서관리</a></span></li>
                    <li><span ><a href="/manager/reservationManagement">예약관리</a></span></li>
                    <li><span><a href="/manager/rentalManagement">대여관리</a></span></li>
                    <li><span class="keyword"><a href="/manager/GeneralMember">회원정보</a></span></li>
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
						<span>회원정보</span>
						 <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>관리자회원</span>
						
					</div>
				</div>
				
				<div class="submenu">
					<table>
						<tr>
							<th><a href="/manager/GeneralMember">일반회원</a></th>
							<th class="selectmenu"><a href="/manager/ManagementMember">관리자회원</a></th>
						</tr>
					</table>
				</div>
				
				<div class="shareContent">
					<div class="bookInsertWrap">
						<table>
							<tr>
								<td>아이디</td>
								<td>이름</td>
								<td>우편번호</td>
								<td>주소</td>
								<td>전화번호</td>
								<td>생일</td>
								<td>가입날짜</td>
								<td>이메일</td>
								<td>권한 해지</td>
							</tr>
					
						
							<c:forEach items="${list}" var="member">
								<tr>
									<td><c:out value="${member.memberid}" /></a></td>
									<td><c:out value="${member.membername}" /></td>
									<td><c:out value="${member.postalcode}" /></td>
									<td><c:out value="${member.postaladdress}" /></td>
									<td><c:out value="${member.mphone}" /></td>
									<td><c:out value="${member.birthdate}" /></td>
									<td><c:out value="${member.joindate}" /></td>
									<td><c:out value="${member.email}" /></td>
									<td><input type="button" value="확인"  onclick="cancelMemberflag('${member.memberid}')"></td>
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
								<form id='actionform' action="/manager/ManagementMember" method="get">
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <select
										name='type'>
										<option value=""
											${pageMaker.cri.type == null ? 'selected' : '' }>--</option>
										<option value="N"
											${pageMaker.cri.type eq 'N' ? 'selected' : '' }>이름</option>
										<option value="M"
											${pageMaker.cri.type eq 'M' ? 'selected' : '' }>아이디</option>
										<option value="P"
											${pageMaker.cri.type eq 'P' ? 'selected' : '' }>우편번호</option>
										<option value="E"
											${pageMaker.cri.type eq 'E' ? 'selected' : '' }>이메일</option>
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

function changeMemberflag(memberid) {
    $.ajax({
        type:'POST',
        url: '/manager/cancelMemberflag',
        data: { memberid : memberid},
        success: function(response) {
        	alert("관리자 권한을 박탈 하였습니다.");
            location.reload();
        },
        error: function(xhr, textStatus, errorThrown) {		           
          
        }
    });
}

</script>
