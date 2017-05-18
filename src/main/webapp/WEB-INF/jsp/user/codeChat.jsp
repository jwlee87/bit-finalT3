<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user/userList.css">
<style>
	#sendmessage {
    height: 45px;
    border-top: 1px solid #e7ebee;
/*     position: absolute; */
    position: relative;
    margin-right: 32.5%;
    width: 100%;
    bottom: 0;
    right: 0px;
    background: #fff;
    padding-bottm: 50px;
}

</style>
<!-- <body> -->

<textarea id="chatMsg" readonly></textarea>
<div id="sendmessage">
        	<input type="text" id="sendChatMsg" name="sendCodeMessage"   placeholder="내용을 입력하세요"/>
            <button id="codeMsgsend"></button>
        </div>
<!-- </body> -->
<%-- <script src="${pageContext.request.contextPath}/js/user/codeChat.js"></script>  --%>
<script type="text/javascript">

</script>


</html>