<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%-- <jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp" flush="false"></jsp:include> --%>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/userList.css">
<script src="${pageContext.request.contextPath}/js/user/userList.js"></script> 
</head>
<body>



<!-- <a id="view-code" href="http://codepen.io/virgilpana/pen/ZYZXgP" target="_blank">VIEW CODE</a> -->

<div id="chatbox" style="margin-top:4.1%">
	<div id="friendslist">
    	<div id="topmenu">
        	<span id="friendsTab" class="friends"><img style='margin: 15% auto;' id="friendPic"  src="${pageContext.request.contextPath}/img/userImg/users.png"></span>
        	<span id="chatTab" class="chats"><img style='margin: 15% auto;' id="chatPic"  src="${pageContext.request.contextPath}/img/userImg/chatOff.png" ></span>
        </div>
        <div id="fList">
        <div id="result"></div>
        </div>
        
        
        <div id="chat" style="display: none;">
        <div id="chat-messages"></div>
        <div id="sendmessage">
        	<input type="text" id="sendMsg" name="sendMessage"   placeholder="내용을 입력하세요"/>
            <button id="send"></button>
        </div>
        </div>
        
        
            
	</div>                
   
</div>	
</body>
</html>