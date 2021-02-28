<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- if else -->
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"><!-- iCon -->

<style>
</style>

<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ header $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->
<nav class="navbar-inverse">
	  <div class="container-fluid" style="height:120px;">
	    <div class="collapse navbar-collapse">
	<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->
	      <a class="navbar-brand" onclick="location.href='/board/boardList'"> <span style="font-size:60px;" class="glyphicon glyphicon-cloud"></span>
	      <br><font style="font-size:24px; font-weight:bold;" face = "Comic sans MS" size =" 5">cloud story</font></a>
	<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo END $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->
	      <ul class="nav navbar-nav navbar-right">
		<c:if test="${ member == null }">
			<li><a onclick="location.href='../member/login'"><span class="glyphicon glyphicon-log-in"></span> login</a></li>
	        <li><a onclick="location.href='../member/join'"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
	    </c:if>
	   
	    <c:if test="${ member != null }">
	  	<p>${member.name} Dzien Dobry :) </p>
			<li><a onclick="location.href='../member/logout'"><span class="glyphicon glyphicon-log-in"></span> logout</a></li>
	        <li><a onclick="location.href='../member/mypage'"><span class="glyphicon glyphicon-user"></span> 회원정보</a></li>
	        <br>
	        <p>(${member.name})님 안녕하세요. </p>
		</c:if>    
	      </ul>
		
	    </div>
	  </div>
		<c:if test="${msg == false}">
			<p style='color: red;'>login has failed. check your ID and Password.</p>
		</c:if>
</nav>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ header END $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->


