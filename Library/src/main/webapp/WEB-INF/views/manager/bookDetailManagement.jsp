<%@page import="com.ezen.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>도서상세정보</title>

    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css"> 
    <link rel="stylesheet" type="text/css" href="/resources/css/bookDetailView.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
 
</head>

<body>
<%@ include file="../includes/header.jsp" %>
    <div class="shareContainer">
        <div class="shareImg" style="background: url(/resources/image/svisual_img.png);"></div>
        <div class="shareContentWrap">
            <div class="shareNav">
                <ul>
                    <li class="navTitle">관리자 페이지</li>
					<li><span><a href="">도서등록</a></span></li>
					<li><span class="keyword"><a href="">도서관리</a></span></li>
					<li><span><a href="">예약관리</a></span></li>
					<li><span ><a href="">대여관리</a></span></li>
					<li><span><a href="">회원정보</a></span></li>
                </ul>
            </div>
            <div class="shareContentBox">
                <div class="shareContentTitle">
                    <div class="contentTitle">도서 관리</div>
                    <div class="contentNav">
                        <span>홈</span>
                        <i class="arrow" style="background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>관리자</span>
                        <i class="arrow" style="background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>도서관리</span>
                        <i class="arrow" style="background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>상세페이지</span>
                    </div>
                </div>

                <div class="shareContent">
                    <div class="bookDetailWrap">
                        <div class="bookDetailBox">
                            <div class="bookDetailImgBox">
                    			<c:choose>
								<c:when test="${empty book.bookimgurl }">
									<img src="/resources/image/noimage.gif" >
								</c:when>
								<c:when test="${fn:contains(book.bookimgurl, 'https')}">
						            <!-- If bookimgurl contains 'https', specify a different image URL -->
						            <img src="${book.bookimgurl }" alt="#">
						        </c:when>
								<c:otherwise>
									<img src="/resources/image/${book.bookimgurl }" alt="책이미지">
								</c:otherwise>
								</c:choose>
								<br>
								<div class="bookTitle">${book.title }</div>
                            </div>
                            <div class="bookDetailInfoBox">
                                <ul>
                                    <li><span>ISBN</span> : ${book.isbn }</li>
                                    <li><span>작가</span> : ${book.author }</li>
                                    <li><span>출판사</span> : ${book.publisher }</li>
                                    <li><span>출간일</span> : ${book.publisheddate }</li>
                                    <li><span>등록일</span> : ${book.registereddate}</li>
                                    <li><span>장르코드</span> : ${book.genrecode }</li>                                  
                                    <li><span>도서분류</span> : ${book.genrecrawled }</li>
                                    <li><span>독자평점</span> : ${book.score }</li>
                                    <li><span>총수량</span> : ${book.totbookcnt }</li>
                                    <li><span>현재수량</span> : ${book.curbookcnt}</li>
                                    <li><span>대여수량</span> : ${book.rentedbookcnt}</li>
                                    <li><span>예약수량</span> : ${book.reservation_quantity }</li>
                                    <li><span>누적대여수량</span> : ${book.cumrentalcnt}</li>
                                    <li><span>마지막 수정인</span> : ${book.modifier}</li>
                                </ul>
                            </div>
                        </div>
						<br><br><br><br><br>
                        <div class="bookDetailIntro">
                            <div class="bookDetailIntroTitle">
                                <h2>책소개</h2>
                            </div>
                            <p>${book.bookcontent }</p>
                        </div>
                       
				<form id='actionform' action="/manager/bookUpdate" method="get">
					<input type='hidden' name='pageNum' value="${cri.pageNum}">
					<input type='hidden' name='amount' value="${cri.amount}">
					<input type='hidden' name='keyword' value="${cri.keyword}">
					<input type='hidden' name='type' value="${cri.type}">
					<input type='hidden' name='isbn' value="${book.isbn}">

						<div class="bookDetailBtnBox">
                            <button type="submit" >수정</button>
							<button type="submit" data-oper='list'>목록</button>			
                        </div>
                 </form>      
                  
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<script type="text/javascript">
var actionForm = $("#actionform");
$(document).ready(function(){
		
	 $('button').on("click", function(e){
		 e.preventDefault();
		 
		 var operation = $(this).data("oper");

		 if(operation == 'list'){
			 actionForm.attr("action", "/manager/bookManagement");			
		 }
		 actionForm.submit();
	 });
	 
});

</script>
  
<%@ include file = "../includes/footer.jsp"%>
</body>
</html>