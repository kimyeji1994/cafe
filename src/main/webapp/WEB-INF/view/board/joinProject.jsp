<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>
<head>
	<!-- input box style -->
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 	<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> --> 	
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- validation -->
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/flatly/bootstrap.min.css">

<title>Insert title here</title>

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
$().ready(function(){
		$("#joinButt").click( function() {
			
			$.post(
				"<c:url value="/project/join" />",
				$("#writeForm").serialize(),
				function(data) {
					if (data != "fail") {
						window.location.href = "/scedule/list/" + data ;
					} else if (data == "fail") {
						alert("No Available Code");
						location.reload();
					}
			});
		});
 });
 </script>
</head>
<body>
 <!-- Modal -->
           
<form id="writeForm"action="#">
	<div class="modal" id="modalJoin" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
	        <h4 class="modal-title">Join</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">

						<div class="form-group input-group">
						      	<!-- <div class="col-xs-3"> -->
							<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
					  	<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
						</div>
						<div class="form-group input-group">
				      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				      <input type="text" class="form-control" id="name" name="name" placeholder="User Name">
				   	</div>
						<div class="form-group input-group">
				      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
				      <input type="text" class="form-control" id="code" name="code" placeholder="Code Number">
				   	</div>
<!-- 	
						이름 : <input type ="text" id="name"  name="name"><br/>
						코드 : <input type ="text" id="code" name ="code"><br/>
 -->						
<!-- 						<input type="button" id="joinButt" value="join">
 -->						
						

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="joinButt" value="join">Join</button>
        </div>
      </div>
    </div>
  </div>
</form>
</body>
</html>