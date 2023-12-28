<%@page import="com.ezen.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>도서상세정보</title>

<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reply.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/bookDetailView.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</head>

<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">도서검색</li>
					<li><span>통합검색</span></li>
					<li><span><a href="/book/bookRecentList">신간도서 조회</a></span></li>
					<li><span><a href="/book/bookPopularList">인기도서 조회</a></span></li>
					<li><span class="keyword">도서 상세 페이지</span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">도서 상세 페이지</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>도서검색</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>도서 상세 페이지</span>
					</div>
				</div>

				<div class="shareContent">
					<div class="bookDetailWrap">
						<div class="bookDetailBox">
							<div class="bookDetailImgBox">
								<c:choose>
									<c:when test="${empty bookVO.bookimgurl }">
										<img src="/resources/image/noimage.gif">
									</c:when>
									<c:when test="${fn:contains(bookVO.bookimgurl, 'https')}">
										<!-- If bookimgurl contains 'https', specify a different image URL -->
										<img src="${bookVO.bookimgurl }" alt="#">
									</c:when>
									<c:otherwise>
										<img src="/resources/image/${bookVO.bookimgurl }" alt="책이미지">
									</c:otherwise>
								</c:choose>
							</div>
							<div class="bookDetailInfoBox">
								<ul>
									<li><span>${bookVo.title }</span></li>
									<li><span>ISBN</span> : ${bookVO.isbn }</li>
									<li><span>작가</span> : ${bookVO.author }</li>
									<li><span>출판사</span> : ${bookVO.publisher }</li>
									<li><span>출간일</span> : ${bookVO.publisheddate }</li>
									<li><span>도서분류</span> : ${bookVO.genrecrawled }</li>
									<li><span>독자평점</span> : ${bookVO.score }</li>
									<li><span>누적대여횟수</span> : ${bookVO.cumrentalcnt }</li>
									<li><span>대여가능수량</span> : ${bookVO.curbookcnt }</li>
								</ul>
							</div>
						</div>

						<div class="bookDetailIntro">
							<div class="bookDetailIntroTitle">
								<h2>책소개</h2>
							</div>
							<p>${bookVO.bookcontent }</p>
						</div>
						<div class="bookDetailReview">
							<div class="bookDetailReviewTitle">
								<h2>독자후기</h2>
								<sec:authorize access="isAuthenticated()">
								<button id='addReplyBtn'>입력</button>
								</sec:authorize>
							</div>
						</div>
						
						<!-- 댓글 -->
						<div>
							<br>
							<ul class='chat'>
								<li class="left clearfix" data-ratingsid='12'>
									<div>
										<div class="header">
											<strong class="memberid">유저이름</strong><p>평점</p>	
											<small class="reply-date">등록날짜</small>
										</div>
										<p>댓글 내용</p>									
									</ div>
								</li>
							</ul>
						</div>
						<!-- 댓글 -->


						<!-- 댓글 페이징들어오는 곳 -->
						<div class="panel-footer">  </div>
						<!-- 댓글 페이징들어오는 곳 -->
						
						<!-- 댓글 모달창 -->
						<div class="modal">

							<div class="modal-body">
								<h1>댓글창</h1>
								<div>
									<div>
										<label>댓글</label> <input name='content' value="새 댓글"></input>
									</div>
									<div>
										<label>작성자</label> <input name='memberid' value="새 작성자"></input>
									</div>
									<div>
										<label>작성날짜</label> <input name='writedate'></input>
									</div>
									<div>
										<label>평점</label> <input name='score'></input>
									</div>
								</div>

								<div class="modal-footer">
									<button id='modalModBtn' type="button">수정</button>
									<button id='modalRemoveBtn' type="button">삭제</button>
									<button id='modalRegisterBtn' type="button">등록</button>
									<button id='modalCloseBtn' type="button">닫기</button>
								</div>
							</div>
						</div>
						<!-- 댓글 모달창 -->

							
						<br><br>
						<sec:authorize access="isAuthenticated()">
						<div class="bookDetailBtnBox">

							  <input type="button" value="관심도서 추가"  onclick="interestedBook('${bookVO.isbn}')">
			                  <input type="button" value="예약하기" onclick="reserveBook('${bookVO.isbn}')" >
						</div>
						</sec:authorize>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="/resources/script/ratings.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			showList(1);
		});
 
		//메인화면 댓글 시작.
		var isbnValue = '${bookVO.isbn}';
		var replyUL = $(".chat");

		function showList(page) {
			//현재페이지_댓글 조회
			replyService.getList(
							{
								isbn : isbnValue,
								page : page || 1
							},
							function(ratingsCnt, list) {
								
								
								//댓글을 추가하면 -1을 호출 맨뒤로가기 위함.
								if(page === -1) {
									pageNum = Math.ceil(ratingsCnt / 10.0);
									showList(pageNum);
									return;
								}
								
								var str = "";
								//만약 가져온 댓글이 0이라면
								if (list == null || list.length == 0) {
									//댓글 html싹다 지워버려
									replyUL.html("");
									return;
								}
								for (var i = 0, len = list.length || 0; i < len; i++) {
									str += "<li class='left clearfix' data-ratingsid='"+list[i].ratingsid+"'>";
									str += "	<div><div class='header'><strong class='memberid'>"
											+ list[i].memberid + "</strong>";
									str += "	<p>" + list[i].score + ""	
									str += "	<small class = 'reply-date'>"+ replyService
													.displayTime(list[i].writedate) + "</small></div>";
									str += "	<p>" + list[i].content + "</p></div></li>"	
								}
								replyUL.html(str);
								
								//페이징 번호 구현
								showRatingsPage(ratingsCnt);
							}); //end replyService.getList
		};//end showList

		//댓글 모달창 시작.
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='content']"); //content 내용
		var modalInputReplyer = modal.find("input[name='memberid']"); //memberid 작성자
		var modalInputReplyDate = modal.find("input[name='writedate']"); //writedate 작성날짜
		var modalInputScore = modal.find("input[name='score']"); //score 점수
		
		
		var modalModBtn = $("#modalModBtn");
		var modalRemoveBtn = $("#modalRemoveBtn");
		var modalRegisterBtn = $("#modalRegisterBtn");

		var memberid = null;
		<sec:authorize access="isAuthenticated()">
		memberid = '<sec:authentication property="principal.username"/>';
		</sec:authorize>
		
		
		//새 댓글 버튼으로 모달창 띄우기
		$("#addReplyBtn").on("click", function(e) {
			e.preventDefault();
			
			modal.find("input").val("");
			modal.find("input[name='memberid']").val(memberid);
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id != 'modalCloseBtn']").hide();
			modalRegisterBtn.show();

			modal.css("display", "flex");
			
			/* $(document).ajaxSend(function(e, xhr, options){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			}); */

		});

		//모달창에서 닫기버튼.
		$("#modalCloseBtn").on("click", function(e) {
			modal.css("display", "none");
		});

		//모달창에서 등록버튼.
		modalRegisterBtn.on("click", function(e) {

			var ratings = {
				content : modalInputReply.val(),
				memberid : modalInputReplyer.val(),
				score : modalInputScore.val(),
				isbn : isbnValue
			};
			replyService.add(ratings, function(result) {

				alert(result);

				modal.find("input").val("");
				modal.css("display", "none");

				//등록한다음 맨뒤로가기위해
				showList(pageNum);
			})

		})

		//댓글 조회 클릭 이벤트 처리
		$(".chat").on("click","li",function(e) {
					var ratingsid = $(this).data("ratingsid");
					
					replyService.get(ratingsid, function(ratingsid) {
						modalInputReply.val(ratingsid.content);
						modalInputReplyer.val(ratingsid.memberid).attr("readonly", "readonly");
						modalInputReplyDate.val(
								replyService.displayTime(ratingsid.writedate))
								.attr("readonly", "readonly");
						modalInputScore.val(ratingsid.score);
						//모달 데이터 중요! 삭제와 수정할 때 필요함;
						modal.data("ratingsid", ratingsid.ratingsid);

						modal.find("button[id != 'modalCloseBtn']").hide();
						modalModBtn.show();
						modalRemoveBtn.show();

						modal.css("display", "flex");
					})
				});

		//모달창에서 댓글 삭제 눌렀을 때
		modalRemoveBtn.on("click", function(e) {
			var ratingsid = modal.data("ratingsid");

			if(!memberid) {
				alert("로그인후 삭제 가능합니다.");
				modal.css("display", "none");
				return;
			}
			
			var originalMemberid = modalInputReplyer.val();
			if(memberid != originalMemberid) {
				alert("자신이 작성한 댓글만 삭제 가능합니다.");
				modal.css("display", "none");
				return;
			}
			
			
			
			replyService.remove(ratingsid,  originalMemberid, function(result) {
				alert(result);
				modal.css("display", "none");
				//삭제한 다음 바로 댓글창 띄우기 위함.
				showList(pageNum);
			})
		});

		//모달창에서 댓글 수정 눌렀을 때
		modalModBtn.on("click", function(e) {
			
			var originalMemberid = modalInputReplyer.val();
			

			var ratings = {
				ratingsid : modal.data("ratingsid"),
				content : modalInputReply.val(),
				score: modalInputScore.val(),
				memberid: originalMemberid
			}
			
			if(!memberid) {
				alert("로그인후 수정 가능합니다.");
				modal.css("display", "none");
				return;
			}
			
			if(memberid != originalMemberid) {
				alert("자신이 작성한 댓글만 수정 가능합니다.");
				modal.css("display", "none");
				return;
			}

			replyService.update(ratings, function(result) {
				alert(result);
				modal.css("display", "none");
				showList(pageNum);
			})
		});
		
		//페이징 번호 구현
		var pageNum = 1;
		var ratingsPageFooter = $(".panel-footer");
		
		function showRatingsPage(ratingsCnt){
			
			var endNum = Math.ceil(pageNum / 10.0) * 10;
			var startNum = endNum - 9;
			
			var prev = startNum != 1;
			var next = false;
			
			if(endNum * 10 >= ratingsCnt) {
				endNum = Math.ceil(ratingsCnt/10.0);
			}
			if(endNum * 10 < ratingsCnt) {
				next = true;
			}
			var str = "<ul class='replypage'>";
			
			//여기가 이전버튼 구현
			if(prev) {
				str += "<li class='page-item'><a class='page-link' href='"+(startNum - 1)+"'>Previous</a></li>";
			}
			
			//여기가 페이지 번호 1~10
			for(var i= startNum; i <= endNum; i++) {
				var active = pageNum == i ? "active" : "" ;
							
				str += "<li class='page-item "+active+"'><a class='page-link' href='"+i+"'>"+i+"</a></li>";
			}
			//여기가 다음버튼 구현
			if(next){
				str += "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
				
			}
			
			str += "</ul>";
			
			ratingsPageFooter.html(str);
			
		}
		
		//댓글 페이지 이벤트 처리
		ratingsPageFooter.on("click", "li a", function(e){
			e.preventDefault();
			
			var targetPageNum = $(this).attr("href");
			
			pageNum = targetPageNum;
			showList(pageNum);
		});
		//예약버튼
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
		
		
		//관심도서 추가 버튼
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