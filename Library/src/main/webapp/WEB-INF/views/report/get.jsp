<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reportRegister.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<title>독후감 조회</title>

</head>
<body>
	
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">열린마당</li>
					<li><span ><a href="/board/list">공지사항</a></span></li>
					<li><span ><a href="">Q&A</a></span></li>
					<li><span class="keyword"><a href="/report/list">독후감</a></span></li>			
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">열린마당</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>열린마당</span><i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>독후감</span><i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>조회</span>								
					</div>
				</div>
				<br><br>
					<div class="shareContent">
						<form action="/report/modify" method="get">
							<input type='hidden' name='pageNum' value="${cri.pageNum}">
							<input type='hidden' name='amount' value="${cri.amount}">
							<input type='hidden' name='keyword' value="${cri.keyword}">
							<input type='hidden' name='type' value="${cri.type}">
							<input type='hidden' name="reportid" value="${report.reportid}">
					<div>
					<table class="boardclass">
					    <tr>
					        <td><label>작성자  </label></td>
					        <td><input class="boardinput" value="${report.memberid}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>작성일  </label></td>
					        <td><input class="boardinput" value="${report.createdate}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>제	목  </label></td>
					        <td><input class="boardinput" value="${report.title}" readonly="readonly"></td>
					    </tr>
					     <tr>
					        <td><label>작	가  </label></td>
					        <td><input class="boardinput" value="${report.author}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>조회수 </label></td>
					        <td><input class="boardinput" value="${report.readcnt}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>평	점 </label></td>
					        <td><input class="boardinput" value="${report.score}점" readonly="readonly"></td>
					    </tr>
					</table>
					
					<div class="bcontent">
							${report.content}
					</div>
					<br>				
					<button class="listbutton" type="submit" data-oper='modify'>수정</button>			
					<button class="listbutton" type="submit" data-oper='list' >목록</button>	
					</form>
					
					<!-- 댓글 -->
					<hr style="border-top: 1px solid #ccc; margin-top: 20px;">
					<sec:authorize access="isAuthenticated()">
								<button id='addReplyBtn'>댓글 입력</button>
					</sec:authorize>
					<br><br>
						<div>
							<br>
							<ul class='chat'>
								<li class="left clearfix" data-ratingsid='12'>
									<div>
										<div class="header">
											<strong class="memberid">유저이름</strong>
											<small class="reply-date">등록날짜</small>
										</div>
										<p>댓글 내용</p>									
									</div>
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
					
					
					
					
<script type="text/javascript" src="/resources/script/reportRatings.js"></script>
    <script type="text/javascript">
        var formObj = $("form");
	
        $('.listbutton').on("click", function (e) {
          e.preventDefault();

          var operation = $(this).data("oper");

          if (operation == 'list') {
            formObj.attr("method", "get");
            formObj.attr("action", "/report/list");
          }
          formObj.submit();
        });

        $(document).ready(function() {
			showList(1);
		});
 
		//메인화면 댓글 시작.
		var reportValue = '${report.reportid}';
		var replyUL = $(".chat");

		function showList(page) {
			//현재페이지_댓글 조회
			reportReplyService.getList(
							{
								reportid : reportValue,
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
									str += "	<small class = 'reply-date'>"+ reportReplyService
													.displayTime(list[i].writedate) + "</small></div>";
									str += "	<p>" + list[i].content + "</p></div></li>"	
								}
								replyUL.html(str);
								
								//페이징 번호 구현
								showRatingsPage(ratingsCnt);
							}); //end reportReplyService.getList
		};//end showList

		//댓글 모달창 시작.
		var modal = $(".modal");
		var modalInputReply = modal.find("input[name='content']"); //content 내용
		var modalInputReplyer = modal.find("input[name='memberid']"); //memberid 작성자
		var modalInputReplyDate = modal.find("input[name='writedate']"); //writedate 작성날짜

		
		
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
				reportid : reportValue
			};
			reportReplyService.add(ratings, function(result) {

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
					
					reportReplyService.get(ratingsid, function(ratingsid) {
						modalInputReply.val(ratingsid.content);
						modalInputReplyer.val(ratingsid.memberid).attr("readonly", "readonly");
						modalInputReplyDate.val(
								reportReplyService.displayTime(ratingsid.writedate))
								.attr("readonly", "readonly");

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
			
			
			
			reportReplyService.remove(ratingsid,  originalMemberid, function(result) {
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

			reportReplyService.update(ratings, function(result) {
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
    </script>
							
							
						
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>

