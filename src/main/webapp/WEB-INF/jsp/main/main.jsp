<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>

html {
    font-family: "Lato", "Lucida Grande","Lucida Sans Unicode", Tahoma, Sans-Serif;
    line-height: 1.5;
    font-size: 15px;
    font-weight: 400;
}

body {
    color: white;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.main-header {
	height: 69px;
    min-height: 69px;
    min-width: 1000px;
    border-bottom: 5px solid #343436;
    box-shadow: 0 1px 1px black;
    
    background: black;
    border-bottom: 1px solid #222;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: middle;
    -ms-flex-align: middle;
    align-items: middle;
    position: relative;
    z-index: 11;
    height: 65px;
}
</style>
</head>
<body>
	<header class="main-header">
		<div></div>
		<div>
			<button>
				<svg></svg>
				<span></span>
			</button>
			<a>로그인</a>
			<a>회원가입</a>
		</div>
	</header>
</body>
</html>