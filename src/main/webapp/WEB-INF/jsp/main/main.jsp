<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="${pageContext.request.contextPath}/js/main/main.js"></script>
	<link href="${pageContext.request.contextPath}/css/main/main.css" rel="stylesheet" type="text/css">
</head>
<body id="home">
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">s
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	<div class="wrapper">
	최근 게시물
		
		<section>
		<article>
			<figure><img src="https://unsplash.it/900/300?image=2" alt="" /></figure>
			<h2>Article 1</h2>
			
			<tr>
				<td>a</td>
				<td>b</td>
			</tr>
			<p>
				<td>c</td>
				<td>d</td>
			</p>
			<tr>
				<td>c</td>
				<td>d</td>
			</tr>
			
			<p>Duis autem vel eum <a href="#">iriure</a> dolor in odio dignissim qui blandit praesent luptatum zzril delenit augue
				duis dolore te feugait nulla facilisi.</p>
			<p>Lorem ipsum dolor sit amet, consectetuer adipiscing magna aliquam erat volutpat.</p>
			<p><a class="btn" href="#">Lire la suite</a></p>
		</article>
		</section>
		
	</div>
	
	
	<div class="table=responsive">
	최근 퀴즈
		<table class="table" id="quizList">
		</table>
	</div>
</body>
</html>