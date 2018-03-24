<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
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
</html>