<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  

					<c:forEach items="${chatList}"  var ="list" varStatus="status">
						<c:if test='${list.phone != myPhone}'>
							<div class="form-group input-group date input-append chatBox">
								<div class="text-left small yourChatName">
									<i class="fa fa-user fa-fw w3-text-theme"></i>
									${list.name}
								</div>
							    <div class="form-control yourChatBox">
									${list.comment}
								</div>
							</div>
						</c:if>
						
						<c:if test='${list.phone == myPhone}'>
							<div class="form-group input-group date input-append chatBox">
								<div class="text-right small myChatName">
									${list.name}<i class="fa fa-user fa-fw w3-text-theme"></i>
								</div>
							    <div class="form-control myChatBox">
									${list.comment}
								</div>
							</div>
						</c:if>
						
					</c:forEach>