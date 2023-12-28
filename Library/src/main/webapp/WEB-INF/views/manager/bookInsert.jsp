<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<link rel="stylesheet" type="text/css" href="/resources/css/bookInsert.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>도서등록</title>
</head>
<body>
	<%@ include file="../includes/header.jsp"%>
	<div class="shareContainer">
		<div class="shareImg" style="background: url(/resources/image/svisual_img.png);"></div>
		<div class="shareContentWrap">
			<div class="shareNav">
				<ul>
                    <li class="navTitle">관리자 페이지</li>
                    <li><span class="keyword"><a href="/manager/bookInsert">도서등록</a></span></li>
                    <li><span ><a href="/manager/bookManagement">도서관리</a></span></li>
                    <li><span><a href="/manager/reservationManagement">예약관리</a></span></li>
                    <li><span><a href="/manager/rentalManagement">대여관리</a></span></li>
                    <li><span><a href="/manager/GeneralMember">회원정보</a></span></li>
                </ul>
			</div>
			<div class="shareContentBox">
				<div class="shareContentTitle">
					<div class="contentTitle">도서등록</div>
					<div class="contentNav">
						<span>홈</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>관리자 페이지</span> <i class="arrow"
							style="background: url(/resources/image/ico_naviArrow.png) 0 50% no-repeat;"></i>
						<span>도서등록</span>
					</div>
				</div>

				<div class="shareContent">
					<form action="/manager/bookInsert" method="post" id="bookInsertForm"
						name="frm" enctype="multipart/form-data" class="bookInsertWrap">
						<table>
							<tr>
								<th>도서 제목</th>
								<td><input type="text" name="title" class="bookInsert"></td>
							</tr>
							<tr>
								<th>ISBN</th>
								<td><input type="text" name="isbn" class="bookInsert"></td>
							</tr>
							<tr>
								<th>장르코드</th>
								<td><input type="text" name="genrecode" class="bookInsert"></td>
							</tr>
							<tr>
								<th>도서분류</th>
								<td><input type="text" name="genrecrawled" class="bookInsert"></td>
							</tr>
							<tr>
								<th>작가</th>
								<td><input type="text" name="author" class="bookInsert"></td>
							</tr>
							<tr>
								<th>출판사</th>
								<td><input type="text" name="publisher" class="bookInsert"></td>
							</tr>
							<tr>
								<th>출판일</th>
								<td><input type="text" name="publisheddate"
									class="bookInsert" placeholder="예시 : '2023-12-14'"></td>
							</tr>
							<tr>
								<th>총보유수량</th>
								<td><input type="text" name="totbookcnt" class="bookInsert"></td>
							</tr>
							<tr>
								<th>도서가격</th>
								<td><input type="text" name="price" class="bookInsert"></td>
							</tr>
							<tr>
								<th>등록자</th>
								<td><input type="text" class="bookInsert"
								value="<sec:authentication property="principal.member.membername"/>"
								readonly="readonly"></td>
							</tr>
							<tr>
								<th>도서이미지정보</th>
								<td><input type="file" name="bookimg">(주의사항 :
									이미지를 변경하고자 할때만 선택하세요.)</td>
							</tr>
							<tr>
								<th>도서정보</th>
								<td><textarea rows="15" cols="100" name="bookcontent"
										class="bookInsert"> </textarea></td>
							</tr>
						</table>
						  
						<div class="bookInsertBtnBox">
							<input type="submit" id="submitBtn" value="등록">
							<input type="reset" value="취소">
						</div>					
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../includes/footer.jsp"%>

	<script type="text/javascript">
	

        $("#submitBtn").on("click", function (event) {
            // 출판일 입력값 가져오기
            var publishedDateValue = $("input[name='publisheddate']").val();

            // 출판일 양식이 맞지 않으면 경고 메시지 표시
            if (!isValidDateFormat(publishedDateValue)) {
                alert("올바른 출판일 양식을 입력해주세요. (예시: 'YYYY-MM-DD')");
                event.preventDefault(); // 폼 제출 중지
            }
        });

        // 출판일 양식 유효성 검사 함수
        function isValidDateFormat(dateString) {
            // 정규식을 사용하여 'YYYY-MM-DD' 형식 검사
            var regex = /^\d{4}-\d{2}-\d{2}$/;
            return regex.test(dateString);
        }

	
	
	
</script>
</body>
</html>
