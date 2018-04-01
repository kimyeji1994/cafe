<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
     <% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>

  <!-- bootbox -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

<!--   <link rel="stylesheet" href="/static/css/add.css"> -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<!-- datepicker -->
  <script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<!-- 	<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
 -->  <script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
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
	});
		 		function saveClick() {
					
					$.post(
							
							"<c:url value="/project/write" />",
							$("#writeForm").serialize(),
							function(data) {
				
								if (data != "FAIL") {
								
									bootbox.alert({
									 	message: "code : "+data,
									  size: 'small',
								    callback: function () {
								    	if(data.length < 6){
								    	
								    		window.location.href = "/scedule/list/" + data ;
								    	}
								    	else{
								    	
								    		window.location.href = "/project/list/" + data ;
								    	}
								    		
								    }
									});
								
								//alert("code : "+data)
								
							} else if (data == "FAIL") {
								location.reload();
							}
						});
				};
		 		function saveClick2() {
					
					$.post(
							
							"<c:url value="/project/write" />",
							$("#writeForm2").serialize(),
							function(data) {
								if (data != "FAIL") {
								
									bootbox.alert({
									 	message: "code : "+data,
									  size: 'small',
								    callback: function () {
								    	if(data.length < 6){
									    	
								    		window.location.href = "/scedule/list/" + data ;
								    	}
								    	else{
								    	
								    		window.location.href = "/project/list/" + data ;
								    	};
								    }
									});
								
								//alert("code : "+data)
								
							} else if (data == "FAIL") {
								location.reload();
							}
						});
				};

				function formCheck() {
				    // 사용하기 쉽도록 변수를 선언하여 담아주고,
				    
				    var phone = $("#phone").val();
				    if (phone == null || phone == "" || phone.length<10) { // null인지 비교한 뒤
				    		alert(phone.length);
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
				    }else{
				    	saveClick();
				    }
				    	
				};
				function formCheck2() {
				    // 사용하기 쉽도록 변수를 선언하여 담아주고,
						
				    var phone = $("#phone2").val();
				    if (phone == null || phone == "") { // null인지 비교한 뒤
				        $("#phone2").focus(); // 해당태그에 포커스를 준뒤")
				        $("#phoneMsg2").show();
				    }else{
				    	$("#phoneMsg2").hide();
				    };
				    
				    var user = $("#name2").val();
				    if (user == null || user == "") { // null인지 비교한 뒤
			        $("#name2").focus(); // 해당태그에 포커스를 준뒤")
			        $("#userMsg2").show();
				    }else{
				    	$("#userMsg2").hide();
				    };
				    
				    var project = $("#project").val();
				    if (project == null || project == "") { // null인지 비교한 뒤
				    	$("#project").focus();
			        $("#projectMsg").show();
				    }else{
				    	$("#projectMsg").hide();
				    };
				    
				    var title = $("#title2").val();
				    if (title == null || title == "") { // null인지 비교한 뒤
			        $("#title2").focus(); // 해당태그에 포커스를 준뒤")
			        $("#titleMsg2").show();
				    }else{
				    	$("#titleMsg2").hide();
				    };
				    
				    var startDate = $("#startDate2").val();
				    if (startDate == null || startDate == "") { // null인지 비교한 뒤
			        $("#startDtMsg2").show();
				    }else{
				    	$("#startDtMsg2").hide();
				    };
				    
				    var endDate = $("#endDate2").val();
				    if (endDate == null || endDate == "") { // null인지 비교한 뒤
			        $("#endDtMsg2").show();
				    }else{
				    	$("#endDtMsg2").hide();
				    };

				    var dueDate = $("#dueDate2").val();
				    if (dueDate == null || dueDate == "") { // null인지 비교한 뒤
			        $("#dueDtMsg2").show();
				    }else{
				    	$("#dueDtMsg2").hide();
				    };
				    
				    if($("#phoneMsg2").css("display") == "block" || $("#userMsg2").css("display") == "block" || $("#projectMsg").css("display") == "block" || $("#titleMsg2").css("display") == "block" || $("#startDtMsg2").css("display") == "block" || $("#endDtMsg2").css("display") == "block" || $("#dueDtMsg2").css("display") == "block"){
				    	
				    	//하나라도 빈칸이 있는 것 이기 때문에 return false로 vali check!!!
				    	return false;
				    }else{
				    	saveClick2();
				    }
				    	
				};

	function excelUploadCall(){
		$('#fileUpload').val('');
		$('#fileUpload').click();
	}
	
	function excelUpload(){
		var ext = '';
		
		if($('#fileUpload').val() != ''){
			ext = $('#fileUpload').val().split('.').pop().toLowerCase();
			
			if($.inArray(ext, ['xlsx', 'xlsm', 'xlsb', 'xls', 'xltx', 'xltxm', 'xlt']) == -1){
				$('#excelMsg').show();
				return false;
			} else {
				$('#excelMsg').hide();
				$('#modalCall').click();
			}

			var formData = new FormData($('#frm')[0]);
			
			$.ajax({
				processData: false,
				contentType: false,
				url: '/excel/excelUpload',
				type: 'POST',
				data: formData,
				success: function(result){
					var getUsers = result.userList;
					
					$('#result').empty();
					
					for(var i = 0; i < getUsers.length ; i++){
						var userInfo = getUsers[i].name + ' : ' + getUsers[i].phone;
						
						$('#result').append('<div id="user_"' + i + '>' + userInfo + '</div>');
					}
				}
			});
			
		}
	}
	
	function userSave(){
		var formData = new FormData($('#frm')[0]);
		
		$.ajax({
			processData: false,
			contentType: false,
			url: '/user/excelUpload',
			type: 'POST',
			data: formData,
			success: function(result){
				var message = "";
				
				if(result == 0){
					message = "Failed to upload users!";
				} else {
					message = "Successfully uploaded users!";
				}
				$("#saveResult").html(message);
				$("#saveModalCall").click();
			}
		});
	}
	
	function excelDown(){
		$('#frm_importance').val($("#importance > li[class='active'] > a").html());
		$('#frm_name').val($('#name').val());
		$('#frm_project').val($('#project').val());
		$('#frm_title').val($('#title').val());
		$('#frm_startDate').val($('#startDate').val());
		$('#frm_endDate').val($('#endDate').val());
		$('#frm_dueDate').val($('#dueDate').val());
		
		var formData = $('#projectFrm').serialize();
		
		console.log(formData);
		
		$.ajax({
			url: '/excel/userExcelDownload',
			type: 'POST',
			data: formData,
			success: function(result){
				console.log(result);
			}
		});
	}
	</script>

