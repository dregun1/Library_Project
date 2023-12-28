function loginCheck() {
	if (document.frm.memberid.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.memberid.focus();
		return false;
	}

	if (document.frm.passcode.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode.focus();
		return false;
	}

	return true;
}

    

function loginCheck2() {

	if (document.frm.memberid.value.length == 0) {
		alert("아이디를 입력해주세요.");
		frm.memberid.focus();
		return false;
	}

	if (document.frm.passcode.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode.focus();
		return false;
	}
	if (document.frm.membername.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.membername.focus();
		return false;
	}
	if (document.frm.postalcode.value.length == 0) {
		alert("우편번호를 입력해주세요.");
		frm.postalcode.focus();
		return false;
	}
	if (document.frm.postaladdress.value.length == 0) {
		alert("주소를 입력해주세요.");
		frm.postaladdress.focus();
		return false;
	} if (document.frm.detailaddress.value.length == 0) {
		alert("상세주소를 입력해주세요.");
		frm.detailaddress.focus();
		return false;
	}
	if (document.frm.mphone.value.length == 0) {
		alert("전화번호를 입력해주세요.");
		frm.mphone.focus();
		return false;
	}
	var birthdate = document.frm.birthdate.value;
	if (!isValidDate(birthdate)) {
		alert("올바른 생년월일 형식(YYYY-MM-DD)을 입력해주세요.");
		frm.birthdate.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력해주세요.");
		frm.address.focus();
		return false;
	}
	return true;
}

function loginCheck3() {
	if (document.frm.membername.value.length == 0) {
		alert("이름을 입력해주세요.");
		frm.membername.focus();
		return false;
	}
	if (document.frm.postalcode.value.length == 0) {
		alert("우편번호를 입력해주세요.");
		frm.postalcode.focus();
		return false;
	}
	if (document.frm.postaladdress.value.length == 0) {
		alert("주소를 입력해주세요.");
		frm.postaladdress.focus();
		return false;
	}
	if (document.frm.detailaddress.value.length == 0) {
		alert("상세주소를 입력해주세요.");
		frm.detailaddress.focus();
		return false;
	}
	if (document.frm.mphone.value.length == 0) {
		alert("전화번호를 입력해주세요.");
		frm.mphone.focus();
		return false;
	}
	var birthdate = document.frm.birthdate.value;
	if (!isValidDate(birthdate)) {
		alert("올바른 생년월일 형식(YYYY-MM-DD)을 입력해주세요.");
		frm.birthdate.focus();
		return false;
	}
	if (document.frm.email.value.length == 0) {
		alert("이메일을 입력해주세요.");
		frm.email.focus();
		return false;
	}

	alert("정보가 수정되었습니다.");
	return true;
}

function isValidDate(dateString) {
	// 생년월일의 유효한 형식을 정의
	var regex = /^\d{4}-\d{2}-\d{2}$/;
	return regex.test(dateString);
}

function idCheck() {
	
	if (document.frm.memberid.value == "") {
		alert("아이디를 입력해주세요.");
		document.frm.memberid.focus();
		return ; 
	}
	let url = "BookServlet?command=idcheck&memberid=" + document.frm.memberid.value;
	window.open(url, "_blank_1", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=450, height=200");
}


function pwcheck() {
	if (document.frm.passcode.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode.focus();
		return false;
	}
	alert("수정 페이지로 이동합니다.");
	return true;
}

function deletecheck() {

	if (document.frm.passcode.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode.focus();
		return false;
	}
	var confirmed = confirm("정말로 탈퇴하시겠습니까?");
	if (confirmed) {
		// 사용자가 "예"를 선택한 경우 서버로 비밀번호 확인 요청을 보낼 수 있습니다.
		// 예를 들어, AJAX 요청을 사용하여 서버와 통신할 수 있습니다.
		// 이 예제에서는 서버로의 요청을 보내지는 않지만, 여기에 필요한 코드를 추가할 수 있습니다.
		return true;
	} else {
		// 사용자가 "아니오"를 선택한 경우 동작을 취소합니다.
		return false;
	}
}



function idOk() {
	opener.frm.memberid.value
		= document.frm.memberid.value;
	self.close();
}


function passEqualCheck() {
	console.log("Function called")
	var passcode = document.getElementById("passcode").value;
	var passcode2 = document.getElementById("passcode2").value;

	if (document.frm.passcode.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode.focus();
		return false;
	}

	if (document.frm.passcode2.value.length == 0) {
		alert("비밀번호를 입력해주세요.");
		frm.passcode2.focus();
		return false;
	}

	if (passcode !== passcode2) {
		alert("비밀번호가 일치하지 않습니다.");
		document.getElementById("passcode").focus();
		return false;
	}
	alert("변경되었습니다.");
	return true;
}
function validateAgreements() {
    const agree1 = document.getElementById('agree1');
    const agree2 = document.getElementById('agree2');
    
    if (!agree1.checked || !agree2.checked) {
        alert('필수사항에 동의해주세요.');
        return false; // 제출 방지
    }
    
    return true; // 폼 제출 허용
}

