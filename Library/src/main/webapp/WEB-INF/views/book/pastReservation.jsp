<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>지난 예약도서</title>
    
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
					<li><span  class="keyword"><a href="/book/pastReservation">지난 예약도서</a></span></li>
                    <li><span><a href="/book/bookRentalList">대여도서 조회</a></span></li>
                    <li><span><a href="/book/bookReturnList">반납현황 조회</a></span></li>
                </ul>
            </div>
            <div class="shareContentBox">
                <div class="shareContentTitle">
                    <div class="contentTitle">지난 예약도서</div>
                    <div class="contentNav">
                        <span>홈</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>내 서재</span>
                        <i class="arrow" style=" background: url(/resources/image/ico_naviArrow.png)0 50% no-repeat;"></i>
                        <span>지난 예약도서</span>
                    </div>
                </div>

                <div class="shareContent">
                    <c:forEach var="book" items="${ pastReservationList }">
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
                            <p>누적대여 횟수 : ${book.cumrentalcnt }, 대여가능 수량 : ${book.curbookcnt }</p>
                            <!-- 본문 내용추가 원하면 여기에 추가 -->
                        </div>
					    	<div class="listBtnBox">
	                            <input type="button" value="관심도서 추가"  onclick="location.href='BookServlet?command=wish_upload&isbn=${book.isbn}&value=2'">
	                            <input type="button" value="삭제하기" onclick="reserveDelete('${book.id}')" >
                     		</div>
                    </div>
                	</c:forEach>
                	<br>
                 	<!-- 페이징 처리  -->
                	<form id='actionform' action="/book/pastReservation" method="get">
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
	
	function reserveDelete(id) {
        $.ajax({
            type: 'GET',
            url: '/book/deleteReserve',
            data: {	id: id },
            success: function(response) {
            	 console.log("삭제가 완료되었습니다.")
            	  // 삭제 성공 후 페이지 새로고침
                 location.reload();
		           
            },
            error: function(xhr, status, error) {
                console.log(xhr);
               
            }
        });
    }
</script>  
    
    
<%@ include file="../includes/footer.jsp"%>
</body>
</html>