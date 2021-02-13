<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<SCRIPT src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></SCRIPT><!-- 다음 주소 API -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
(function(){
	$("#joinForm").submit(function(){
		if($("#pw").val() !== $("#pw2").val()){
			alert("비밀번호가 다릅니다.");
			$("#pw").val("").focus();
			$("#pw2").val("");
			return false;
		}else if ($("#pw").val().length < 3) {
			alert("비밀번호는 3자 이상으로 설정해야 합니다.");
			$("#pw").val("").focus();
			return false;
		}else if($.trim($("#pw").val()) !== $("#pw").val() || $.trim($("#email").val()) !== $("#email").val() || $.trim($("#id").val()) !== $("#id").val()){
			alert("공백은 입력이 불가능합니다.");
			return false;
		}
	})
	
	$("#id").keyup(function() {
		$.ajax({
			url : "../member/check_id",
			type : "POST",
			data : {
				id : $("#id").val()
			},
			success : function(result) {
				if (result == 1) {
					$("#check_id").html("중복된 아이디가 있습니다.");
					$("#joinBtn").attr("disabled", "disabled");
				} else {
					$("#check_id").html("");
					$("#joinBtn").removeAttr("disabled");
				}
			},
		})
	});
	
	$("#email").keyup(function(){
		$.ajax({
			url : "./check_email",
			type : "POST",
			data : {
				email : $("#email").val()
			},
			success : function(result) {
				if (result == 1) {
					$("#email_check").html("중복된 이메일이 있습니다.");
				} else {
					$("#email_check").html("");
				}
			},
		})
	});
})


//////////////////////////////////////// 다음 주소 ///////////////////////////////////
    function PostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('adres1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('adres2').value = fullRoadAddr;
                document.getElementById('adres3').focus();
            }
        }).open();
    }

</script>
<style>
body {
	color: #fff;
	background: lightblue;
	font-family: 'Roboto', sans-serif;
}

.signup-form {
	width: 450px;
	margin: 0 auto;
	padding: 30px 0;
  	font-size: 15px;
}

.signup-form form {
	color: #999;
	border-radius: 3px;
	margin-bottom: 15px;
	background: #f2f3f7;
	box-shadow: 20px 20px 10px rgba(0, 0, 0, 0.3);
	padding: 30px;
}
</style>
<title>Join Form</title>
</head>
<body>
<div class="signup-form">
    <form id="joinForm" action="../member/join" method="post">
		<h2 style="text-align: center; color:black;">Register</h2>
		<br>

		<p class="hint-text">type the your information to join.</p>
        <div class="form-group">
        	<input type="text" class="form-control" id="id" name="id" placeholder="ID" required autofocus>
            <span id="check_id"></span>
        </div>
		<div class="form-group">
            <input type="password" class="form-control" id="pw" name="pw" placeholder="Password" required>
        </div>
		<div class="form-group">
            <input type="password" class="form-control" id="pw2" name="pw2" placeholder="Confirm Password" required>
        </div>   
        <div class="form-group">
        	<input type="email" class="form-control" name="email" placeholder="Email" required>
			<span id="email_check" class="text-red"></span>
        </div>
        
        <div class="form-group">                   
	        <input class="form-control" style="width: 60%; display: inline;" placeholder="postal code" name="adres1" id="adres1" type="text" readonly="readonly" >
	        <button type="button" style="float: right;" class="btn btn-outline-dark btn-sm" onclick="PostCode();"><i class="fa fa-search"></i> find postal code</button>                               
        </div>
        <div class="form-group">
            <input class="form-control" style="top: 5px;" placeholder="Road Name Adres" name="adres2" id="adres2" type="text" readonly="readonly" />
        </div>
        <div class="form-group">
            <input class="form-control" placeholder="Detailed Adres" name="adres3" id="adres3" type="text"  />
        </div>  
        
        <div class="form-group">
        	<input type="text" class="form-control" name="name" placeholder="Name" required>
        </div>
        <div class="form-group">
        	<input type="text" class="form-control" name="phone" placeholder="Phone">
        </div>
        <div class="form-group">
        	<input type="date" class="form-control" name="bday" placeholder="bday" >
        </div>
        
        <br><br>     
		<div class="form-group">
            <button type="submit" id="joinBtn" class="btn btn-primary btn-block">Register</button>
        	<button type="button" class="btn btn-dark btn-block" onclick="history.go(-1);">cancle</button>
        </div>
    </form>
    <br>
	<div class="text-center">Already have an account? <a onclick="location.href='../member/login'"> login</a></div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>