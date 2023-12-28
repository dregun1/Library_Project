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
<script type="text/javascript" src="/resources/script/bookMain.js"></script>
</head>

<body>
	<%@ include file="../includes/header.jsp"%>
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
											<img src="/resources/image/noimage.gif" alt="도서 이미지">
										</a>
									</c:when>
							        <c:when test="${fn:contains(book.bookimgurl, 'https')}">
							        	<a href="/book/bookDetail?isbn=${book.isbn}">
								            <!-- If bookimgurl contains 'https', specify a different image URL -->
								            <img src="${book.bookimgurl}" alt="도서 이미지">
							            </a>
							        </c:when>
									<c:otherwise>
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/${book.bookimgurl }" alt="도서 이미지">
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
											<img src="/resources/image/noimage.gif" alt="도서 이미지">
										</a>
									</c:when>
									<c:when test="${fn:contains(book.bookimgurl, 'https')}">
							        	<a href="/book/bookDetail?isbn=${book.isbn}">
								            <!-- If bookimgurl contains 'https', specify a different image URL -->
								            <img src="${book.bookimgurl }" alt="도서 이미지">
							            </a>
							        </c:when>
									<c:otherwise>
										<a href="/book/bookDetail?isbn=${book.isbn}">
											<img src="/resources/image/${book.bookimgurl }" alt="도서 이미지">
										</a>
									</c:otherwise>
								</c:choose>
								<p>${book.title }</p>
							</div>
						</c:forEach></li>
				</ul>
			</div>
		</section>
	</div>

</body>
<%@ include file="../includes/footer.jsp"%>
</html>