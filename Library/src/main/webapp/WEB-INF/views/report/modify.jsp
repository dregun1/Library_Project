<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<title>대여관리</title>
</head>
<body>
	
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">열린마당</li>
					<li><span><a href="/board/list">공지사항</a></span></li>
					<li><span><a href="">Q&A</a></span></li>
					<li><span class="keyword"><a href="/report/list">독후감</a></span></li>			
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">열린마당</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>열린마당</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>독후감</span>	
						<i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>조회</span><i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>수정</span>							
					</div>
				</div>
				<br><br>
					<div class="shareContent">
						<form action="/report/modify" method="post">
							<input type='hidden' name='pageNum' value="${cri.pageNum}">
							<input type='hidden' name='amount' value="${cri.amount}">
							<input type='hidden' name='keyword' value="${cri.keyword}">
							<input type='hidden' name='type' value="${cri.type}">
							<input type='hidden' name="reportid" value="${report.reportid}">
					<div>
					<table class="boardclass">
					    <tr>
					        <td><label>작성자  </label></td>
					        <td><input class="boardinput" name="memberid" value="${report.memberid}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>작성일  </label></td>
					        <td><input class="boardinput" name="createdate" value="${report.createdate}" readonly="readonly"></td>
					    </tr>
					    <tr>
					        <td><label>제	목  </label></td>
					        <td><input class="boardinput" name="title" value="${report.title}" ></td>
					    </tr>
					    <tr>
					        <td><label>작	가  </label></td>
					        <td><input class="boardinput" name="title" value="${report.author}" ></td>
					    </tr>
					    <tr>
					        <td><label>평	점 </label></td>
					        <td><input class="boardinput" name="score" value="${report.score}" readonly="readonly"></td>
					    </tr>
					</table>
					
		
						<textarea  class="bcontent" name="content">${report.content}</textarea>
				
					<br>
					<button class="listbutton" type="submit" data-oper='modify'>수정</button>
					<button class="listbutton" type="submit" data-oper='delete'>삭제</button>
					<button class="listbutton" type="submit" data-oper='list' >목록</button>
					
					</form>

    <script>
      $(document).ready(function () {       

        var formObj = $("form");
	
        $('.listbutton').on("click", function (e) {
          e.preventDefault();

          var operation = $(this).data("oper");

          if (operation == 'list') {
            formObj.attr("method", "get");
            formObj.attr("action", "/report/list");
          }
          
          if (operation == 'delete') {
        	  alert("해당 독후감이 삭제되었습니다.")
              formObj.attr("method", "post");
              formObj.attr("action", "/report/delete");                     
            }
          formObj.submit();
        });
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

