<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<style>
    .myModal {
        position: absolute;
        display: none;
        justify-content: center;
        align-items: center;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-body {
        position: relative;
        width: 400px;
        height: 200px;
        padding: 20px;
        text-align: center;
        background-color: rgb(255, 255, 255);
        border-radius: 10px;
        box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15);
    }
</style>






<%@ include file="../includes/header.jsp"%>
<body>
<h1>
	메인창이라고 합시다.  
</h1>
    <!-- 모달창 -->
    <div class="myModal">
        <div class="modal-body">
            <span class="close_button" onclick="closeModal()">&times;</span>
            정보 수정이 완료되었습니다.
        </div>
    </div>
    <!--  -->
    
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
  $(document).ready(function(){
        var result = '<c:out value="${result}"/>';

        checkModal(result);
        
        //result값 보고 모달창 띄우기
        function checkModal(a){
            if (a === ''){
                return;
            }
            if (parseInt(a)>0){
                $(".myModal").css("display", "flex");
            }
        }

        // 닫기 버튼을 누를 때 모달을 숨깁니다.
        window.closeModal = function() {
            $(".myModal").css("display", "none");
        };

    });
</script>