<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- if else -->
<%@ page contentType="text/html; charset=UTF-8" %>

<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ header $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->
<nav class="navbar-inverse" >
	  <div class='container' style="height:120px;">
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
			<li><a onclick="location.href='../member/logout'"><span class="glyphicon glyphicon-log-in"></span> logout</a></li>
	        <li><a onclick="location.href='../member/mypage'"><span class="glyphicon glyphicon-user"></span> 회원정보</a></li>
	        <br>
	        <p style='text-align: right; color:white;'>Dzień Dobry ${member.name} :) </p>
		</c:if>    
	      </ul>
		
	    </div>
		<c:if test="${msg == false}">
			<p style='color: red;'>login has failed. check your ID and Password.</p>
		</c:if>
</nav>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ header END $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$-->

<!-- https://www.tutorialrepublic.com/snippets/preview.php?topic=bootstrap&file=navbar-dropdown-login-and-signup-form-with-social-buttons -->

