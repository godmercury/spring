<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>Spring MVC02</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
  	#boardForm {
  		display: none;
  	}
  </style>
</head>
<body>
 
<div class="container">
  <h2>Spring MVC02</h2>
  <div class="panel panel-default">
    <div class="panel-heading">Board</div>
    
    <!-- 게시판 리스트 -->
    <div id="boardList" class="panel-body">
    	<div class="text-right">
    		<button type="button" id="btnWrite" class="btn btn-primary btn-sm">작성</button>
    	</div>
    	<table class="table table-bordered">
    		<thead>
	    		<th>번호</th>
	    		<th>제목</th>
	    		<th>작성자</th>
	    		<th>작성일</th>
	    		<th>조회수</th>
    		</thead>
    		<tbody id="tableBody">
    		</tbody>
    	</table>
    </div>
    <!-- // 게시판 리스트 -->
    
    <!-- 게시판 작성 -->
    <div id="boardForm" class="panel-body">    	
        <form id="frmWrite" method="post" action="boards" class="needs-validation" novalidate>
    		<table class="table table-bordered">
    			<tbody>
    			<tr>
    				<th>제목</th>
    				<td>
    					<input type="text" name="title" class="form-control" required />    					
    				</td>
    			</tr>
    			<tr>
    				<th>내용</th>
    				<td>
    					<textarea name="content" rows="7" class="form-control" required></textarea>    					
    				</td>
    			</tr>
    			<tr>
    				<th>작성자</th>
    				<td>
    					<input type="text" name="writer" class="form-control" required />
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2" class="text-center">
    					<button type="submit" class="btn btn-success btn-sm">등록</button>
    					<button type="reset" id="btnReset" class="btn btn-warning btn-sm">취소</button>
    					<button type="button" class="btn btn-info btn-sm btnList">목록</button>    					
    				</td>
    			</tr>    			
    			</tbody>
    		</table>
    	</form>
    </div>
    <!-- // 게시판 작성 -->
    
    <div class="panel-footer">Copyright Spring</div>
  </div>
