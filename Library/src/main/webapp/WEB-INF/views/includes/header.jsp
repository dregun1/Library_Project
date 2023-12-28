<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">

<header>
	<!-- headerTop -->
	<div class="headerTopWrap">
		<div class="logo">
			<a href=""><img src="/resources/image/logo.png" alt="logoImg"></a>
		</div>
		<div class="headerSerchWrap">
			<div class="headerSerchBox">
				<form id='searchform' action="/book/bookTotalList" method="get"
					name="frm" class="searchWordWrap">
					<div class="headerSerch">
						<select name='type'>
				    		<option value="TPA" ${pageMaker.cri.type == 'TPA' || pageMaker.cri.type == null ? 'selected' : '' }>전체</option>
				    		<option value="T" ${pageMaker.cri.type eq 'T' ? 'selected' : '' }>도서명</option>
				    		<option value="P" ${pageMaker.cri.type eq 'P' ? 'selected' : '' }>출판사</option>
				    		<option value="A" ${pageMaker.cri.type eq 'A' ? 'selected' : '' }>작가</option>
				    		<option value="TP" ${pageMaker.cri.type eq 'TP' ? 'selected' : '' }>도서명 또는 출판사</option>
				    		<option value="PA" ${pageMaker.cri.type eq 'PA' ? 'selected' : '' }>출판사 또는 작가</option>
				    		<option value="TA" ${pageMaker.cri.type eq 'TA' ? 'selected' : '' }>도서명 또는 작가</option>
				    	</select>
						<input type="text" name="keyword" class="searchWord"  value="${pageMaker.cri.keyword}"
							placeholder="검색어를 입력하세요.(도서명, 작가, 출판사 등)">
					</div>
					<div class="headerSerchBtn">
						<button type="submit">
							<img src="/resources/image/serch.jpg" alt="serchIcon">
						</button>
					</div>
				</form>
			</div>
		</div>
		<div class="headerNav1">
			<sec:authorize access="isAnonymous()">
			<!-- 사용자가 로그인하지 않은 경우 -->
				<ul>
					<li><a href="/customLogin">로그인</a></li>
					<li>|</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
					<li>|</li>
					<li><a href="">사이트맵</a></li>
				</ul>
			</sec:authorize>
	
			<sec:authorize access="isAuthenticated()">
			<!-- 사용자가 로그인한 경우 -->
		            <ul>
		                <li class="logout">
		                    <a>로그아웃</a>
		                </li>
		                <li>|</li>
		                <li><button id='regBtn' type="button">정보 수정</button></li>
		                <li>|</li>
		                <li><a href="">사이트맵</a></li>
		            </ul>
		            <a>안녕하세요, <sec:authentication property="principal.member.membername"/>님!</a> 
			</sec:authorize>
		</div>
	</div>

	<!-- headerBottom -->
	<div class="headerBottomWrap">
		<div class="headerNav2">
			<nav>
				<ul>
					<li>도서관 안내
						<ul>
							<li><a href="#">회원 가입 안내</a></li>
							<li><a href="#">도서 대여 안내</a></li>
						</ul>
					</li>
					<li>도서검색
						<ul>
							<li><a href="/book/bookTotalList">통합도서 검색</a></li>
							<li><a href="/book/bookRecentList">신간도서 조회</a></li>
							<li><a href="/book/bookPopularList">인기도서 조회</a></li>
						</ul>
					</li>
					<li>열린마당
						<ul>
							<li><a href="/board/list">공지사항</a></li>
							<li><a href="#">Q&A</a></li>
							<li><a href="/report/list">독후감</a></li>
						</ul>
					</li>
				<sec:authorize access="isAuthenticated()">
				<!-- 사용자가 로그인한 경우 -->
					<li>내 서재
						<ul>
							<li><a href="/book/InterestedBooks">내 관심도서</a></li>
							<li><a href="/book/reservationList">예약도서 조회</a></li>
							<li><a href="/book/pastReservation">지난 예약도서</a></li>
							<li><a href="/book/bookRentalList">대여도서 조회</a></li>
							<li><a href="/book/bookReturnList">반납도서 조회</a></li>							
						</ul>
					</li>
				</sec:authorize>
				<sec:authorize access="isAnonymous()">
				<!-- 사용자가 로그인 안 한 경우 -->
					<li>내 서재
						<ul>
							<li><a href=""  onclick="alert('로그인이 필요합니다.');">내 관심도서</a></li>
							<li><a href=""  onclick="alert('로그인이 필요합니다.');">예약도서 조회</a></li>
							<li><a href=""  onclick="alert('로그인이 필요합니다.');">지난 예약도서</a></li>
							<li><a href=""  onclick="alert('로그인이 필요합니다.');">대여도서 조회</a></li>
							<li><a href=""  onclick="alert('로그인이 필요합니다.');">반납도서 조회</a></li>							
						</ul>
					</li>
				</sec:authorize>			
					<sec:authorize access="hasAuthority('01')">
					    <li class="hiddenNav">
					        <a href="">관리자 페이지</a>
					        <ul>
					            <li><a href="/manager/bookInsert">도서등록</a></li>
					            <li><a href="/manager/bookManagement">도서관리</a></li>
					            <li><a href="/manager/reservationManagement">예약관리</a></li>
					            <li><a href="/manager/rentalManagement">대여관리</a></li>
					            <li><a href="/manager/GeneralMember">회원정보</a></li>
					        </ul>
					    </li>
					</sec:authorize>
				</ul>
			</nav>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function() {
			// 각 항목에 대한 이벤트 핸들링
			$('.headerNav2 nav ul li').mouseover(function() {
				// 마우스 오버 시 실행되는 코드
				$('.headerNav2 nav ul li ul').css('display', 'block');
			}).mouseleave(function() {
				// 마우스 아웃 시 실행되는 코드
				$('.headerNav2 nav ul li ul').css('display', 'none');
			});
		});
		$(document).ready(function() {
			// 각 항목에 대한 이벤트 핸들링
			$('.headerNav2 nav ul li').hover(function() {
				// 마우스 오버 시 실행되는 코드
				$(this).find('ul').css('background-color', '#eee');
			}, function() {
				// 마우스 아웃 시 실행되는 코드
				$(this).find('ul').css('background-color', ''); // 기본 배경색으로 변경
			});
		});
		
		//등록하기 버튼누르면 register페이지로 이동
		$("#regBtn").on("click", function(){
			self.location ="/member/modify";
		})
		
		//로고 누르면 메인화면으로 리다이렉트	
		 $(document).ready(function() {
		        $(".logo").on("click", function(e) {
		            e.preventDefault();
		            
		            var actionForm = $('<form>', {
		                'action': '/member/main',
		                'method': 'post'
		            });
		            
		            actionForm.append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">');

		            $('body').append(actionForm);
		            actionForm.submit();
		        });
		    });
		
		 
		 //로그아웃		
		 $(document).ready(function() {
		        $(".logout").on("click", function(e) {
		            e.preventDefault();
		            
		            var actionForm = $('<form>', {
		                'action': '/logout',
		                'method': 'post'
		            });
		            
		            actionForm.append('<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">');

		            $('body').append(actionForm);
		            actionForm.submit();
		        });
		    });
		 
		 $(document).ready(function(){
			 $("#searchform button").on("click", function(e){
				 var searchform = $("#searchform");
		        	if(!searchform.find("input[name='keyword']").val()){
		        		alert("키워드를 입력하세요");
		        		return false;
		        	}
		        	e.preventDefault();
		        	searchform.submit();
		        });
		 });
		 
	</script>

</header>