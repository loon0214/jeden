<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- if else -->
<%@ page contentType="text/html; charset=UTF-8" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous"><!-- iCon -->

<style>
</style>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
<div class='container'>
<!-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ logo $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ -->
      <a class="navbar-brand" onclick="location.href='../../board/boardList'"><i class='fas fa-cloud' style='font-size:55px; text-indent: 0.4em;'></i><br>
      <font style="font-size:24px; font-weight:bold;" face = "Comic sans MS" size ="5">cloud Story</font></a>
<!-- END END END END END END END END END END logo END END END END END END END END END END -->  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
  	<span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
  <c:if test = "${member == null}">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active"><a class="nav-link" onclick="location.href='../../member/login'">login</a></li>
      <li class="nav-item active"><a class="nav-link" onclick="location.href='../../member/join'">Join</a></li>
   </ul>
  </c:if>
  <c:if test = "${member != null}">
  	<p>${member.name} Dzien Dobry :) </p>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active"><a class="nav-link" onclick="location.href='../../member/login'" id='logoutBtn'>logout</a></li>
      <li class="nav-item active"><a class="nav-link" onclick="location.href='../../member/join'">mypage</a></li>
   </ul>
  </c:if>
  <c:if test="${msg == false}">
  	<p style='color: red;'>login has failed. check your ID and Password.</p>
  </c:if>
  </div>
</div>
</nav>

<br><br><br>
<!-- https://stackoverflow.com/questions/41513463/bootstrap-4-align-navbar-items-to-the-right  -->
