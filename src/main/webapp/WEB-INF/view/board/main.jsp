<%@ page language="java" contentType="text/html; charset=UTF-8"
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



<body>

<a href="<c:url value ="/project/write"/>" ><input type="button" id="create" value="create"></a>
<input type="button" id="join" value="join">

</body>
</html>