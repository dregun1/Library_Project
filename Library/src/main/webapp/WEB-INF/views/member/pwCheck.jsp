<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/pwCheck.css">
<title>로그인 창</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:if test="${result == -1}">
	<script type="text/javascript">
		alert("비밀번호가 틀렸습니다.")
	</script>
</c:if>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg" style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">회원정보</li>
					<li><span ><a href="/member/modify">개인정보수정</a></span></li>
					<li><span class="keyword"><a href="/member/pwCheck">비밀번호변경</a></span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">개인정보수정</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat"></i>
						<span>회원정보</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat"></i>
						<span>개인정보수정</span>
					</div>
				</div>

				<div class="shareContent">
					<div class="pwCheckWrap">
						<h2>비밀번호 확인</h2>
						<p>
							· 공용 사용환경 등에서의 개인정보 보호를 위해 비밀번호를 확인합니다.<br /> · 아래 입력창에 비밀번호를
							입력하고 확인을 누르면 회원정보수정 페이지로 이동합니다.<br />
						</p>
						<form class="pwCheckForm" action="/member/pwCheck" method="post" name="frm">
							<div class="pwCheckInputWrap">
								<input type="password" id="passcode" name="passcode" placeholder="비밀번호 입력">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
								<input type="submit"
									value="비밀번호 확인" onclick="return pwcheck()" class="pwCheckBtn">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
	<script type="text/javascript">
    function pwcheck() {
        if (document.getElementsByName("passcode")[0].value.length == 0) {
            alert("비밀번호를 입력해주세요.");
            document.getElementsByName("passcode")[0].focus(); 
            return false;
        }
        alert("수정 페이지로 이동합니다.");
        return true;
    }

	</script>
