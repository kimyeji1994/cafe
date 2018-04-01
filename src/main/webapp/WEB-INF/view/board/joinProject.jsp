<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>
<head>
<link rel="stylesheet" href="/static/css/join.css">
<script type="text/javascript" src="<c:url value="/static/js/spin.js"/>"></script>
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
	 					<div class="col-xs-12">
							<div id="joinPhoneMsg" class="text-right small" style="display:none; color:#ff6666;">* Please enter your phone number!</div>
						</div>	
						<div class="form-group">
							<input type="text" class="form-control" id="joinPhone" name="phone" placeholder="Phone Number">
						</div>
						<div class="col-xs-12">
							<div id="joinUserMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out user name!</div>
						</div>
						<div class="form-group">
							<input type="text" class="form-control" id="joinName" name="name" placeholder="User Name">
						</div>
				   	<div class="col-xs-12">
							<div id="joinCodeMsg" class="text-right small" style="display:none; color:#ff6666;">* Please fill out the code!</div>
						</div>				
						<div class="form-group">		
							<input type="text" class="form-control" id="joinCode" name="code" placeholder="Invite Code">
						</div>
						<div class="form-group">
							<button id="joinButt" class="btn btn-lg btn-primary btn-block btn-signin" type="button" value="join" onClick="joinFormCheck();">Join</button>
			    	</div>
			    </div><!-- /container -->	
        </div>
      </div>
    </div>
  </div>
</form>

</body>
<script type="text/javascript">
/* 
		$("#joinButt").click( function() { */
		function joinClick() {
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
						/* alert("No Available Code"); */
						bootbox.alert({
						 	message: "No Available Code",
						  size: 'small',
					    callback: function () {
								location.reload();
					    }
						});
			  	}
				}
		)};	
 
var spinner

$(document).ready(function(){ 
 $("#joinPhone").change(function(){
	 
	if( $("#joinPhone").val().length > 10 ){
		/* 	alert($("#joinPhone").val()); */
	
		var spinner;

		jQuery(function(){
		    spinner = new Spinner().spin().el;
		    jQuery(document.body).append(spinner);
		    
		    var spinerTextFontSize = 14;
		    var spinerTextPadding = 10;
		    var spinerTextWidth = 200;
		    var spinerTextBorderWidth = 2;
		    var spinerTextMarginTop = (((spinerTextFontSize + (spinerTextBorderWidth * 2) + (spinerTextPadding * 2)) / 2) * -1);
		    var spinnerMarginLeft = (spinerTextWidth/2);
		 
		    $(spinner).append('<div class="spinerText"></div>');
		    $(".spinerText").css("width",spinerTextWidth + "px");
		    $(".spinerText").css("font-size",spinerTextFontSize + "px");
		    $(".spinerText").css("line-height",spinerTextFontSize + "px");
		    $(".spinerText").css("margin-top",spinerTextMarginTop + "px");
		    $(".spinerText").css("padding",spinerTextPadding + "px");
		    $(".spinerText").css("font-weight","bold");
		    $(".spinerText").css("display","table");
		    $(".spinerTextDiv").css("display","table-cell");
		    $(".spinerTextDiv").css("text-align","center");
		    $(".spinerTextDiv").css("vertical-align","middle");
		 
		    $(spinner).css('margin-left','-' + spinnerMarginLeft + 'px');
		    $(spinner).css('margin', 'auto');
		});

		$.get(
				"<c:url value="/project/getCode" />" ,
				{     "phone" : $("#joinPhone").val()  },
				function(data) {
					if (data != null) {
						$("#joinName").val(data.name); 
						$("#joinCode").val(data.code); 
						
					} else if (data == null) {
				
					}
			$(spinner).empty();
			}
		); 
	}
 });
});

				function joinFormCheck() {
				    // 사용하기 쉽도록 변수를 선언하여 담아주고,
				    
				    var phone = $("#joinPhone").val();
				    if (phone == null || phone == "" || phone.length<10) { // null인지 비교한 뒤
				    		/* alert(phone.length); */
				        $("#joinPhone").focus(); // 해당태그에 포커스를 준뒤")
				        $("#joinPhoneMsg").show();
				    }else{
				    	$("#joinPhoneMsg").hide();
				    };
				    
				    var user = $("#joinName").val();
				    if (user == null || user == "") { // null인지 비교한 뒤
			        $("#joinName").focus(); // 해당태그에 포커스를 준뒤")
			        $("#joinUserMsg").show();
				    }else{
				    	$("#joinUserMsg").hide();
				    };
				    
				    var code = $("#joinCode").val();
				    if (code == null || code == "") { // null인지 비교한 뒤
			        $("#joinCode").focus(); // 해당태그에 포커스를 준뒤")
			        $("#joinCodeMsg").show();
				    }else{
				    	$("#joinCodeMsg").hide();
				    };
				    
				    if($("#joinPhoneMsg").css("display") == "block" || $("#joinUserMsg").css("display") == "block" || $("#joinCodeMsg").css("display") == "block"){

				    	//하나라도 빈칸이 있는 것 이기 때문에 return false로 vali check!!!
				    	return false;
				    }else{
				    	joinClick();
				    }
				};
 
 
 </script>
</html>