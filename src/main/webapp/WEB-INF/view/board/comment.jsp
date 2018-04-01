<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
<!-- validation -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/flatly/bootstrap.min.css">
  
<!-- bootbox -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
	
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.min.js"></script>

<script type="text/javascript">
	function submitMyMsg(){
		console.log("hi");
		$("#chat").append('<div class="form-group input-group date input-append" style="width:100%"><div id="userNm" class="text-right" style="color:#00000;"><b>도경</b></div><div class="form-control" style="width:50%; float:right"></div></div>');
	}
</script>

<style>
	.yourChatBox {
    	width:50% !important;;
    	overflow:hidden;
    	height:auto;
	}
	.myChatBox {
    	width:50% !important;
    	overflow:hidden;
    	height:auto;
    	float: right !important;;
	}
	.chatBox {
		width:100% !important;
	}
	.yourChatName {
		font-weight: bold;
		color: #736F6E;
	}
	.myChatName {
		font-weight: bold;
		color: #157DEC;
	}
</style>

</head>

<body>
	<div class="container">
		<div class="col-sm-4 col-sm-offset-4">
			<br /><br />
		    <form id="frm" name="frm">
		        
		   </form>
		   	<div class="form-group required text-left" style="height:450px; background-color:#F2F4F4; overflow-y:scroll;">
				<div id="chat" style="margin:20px 20px 0 20px;">
			   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-left small yourChatName">진무</div>
	    				<div class="form-control yourChatBox">나는 진무야</div>
			   		</div>
			   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-left small yourChatName">예지</div>
	    				<div class="form-control yourChatBox">나는 예지야나는 예지야나는 예지야나는 예지야나는 예지야</div>
			   		</div>
			   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-right small myChatName">도경</div>
	    				<div class="form-control myChatBox">나는 도경이야나는 도경이야나는 도경이야나는 도경이야</div>
	    	   		</div>
			   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-left small yourChatName">예지</div>
	    				<div class="form-control yourChatBox">나는 예지야</div>
			   		</div>
			   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-right small myChatName">도경</div>
	    				<div class="form-control myChatBox">나는 도경이야</div>
	    	   		</div>
	    	   		<div class="form-group input-group date input-append chatBox">
			   			<div id="userNm" class="text-left small yourChatName">진무</div>
	    				<div class="form-control yourChatBox">나는 진무야나는 진무야나는 진무야</div>
			   		</div>
		   		</div>
			</div>
		   
		   	<div class="form-group required text-center">
		   		<div class="form-group input-group date input-append">
    				<input type="text" id="msg" name="msg" class="form-control">
    				<span class="input-group-addon add-on" onClick="submitMyMsg();">전송</span>
		   		</div>
	    	</div>
		</div>
	</div>
</body>
</html>