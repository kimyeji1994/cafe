<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">

function sceduleClick(date) {
	var sceduleId = "#" + date;
	alert($(sceduleId).val());
	var boardId = $("#boardId").val();
	
	$.post(
			"<c:url value="/project/addScedule" />",
			{ "date" : date   , "boardId" : boardId  },
			function(data) {
				if (data != "FAIL") {
					alert("code : "+data)
					console.log(data.data);
					//window.location.href = "/scedule/list/" + data ;
				} else if (data == "FAIL") {
					location.reload();
				}
		}); 
	
	
}


</script>
</head>
<body>
<h1>${boardInfo.title}</h1>
<table>
	

<c:forEach items = "${sceduleList}"  var = "scedules">
	<tr>
	
	
	
	<td><input type="button" class="scedules" id ="${scedules}" value="${scedules}" onClick="sceduleClick(${scedules})"></td>
		
	</tr>
</c:forEach>

</table>
<input type="hidden" id="boardId" val="${boardInfo.board_id }">

</body>
</html>