<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>

 
<div class="container" style='padding-left:220px; padding-right:220px;' >
<h2> Post </h2>

    <form action="/boardPostProc" method="post">
      <div class="form-group">
        <label>title</label>
        <p>${boardDetail.title}</p>
      </div>
      <div class="form-group">
        <label>writer</label>
		<p>user</p>
      </div>
      <div class="form-group">
        <label>date</label>
        <p>${boardDetail.reg_date}</p>
      </div>
      <div class="form-group">
        <label>content</label>
        <p>${boardDetail.content}</p>
      </div>
    </form>

<c:if test='${member.id != null}'>    
    <button class="btn btn-primary" onclick="location.href='/board/boardEdit/${boardDetail.bno}'">Edit</button>
	<button class="btn btn-danger" onclick="location.href='/boardDel/${boardDetail.bno}'">remove</button>
</c:if>
</div>
 
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


