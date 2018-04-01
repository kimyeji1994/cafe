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
		var flag = 0;
		
		function smsSend(){
			validation();
			if(flag == 0){
				return;
			}
			
			var formData = $('#frm').serialize();

			$.ajax({
				url: '/board/smsSend',
				type: 'POST',
				data: formData,
				success: function(result){
					console.log(result);
					
					$('#modalCall').click();
					$('#result').html(result);
				}
			});
		}
		
		function validation(){
	    	flag = 1;
	    	
		    var msg = $("#msg").val();
	    	$("#msgError").html('* Please fill out message!');
	    	
		    if (msg == null || msg == "") {
		    	flag = 0;
		        $("#msgError").show();
		    } else if (msg != null && msg != "" && msg.length > 45) { // 최대 45자까지 입력 가능
		    	flag = 0;
		    	$("#msgError").html('* You can enter up to 45 characters.');
		        $("#msgError").show();
		    } else {
		    	$("#msgError").hide();
		    };
		    
		    var phone = $("#phone").val();
		    if (phone == null || phone == "" || phone.length <= 10) {
		    	flag = 0;
		        $("#phoneError").show();
		    } else {
		    	$("#phoneError").hide();
		    	
		    	if(phone.indexOf('-') <= 0) {
		    		phone = phone.substring(0, 3) + '-' + phone.substring(3, 7) + '-' + phone.substring(7, 11);
		    	}
		    };
		    
		    $("#rphone").val(phone);
		}
		
		function init(){
			$('#msg').val('');
			$('#rphone').val('');
		}
	</script>
</head>

<body>
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onClick="init(); return false;">&times;</button>
			     </div>
				<div class="modal-body">
					<div id="result">
					</div>
				</div>
			</div>
		</div>
	</div>

	<input type="hidden" id="modalCall" data-toggle="modal" data-target="#myModal" />
	<div class="container">
		<div class="col-sm-4 col-sm-offset-4">
			<br /><br />
		    <form id="frm" name="frm">
		        <div class="form-group required text-right">
		       		<input type="hidden" name="action" value="go">
		        	<input type="text" id="msg" name="msg" class="form-control" style="height:200px" placeholder="내용 입력">
					<div class="row">
						<div id="msgError" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out message!</div>
					</div>
				
		        </div>
						
		        <div class="form-group required text-right">
		        	<!-- <input type="text" name="rphone" placeholder="받는 사람 (010-1234-5678)"> -->
			        <input type="hidden" name="sphone1" value="010">
			        <input type="hidden" name="sphone2" value="4029">
			        <input type="hidden" name="sphone3" value="9030">
			        <div class="row">
						<div id="phoneError" class="col-xs-12 text-right small" style="display:none; color:#ff6666;">* Please fill out valid phone!</div>
					</div>
		        </div>

		   </form>
		   	<div class="form-group required text-center">
				<button type="button" class="btn btn-default btn-sm" id="smsSend" onClick="smsSend(); return false;">전송</button>		
			</div>
	    </div>
    </div>
</body>
</html>
            