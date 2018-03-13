<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
 <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">


</script>
</head>
<body>
<h1>IBM</h1>
<table>
	

<c:forEach items = "${sceduleList}"  var = "scedules">
	<tr>
	
	
	
		<td>${scedules}</td>
		
	</tr>
</c:forEach>

</table>


</body>
</html>