<!-- 	<style>
	
	a {
    color: #555 !important;
	}
	
	</style> -->
</head>

<body>
<div class="modal" id="modalCreate" role="dialog">
	<div class="modal-dialog modal-sm">
		<div class="modal-content" style='background: rgba(255,255,255,0.98);'>
			<div class="modal-body">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<div class="container">
<!-- 	<div class="col-sm-4 col-sm-offset-4"> -->
	<!-- <form id="writeForm"> -->	
					<br/>
				  <ul class="nav nav-tabs" style="margin-bottom:20px;">
<!-- 				    <li class="active"><a data-toggle="tab" href="#writeDiv">Easy</a></li>
				    <li><a data-toggle="tab" href="#writeDiv2">Complex</a></li> -->
				    <li class="nav-item"><a data-toggle="tab" href="#writeDiv" class="nav-link small text-uppercase active">Quick</a></li>
				    <li class="nav-item"><a data-toggle="tab" href="#writeDiv2" class="nav-link small text-uppercase">Project</a></li>
				  </ul>
					<div class="tab-content">
				  	<div class="tab-pane fade active show" id="writeDiv">
				  		<form id="writeForm">
			  					<div class="col-xs-12">
										<div id="phoneMsg" class="text-right small" style="display:none; color:#ff6666;">* Please enter your phone number.</div>
									</div>	
									<div class="form-group input-group">
						      	<div class="input-group-prepend">
									    <span class="input-group-text" style="background: #fff;"><i class="fa fa-phone"></i></span>
									  </div>
						   			<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
									</div>
									
									<div class="col-xs-12">
										<div id="userMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out user name!</div>
									</div>
									<div class="form-group input-group">
						      	<div class="input-group-prepend">
									    <span class="input-group-text" style="background: #fff;"><i class="fa fa-user"></i></span>
									  </div>												
							      <input type="text" class="form-control" id="name" name="name" placeholder="User Name">
							   	</div>
							   	
							   	<div class="col-xs-12">
										<div id="titleMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out title!</div>
									</div>
							   	<div class="form-group input-group">
						      	<div class="input-group-prepend">
									    <span class="input-group-text" style="background: #fff;"><i class="fa fa-pencil"></i></span>
									  </div>	
										<input type="text" class="form-control" id="title" name="title" placeholder="Title">
							   	</div>
			
									<div class="col-xs-12">
										<div id="startDtMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out start date!</div>
									</div>
									<div class="form-group date input-append date" id="dpDOB">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="startDate" name="startDate" placeholder="From Date" /> 
									</div>
									
									<div class="col-xs-12">
										<div id="endDtMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out end date!</div>
									</div>
									<div class="form-group date input-append date" id="dpDOB2">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="endDate" name="endDate" placeholder="To Date" /> 
									</div>
									
									<div class="col-xs-12">
										<div id="dueDtMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out due date!</div>
									</div>
									<div class="form-group date input-append date" id="dpDOB3">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="dueDate" name="dueDate" placeholder="Due Date" /> 
									</div>
	<!-- 									<div class="form-group required text-right">		
											<button type="button" class="btn btn-default btn-sm" id="save" onClick="formCheck();">Save</button>		
										</div> -->
									<div class="form-group required">
										<button type="button" class="btn btn-lg btn-primary btn-block btn-signin" id="save" onClick="formCheck();" >Save</button>
						    	</div>
								</form>	
							</div>
						
		  				<div class="tab-pane fade"id="writeDiv2">
					  		<form id="writeForm2">
									<div class="row">
										<div id="phoneMsg2" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please enter your phone number more than 10 digits.</div>
									</div>
				
									<div class="form-group input-group">
							      <div class="input-group-prepend">
									    <span class="input-group-text" style="background: #fff;"><i class="fa fa-phone"></i></span>
									  </div>
										<input type="text" class="form-control" id="phone2" name="phone" placeholder="Phone Number">
									</div>
									
									<div class="col-xs-12">
										<div id="userMsg2" class="text-right small" style="display:none; color:#ff6666;">* Please fill out user name!</div>
									</div>
				
									<div class="form-group input-group">
							      <div class="input-group-prepend">
										   <span class="input-group-text" style="background: #fff;"><i class="fa fa-user"></i></span>
										</div>	
							      <input type="text" class="form-control" id="name2" name="name" placeholder="User Name">
							   	</div>
							   	<div class="col-xs-12">
										<div id="projectMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out your project!</div>
									</div>
			
							   	<div class="form-group input-group">
							      <div class="input-group-prepend">
										  <span class="input-group-text" style="background: #fff;"><i class="fa fa-file-powerpoint-o"></i></span>
										</div>	
							      <input type="text" class="form-control" id="project" name="project" placeholder="Project">
							   	</div>
				
							   	<div class="col-xs-12">
										<div id="titleMsg2" class="text-right small" style="display:none; color:#ff6666;">* Please fill out title!</div>
									</div>
				
							   	<div class="form-group input-group">
							      <div class="input-group-prepend">
										  <span class="input-group-text" style="background: #fff;"><i class="fa fa-pencil"></i></span>
										</div>	
							      <input type="text" class="form-control" id="title2" name="title" placeholder="Title">
							   	</div>
			
									<div class="col-xs-12">
										<div id="startDtMsg2" class="text-right small" style="display:none; color:#ff6666;">* Please fill out start date!</div>
									</div>
				
									<div class="form-group date input-append date" id="dpDOB4">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="startDate2" name="startDate" placeholder="From Date" /> 
									</div>
									
									<div class="col-xs-12">
										<div id="endDtMsg2" class="text-right small" style="display:none; color:#ff6666;">* Please fill out end date!</div>
									</div>
				
									<div class="form-group date input-append date" id="dpDOB5">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="endDate2" name="endDate" placeholder="To Date" /> 
									</div>
			
									<div class="col-xs-12">
										<div id="dueDtMsg2" class="text-right small" style="display:none; color:#ff6666;">* Please fill out due date!</div>
									</div>
			
									<div class="form-group date input-append date" id="dpDOB6">
	      						<span class="input-group-addon"></span>
										<input type="text" class="form-control" id="dueDate2" name="dueDate" placeholder="Due Date" /> 
									</div>
									<div class="form-group">
										<button id="save2" onClick="formCheck2();" class="btn btn-lg btn-primary btn-block btn-signin" type="button">Sign in</button>
						    	</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- User upload Modal -->
			<div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog modal-sm">
			      <div class="modal-content">
			        <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal">&times;</button>
				        <h4 class="modal-title text-center">User List</h4>
			        </div>
			        <div class="modal-body">
			        	<div id="result">
			        	</div>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" id="userSave" onClick="userSave();">Save</button>
			        </div>
			      </div>
			    </div>
			</div>
  
  			<!-- User save Modal -->
			<div class="modal fade" id="saveModal" role="dialog">
			    <div class="modal-dialog modal-sm">
			      <div class="modal-content">
			      
			        <div class="modal-body">
			        	<div id="saveResult" class="text-center">
			        	</div>
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
			        </div>
			        
			      </div>
			    </div>
			</div>
			
			<div class="input-group input-group-newsletter">
				<div class="row">
					<div id="excelMsg" class="col-xs-12 text-center small" style="display:none; color:#ff6666;">* Please upload *.xls file!</div>
				</div>
				<div class="form-group required text-center">
					<button type="button" class="btn btn-default btn-sm" id="excelUp" onClick="excelUploadCall(); return false;">User Upload</button>		
					<button type="button" class="btn btn-default btn-sm" id="excelDown" onClick="excelDown(); return false;">Excel Download</button>		
				</div>
				
				<input type="hidden" id="modalCall" data-toggle="modal" data-target="#myModal" />
				<input type="hidden" id="saveModalCall" data-toggle="modal" data-target="#saveModal" />
				<form id="frm" name="frm" method="POST" enctype="multipart/form-data">
					<input type="file" id="fileUpload" name="fileUpload" onchange="excelUpload();" style="display:none"/>
				</form>

				<form id="projectFrm" name="projectFrm" method="POST">
					<input type="hidden" id="frm_importance" name="importance" />
					<input type="hidden" id="frm_phone" name="phone" />
					<input type="hidden" id="frm_name" name="name" />
					<input type="hidden" id="frm_project" name="project" />
					<input type="hidden" id="frm_title" name="title" />
					<input type="hidden" id="frm_startDate" name="startDate" />
					<input type="hidden" id="frm_endDate" name="endDate" />
					<input type="hidden" id="dfrm_ueDate" name="dueDate" />
				</form>
			</div>
		</div>
	</div>
</body>
</html>