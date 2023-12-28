<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<%@ include file="../includes/header.jsp"%>
<body>
	<div class="shareContainer">
		<div class="shareImg" style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
					<li class="navTitle">회원정보</li>
					<li><span><a href="/customLogin">로그인</a></span></li>
					<li><span class="keyword"><a href="/member/join">회원가입</a></span></li>
				</ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">회원가입</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>회원정보</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>회원가입</span>
					</div>
				</div>

				<div class="shareContent">
					<div class="joinNav">
						<ul>
							<li>01. 약관동의<img src="/resources/image/joinStep_arr.png" alt="navicon"></li>
							<li class="keyNav">02. 회원 정보 입력<img
								src="/resources/image/joinStep_arrOn.png" alt="navicon"></li>
						</ul>
					</div>
					<div class="joinTitle">
						<h5>회원 정보 입력</h5>
						<p>*표시가 있는 항목은 필수 입력 항목입니다.</p>
					</div>
					<form action="/member/join" method="post" id="frm">
						<table>
							<tr>
								<th>아이디(ID)</th>
								<td>
									<input type="text" id="memberid" name="memberid">
								 	<input class="joinBtn" type="button"  value="중복확인" onclick="idCheck()">
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="membername">
								</td>
							</tr>
							<tr>
								<th>우편번호</th>
								<td><input type="text"  name="postalcode"
									maxlength="5" readonly="readonly"> 
								<input class="joinBtn" type="button" value="번호검색" id="btn"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="postaladdress" readonly="readonly"><br></td>
							</tr>
							<tr>
								<th>상세주소</th>
								<td><input type="text" name="detailaddress"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" name="mphone"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text"  name="birthdate"
									placeholder="예시:'1998-05-05'"></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="passcode">
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input type="password" id="passcode2">
								<input class="joinBtn" type="button" value="일치확인" onclick="pwCheck()"></td>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" id="email" name="email">
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
						<div class='joinButton'>
						<input class="joinCheck" id="join" type="submit" value="회원가입 확인"> 	
						<input class="joinCancel"type="reset" value="취소">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
<script>

<!-- 카카오 우편검색 -->
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
<!-- 카카오 우편검색 -->

<!-- 중복 검색창 띄우기-->
function idCheck() {
	if (document.getElementsByName("memberid")[0].value == "") {
		alert("아이디를 입력해주세요.");
		document.getElementsByName("postaladdress")[0].focus();
		return ; 
	}
	let url = "/member/IdDuplicationCheck?memberid=" + document.getElementsByName("memberid")[0].value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}
<!-- 중복 검색창 띄우기-->

<!-- 비밀번호 일치 확인 -->
function pwCheck() {
    var passcode1 = document.getElementsByName("passcode")[0].value;
    var passcode2 = document.getElementById("passcode2").value;

    if (passcode1 !== "") {
        if (passcode1 !== passcode2) {
            alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
            // 비밀번호 란 초기화
            document.getElementsByName("passcode")[0].value = "";
            document.getElementById("passcode2").value = "";
            // 첫 번째 비밀번호 입력란에 포커스
            document.getElementsByName("passcode")[0].focus();
        } else {
            alert("비밀번호가 일치합니다.");
        }
    } else {
        alert("비밀번호를 입력해주세요.");
    }
}
<!-- 비밀번호 일치 확인 -->


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
//생일양식
function isValidDate(dateString) {
	// 생년월일의 유효한 형식을 정의
	var regex = /^\d{4}-\d{2}-\d{2}$/;
	return regex.test(dateString);
}


//회원가입 체크리스트
$("#join").click(function (e) {
	e.preventDefault();
	if (document.getElementsByName("membername")[0].value == 0) {
		alert("이름을 입력해주세요.");
		document.getElementsByName("membername")[0].focus();
		return false;
	}
	if (document.getElementsByName("memberid")[0].value == 0) {
		alert("아이디를 입력해주세요.");
		document.getElementsByName("memberid")[0].focus();
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
	
	if (document.getElementsByName("passcode")[0].value !== document.getElementById("passcode2").value ) {
		alert("비밀번호 일치확인을 부탁드립니다.");
		document.getElementsByName("passcode")[0].focus();
		return false;
	}
	
	if (document.getElementsByName("passcode")[0].value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		document.getElementsByName("passcode")[0].focus();
		return false;
	}
	
	
    if ($('#email_auth_key').val() != email_auth_cd) {
        alert("인증번호가 일치하지 않습니다.");
        return false;
    }
    var id = $('#memberid').val();
    
    $.ajax({
        type: "POST",
        url: "/member/idCheck",
        data: { id: id, _csrf: $('input[name="_csrf"]').val()},
        dataType: "text",
        success: function (data) {
            // 이 부분이 콜백 함수입니다.
            if (data === "duplicate") {
                alert("아이디가 중복되었습니다. 중복확인 부탁드립니다.");
               
            } else {
                alert("회원가입이 완료되었습니다.");
                document.getElementById("frm").submit();
            }
        },
        error: function () {
            alert("서버 오류로 회원가입에 실패했습니다.");
        }
    });

});
</script>