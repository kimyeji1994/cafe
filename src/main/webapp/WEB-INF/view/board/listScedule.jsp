<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html >
<html>
<head>
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


</script>
</head>
<body class="w3-light-grey">

<!-- Page Container -->
<div class="w3-content w3-margin-top" style="max-width:1400px;">

  <!-- The Grid -->
  <div class="w3-row-padding">
  
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
          <p><i class="fa fa-home fa-fw w3-margin-right w3-large w3-text-teal"></i>Coway, Global Project</p>
        <!--   <p><i class="fa fa-envelope fa-fw w3-margin-right w3-large w3-text-teal"></i>ex@mail.com</p> -->
          <p><i class="fa fa-phone fa-fw w3-margin-right w3-large w3-text-teal"></i>010-6534-3426</p>
          <hr>
	
          <p class="w3-large"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Click Your Available Dates</b></p>
         <table class="textMid">
	

			<c:forEach items = "${sceduleList}"  var = "scedules">
				<tr>
				
				
				
				<td > <i class="fa fa-calendar fa-fw w3-margin-right"></i><input type="button" class="rosy" id ="${scedules}" value="${scedules}" onClick="sceduleClick('${scedules}')"></td>
					
				</tr>
			</c:forEach>

			</table>
			<input type="hidden" id="boardId" value="${boardInfo.board_id }">
			<input type="hidden" id="board" value="${boardInfo}">
			<input type="hidden" id="sceduleLogList" value="${sceduleLogList}">
			
		
			
			          <br>

          <p class="w3-large w3-text-theme"><b><i class="fa fa-asterisk fa-fw w3-margin-right w3-text-teal"></i>Progress</b></p>
          <p>DeadLine</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:100%"></div>
          </div>
          <p>Voter</p>
          <div class="w3-light-grey w3-round-xlarge">
            <div class="w3-round-xlarge w3-teal" style="height:24px;width:55%"></div>
          </div>
          
          <br>
        </div>
      </div><br>

    <!-- End Left Column -->
    </div>

    <!-- Right Column -->
    <div class="w3-twothird">

      <div class="w3-container w3-card w3-white w3-margin-bottom">
           <h2 class="w3-text-grey w3-padding-16" id="miseon"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Scedules</h2>
        <div id="curve_chart" style="width: 100%; height: 550px"></div>
      </div>

      <div class="w3-container w3-card w3-white">
        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-certificate fa-fw w3-margin-right w3-xxlarge w3-text-teal"></i>Attendances</h2>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Full Participants</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${boardInfo.start_date}  ~ ${boardInfo.end_date}</h6>
          <c:forEach items = "${applicantList}"  var = "applicantList">
          <b class="w3-margin-right"><i class="fa fa-user fa-fw appli"></i>${applicantList}</b>    
         </c:forEach>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Participants</b></h5>
          <h6 class="w3-text-teal" id = "thatDay"><i class="fa fa-calendar fa-fw w3-margin-right"></i>${oneday}</h6>
          <c:forEach items = "${applicantInOneDay}"  var = "applicantInOneDay">
          <b class="w3-margin-right"><i class="fa fa-user fa-fw appli"></i>${applicantInOneDay}</b>    
         </c:forEach>
          <hr>
        </div>
        <div class="w3-container">
          <h5 class="w3-opacity"><b><i class="fa fa-users fa-fw w3-margin-right"></i>Compulsory</b></h5>
          <h6 class="w3-text-teal"><i class="fa fa-calendar fa-fw w3-margin-right"></i>2013 - 2015</h6>
        <p><i class="fa fa-user fa-fw w3-margin-right"></i>yeji</p>
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