</div>

 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 <script>
 	$(document).on('click', '.btnDetail', function() {
 		const idx = $(this).data('idx');
 		
 		if ($('#content' + idx).css('display') === 'none') {
 			$('#textarea' + idx).attr('readonly', true);
 	 		$.ajax({
 	 			url: 'boards/' + idx,
 	 			type: 'get',
 	 			data: {},
 	 			dataType: 'json',
 	 			success: function(data) { 	 				
 	 				$('#textarea' + idx).val(data.content);
 	 				$('#count' + idx).html(data.count);
 	 			},
 	 			error: function(e) {
 	 				// console.log(e);
 	 				alert('error');
 	 			}
 	 		}); 			
 		}
 		 		
 		$('#content' + idx).toggle(); 	
 	});
 	
 	$(document).on('click', '.btnDestroy', function() { 		
 		const idx = $(this).data('idx');
 		
 		$.ajax({
 			url: 'boards/' + idx,
 			type: 'delete',
 			data: {},
 			success: loadList,
 			error: function(e) {
 				// console.log(e);
 				alert('error');
 			}
 		});
 	});
 	
 	$(document).on('click', '.btnUpdate', function() { 		
 		const idx = $(this).data('idx');
 		
 		const param = {
 			idx: idx,
			title: $('#titleText' + idx).val(),
			content: $('#textarea' + idx).val()
 		};
 		
 		$.ajax({
 			url: 'boards/' + idx,
 			type: 'put',
 			contentType: 'application/json',
 			data: JSON.stringify(param), 			
 			success: loadList,
 			error: function(e) {
 				// console.log(e);
 				alert('error');
 			}
 		});
 	}); 	
 	
 	$(document).on('click', '.btnEdit', function() { 		
 		const idx = $(this).data('idx');
 		 		 		
 		$('#textarea' + idx).attr('readonly', false);
 		$('#titleText' + idx).show();
 		$('#titleBtn' + idx).hide(); 	
 		$('#btnSave' + idx).show();
 		$('#btnEdit' + idx).hide(); 		
 	});
 	
 	$(document).on('click', '.btnList', function() { 		
 		changeView('boardList'); 		
 	}); 	
 
	(function() {
		'use strict';
		
	  	const btnWrite = document.getElementById('btnWrite');
	  	btnWrite.addEventListener('click', (e) => {
	  		changeView('boardForm');
	  	}, false);
	  	
	  	/*
	  	const btnLists = document.querySelectorAll('button.btnList');
	  	for (let i=0; i<btnLists.length; i++) {
	  		const btnList = btnLists[i];
	  		btnList.addEventListener('click', (e) => {
	  			changeView('boardList');
	  		}, false);  		
	  	}
	  	*/
			
		window.addEventListener('load', function() {
			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.getElementsByClassName('needs-validation');
			// Loop over them and prevent submission
			var validation = Array.prototype.filter.call(forms, function(form) {
				form.addEventListener('submit', function(event) {
					if (form.checkValidity() === false) {
						// form.classList.add('was-validated');
						alert('validation!!!');
					} else {
						doSave(form);
					}
					
					event.preventDefault();
					event.stopPropagation();					
				}, false);
			});
		}, false);
		
		loadList();
	})();
 	
 	function loadList() {
 		$.ajax({
 			url: 'boards',
 			type: 'get', 			
 			success: makeList,
 			error: function(e) {
 				// console.log(e);
 				alert('error'); 				
 			}
 		});
 	}
 	
 	function doSave(form) {
 		//console.log(form.getAttribute('action'));
 		//console.log(form.getAttribute('method'));
		$.ajax({
 			url: form.getAttribute('action'),
 			type: form.getAttribute('method'), 			
 			//data: new FormData(form),
 			//processData: false,			 			
 			data: $('#frmWrite').serialize(), 			
 			success: loadList,
 			error: function(e) {
 				// console.log(e);
 				alert('error');
 			}
 		});
		clearForm('btnReset');
 	}
 	
 	function makeList(data) {
 		// console.log(data);
 		let result = '';
 		
 		$.each(data, function(index, obj) {
 			result += '<tr>';
 	  		result += '<td>' + (index + 1) + '</td>';
 	  		result += '<td>';
 	  		result += '	<button type="button" id="titleBtn' + obj.idx + '" class="btn btn-link btnDetail" style="padding: 0" data-idx="' + obj.idx + '">' + obj.title + '</button>';
			result += '	<input type="text" id="titleText' + obj.idx + '" name="title" value="' + obj.title + '" class="form-control" style="display: none;" />'; 	  		
 	  		result += '</td>';
 	  		result += '<td>' + obj.writer + '</td>';
 	  		result += '<td>' + obj.indate.split(' ')[0] + '</td>';
 	  		result += '<td><span id="count' + obj.idx + '">' + obj.count + '</span></td>';
 	  		result += '<td>'; 	  		
 	  		result += '	<button type="button" class="btn btn-warning btn-sm btnDestroy" data-idx="' + obj.idx + '">삭제</button>';
 	  		result += '</td>';
 	  		result += '</tr>';
 	  		result += '<tr id="content' + obj.idx + '" style="display: none">';
 	  		result += '<td colspan="6">'
 	  		result += '	<textarea rows="5" id="textarea' + obj.idx + '" class="form-control" readonly></textarea>';
 	  		result += '	<button type="button" id="btnEdit' + obj.idx + '" class="btn btn-success btn-sm btnEdit" data-idx="' + obj.idx + '">수정</button>';
 	  		result += '	<button type="button" id="btnSave' + obj.idx + '" class="btn btn-primary btn-sm btnUpdate" data-idx="' + obj.idx + '" style="display:none;">저장</button>';
 	  		result += '	<button type="button" class="btn btn-info btn-sm btnList">목록</button> '; 	  		
 	  		result += '</td>';
 	  		result += '</tr>';
 		});
 		
 		$('#tableBody').html(result);
 		changeView('boardList');
 	} 	
 	
 	function changeView(elementId) {
 		// boardForm 작성
 		// boardList 리스트
 		const views = ['boardForm', 'boardList'];
 		
 		for(let i=0; i<views.length; i++) {
 			const view = views[i];
 			
 			if (view === elementId) {
 				document.getElementById(view).style.display = 'block';
 			} else {
 				document.getElementById(view).style.display = 'none';
 			}  		    
 		}
 	}
 	
 	function clearForm(elementId) {
 		const element = document.getElementById(elementId);
 		element.click();
 	}
 	
 </script>
</body>
</html>

