<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
     <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

	<!-- input box style -->
	<meta charset="utf-8">
 	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- datepicker -->
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	<script type='text/javascript'>
    //플러그인 간의 충돌을 제거합니다.
 /*  		$.noConflict();
    	var j$ = jQuery;

    	j$(function(){
    		j$('.input-daterange').datepicker({
    			autoclose: true, 
    	    locale: {
    	    	format: 'YYYY-MM-DD'
    	   	}
			});
		});
 */  
	$.noConflict();
	var j$ = jQuery;

	j$(function(){
		j$('#dpDOB').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
	});
	
	j$(function(){
		j$('#dpDOB2').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
	});
 /*   	$('#dpDOB').datepicker({
    		 format: 'dd/mm/yyyy'
    		})
    		.on('changeDate', function(e) {
    		// Revalidate the date field
    		   $('#frmClientEdit').formValidation('revalidateField', 'dob');
    		});
*/
	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>

	<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
	<script type="text/javascript">
/* $("#writeBtn").click(function(){
	$("#writeForm").attr({
		"action" : "<c:url value="/project/write"/>",
		"method" : "post"
	}).submit();
});
 */

	$().ready(function(){
		$("#easy").click( function() {
			
			$.post(
				"<c:url value="/project/write" />",
				$("#writeForm").serialize(),
				function(data) {
					if (data != "FAIL") {
						alert("code : "+data)
						window.location.href = "/scedule/list/" + data ;
					} else if (data == "FAIL") {
						location.reload();
					}
			});
		});
	});

	</script>
	<style>
	.button1:hover {
    background-color: white;
    border: 1px solid #BDBDBD;
	}
	</style>
</head>

<body>
<div class="container">
	<div class="col-sm-4 col-sm-offset-4">
	<!-- <form id="writeForm"> -->	
		<br>
		<div class="panel panel-default">
	  	<div class="panel-body">
	  		<div class="col-sm-12">
					<form class="form-horizontal" role="form" id="writeForm" method="post" action="">
						<div class="form-group required">
							<div class="container">
								Create Group Meeting
							</div>
				   	</div>
						<div class="form-group required">
							<div class="input-group">
						      	<!-- <div class="col-xs-3"> -->
					      	<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					   			<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
					    	</div>
						</div>
						<div class="form-group required">
				    	<div class="input-group">
				      		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				      		<input type="text" class="form-control" id="name" name="name" placeholder="User Name">
				    	</div>
				   	</div>
				   	<div class="form-group required">
				    	<div class="input-group">
				      		<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
				      		<input type="text" class="form-control" id="title" name="title" placeholder="Title">
				    	</div>
				   	</div>
				   	<div class="form-group required">
				    	<div class="input-group">
				      		<span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span>
				      		<input type="text" class="form-control" id="project" name="project" placeholder="Project">
				    	</div>
				   	</div>
						<div class="form-group required">
							<div class="input-group date input-append date" id="dpDOB">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" name="startDate" placeholder="From Date" /> 
							</div>
						</div>
						<div class="form-group required">
							<div class="input-group date input-append date" id="dpDOB2">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" name="endDate" placeholder="To Date" /> 
							</div>
						</div>
						<div class="form-group required text-right">		
							<button type="button" class="btn btn-default btn-sm" id="easy">Easy</button>
							<button type="button" class="btn btn-sm button1" id="complex">Complex</button>		
						</div>
				
				<!-- 번호 : <input type ="text" id="phone" name = "phone"><br/>
					이름 : <input type ="text" id="name"  name="name"><br/>
					제목 : <input type ="text" id="title" name ="title"><br/>
					시작날짜 : <input type ="text" id="startDate" name ="startDate"><br/>	
					끝날짜 : <input type ="text" id="endDate" name ="endDate"><br/>
				
					프로젝트  : <input type ="text" id="project" name ="project"><br/>
				
					<input type="button" id="easy" value="간편일정">
					<input type="button" id="complex" value="프로젝트 일정"> -->	
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>