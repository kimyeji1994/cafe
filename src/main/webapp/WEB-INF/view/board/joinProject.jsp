<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="/static/css/join.css">
</head>
<body>
 <!-- Modal -->
           
<form id="joinForm"action="#">
	<div class="modal" id="modalJoin" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style='background: rgba(255,255,255,0.85);'>
        <div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
			    <div class="container">
						<img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" style='border: 1px solid #bdbdbd;'/>
						<p id="profile-name" class="profile-name-card"></p>
						<div class="form-group">
							<input type="text" class="form-control" id="joinPhone" name="phone" placeholder="Phone Number">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="joinName" name="name" placeholder="User Name">
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="joinCode" name="code" placeholder="Invite Code">
						</div>
						<div class="form-group">
							<button id="joinButt" class="btn btn-lg btn-primary btn-block btn-signin" type="button" value="join">Join</button>
			    	</div>
			    </div><!-- /container -->	
        </div>
      </div>
    </div>
  </div>
</form>
</body>
<script type="text/javascript">
$(document).ready(function(){
		$("#joinButt").click( function() {
			$.post(
				"<c:url value="/project/join" />",
				$("#joinForm").serialize(),
				function(data) {
					if (data != "fail") {
						if(data.length < 6){
					    	
				    		window.location.href = "/scedule/list/" + data ;
				    	}
				    	else{
				    	
				    		window.location.href = "/project/list/" + data ;
				    	}
				    }
						
						
				
					else if (data == "fail") {
						alert("No Available Code");
						location.reload();
					}
			});
		});

 
 
 
 $("#joinPhone").change(function(){
	 
	if( $("#joinPhone").val().length > 10 ){
		alert($("#joinPhone").val());
	
	

		$.get(
				"<c:url value="/project/getCode" />" ,
				{     "phone" : $("#joinPhone").val()  },
				function(data) {
					if (data != null) {
						$("#joinName").val(data.name); 
						$("#joinCode").val(data.code); 
						
					} else if (data == null) {
				
					}
			}); 
		
	}
	
	
	
	 
 });
 
});
 
 
 </script>
</html>