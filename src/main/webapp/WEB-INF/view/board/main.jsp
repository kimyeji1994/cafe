<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Scodule</title>
   
    <!-- Bootstrap core CSS -->
    <link href=" <c:url value="/static/vendor/bootstrap/css/bootstrap.min.css"/> " rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<c:url value="/static/vendor/font-awesome/css/font-awesome.min.css"/> " rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/static/css/coming-soon.min.css"/> " rel="stylesheet">
	<style>
	.mb-3 , .mb-5 {
	text-align: center;
	}
	.input-group {
	text-align: center;
	
	}
	.marR {
	  margin-left: 25%;
	}
	
	</style>
  </head>

  <body>

    <div class="overlay"></div>

    <div class="masthead">
    <div class="masthead-bg"></div>
   
      <div class="container h-100">
     
        <div class="row h-100">
          <div class="col-12 my-auto">
            <div class="masthead-content text-white py-5 py-md-0">
              <h1 class="mb-3">Get Together With Code</h1>
              <p class="mb-5">The simple way to decide on dates</p>
              <div class="input-group input-group-newsletter">
                <!-- <input type="email" class="form-control" placeholder="Enter email..." aria-label="Enter email..." aria-describedby="basic-addon"> -->
				<button class="btn btn-secondary marR" type="button" data-toggle="modal" data-target="#myModal"> &nbsp;Join&nbsp;&nbsp;  </button> 
                <div class="input-group-append">
                &emsp;<a href="<c:url value="/project/write" />" >  <button class="btn btn-secondary" type="button">Create</button> </a>
                </div>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="social-icons">
      <ul class="list-unstyled text-center mb-0">
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-twitter"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-facebook"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-instagram"></i>
          </a>
        </li>
      </ul>
    </div>
    
    
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
	        <h4 class="modal-title">Join</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          
          <form id="writeForm">
						<div class="form-group input-group">
						      	<!-- <div class="col-xs-3"> -->
					  <!-- 	<span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span> -->
					  	<input type="text" class="form-control" id="phone" name="phone" placeholder="Phone Number">
						</div>
						<div class="form-group input-group">
				      		<!-- <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
				      <input type="text" class="form-control" id="name" name="name" placeholder="User Name">
				   	</div>
						<div class="form-group input-group">
				      		<!-- <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
				      <input type="text" class="form-control" id="code" name="code" placeholder="Code Number">
				   	</div>
<!-- 	
						이름 : <input type ="text" id="name"  name="name"><br/>
						코드 : <input type ="text" id="code" name ="code"><br/>
 -->						
<!-- 						<input type="button" id="joinButt" value="join">
 -->						
						
					</form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="joinButt" value="join">Join</button>
        </div>
      </div>
    </div>
  </div>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/static/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/static/vendor/vide/jquery.vide.min.js"/>"></script>
   
    <!-- Custom scripts for this template -->
    <script src="<c:url value="/static/js/coming-soon.min.js"/>"></script>

 
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



 </body>
</html>










<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scedule</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">

$().ready(function(){
	
	$("#join").click(function(){
	
		
	});
	
	$("#create").click(function(){
	
		
		
	});
	
});



</script>
</head>



<body> --%>



<!-- </body>
</html> -->