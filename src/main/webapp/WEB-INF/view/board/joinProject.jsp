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
$().ready(function(){
		$("#joinButt").click( function() {
			
			$.post(
				"<c:url value="/project/join" />",
				$("#writeForm").serialize(),
				function(data) {
					if (data != "fail") {
						window.location.href = "/scedule/list/" + data ;
					} else if (data == "fail") {
						alert("No Available Code");
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
코드 : <input type ="text" id="code" name ="code"><br/>

<input type="button" id="joinButt" value="join">


</form>

</body>
</html>