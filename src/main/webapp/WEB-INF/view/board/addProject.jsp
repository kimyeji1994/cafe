<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<c:url value="/static/js/jquery-3.1.1.min.js"/>"></script>
<script type="text/javascript">
/* $("#writeBtn").click(function(){
	$("#writeForm").attr({
		"action" : "<c:url value="/project/write"/>",
		"method" : "post"
	}).submit();
});
 */$().ready(function(){
		$("#easy").click( function() {
			
			$.post(
				"<c:url value="/project/write" />",
				$("#writeForm").serialize(),
				function(data) {
					if (data != "FAIL") {
						alert("code : "+data)
						window.location.href = "/scedule/list/" + data ;
					} else if (data == "FAIL") {
						location.reload();
					}
			});
		});
 });


</script>
</head>


<body>


<form id="writeForm">
번호 : <input type ="text" id="phone" name = "phone"><br/>
이름 : <input type ="text" id="name"  name="name"><br/>
제목 : <input type ="text" id="title" name ="title"><br/>
시작날짜 : <input type ="text" id="startDate" name ="startDate"><br/>
끝날짜 : <input type ="text" id="endDate" name ="endDate"><br/>
프로젝트  : <input type ="text" id="project" name ="project"><br/>
<input type="button" id="easy" value="간편일정">
<input type="button" id="complex" value="프로젝트 일정">

</form>

</body>
</html>