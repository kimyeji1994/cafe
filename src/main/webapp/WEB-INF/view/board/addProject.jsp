<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
     <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

	<!-- input box style -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> --> 	
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- validation -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/flatly/bootstrap.min.css">
  
  <!-- bootbox -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
  
	<!-- datepicker -->
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
	<script type='text/javascript'>
	
  //플러그인 간의 충돌을 제거  
/* 	$.noConflict();
	var j$ = jQuery;
 */
	$(document).ready(function () {
		
		$('#dpDOB').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
		$('#dpDOB2').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
		$('#dpDOB3').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
		$('#dpDOB4').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
		$('#dpDOB5').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});
		$('#dpDOB6').datepicker({
			autoclose: true, 
			format: 'yyyy-mm-dd'	   	
		});

/* 		$("#save").click( function() {
			
			$.post(
				"<c:url value="/project/write" />",
				$("#writeForm").serialize(),
				function(data) {
					if (data != "FAIL") {
						
						bootbox.alert({
							 	message: "code : "+data,
							  size: 'small',
						    callback: function () {
						    	window.location.href = "/scedule/list/" + data ;
						    }
						});
						
						//alert("code : "+data)
						
					} else if (data == "FAIL") {
						location.reload();
					}
			});
		}); */
		$("#save2").click( function() {
						
			$.post(
				"<c:url value="/project/write" />",
				$("#writeForm2").serialize(),
					function(data) {
						if (data != "FAIL") {
							bootbox.alert({
							 	message: "code : "+data,
							  size: 'small',
						    callback: function () {
						    	window.location.href = "/scedule/list/" + data ;
						    }
							});						
						} else if (data == "FAIL") {
								location.reload();
						}
				});
			});

	});
 

				function formCheck() {
				    // 사용하기 쉽도록 변수를 선언하여 담아주고,
				    var phone = $("#phone").val();
				    if (phone == null || phone == "") { // null인지 비교한 뒤
				        $("#phone").focus(); // 해당태그에 포커스를 준뒤")
				        $("#phoneMsg").show();
				    }else{
				    	$("#phoneMsg").hide();
				    };
				    
				    var user = $("#name").val();
				    if (user == null || user == "") { // null인지 비교한 뒤
			        $("#name").focus(); // 해당태그에 포커스를 준뒤")
			        $("#userMsg").show();
				    }else{
				    	$("#userMsg").hide();
				    };
				    
				    var title = $("#title").val();
				    if (title == null || title == "") { // null인지 비교한 뒤
			        $("#title").focus(); // 해당태그에 포커스를 준뒤")
			        $("#titleMsg").show();
				    }else{
				    	$("#titleMsg").hide();
				    };

				    var startDate = $("#startDate").val();
				    if (startDate == null || startDate == "") { // null인지 비교한 뒤
			        $("#startDtMsg").show();
				    }else{
				    	$("#startDtMsg").hide();
				    };
				    
				    var endDate = $("#endDate").val();
				    if (endDate == null || endDate == "") { // null인지 비교한 뒤
			        $("#endDtMsg").show();
				    }else{
				    	$("#endDtMsg").hide();
				    };

				    var dueDate = $("#dueDate").val();
				    if (dueDate == null || dueDate == "") { // null인지 비교한 뒤
			        $("#dueDtMsg").show();
				    }else{
				    	$("#dueDtMsg").hide();
				    };
				    
				    if($("#phoneMsg").css("display") == "block" || $("#userMsg").css("display") == "block" || $("#titleMsg").css("display") == "block" || $("#startDtMsg").css("display") == "block" || $("#endDtMsg").css("display") == "block" || $("#dueDtMsg").css("display") == "block"){
				    	
				    	//하나라도 빈칸이 있는 것 이기 때문에 return false로 vali check!!!
				    	return false;
				    }
				    
				    
				    	
				};
	
	</script>

	<style>
	
	a {
    color: #555 !important;
	}
	
	</style>
</head>

<body>
<div class="container">
	<div class="col-sm-4 col-sm-offset-4">
	<!-- <form id="writeForm"> -->	
	<br/>
	  <ul class="nav nav-tabs" style="margin-bottom:20px;">
	    <li class="active"><a data-toggle="tab" href="#writeDiv">Easy</a></li>
	    <li><a data-toggle="tab" href="#writeDiv2">Complex</a></li>
	  </ul>
		<div class="tab-content">
	  	<div class="tab-pane fade in active" id="writeDiv">
	  		<form action="" id="writeForm">
	  							
						<div class="row">
							<div id="phoneMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out phone number!</div>
						</div>
						<div class="form-group input-group">
						      	<!-- <div class="col-xs-3"> -->
					      	<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					   			<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
						</div>
						
						<div class="row">
							<div id="userMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out user name!</div>
						</div>
						<div class="form-group input-group">
				      		<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				      		<input type="text" class="form-control" id="name" name="name" placeholder="User Name">
				   	</div>
				   	
				   	<div class="row">
							<div id="titleMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out title!</div>
						</div>
				   	<div class="form-group input-group">
				      		<span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
				      		<input type="text" class="form-control" id="title" name="title" placeholder="Title">
				   	</div>

						<div class="row">
							<div id="startDtMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out start date!</div>
						</div>
						<div class="form-group input-group date input-append date" id="dpDOB">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" id="startDate" name="startDate" placeholder="From Date" /> 
						</div>
						
						<div class="row">
							<div id="endDtMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out end date!</div>
						</div>
						<div class="form-group input-group date input-append date" id="dpDOB2">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" id="endDate" name="endDate" placeholder="To Date" /> 
						</div>
						
						<div class="row">
							<div id="dueDtMsg" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out due date!</div>
						</div>
						<div class="form-group input-group date input-append date" id="dpDOB3">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" id="dueDate" name="dueDate" placeholder="Due Date" /> 
						</div>
						<div class="form-group required text-right">		
							<button type="button" class="btn btn-default btn-sm" id="save" onClick="formCheck();">Save</button>		
						</div>
				</form>	
			</div>
				
	  	<div class="tab-pane fade"id="writeDiv2">
	  		<form id="writeForm2">
	  			<fieldset>
						<div class="form-group has-feedback">
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
							<div class="input-group date input-append date" id="dpDOB4">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" name="startDate" placeholder="From Date" /> 
							</div>
						</div>
						<div class="form-group required">
							<div class="input-group date input-append date" id="dpDOB5">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" name="endDate" placeholder="To Date" /> 
							</div>
						</div>
						<div class="form-group required">
							<div class="input-group date input-append date" id="dpDOB6">
								<span class="input-group-addon add-on">
								<span class="glyphicon glyphicon-calendar"></span></span>
								<input type="text" class="form-control" name="dueDate" placeholder="Due Date" /> 
							</div>
						</div>
						<div class="form-group required text-right">		
							<button type="button" class="btn btn-default btn-sm" id="save2">Save</button>		
						</div>
					</fieldset>		
				</form>
			</div>
		</div>
	</div>
</div>
<script>

/* $(document).ready(function () {
	
function formCheck() {
    // 사용하기 쉽도록 변수를 선언하여 담아주고,
    var phone = document.writeForm.phone.value;
    alert(phone+' : phone');
 
    if (phone == null || phone == "") { // null인지 비교한 뒤
        alert('please enter your phone number'); // 경고창을 띄우고
        document.writeForm.phone.focus(); // 해당태그에 포커스를 준뒤
        return false; // false를 리턴합니다.
    }

};
}); */
</script>
</body>
</html>