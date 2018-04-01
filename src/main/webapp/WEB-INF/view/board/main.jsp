<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%
// 인코딩
request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Schedule</title>
    <title>Scodule</title>
   
    <!-- Bootstrap core CSS -->
    <link href=" <c:url value="/static/vendor/bootstrap/css/bootstrap.min.css"/> " rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<c:url value="/static/vendor/font-awesome/css/font-awesome.min.css"/> " rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/static/css/coming-soon.min.css"/> " rel="stylesheet">
  <!--   <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"> -->
    <style>
    	#joinText{
    		font-weight: bold;
    	}
    
    </style>
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
              <h1 class="mb-3 b3">Get Together With Code</h1>
              <p class="mb-5">The simple way to decide on dates</p>
              <div class="input-group input-group-newsletter">
                <!-- <input type="email" class="form-control" placeholder="Enter email..." aria-label="Enter email..." aria-describedby="basic-addon"> -->
								<button class="btn btn-secondary marR" type="button" data-toggle="modal" data-target="#modalCreate" >Create</button>
                <div class="input-group-append">
								<button class="btn btn-secondary" type="button" data-toggle="modal" data-target="#modalJoin" style='margin-left: 15px; border-radius: 3px;'> &nbsp;Join&nbsp;&nbsp;  </button>
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
          <a href="/sample">
            <i class="fa fa-search"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="#">
            <i class="fa fa-film"></i>
          </a>
        </li>
        <li class="list-unstyled-item">
          <a href="/samplePeople">
            <i class="fa fa-group"></i>
          </a>
        </li>
      </ul>
    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="<c:url value="/static/vendor/jquery/jquery.min.js"/>"></script>
    <script src="<c:url value="/static/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

    <!-- Plugin JavaScript -->
    <script src="<c:url value="/static/vendor/vide/jquery.vide.min.js"/>"></script>
   
    <!-- Custom scripts for this template -->
    <script src="<c:url value="/static/js/coming-soon.min.js"/>"></script>

	<!-- Modal -->
	<jsp:include page="joinProject.jsp"></jsp:include>
	<jsp:include page="addProject.jsp"></jsp:include>
	<jsp:include page="listCode.jsp"></jsp:include>


 </body>
</html>