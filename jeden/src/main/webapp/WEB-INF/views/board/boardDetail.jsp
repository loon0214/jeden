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

 
<div class="container">
<h2> Post </h2>

    <form action="/boardPostProc" method="post">
      <div class="form-group">
        <label>제목</label>
        <p>${boardDetail.title}</p>
      </div>
      <div class="form-group">
        <label>작성자</label>
		<p>user</p>
      </div>
      <div class="form-group">
        <label>작성날짜</label>
        <p>${boardDetail.reg_date}</p>
      </div>
      <div class="form-group">
        <label>내용</label>
        <p>${boardDetail.content}</p>
      </div>
    </form>
    
    <button class="btn btn-primary" onclick="location.href='/board/boardEdit/${boardDetail.bno}'">Eidt</button>
	<button class="btn btn-danger" onclick="location.href='/boardDel/${boardDetail.bno}'">remove</button>

</div>
 
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


