<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신간도서조회</title>
    
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
                    <li class="navTitle">도서검색</li>
                    <li><span><a href="/book/bookTotalList">통합도서 검색</a></span></li>
                    <li><span class="keyword"><a href="/book/bookRecentList">신간도서 조회</a></span></li>
                    <li><span><a href="/book/bookPopularList">인기도서 조회</a></span></li>
                </ul>
            </div>
            <div class="shareContentBox">
                <div class="shareContentTitle">
                    <div class="contentTitle">신간도서 조회</div>
                    <div class="contentNav">
                        <span>홈</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>도서검색</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>신간도서 조회</span>
                    </div>
                </div>

                <div class="shareContent">
                    <c:forEach var="book" items="${ bookRecentList }">
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
                            <p>누적대여 횟수 : ${book.cumrentalcnt }, 대여가능 수량 : ${book.curbookcnt }, 구독자 평점 : ${book.score }</p>
                            <!-- 본문 내용추가 원하면 여기에 추가 -->
                        </div>
                        	<sec:authorize access="isAnonymous()">
							       <div class="listBtnBox">
			                            <input type="button" value="관심도서 추가"  onclick="alert('로그인이 필요합니다.');">
			                            <input type="button" value="예약하기" onclick="alert('로그인이 필요합니다.');">
                       				</div>
							</sec:authorize>
							<sec:authorize access="isAuthenticated()">
							    	 <div class="listBtnBox">
			                            <input type="button" value="관심도서 추가"  onclick="interestedBook('${book.isbn}')">
			                            <input type="button" value="예약하기" onclick="reserveBook('${book.isbn}')" >
                       				</div>
							</sec:authorize>
                    </div>
                	</c:forEach>
                	
                 	<!-- 페이징 처리  -->
                	<form id='actionform' action="/book/bookRecentList" method="get">
						<div class="paging">
						  <ul >
							    <c:if test="${pageMaker.prev}">
							    	<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
							    </c:if>
							    
							    <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							    	<li class="paginate_button ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
							    </c:forEach>
							    
							    <c:if test="${pageMaker.next}">
							    	<li class="paginate_button next"><a href="${pageMaker.endPage +1}">Next</a></li>
							    </c:if>
						    </ul>
						</div>
						<input type="hidden" name="amount" value= "${pageMaker.cri.amount}"/>
						<input type="hidden" name="pageNum" value= "${pageMaker.cri.pageNum}"/>  
					</form>
                    <!-- /페이징 처리  -->
      	
                	

                </div>
            </div>
        </div>
    </div>

<script>
	$(document).ready(function(){

		//페이지 버튼 클릭 이동
		var actionForm = $("#actionform");
        
        $(".paginate_button a").on("click", function(e){
        	e.preventDefault();
        	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
        	actionForm.submit();
        });
		

	});
	
	function reserveBook(isbn) {
        $.ajax({
            type: 'GET',
            url: '/book/reservation',
            data: { isbn: isbn },
            success: function(response) {
            	 var confirmResponse = confirm("예약이 완료되었습니다. 내 서재로 이동하시겠습니까?");
		            if (confirmResponse) {
		                window.location.href = "/book/reservationList";
		            }
            },
            error: function(xhr, status, error) {
                console.log(xhr);
                var errorMessage = xhr.responseText;

                console.log("에러메세지>>>>", errorMessage);
                if (errorMessage === 'fail1') {
                    alert("이미 예약한 도서입니다.");
                } else if (errorMessage === 'fail2') {
                    alert("도서 수량이 부족합니다.");
                } else if (errorMessage === 'fail3') {
                    alert("예약목록이 가득찼습니다.");
                } else {
                    alert("알 수 없는 오류가 발생했습니다.");
                }
            }
        });
    }
	
	
	
	function interestedBook(isbn) {
        $.ajax({
            type:'GET',
            url: '/book/addInterested',
            data: { isbn: isbn },
            success: function(response) {
            	 var confirmResponse = confirm("관심도서에 추가하였습니다. 내 관심도서로 이동하시겠습니까?");
		            if (confirmResponse) {
		                window.location.href = "/book/InterestedBooks";
		            }
            },
            error: function(xhr, status, error) {
               alert("이미 추가하신 도서입니다.")       
            }
        });
    }
</script>  
    
    
<%@ include file="../includes/footer.jsp"%>
</body>
</html>