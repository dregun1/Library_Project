<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
<title>Document</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg" style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">회원정보</li>
					<li><span class="keyword"><a href="member/modify">개인정보수정</a></span></li>
					<li><span><a href="/member/pwCheck">비밀번호변경</a></span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">개인정보수정</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>회원정보</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>개인정보수정</span>
					</div>
				</div>

				<div class="shareContent">
					<div class="joinTitle">
						<p>*표시가 있는 항목은 필수 입력 항목입니다.</p>
					</div>
					<form action="/member/modify" method="post" name="frm">
						<input type="hidden" name="command" value="update_success">
						<table>
							<tr>
								<th>아이디(ID)</th>
								<td><input type="text" id="memberid" name="memberid"
									value="<sec:authentication property="principal.member.memberid"/>" readonly="readonly"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" id="membername" name="membername"
									value="<sec:authentication property="principal.member.membername"/>"></td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td><input type="text" id="postalcode" name="postalcode"
									value="<sec:authentication property="principal.member.postalcode"/>" readonly="readonly"> <input
									class="joinBtn" type="button" value="검색" id="btn"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" id="postaladdress"
									name="postaladdress" value="<sec:authentication property="principal.member.postaladdress"/>"
									readonly="readonly"></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="text" id="detailaddress"
									name="detailaddress" value="<sec:authentication property="principal.member.detailaddress"/>">
								</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" id="mphone" name="mphone"
									value="<sec:authentication property="principal.member.mphone"/>"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" id="birthdate" name="birthdate"
									placeholder="예시:'1971-08-08'" value="<sec:authentication property="principal.member.birthdate"/>" >
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" id="email" name="email" value="<sec:authentication property="principal.member.email"/>">
								 <button type="button" id="email_auth_btn" class="email_auth_btn">인증번호 받기</button>
								</td>
							</tr>
							<tr>
						        <th>인증번호</th>
						        <td>       
						            <input type="text" placeholder="인증번호 입력" id="email_auth_key">
						        </td>
						    </tr>
						</table>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<input class="joinCheck" type="submit" value="정보수정" id="join"> 
						<input class="joinCancel" type="reset" value="취소">
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	<!-- 이메일 보내기 -->
    var email_auth_cd;

    $("#email_auth_btn").click(function () {
        var email = $('#email').val();

        if (email == '') {
            alert("이메일을 입력해주세요.");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "/member/emailAuth",
            data: { email: email, _csrf: $('input[name="_csrf"]').val()},
            success: function (data) {
                alert("인증번호가 발송되었습니다.");
                email_auth_cd = data;
            },
            error: function (data) {
                alert("메일 발송에 실패했습니다.");
            }
        });
    });
    <!-- 이메일 보내기 -->
	
	
	$("#join").click(function () {

    	if (document.getElementsByName("membername")[0].value == 0) {
    		alert("이름을 입력해주세요.");
    		document.getElementsByName("membername")[0].focus();
    		return false;
    	}
    	if (document.getElementsByName("postalcode")[0].value == 0) {
    		alert("우편번호를 입력해주세요.");
    		document.getElementsByName("postalcode")[0].focus();
    		return false;
    	}
    	if (document.getElementsByName("postaladdress")[0].value == 0) {
    		alert("주소를 입력해주세요.");
    		document.getElementsByName("postaladdress")[0].focus();
    		return false;
    	}
    	if (document.getElementsByName("detailaddress")[0].value == 0) {
    		alert("상세주소를 입력해주세요.");
    		document.getElementsByName("detailaddress")[0].focus();
    		return false;
    	}
    	if (document.getElementsByName("mphone")[0].value == 0) {
    		alert("전화번호를 입력해주세요.");
    		document.getElementsByName("mphone")[0].focus();
    		return false;
    	}
    	var birthdateElement = document.getElementsByName("birthdate")[0].value; // birthdate 요소를 변수에 할당
    	if (!birthdateElement || !isValidDate(birthdateElement)) {
    	    alert("올바른 생년월일 형식(YYYY-MM-DD)을 입력해주세요.");
    	    if (birthdateElement) {
    	        birthdateElement.focus();
    	    }
    	    return false;
    	}
    	if (document.getElementsByName("email")[0].value.length == 0) {
    		alert("이메일을 입력해주세요.");
    		document.getElementsByName("email")[0].focus();
    		return false;
    	}
    	if ($('#email_auth_key').val() != email_auth_cd) {
            alert("인증번호가 일치하지 않습니다.");
            return false;
        }

    	alert("정보가 수정되었습니다.");
    	return true;
    });

    function isValidDate(dateString) {
    	// 생년월일의 유효한 형식을 정의
    	var regex = /^\d{4}-\d{2}-\d{2}$/;
    	return regex.test(dateString);
    }
    
    
    
    
    const btn = document.querySelector("#btn");
    btn.addEventListener("click", () =>{
    	   new daum.Postcode({
    	        oncomplete: function(data) {
    	        	console.log(data);
    	        	let fullAddr = '';
    	        	let extraAddr = '';
    	        	if(data.userSelectedType == 'R'){
    	        		fullAddr = data.roadAddress;
    	        	}else{
    	        		fullAddr = data.jibunAddress;
    	        	}
    	        	
    	        	if(data.userSelectedType == 'R'){
    	        		if(data.bname !== ''){
    	        			extraAddr += data.bname;
    	        		}
    	        		if(data.buildingName !== ' '){
    	        			extraAddr += (extraAddr !== ''?', '+ data.buildingName : data.buildingName);
    	        		} 
    	        		fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');	
    	        	}
    	        	
    	        	
    	        	document.getElementsByName("postaladdress")[0].value = fullAddr;
    	        	document.getElementsByName("postalcode")[0].value = data.zonecode;
    	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
    	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
    	            document.getElementsByName("detailaddress")[0].focus();
    	        }
    	    }).open();	
    })
    </script>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>