<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/register.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="../includes/header.jsp"%>
<title>대여관리</title>
   <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="/resources/summernote/summernote-ko-KR.js"></script>
</head>
<body>
	
	<div class="shareContainer">
		<div class="shareImg"
			style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">열린마당</li>
					<li><span class="keyword"><a href="/board/list">공지사항</a></span></li>
					<li><span><a href="">Q&A</a></span></li>
					<li><span><a href="/report/list">독후감</a></span></li>			
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
						<span>공지사항</span>								
					</div>
				</div>
				<br><br>
					<div class="shareContent">
						<form method="post" action="/board/write">
					
						  <table class="boardclass">
					        <tr>
					            <td><label>작성자  </label></td>
					            <td>
					                <input class="boardinput" type="text" placeholder="작성자" readonly="readonly"
					                    value="<sec:authentication property="principal.member.membername"/>" />
					            </td>
					        </tr>
					        <tr>
					            <td><label>제	목  </label></td>
					            <td>
					                <input class="boardinput" type="text" name="btitle" placeholder="제목" />
					            </td>
					        </tr>
					    </table>
										    <br><br>
						<div class="bcontent">
					      <textarea id="summernote" name="bcontent"></textarea>
					     </div>
					      <button class="listbutton" id="regBtn" type="button">등록</button>
					      <button class="listbutton" type="submit" data-oper="list">목록</button>
					      <input type='hidden' name='pageNum' value="${cri.pageNum}">
							<input type='hidden' name='amount' value="${cri.amount}">
							<input type='hidden' name='keyword' value="${cri.keyword}">
							<input type='hidden' name='type' value="${cri.type}">
					      <input type="hidden" name="memberid" value="<sec:authentication property="principal.member.memberid"/>"/>
					      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					    </form>

    <script>
      $(document).ready(function () {
        $('#summernote').summernote({
          lang: 'ko-KR',
          placeholder: '여기에 공지사항을 입력하세요.',
          tabsize: 2,
          minHeight: 800,
          width: 1000
        });

        var formObj = $("form");
	
        $('.listbutton').on("click", function (e) {
          e.preventDefault();

          var operation = $(this).data("oper");

          if (operation == 'list') {
            formObj.attr("method", "get");
            formObj.attr("action", "/board/list");
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

