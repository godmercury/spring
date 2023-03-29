<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	pageContext.setAttribute("LF", "\n");
	pageContext.setAttribute("BR", "<br/>");
%>  
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Spring MVC01</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC01</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    <div class="panel-body">
   		<table class="table">
   			<tbody>
   			<tr>
   				<th>제목</th>
   				<td>${vo.title}</td>
   			</tr>
   			<tr>
   				<th>내용</th>
   				<%-- <td>${fn:replace(vo.content, LF, BR}</td> --%>
   				<%-- <td><c:out value="${fn:replace(vo.content, LF, BR)}" escapeXml="false"/></td> --%>
   				<td>${fn:replace(vo.content, LF, BR)}</td>
   			</tr>
   			<tr>
   				<th>작성자</th>
   				<td>${vo.writer}</td>
   			</tr>
   			<tr>
   				<th>작성일</th>
   				<td>${fn:split(vo.indate," ")[0]}</td>
   			</tr>   			
   			<tr>
   				<td colspan="2" class="text-center">
   					<a href="boardUpdateForm.do/${vo.idx}" class="btn btn-success btn-sm">수정</a>
   					<a href="boardDelete.do/${vo.idx}" class="btn btn-danger btn-sm">삭제</a>
   					<a href="boardList.do" class="btn btn-info btn-sm">목록</a>
   				</td>
   			</tr>    			
   			</tbody>
   		</table>    
    </div>
    <div class="panel-footer">Copyright Spring</div>
  </div>
</div>

</body>
</html>
