<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert Form</title>
</head>
<body>
<%@ include file="../common/header.jsp" %>
<div class="container" style='padding-bottom:50px;'>
<h2> new Post </h2>
    <form action="/boardPostProc" method="post">
      <div class="form-group">
        <label for="subject">title</label>
        <input type="text" class="form-control" id="title" name="title" placeholder="type the title.">
      </div>
      <div class="form-group">
        <label for="content">content</label>
        <textarea class="form-control" id="content" name="content" rows="3" placeholder='type the content'></textarea>
      </div>
      <button type="submit" class="btn btn-primary">post</button>
    </form>
</div>
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>


