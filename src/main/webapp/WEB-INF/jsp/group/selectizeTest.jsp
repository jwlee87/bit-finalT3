<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/normalize.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/comm/stylesheet.css">
<!--[if IE 8]><script src="js/es5.js"></script><![endif]-->
<script src="${pageContext.request.contextPath}/js/comm/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/selectize.js"></script>
<script src="${pageContext.request.contextPath}/js/comm/index.js"></script>
<style type="text/css">
.selectize-control .option .title {
	display: block;
}
.selectize-control .option .url {
	font-size: 12px;
	display: block;
	color: #a0a0a0;
}
.selectize-control .item a {
	color: #006ef5;
}
.selectize-control .item.active a {
	color: #303030;
}
</style>
</head>
<body>
<div id="wrapper">
	<h1>Selectize.js</h1>
	<div class="demo">
		<h2>Customizing Appearance</h2>
		<p>Render items on your own &amp; apply unique CSS styles.</p>
		<div class="control-group">
			<label for="select-links">Links:</label>
			<select id="select-links" placeholder="Pick some links..."></select>
		</div>
		<script>
		$('#select-links').selectize({
			theme: 'links',
			maxItems: null,
			valueField: 'id',
			searchField: 'title',
			options: [
				{id: 1, title: 'DIY', url: 'https://diy.org'},
				{id: 2, title: 'Google', url: 'http://google.com'},
				{id: 3, title: 'Yahoo', url: 'http://yahoo.com'},
			],
			render: {
				option: function(data, escape) {
					return '<div class="option">' +
							'<span class="title">' + escape(data.title) + '</span>' +
							'<span class="url">' + escape(data.url) + '</span>' +
						'</div>';
				},
				item: function(data, escape) {
					return '<div class="item"><a href="' + escape(data.url) + '">' + escape(data.title) + '</a></div>';
				}
			},
			create: function(input) {
				return {
					id: 0,
					title: input,
					url: '#'
				};
			}
		});
		</script>
		<p>TODO: explain how to bind events.</p>
	</div>
</div>
</body>
</html>