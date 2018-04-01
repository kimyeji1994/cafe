<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<title>Scodule</title>

<style>
.w3-theme-d4 {
    color: #fff !important;
    background-color: #3F5E9F!important;
}

.w3-theme-d2 {
    color: #fff !important;
    background-color:#3F5E9F!important;
}

</style>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">



google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  

 var scduleLogArray = new Array();

 
 <c:forEach items="${recommandList}"  var ="sceduleLogList" varStatus="status">
	 var oneSceduleLog = new Array();
	 if(${ status.count } == 1 ){
		 oneSceduleLog.push("${sceduleLogList[0]}");
		 oneSceduleLog.push("${sceduleLogList[1]}"); 
		 oneSceduleLog.push("${sceduleLogList[2]}"); 
	
		 
	 }
	 else{
		 oneSceduleLog.push("${sceduleLogList[0]}");
		 oneSceduleLog.push(${sceduleLogList[1]}); 
		 oneSceduleLog.push(${sceduleLogList[2]}); 
		
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

  var chart = new google.visualization.BarChart(document.getElementById('curve_chart'));

  chart.draw(data, options);
}



</script>

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
	
   <div id="curve_chart" class ="w3-margin-tops" style="width: 100%; height: 550px"></div>




</body>
</html>