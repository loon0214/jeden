<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
 
 
<div class="container">
<h2> Edit Post </h2>
    <form action="/boardEditProc" method="post">
      <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control" id="title" name="title" value="${boardDetail.title}">
      </div>
      <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control" id="content" name="content" rows="3">${boardDetail.content}</textarea>
      </div>
      <input type="hidden" name="bno" value="${bno}"/>
      <button type="submit" class="btn btn-primary">수정</button>
    </form>
</div>
 
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


