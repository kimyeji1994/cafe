<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html >
<html>
<head>
<!-- bootbox -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>
<!-- Bootstrap core CSS -->
<link href=" <c:url value="/static/vendor/bootstrap/css/bootstrap.min.css"/> " rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif}
.w3-text-teal, .w3-hover-text-teal:hover {
    color: #3F5E9F!important;
}

.w3-teal, .w3-hover-teal:hover {
    color: #fff!important;
    background-color: #3F5E9F!important;
}
#miseon{
	margin-bottom: 0px!important;

}
.appli{
	margin-right: 6px!important

}
.rosy{
display: inline-block;
    zoom: 1;
    vertical-align: baseline;
    margin: 0 2px;
    outline: none;
    cursor: pointer;
    text-align: center;
    text-decoration: none;
    font: 14px/100% Arial, Helvetica, sans-serif;
    padding: .5em 2em .55em;
    text-shadow: 0 1px 1px rgba(0,0,0,.3);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
    color: #fae7e9;
    border: solid 1px #757575;
    background: -webkit-gradient(linear, left top, left bottom, from(#757575), to(#757575));
}
.textMid{
   
 margin-left: 20%;




}

.body{
height : 1000px;

}
.w3-bar  {
display : inline-block;
width : 32%;
margin : 0px;
}

.w3-ul li {
    padding: 0px 0px;
    border-bottom: 0.3px solid #ddd;
    border-left: 0.3px solid #ddd;
}
.w3-margin-lefts {
	    margin-left: 8px!important;
}
.xbutt {
    padding-top: 0px;
    padding-left: 0px;
    padding-right: 0px;
    padding-bottom: 0px;

}

.w3-margin-leftt {
	 margin-left: 35px!important;
}

.w3-theme-d4 {
    color: #fff !important;
    background-color: #3F5E9F!important;
}

.w3-theme-d2 {
    color: #fff !important;
    background-color:#3F5E9F!important;
}


.w3-bars {
width: 100%;
    overflow: hidden;

}

.w3-margin-tops {
margin-top: 5%
}
</style>
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">



function sceduleClick(date) {
	var sceduleId = "#" + String(date);
	 date = String(date);
	console.log($(board).val());
	var boardId = $("#boardId").val();

	$.post(
			"<c:url value="/project/addScedule" />",
			{ "date" : String(date)   , "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					//window.location.href = "/scedule/list/" + data ;

					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
  }
function appliClick(phone) {
	alert(phone);
/* 	
	bootbox.alert({
	 	message: "code : ",
	  size: 'small',
    callback: function () {}
	}); */

	var boardId = $("#boardId").val();
	$.post(
			
			"<c:url value="/project/addCompulsory" />",
			{ "phone" : String(phone)   , "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
}

function deleteCompulsory(phone) {
	alert(phone);
	var boardId = $("#boardId").val();
	$.post(
			"<c:url value="/project/deleteCompulsory" />",
			{ "phone" : String(phone)   , "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
}

function viewScedule(date) {
	alert(date);
	var boardId = $("#boardId").val();
	$.post(
			"<c:url value="/project/viewScedule" />",
			{ "date" : String(date)   , "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
}


function addComment(){
	var boardId = $("#boardId").val();
	$.get(
			"<c:url value="/project/addComment" />" ,
			{     "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					location.reload();
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
}

function addRecommand(){
	var boardId = $("#boardId").val();
	window.location.href = "/project/viewRecommand?boardId=" + boardId ;


}



  

google.charts.load('current', {'packages':['corechart','bar']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  

 var scduleLogArray = new Array();

 
 <c:forEach items="${sceduleLogList}"  var ="sceduleLogList" varStatus="status">
	 var oneSceduleLog = new Array();
	 if(${ status.count } == 1 ){
		 oneSceduleLog.push("${sceduleLogList[0]}");
		 oneSceduleLog.push("${sceduleLogList[1]}"); 
		 oneSceduleLog.push({ role: 'style' }); 
		 
	 }
	 else{
		 oneSceduleLog.push("${sceduleLogList[0]}");
		 oneSceduleLog.push(${sceduleLogList[1]}); 
		 oneSceduleLog.push("#ED785D"); 
	 }
	 console.log(oneSceduleLog);
		
	 scduleLogArray.push(oneSceduleLog)		
 
 </c:forEach>
   
  console.log(scduleLogArray);
  var data = google.visualization.arrayToDataTable(scduleLogArray);

  var options = {
  
    curveType: 'function',
    legend: { position: 'bottom' }
  };

  var chart = new google.visualization.ColumnChart(document.getElementById('curve_chart'));

  chart.draw(data, options);
}







$().ready(function(){
var userLog ="";	
	<c:forEach items="${userLog}"  var ="userLog" varStatus="status">

		userLog ="#"+"${userLog}";
		$(userLog).css('background',  '#3F5E9F');	
	</c:forEach>
	
	
});


</script>
</head>
<body class="w3-light-grey">

<!-- Page Container -->
<!-- Navbar -->

<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <div class="w3-top">
 <div class="w3-bars w3-theme-d2 w3-left-align w3-large">

  <a href="/" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i>Scodule</a>

 </div>
</div>
</div>


  <!-- The Grid -->
  <div class="w3-row-padding w3-margin-tops" >

  
    <!-- Left Column -->
    <div class="w3-third">
    
      <div class="w3-white w3-text-grey w3-card-4">
        <div class="w3-display-container">
          <img src="/static/img/sceduler.jpeg" style="width:100%; height: 380px" alt="Avatar">
          <div class="w3-display-bottomleft w3-container w3-text-black">
           <h2>${boardInfo.title}</h2> 
          </div>
        </div>
        <div class="w3-container">
          <p><i class="fa fa-briefcase fa-fw w3-margin-right w3-large w3-text-teal"></i>${boardInfo.title}</p>
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>${boardInfo.project} </p>
       	 <p><i class="fa fa-user fa-fw w3-margin-right w3-large w3-text-teal"></i>${managerInfo.name}</p>
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>${managerInfo.phone}</p>
           <p><i class="fa fa-lock fa-fw w3-margin-right w3-large w3-text-teal"></i>${boardInfo.code}</p>
          
          
          <hr>
	
          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Click Your Available Dates</b></p>
         <table class="textMid">
	
			<c:forEach items = "${sceduleList}"  var = "scedules">
				<tr>
				
				
				
				<td > <input type="button" class="rosy" id ="${scedules[1]}" value="${scedules[0]}" onClick="sceduleClick('${scedules[0]}')"><i class="fa fa-users fa-fw w3-margin-lefts" onClick="viewScedule('${scedules[0]}')"></i></td>
					
				</tr>
			</c:forEach>

			</table>
			<input type="hidden" id="boardId" value="${boardInfo.board_id }">
			<input type="hidden" id="board" value="${boardInfo}">
			<input type="hidden" id="sceduleLogList" value="${sceduleLogList}">
			
		
			
			          <br>

         
          <div class="w3-half">
          <p>DeadLine : D  ${boardInfo.dday}</p>
         
           
          </div>
          <div class="w3-half">
          <p>Voter : ${voter}</p>
         </div>
          
          <br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">

      <div class="w3-container w3-card w3-white w3-margin-bottom">
           <h2 class="w3-text-grey w3-padding-16" id="miseon"><i class="fa fa-calendar fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Current Status</h2>
         <p onclick="addComment()">comment</p>
           <p onclick="addRecommand()">recommand</p>
        <div id="curve_chart" style="width: 100%; height: 550px"></div>
      </div>

      <div class="w3-container w3-card w3-white">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Attendances</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Full Participants</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${boardInfo.start_date}  ~ ${boardInfo.end_date}</h6>
            <ul class="w3-ul w3-card-4">
          <c:forEach items = "${applicantList}"  var = "applicantList" varStatus="status">
        
          <c:if test = '${status.count % 3 == 1 }'>  
           
          <li class="w3-bar" onClick = "appliClick('${applicantList.phone}')" >
                   
   					<img src="/static/img/img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
	      		<div class="w3-bar-item">
	       			 <span class="w3-large">${applicantList.name}</span><br/>
	       			 <span >${applicantList.phone}</span>
      			</div>
    			</li>
 
          </c:if>
          
          <c:if test = '${status.count % 3 == 2 }'>  
          <li class="w3-bar"  onClick = "appliClick('${applicantList.phone}')">
          
          <img src="/static/img/img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      		<div class="w3-bar-item" >
       		 <span class="w3-large">${applicantList.name}</span><br/>
        	<span >${applicantList.phone}</span>
    		  </div>
   				</li>
          </c:if>
            
           <c:if test = '${status.count % 3 == 0 }'>  
           <li class="w3-bar"  onClick = "appliClick('${applicantList.phone}')">
                    
     				  <img src="/static/img/img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      				<div class="w3-bar-item ">
        		 	  <span class="w3-large">${applicantList.name}</span><br/>
        				<span >${applicantList.phone}</span><br/>
      				</div>
    				</li>
            </c:if>
    
    
         </c:forEach>
               </ul>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Participants</b></h5>
          <h6 class="w3-text-teal" id = "thatDay"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${oneday}</h6>
          <ul class="w3-ul w3-card-4">
          <c:forEach items = "${applicantInOneDay}"  var = "applicantInOneDay" varStatus="status">
            
          <c:if test = '${status.count % 3 == 1 }'>  
           
             <li class="w3-bar">
   				
	      		<div class="w3-bar-item">
	      		<img src="/static/img/img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
	       			 <span class="w3-large">${applicantInOneDay.name}</span><br/>
       			  <span class="w3-Small">${applicantInOneDay.phone}</span>
      			</div>
    		</li>
    	
    		
 
          </c:if>
          
             <c:if test = '${status.count % 3 == 2 }'>  
                 <li class="w3-bar">
     
          <img src="/static/img/img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      <div class="w3-bar-item">
        <span class="w3-large">${applicantInOneDay.name}</span><br/>
       			  <span class="w3-Small">${applicantInOneDay.phone}</span>
       
      </div>
    </li>
            </c:if>
            
             <c:if test = '${status.count % 3 == 0 }'>  
                 <li class="w3-bar">
     			 <img src="/static/img/img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      				<div class="w3-bar-item">
        			 <span class="w3-large">${applicantInOneDay.name}</span><br/>
       			  <span class="w3-Small">${applicantInOneDay.phone}</span><br/>
      				</div>
      				
    </li>
            </c:if>
     
         </c:forEach>
         </ul>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Compulsory</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${boardInfo.start_date}  ~ ${boardInfo.end_date}</h6>
		
          <ul class="w3-ul w3-card-4">
          <c:forEach items = "${compulsoryPeoples}"  var = "compulsoryPeoples" varStatus="status">
            
          <c:if test = '${status.count % 3 == 1 }'>  
           
             <li class="w3-bar">
   				<img src="/static/img/img_avatar2.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
	      		<div class="w3-bar-item">
	   
	       			 <span class="w3-large">${compulsoryPeoples.name}</span>
	       			 	<i class="fa fa-close fa-fw w3-margin-leftt" onclick="deleteCompulsory('${compulsoryPeoples.phone}')"></i><br/>
       			  <span class="w3-Small">${compulsoryPeoples.phone}</span>
      			</div>
      			  
    		</li>
    	
    		
 
          </c:if>
          
             <c:if test = '${status.count % 3 == 2 }'>  
                 <li class="w3-bar">
     
          <img src="/static/img/img_avatar5.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      <div class="w3-bar-item">
     
        <span class="w3-large">${compulsoryPeoples.name}</span> 
      	<i class="fa fa-close fa-fw w3-margin-leftt" onclick="deleteCompulsory('${compulsoryPeoples.phone}')"></i><br/>
       			  <span class="w3-Small">${compulsoryPeoples.phone}</span>
       
      </div>
         
    </li>
            </c:if>
            
             <c:if test = '${status.count % 3 == 0 }'>  
                 <li class="w3-bar">
     			 <img src="/static/img/img_avatar6.png" class="w3-bar-item w3-circle w3-hide-small" style="width:30%">
      				<div class="w3-bar-item">
      				
        			 <span class="w3-large">${compulsoryPeoples.name}</span>
        			 	<i class="fa fa-close fa-fw w3-margin-leftt" onclick="deleteCompulsory('${compulsoryPeoples.phone}')"></i><br/>
       			  <span class="w3-Small">${compulsoryPeoples.phone}</span><br/>
      				</div>
      				  
    </li>
            </c:if>
     
         </c:forEach>
         </ul>
           <hr>
        </div>
      </div>

    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
  <!-- End Page Container -->
</div>

<footer class="w3-container w3-teal w3-center w3-margin-top">
  <p>Find me on social media.</p>
  <i class="fa fa-facebook-official w3-hover-opacity"></i>
  <i class="fa fa-instagram w3-hover-opacity"></i>
  <i class="fa fa-snapchat w3-hover-opacity"></i>
  <i class="fa fa-pinterest-p w3-hover-opacity"></i>
  <i class="fa fa-twitter w3-hover-opacity"></i>
  <i class="fa fa-linkedin w3-hover-opacity"></i>
  <p>Powered by <a href="https://www.w3schools.com/w3css/default.asp" target="_blank">IBM</a></p>
</footer>

</body>
</html>

