<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>List</title>
</head>
<script>

//이전 버튼 이벤트
function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/board/boardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
<body>
<%@ include file="../common/header.jsp" %>
 
<div class="container">
	<h2> Blog </h2>
    <table class="table table-hover">
        <tr>
            <th>No</th>
            <th>title</th>
            <th>Writer</th>
            <th>Date</th>
        </tr>
          <c:forEach var="l" items="${boardList}">
              <tr onclick='location.href="/board/boardDetail/${l.bno}"'>
                  <td>${l.bno}</td>
                  <td>${l.title}</td>
                  <td>user</td>
                  <td>${l.reg_date}</td>
              </tr>
          </c:forEach>
          
    </table>
    <p align = 'right'>
		<button class="btn btn-primary" onclick="location.href='/board/boardPost'">post</button>
	</p>
	
<!-- pagination{s} -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>
			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="bno">
				<li class="page-item <c:out value="${pagination.page == bno ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${bno}', '${pagination.range}', '${pagination.rangeSize}')"> ${bno} </a></li>
			</c:forEach>
			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
</div>
<div style='margin-bottom:-100px;'></div>
 
<%@ include file="../common/code.jsp" %>
<%@ include file="../common/footer.jsp" %>
</body>
</html>