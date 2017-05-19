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

#sendmessage input{
	background:#fff;
	margin:21px 0 0 21px;
	border:none;
	padding:0;
	font-size:14px;
	font-family:"Open Sans", sans-serif; 
	font-weight:400px;
	color:#626263;
}

#sendmessage button{
	background:#fff url("https://s3-us-west-2.amazonaws.com/s.cdpn.io/245657/send.png") 0 -41px no-repeat;
	width:30px;
	height:30px;
	position:absolute;
	right: 15px;
	top: 23px;
	border:none;
	margin-top: -7px;
}
#sendmessage button:hover{
	cursor:pointer;
	background-position: 0 0 ;
}

</style>
<!-- <body> -->

<textarea id="chatMsg" readonly></textarea>
<div id="sendmessage">
        	<input type="text" id="sendChatMsg" name="sendCodeMessage" style="margin-top: 13px; width: 361px;"  placeholder="내용을 입력하세요"/>
            <button id="codeMsgsend"></button>
        </div>
<!-- </body> -->
<%-- <script src="${pageContext.request.contextPath}/js/user/codeChat.js"></script>  --%>
<script type="text/javascript">

</script>


</html>