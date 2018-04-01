<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 



<!DOCTYPE html>
<html>
<title>Scodule</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link href=" <c:url value="/static/vendor/bootstrap/css/bootstrap.min.css"/> " rel="stylesheet">
<!-- datepicker -->
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker3.min.css">
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>
<%-- <!-- Bootstrap core JavaScript -->
<script src="<c:url value="/static/vendor/jquery/jquery.min.js"/>"></script>
<script src="<c:url value="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

<!-- Plugin JavaScript -->
<script src="<c:url value="/static/vendor/vide/jquery.vide.min.js"/>"></script>
 --%>
<script type='text/javascript'>
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
});
//validation check
function formCheck() {
    // 사용하기 쉽도록 변수를 선언하여 담아주고,
    
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
    
    if($("#titleMsg").css("display") == "block" || $("#startDtMsg").css("display") == "block" || $("#endDtMsg").css("display") == "block" || $("#dueDtMsg").css("display") == "block"){

    	//하나라도 빈칸이 있는 것 이기 때문에 return false로 vali check!!!
    	return false;
    }else{
    	saveClick();
    }
    	
};

function saveClick() {
	
	$.post(
			"<c:url value="/project/addBoard" />",
			$("#writeForm").serialize(),
			function(data) {
				if (data != "FAIL") {
					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
}

function excelUploadCall(){
	$('#fileUpload').val('');
	$('#fileUpload').click();
}

function excelUpload(){
	var ext = '';
	if($('#fileUpload').val() != ''){
		
		ext = $('#fileUpload').val().split('.').pop().toLowerCase();
		
		if($.inArray(ext, ['xlsx', 'xlsm', 'xlsb', 'xls', 'xltx', 'xltxm', 'xlt']) == -1){
			$('#result').empty();
			$('#result').append('<div id="excelMsg" class="col-xs-12 text-center small" style="color:#ff6666;">* Please upload *.xls file!</div>');
			return false;
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
					
					$('#result').append('<div id="user_' + i + '">' + userInfo + '</div>');
				}
				
				$('#result').append('<br/><button type="button" class="w3-button w3-theme-d1 w3-margin-bottom" id="userSave" onClick="userSave();">Save</button>');
			}
		});
		
	}
}

function userSave(){
	var formData = new FormData($('#frm')[0]);
	
	$.ajax({
		processData: false,
		contentType: false,
		url: "/user/excelUpload",
		type: 'POST',
		data: formData,
		success: function(result){
			var message = "";
			
			if(result == 0){
				message = "Failed to upload users!";
			} else {
				message = "Successfully uploaded users!";
				$("#result").empty('');
			}
			alert(message);
			$("#result").empty('');
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
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

  <a href="/" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Scodule</a>


 
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">Our Project</h4>
         <p class="w3-center">  <img src="/static/img/sceduler.jpeg" style="width:100%; height: 380px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo[0].code_name}</p>
          <p><i class="fa fa-lock fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo[0].code}</p>
        </div>
      </div>
      <br>
      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white ">
        <div class="w3-container">
				  		<form id="writeForm">
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
									<input type="hidden" id="codeParam" name="code" value="${boardInfo[0].code}">
									<div class="form-group required">
										<button type="button" class="btn btn-lg btn-primary btn-block btn-signin" id="save" onClick="formCheck();" >Save</button>
						    	</div>
								</form>	
        </div>
      </div>
      <br>
      
 
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
 <c:forEach items = "${boardInfo}"  var = "boardInfo">
      <div class="w3-container w3-card w3-white w3-round w3-margin"><br>
        <span class="w3-right w3-opacity">1 min</span>
        <h4>${boardInfo.title}</h4><br>
        <hr class="w3-clear">

          <div class="w3-row-padding" style="margin:0 -16px">
            <div class="w3-half">
				<p><i class="fa fa-user fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo.name}</p>
        		 <p><i class="fa fa-phone fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo.phone}</p>               
            </div>
            <div class="w3-half">
               <p><i class="fa  fa-calendar  fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo.start_date} ~ ${boardInfo.end_date}</p>
               <p><i class="fa fa-calendar fa-fw w3-margin-right w3-text-theme"></i>${boardInfo.due_date}</p>
          </div>
        </div>
        <div class="container" align="center">
       		 <a href="/scedule/list/${boardInfo.code}?board=${boardInfo.board_id}"><button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  JOIN</button></a> 
     		</div>
      </div>
      
      </c:forEach>
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <!-- <p><button class="w3-button w3-block w3-theme-l4">Project User Upload</button></p> -->
	        <div class="form-group required text-center">
				<button type="button" class="w3-button w3-block w3-theme-l4" id="excelUp" onClick="excelUploadCall(); return false;">Project User Upload</button>		
<!-- 			<button type="button" class="btn btn-default btn-sm" id="excelDown" onClick="excelDown(); return false;">Excel Download</button>		 -->
			</div>

         <table style="height: 100px;">
         <tbody>

         <c:forEach items = "${userList}"  var = "userList" varStatus="status">
			       	<tr>
							<td>
							<c:if test = '${status.count % 3 == 1 }'>
								<img src="/static/img/img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
							</c:if>
							<c:if test = '${status.count % 3 == 2 }'>
								<img src="/static/img/img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
							</c:if>
							<c:if test = '${status.count % 3 == 0 }'>
								<img src="/static/img/img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
							</c:if>
							
							</td>
							</tr>
					    <tr>
					      <td class="align-middle">${userList.name}</td>
					    </tr>
					    <tr>
					    	<td class="align-middle">${userList.phone}</td>
					    </tr>
       
          </c:forEach>
          </tbody>
          </table>   
          
        </div>
        <div class="w3-container">
        	<div id="result" class="small">
        	</div>
        </div>
      </div>
      <br>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
			<!-- User upload Modal -->
<!-- 			<div class="modal fade" id="myModal" role="dialog">
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
			</div> -->
  
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
<!-- 				<div class="form-group required text-center">
					<button type="button" class="btn btn-default btn-sm" id="excelUp" onClick="excelUploadCall(); return false;">User Upload</button>		
					<button type="button" class="btn btn-default btn-sm" id="excelDown" onClick="excelDown(); return false;">Excel Download</button>		
				</div> -->
				
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
<br>
</body>
</html> 