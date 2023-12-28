<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.0.min.js"></script>
</head>
<style>
    .myModal {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-body {
        position: relative;
        width: 400px;
        height: 200px;
        padding: 20px;
        text-align: center;
        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
    }
</style>
<body>
	<%@ include file="includes/header.jsp"%>
	<div id="container">
		<section id="section1">
			<div class="mainSlideWrap">
				<ul class="mainSlide">
					<li><img src="/resources/image/slide1.jpg" alt="main slide1"></li>
					<li><img src="/resources/image/slide2.jpg" alt="main slide2"></li>
					<li><img src="/resources/image/slide3.jpg" alt="main slide3"></li>
					<li><img src="/resources/image/slide4.jpg" alt="main slide4"></li>
				</ul>
				<span class="prev">&lt;</span> <span class="next">&gt;</span>
			</div>
		</section>

		<section id="section2">
			<div class="recommendWrap">
				<div class="recommendTitle">
					<ul>
						<li class="bestTitle">인기도서</li>
						<li class="newTitle">신착도서</li>
					</ul>
				</div>
				<ul class="recommend">
					<li class="bestWrap"><c:forEach var="book"
							items="${ bookPopularList }">
							<div>
								<c:choose>
									<c:when test="${empty book.bookimgurl }">
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/noimage.gif" alt="#">
										</a>
									</c:when>
							        <c:when test="${fn:contains(book.bookimgurl, 'https')}">
							        	<a href="/book/bookDetail?isbn=${book.isbn}">
								            <!-- If bookimgurl contains 'https', specify a different image URL -->
								            <img src="${book.bookimgurl }" alt="#">
							            </a>
							        </c:when>
									<c:otherwise>
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/${book.bookimgurl }" alt="#">
										</a>
									</c:otherwise>
								</c:choose>
								<p>${book.title }</p>
							</div>
						</c:forEach></li>
					<li class="newWrap"><c:forEach var="book"
							items="${ bookRecentList }">
							<div>
								<c:choose>
									<c:when test="${empty book.bookimgurl }">
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/noimage.gif" alt="#">
										</a>
									</c:when>
									<c:when test="${fn:contains(book.bookimgurl, 'https')}">
							        	<a href="/book/bookDetail?isbn=${book.isbn}">
								            <!-- If bookimgurl contains 'https', specify a different image URL -->
								            <img src="${book.bookimgurl }" alt="#">
							            </a>
							        </c:when>
									<c:otherwise>
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/${book.bookimgurl }" alt="#">
										</a>
									</c:otherwise>
								</c:choose>
								<p>${book.title }</p>
							</div>
						</c:forEach></li>
				</ul>
			</div>
		</section>
		
	<!-- 모달창 -->
    <div class="myModal">
        <div class="modal-body">
            <span class="close_button" onclick="closeModal()">&times;</span>
            정보 수정이 완료되었습니다.
        </div>
    </div>
    <!--  -->
    
	</div>

	<%@ include file="includes/footer.jsp"%>
</body>

</html>
<script type="text/javascript">
		$(document).ready(function() {
			function prev() {
				$('.mainSlide li:last').prependTo('.mainSlide');
				$('.mainSlide').css('margin-left', -1200);
				$('.mainSlide').stop().animate({
					marginLeft : 0
				}, 1200);
			}

			function next() {
				$('.mainSlide').stop().animate({
					marginLeft : -1200
				}, function() {
					$('.mainSlide li:first').appendTo('.mainSlide');
					$('.mainSlide').css({
						marginLeft : 0
					});
				});
			}

			function slide() {
				$('.mainSlide').stop().animate({
					marginLeft : -1200
				}, function() {
					$('.mainSlide li:first').appendTo('.mainSlide');
					$('.mainSlide').css({
						marginLeft : 0
					});
				});
			}

			setInterval(slide, 5000);

			$('.prev').click(function() {
				prev();
			});

			$('.next').click(function() {
				next();
			});
		});

		/*recommend*/
		$(document).ready(function() {
			// 초기로드시
			$('.bestTitle').addClass('underline');
			$('.bestWrap').show();
			$('.newWrap').hide();

			// 'bestTitle'을 클릭하면 '인기도서' 표시 및 '신착도서' 숨김
			$('.bestTitle').click(function() {
				$('.bestTitle').addClass('underline');
				$('.newTitle').removeClass('underline');
				$('.bestWrap').show(); // 인기도서 보이기
				$('.newWrap').hide(); // 신착도서 숨기기
				$('.newWrap').css('opacity', '0');
			});

			// 'newTitle'을 클릭하면 '신착도서' 표시 및 '인기도서' 숨김
			$('.newTitle').click(function() {
				$('.newTitle').addClass('underline');
				$('.bestTitle').removeClass('underline');
				$('.newWrap').show(); // 신착도서 보이기
				$('.bestWrap').hide(); // 인기도서 숨기기
				$('.newWrap').css('opacity', '1');
			});
		});
		
		<!-- 모달창 -->
		$(document).ready(function(){
	        var result = '<c:out value="${result}"/>';

	        checkModal(result);
	        
	        //result값 보고 모달창 띄우기
	        function checkModal(a){
	            if (a === ''){
	                return;
	            }
	            if (parseInt(a)>0){
	                $(".myModal").css("display", "flex");
	            }
	        }

	        // 닫기 버튼을 누를 때 모달을 숨깁니다.
	        window.closeModal = function() {
	            $(".myModal").css("display", "none");
	        };

	    });
	</script>