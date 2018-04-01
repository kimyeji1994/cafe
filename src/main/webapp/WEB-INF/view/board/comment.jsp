<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/3.3.7/flatly/bootstrap.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type='text/javascript' src='//code.jquery.com/jquery-1.8.3.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>

<script type="text/javascript" src="<c:url value="/static/js/spin.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/spinnerJS.js"/>"></script>

<style type="text/css">
	@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
	
	.w3-theme-d4 {
    color: #fff !important;
    background-color: #3F5E9F!important;
}

.w3-theme-d2 {
    color: #fff !important;
    background-color:#3F5E9F!important;
}


.w3-margin-tops {
	margin-top: 5%
}
</style>

<script type="text/javascript">
	var myPhone = '${myPhone}';
	
	function submitMyMsg(){
		$('#msg').val($('#myMsg').val());
		var formData = $('#frm').serialize();
		var boardId = $("#boardId").val();

		var myMsg = $('#myMsg').val().replace(/ /gi, '');

		if(myMsg == '') {
			return;
		}
		
		showSpinner(true);
		
		$.ajax({
			url: '/project/addComment',
			type: 'POST',
			data: formData,
			success: function(result){
				$('#chat').empty();
				$('#chat').append(result);
				$('#myMsg').val('');
				$('#submit').css('color', '#ffffff');
				chatScrollBar();
				
				showSpinner(false);
			}
		})
	}
	
	function chatScrollBar() {
		$("#chatroomBox").scrollTop($("#chatroomBox")[0].scrollHeight);
	}
	
	function validation(){
		var myMsg = $('#myMsg').val();
		if(myMsg == '') {
			$('#submit').css('color', '#ffffff');
		} else {
			$('#submit').css('color', '#000000');
			enterKeyPress();
		}
	}
	
	function enterKeyPress(){
		 if (window.event.keyCode == 13) {
			 $('#submit').click();
		 }
	}
	
	$(function(){
		chatScrollBar();
	});
</script>

<style>
	.yourChatBox {
    	width:50% !important;
    	overflow:hidden;
    	height:auto;
	}
	.myChatBox {
    	width:50% !important;
    	overflow:hidden;
    	height:auto;
    	float: right !important;
	}
	.chatBox {
		width:100% !important;
	}
	.yourChatName {
		color: #736F6E;
		margin:0 0 4px 0;
	}
	.myChatName {
		color: #736F6E;
		margin:0 0 4px 0;
	}
	body {
		font-family: Nanum Gothic;
		font-size: 14px;
		line-height: 1.42857143;
		color: #333;
		background-color: #fff;
	}
	
	
	
.w3-margin-tops {
	margin-top: 20%
}
</style>

</head>

<body>
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

  <a href="/" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Scodule</a>
 <a href="/samplePeople" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="Messages"><i class="fa fa-group"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="Account Settings"><i class="fa fa-film"></i></a>
  <a href="/sample" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white w3-right" title="News"><i class="fa fa-search"></i></a> 

 
 </div>
</div>

	<div class="container w3-margin-tops">
		<div class="col-sm-4 col-sm-offset-4">
		   	<div id="chatroomBox" class="form-group required text-left" style="height:450px; background-color:#F2F4F4; overflow-y:scroll;">
				<div id="chat" style="margin:20px 20px 0 20px;">
				
					<c:forEach items="${chatList}"  var ="list" varStatus="status">
						<c:if test='${list.phone != myPhone}'>
							<div class="form-group input-group date input-append chatBox">
								<div class="text-left small yourChatName">
									<i class="fa fa-user fa-fw w3-text-theme"></i>
									${list.name}
								</div>
							    <div class="form-control yourChatBox">
									${list.comment}
								</div>
							</div>
						</c:if>
						
						<c:if test='${list.phone == myPhone}'>
							<div class="form-group input-group date input-append chatBox">
								<div class="text-right small myChatName">
									${list.name}<i class="fa fa-user fa-fw w3-text-theme"></i>
								</div>
							    <div class="form-control myChatBox">
									${list.comment}
								</div>
							</div>
						</c:if>
						
					</c:forEach>
		   		</div>
			</div>
		   
		   	<div class="form-group required text-center">
		   		<div class="form-group input-group date input-append">
    				<input type="text" id="myMsg" name="myMsg" class="form-control" onkeyup="validation(); return false;">
    				<span id="submit" class="input-group-addon add-on" onClick="submitMyMsg();" style="color:white">전송</span>
		   		</div>
	    	</div>
	    	
	    	<form id="frm" name="frm">
    			<input type="hidden" id="msg" name="msg" class="form-control">
				<input type="hidden" id="boardId" name="boardId" value="${boardId}">
			</form>
		</div>
	</div>
</body>

<script>
</script>
</html>