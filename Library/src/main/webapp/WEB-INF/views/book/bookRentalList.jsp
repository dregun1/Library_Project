<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대여도서조회</title>
    
    <link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/list.css">
    
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> 
</head>

<body>
<%@ include file="../includes/header.jsp"%>
    <div class="shareContainer">
        <div class="shareImg" style="background: url(/resources/image/svisual_img.png)"></div>
        <div class="shareContentWrap">
            <div class="shareNav">
                <ul>
                    <li class="navTitle">내 서재</li>
                    <li><span><a href="/book/InterestedBooks">내 관심도서</a></span></li>
                    <li><span><a href="/book/reservationList">예약도서 조회</a></span></li>
					<li><span ><a href="/book/pastReservation">지난 예약도서</a></span></li>
                    <li><span  class="keyword"><a href="/book/bookRentalList">대여도서 조회</a></span></li>
                    <li><span><a href="/book/bookReturnList">반납현황 조회</a></span></li>
                </ul>
            </div>
            <div class="shareContentBox">
                <div class="shareContentTitle">
                    <div class="contentTitle">대여도서 조회</div>
                    <div class="contentNav">
                        <span>홈</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>내 서재</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>대여도서 조회</span>
                    </div>
                </div>

                <div class="shareContent">
                    <c:forEach var="book" items="${ rentalList }">
                    <div class="listWrap">
                        <div class="listImgBox">
	                        <c:choose>
								<c:when test="${empty book.bookimgurl }">
									<img src="/resources/image/noimage.gif"  alt="신간도서">
								</c:when>
								<c:when test="${fn:contains(book.bookimgurl, 'https')}">
						            <!-- If bookimgurl contains 'https', specify a different image URL -->
						            <img src="${book.bookimgurl }" alt="신간도서">
						        </c:when>
								<c:otherwise>
									<img src="/resources/image/${book.bookimgurl }" alt="신간도서">
								</c:otherwise>
							</c:choose>
                        </div>
                        <div class="listContentBox">
                            <h2><a href="/book/bookDetail?isbn=${book.isbn}">${book.title }</a></h2>
                            <h3>${book.author }, ${book.publisher }, ${book.publisheddate }</h3>
                            <p>대여기간 : ~ ${book.plannedreturndate}</p>
                            <!-- 본문 내용추가 원하면 여기에 추가 -->
                        </div>                        	
					       <div class="listBtnBox">
	                            <input type="button" value="반납 미완료" readonly="readonly" >
	                            <input type="button" value="연장하기"  onclick="Extend('${book.rentallistid}')">
                     		</div>						
                    </div>
                	</c:forEach>
                	
                 	
                    
                    <form id="actionForm" action="/book/bookRentalList" method="get">
                    	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
                    	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
                    	<input type="hidden" name="type" value="${pageMaker.cri.type }">
                    	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
                    </form>               	
                	

                </div>
            </div>
        </div>
    </div>

<script>
	
		
		function Extend(rentallistid) {
		    $.ajax({
		        type:'GET',
		        url: '/book/Extend',
		        data: { rentallistid : rentallistid },
		        success: function(response) {
		        	alert("연장이 완료되었습니다.");
		            location.reload();
		        },
		        error: function(xhr, textStatus, errorThrown) {		           
		        	alert("연장횟수가 초과된 도서입니다.");
		        }
		    });
		}
	
</script>  

    
<%@ include file="../includes/footer.jsp"%>
</body>
</html>
