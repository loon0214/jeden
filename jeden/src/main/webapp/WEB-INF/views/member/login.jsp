<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login Form</title>
<script src="${contextPath}/resources/js/js.cookie.js"></script><!-- 쿠키 -->
<script>
	
/////////////////////////////////////// ID 저장 cookie ////////////////////////////////////////////////
$(document).ready(function(){
 
    var key = getCookie("key");	// 저장된 쿠키값을 가져와 ID input에 넣는다.
    $("#id").val(key); 
     
    if($("#id").val() != ""){ //  ID가 입력 되있으면,
        $("#checkId").attr("checked", true); // ID checked
    }
    
    $("#checkId").change(function(){ // checkbox의 체크가 변하면,
        if($("#checkId").is(":checked")){ // if checked,
            setCookie("key", $("#id").val(), 7); // 7일 동안 쿠키 저장
        }else{ // if not checked,
            deleteCookie("key");
        }
    })
     
    // checked -> ID 입력 -> cookie 저장
    $("#id").keyup(function(){ //  ID입력 시,
        if($("#checkId").is(":checked")){ // if checked,
            setCookie("key", $("#id").val(), 7); // 7일 동안 cookie 보관
        }
    })
})
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}

<!-- END END END END END END END END END END ID 저장 cookie END END END END END END END END END END  -->
	


	
</script>
<title>login</title>
</head>
<body>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ login $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->	
<div class="container">    
<div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">                    
	<div class="panel panel-info" >
		<div class="panel-heading">
		    <div class="panel-title">Login</div>
		  
		    <div id="find_id_btn" style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">ID가 기억나지 않으세요 ?</a></div>
		    <br>
		    <div title="비밀번호 찾기" id="find_pw_btn" style="float:right; font-size: 80%; position: relative; top:-10px"><a onclick="location.href='../member/find_pw'">비밀번호가 기억나지 않으세요 ?</a></div>
			
		</div>     
		
		<div style="padding-top:30px" class="panel-body" >
		    <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
		    
		    <form name="loginForm" action="../member/login" method="post">
		                
		        <div style="margin-bottom: 25px" class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
		            <input class="form-control" id="id" name="id" type="text" value ="" required placeholder="ID를 입력 해주세요." autofocus> 
		        </div>
		            
		        <div style="margin-bottom: 25px" class="input-group">
		            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
		            <input class="form-control" id="pw" name="pw" type="password" required placeholder="비밀번호를 입력해주세요.">
		        </div>
	        	<input type="checkbox" id="checkId"> ID 저장
		        <br><br>    
				<button type="submit" class="btn btn-success" style="margin-top:10px">Login</button>
				<button type="button" class="btn btn-default" style="margin-top:10px" onclick="history.go(-1)"> 취소 </button>
				<br><br>
				
		        <div class="form-group">
		            <div class="col-md-12 control">
		                <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" > 회원이 아니신가요 ? 
		                <a onclick="location.href='../member/join'">회원가입은 이곳을 클릭해 주세요.</a>
		                </div>
	                </div>
	            </div>    
	    	</form>   
	    	
		</div>                     
	</div>  
</div>
</div>
<!-- END END END END END END END END END END login END END END END END END END END END END  -->
	
<br><br><br><br><br><br><br><br><br><br>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
