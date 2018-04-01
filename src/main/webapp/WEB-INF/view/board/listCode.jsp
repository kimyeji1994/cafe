<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html >
<html>

<head>


</head>
<body>


<form id="codeForm" action="#" >
			
		<!-- new post Modal -->
	<div class="modal" id="codeModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content" style='background: rgba(255,255,255,0.85);'>
	   		<div class="modal-header">
	       <h5 class="modal-title">Code List</h5>
	       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	         <span aria-hidden="true">&times;</span>
	       </button>
	     	</div>
        <div class="modal-body">        	
        	<div class="container">
			     <table>
	         	<tbody>
<!-- 			       	<tr>
					      <td class="align-middle">codeList1</td>
							</tr>   -->    
			       	<tr>
					      <input type="button" class="btn btn-sm btn-block btn-code" value="codeList 1" onClick="joinFormCheck();">
							</tr>
							<c:forEach items = "${sceduleList}"  var = "scedules">
								<tr>
								<td><input type="button" class="rosy" id ="${scedules[1]}" value="${scedules[0]}" onClick="sceduleClick('${scedules[0]}')"><i class="fa fa-users fa-fw w3-margin-lefts" onClick="viewScedule('${scedules[0]}')"></i></td>
								</tr>
							</c:forEach>							     						      	
			    		<c:forEach items = "${codeList}"  var = "codeList" varStatus="status">
				       	<tr>
						      <td class="align-middle">${codeList}</td>
								</tr>   
	          	</c:forEach>
	          </tbody>
	         </table> 
         </div>
	    	</div>
  	
		  </div>
		</div>
	</div>
</form>

</body>
</html>