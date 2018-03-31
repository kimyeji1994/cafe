<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%-- <!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach items = "${boardInfo}"  var = "boardInfo">
	<tr>
		<td><a href="/scedule/list/${boardInfo.code}?board=${boardInfo.board_id}">${boardInfo.board_id}</a></td><br/>
					
	</tr>		
</c:forEach>




</body>
</html> --%>


<!DOCTYPE html>
<html>
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Scodule</a>

  <div class="w3-dropdown-hover w3-hide-small">
 
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend request</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
 
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
          <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ${boardInfo[0].code}</p>
        </div>
      </div>
      <br>
      

      
      <!-- Interests --> 
      <div class="w3-card w3-round w3-white ">
        <div class="w3-container">
          <p>Interests</p>
          <p>
            <span class="w3-tag w3-small w3-theme-d5">News</span>
            <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
            <span class="w3-tag w3-small w3-theme-d3">Labels</span>
            <span class="w3-tag w3-small w3-theme-d2">Games</span>
            <span class="w3-tag w3-small w3-theme-d1">Friends</span>
            <span class="w3-tag w3-small w3-theme">Games</span>
            <span class="w3-tag w3-small w3-theme-l1">Friends</span>
            <span class="w3-tag w3-small w3-theme-l2">Food</span>
            <span class="w3-tag w3-small w3-theme-l3">Design</span>
            <span class="w3-tag w3-small w3-theme-l4">Art</span>
            <span class="w3-tag w3-small w3-theme-l5">Photos</span>
          </p>
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
        <a href="/scedule/list/${boardInfo.code}?board=${boardInfo.board_id}"><button type="button" class="w3-button w3-theme-d1 w3-margin-bottom"><i class="fa fa-thumbs-up"></i>  JOIN</button></a> 
     
      </div>
      
      </c:forEach>
      
    
      
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p><button class="w3-button w3-block w3-theme-l4">Project User Upload</button></p>
            <ul class="w3-ul w3-card-4">
          <c:forEach items = "${userList}"  var = "userList" varStatus="status">
            
          <c:if test = '${status.count % 3 == 1 }'>  
           
             <li class="w3-bar">
   				
	      		<div class="w3-bar-item">
	      		<img src="/static/img/img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style=" height : 45px;"><br/><br/>
	       			 <span class="w3-large">${userList.name}</span><br/>
       			  <span class="w3-Small">${userList.phone}</span>
      			</div>
    		</li>
    	
    		
 
          </c:if>
          
             <c:if test = '${status.count % 3 == 2 }'>  
                 <li class="w3-bar">
     
          <img src="/static/img/img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      <div class="w3-bar-item">
        <span class="w3-large">${userList.name}</span><br/>
       			  <span class="w3-Small">${userList.phone}</span>
       
      </div>
    </li>
            </c:if>
            
             <c:if test = '${status.count % 3 == 0 }'>  
                 <li class="w3-bar">
     			 <img src="/static/img/img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      				<div class="w3-bar-item">
        			 <span class="w3-large">${userList.name}</span><br/>
       			  <span class="w3-Small">${userList.phone}</span><br/>
      				</div>
      				
    </li>
            </c:if>
     
         </c:forEach>
         </ul>
          
          
          
        </div>
      </div>
      <br>
      
    

      
 
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>


<script>

</script>

</body>
</html> 