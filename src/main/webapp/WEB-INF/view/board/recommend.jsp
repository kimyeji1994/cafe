<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Scodule</title>


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
	
   <div id="curve_chart" style="width: 100%; height: 550px"></div>




</body>
</html>