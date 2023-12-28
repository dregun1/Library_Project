function bookCheck(){
    if((parseInt(document.frm.totbookcnt.value) != (parseInt(document.frm.rentedbookcnt.value) + parseInt(document.frm.curbookcnt.value)))){ 
        alert("입력하신 보유량 정보를 확인해 주세요");
        return false;
    }
    if(document.frm.isbn.value.length == 0){
        alert("ISBN 코드를 확인해 주세요.");
        return false;
    }
    if(document.frm.title.value.length == 0){
        alert("도서제목을 확인해 주세요.");
        return false;
    }
    if(document.frm.author.value.length == 0){
        alert("작가명을 확인해 주세요.");
        return false;
    }
    if(document.frm.genrecode.value.length == 0){
        alert("도서분류를 확인해 주세요.");
        return false;
    }
    if(document.frm.publisher.value.length == 0){
        alert("출판사 정보를 확인해 주세요.");
        return false;
    }
    if(document.frm.publisheddate.value.length == 0){
        alert("출간일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.price.value.length == 0){
        alert("도서가격을 확인해 주세요.");
        return false;
    }
    if(document.frm.registereddate.value.length == 0){
        alert("등록일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.memberid.value.length == 0){
        alert("등록자 정보를 확인해 주세요.");
        return false;
    }
    
    return true;
}

function subscrCheck(){
    if(document.frm.subscrname.value.length == 0){
        alert("구독권명을 확인해 주세요.");
        return false;
    }
    if(document.frm.price.value.length == 0){
        alert("구독권 가격을 확인해 주세요.");
        return false;
    }
    if(document.frm.salefromdate.value.length == 0){
        alert("판매시작일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.saletodate.value.length == 0){
        alert("판매종료일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.subscrperiod.value.length == 0){
        alert("구독기간을 확인해 주세요.");
        return false;
    }
    if(document.frm.allowedbookcnt.value.length == 0){
        alert("대여가능 도서수를 확인해 주세요.");
        return false;
    }
    if(document.frm.memberid.value.length == 0){
        alert("등록자를 확인해 주세요.");
        return false;
    }
    if(document.frm.registereddate.value.length == 0){
        alert("등록/수정일자를 확인해 주세요.");
        return false;
    }
    
    let fromdate = new Date(document.frm.salefromdate.value);
    let todate = new Date(document.frm.saletodate.value);
    let nowdate = new Date();
    if (todate < fromdate){
		alert("판매종료일자는 판매시작일자 이후로 입력해 주세요");
		return false;
	}
	if (fromdate < nowdate){
		alert("판매개시일은 이전 날짜를 입력할 수 없습니다.");
		return false;
	}
    
    return true;
}
function subscrUpdateCheck(){
    if(document.frm.subscrname.value.length == 0){
        alert("구독권명을 확인해 주세요.");
        return false;
    }
    if(document.frm.price.value.length == 0){
        alert("구독권 가격을 확인해 주세요.");
        return false;
    }
    if(document.frm.salefromdate.value.length == 0){
        alert("판매시작일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.saletodate.value.length == 0){
        alert("판매종료일자를 확인해 주세요.");
        return false;
    }
    if(document.frm.subscrperiod.value.length == 0){
        alert("구독기간을 확인해 주세요.");
        return false;
    }
    if(document.frm.allowedbookcnt.value.length == 0){
        alert("대여가능 도서수를 확인해 주세요.");
        return false;
    }
    if(document.frm.memberid.value.length == 0){
        alert("등록자를 확인해 주세요.");
        return false;
    }
    if(document.frm.registereddate.value.length == 0){
        alert("등록/수정일자를 확인해 주세요.");
        return false;
    }
    
    let fromdate = new Date(document.frm.salefromdate.value);
    let todate = new Date(document.frm.saletodate.value);
    let nowdate = new Date();
    if (todate < fromdate){
		alert("판매종료일자는 판매시작일자 이후로 입력해 주세요");
		return false;
	}
	if (fromdate < nowdate){
		alert("판매개시된 구독권은 수정할 수 없습니다.");
		return false;
	}
	
    var inputs = document.querySelectorAll('.subscrUpdate');
    for (var i = 0; i < inputs.length; i++) {
      if (inputs[i].defaultValue !== inputs[i].value) {
        return true; // 변경된 값이 있으면 true 반환
      }
    }
    alert('수정된 항목이 없습니다.');
    return false;
}

function subscrDelCheck(){
    
    let fromdate = new Date(document.frm.salefromdate.value);
    let nowdate = new Date();
	if (fromdate < nowdate){
		alert("판매개시된 구독권은 삭제할 수 없습니다.");
		return false;
	}
    
    return true;
}
