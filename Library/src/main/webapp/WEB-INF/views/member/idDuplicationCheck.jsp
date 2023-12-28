<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<body>
<h3>아이디 중복체크</h3>
<form action="/member/IdDuplicationCheck" method="get" >
	아이디 <input type="text" name="memberid" value="${memberid}">
	<input type="submit" value="중복체크">
	<br>
	<c:if test="${result == 1}">
		<script type="text/javascript">
		document.getElementsByName("memberid")[0].value="";
		</script>
		${memberid}는 이미 사용 중인 아이디입니다.
	</c:if>

	<c:if test="${result != 1 }">
		${memberid}는 사용 가능한 아이디입니다.
		<input type="button" value="사용"  onclick="idOk()">
	</c:if>
</form>
</body>
</html>
<script type="text/javascript">
function idOk() {
    opener.document.getElementsByName("memberid")[0].value = document.getElementsByName("memberid")[0].value;
    self.close();
}

</script>