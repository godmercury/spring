<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
    	<form id="" method="post" action="boardInsert.do">
    		<table class="table">
    			<tbody>
    			<tr>
    				<th>제목</th>
    				<td><input type="text" name="title" class="form-control" /></td>
    			</tr>
    			<tr>
    				<th>내용</th>
    				<td><textarea name="content" rows="7" class="form-control"></textarea></td>
    			</tr>
    			<tr>
    				<th>작성자</th>
    				<td><input type="text" name="writer" class="form-control" /></td>
    			</tr>
    			<tr>
    				<td colspan="2" class="text-center">
    					<button type="submit" class="btn btn-success btn-sm">등록</button>
    					<button type="reset" class="btn btn-warning btn-sm">취소</button>
    				</td>
    			</tr>    			
    			</tbody>
    		</table>
    	</form>    
    </div>
    <div class="panel-footer">Copyright Spring</div>
  </div>
</div>

</body>
</html>
