<%@ page contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="navi" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta Charset="UTF-8">
<title>상세 조회</title>

<jsp:include page="/WEB-INF/jsp/decorators/mainHeader.jsp"></jsp:include>
<script src="${pageContext.request.contextPath}/js/comm/jquery.form.min.js"></script>
<script src="${pageContext.request.contextPath}/js/card/detail.js"></script>
<link href="${pageContext.request.contextPath}/css/card/detail.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/comment/commentUpdateForm.css" rel="stylesheet" type="text/css">

<link href="https://cdn-na.infragistics.com/igniteui/2016.2/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
<link href="https://cdn-na.infragistics.com/igniteui/2016.2/latest/css/structure/infragistics.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>

<style>
.divDetail {
    padding: 13px !important;
    min-height: 170px;
    line-height: 24px;
    width: 507px;
}
</style>
</head>
<body>
	<input type="hidden" id="content" value="${detail.cardContent}" />
  	<div class="cDetail">
  		<div class="post">
			<form id="frmFileUpload" name="frmFileUpload" method="POST" enctype="multipart/form-data">
			<div id="detailBlock">
				<div><c:out value="${detail.userNickName}"></c:out></div>	
				<input type="hidden" id="cardNo" name="cardNo" value="${param.cardNo}" />
				<input type="hidden" id="userNo" value="${detail.userNo}"/>
				<input type="hidden" id="loginUserNo" value="${user.userNo}"/>
				
				<div id="printDetail">
					<div class="divDetail" id="divDetail"><c:out value="${detail.cardContent}"></c:out></div>
				</div>
					<div id="igUpload1" style="position-top:20px;">
						<div class="ui-iguploadmultiple ui-widget ui-widget-content ui-corner-all ui-igupload" id="igUpload1_bmncntr">  
							<div id="igUpload1_fu" class="ui-igupload-basemaincontainer">
								<div id="igUpload1_fi_main_cntnr" class="ui-igupload-fimaincontainer" style="display:none;">
									<button id="igUpload1_bb" class="ui-igupload-browsebutton ui-button-text-only ui-button ui-igbutton ui-widget ui-widget-content ui-corner-all ui-state-default" title="Add" role="button" aria-disabled="false">
										<span class="ui-button-text" id="igUpload1_bb_lbl">Add</span>
									</button>
									<input type="file" name="uploadFile[]" id="uploadFile" multiple title="Add" 
										style="position: absolute; margin: -5px 0px 0px -175px; padding: 0px; width: 1px; 
										top: 210px; right: 489px; height: 27px; font-size: 14px; opacity: 0; cursor: pointer; display: block; z-index: 1000000;">
									<div id="igUpload1_fc" class="ui-igupload-container ui-widget-content"></div>
								</div>
								
								
								<div id="igUpload1___fus" class="ui-igupload-uploadprogress ui-helper-clearfix">	
								<c:forEach var="fileItem" items="${fileList}" varStatus="status">
										
										<div class="ui-widget-content ui-igupload-progress-container ui-corner-all ui-helper-clearfix">		
											<div class="ui-container-button-cancel-class  ui-helper-clearfix" >			
												<button type="button" id="igUpload1_${status.index}__cbtn" title="Cancel" 
													class="ui-button-icon-only ui-button ui-widget ui-state-default ui-corner-all ui-igbutton ui-igupload-cancel-button" 
													role="button" aria-disabled="false" style="display:none" onclick="deleteFile(${fileItem.fileNo});">
													<span class="ui-button-icon-primary ui-icon ui-icon-closethick" id="igUpload1_${status.index}__cbtn_picn"></span>
													<span class="ui-button-text" id="igUpload1_${status.index}__cbtn_lbl"></span>
												</button>		
											</div>		
											
											<div class="ui-helper-clearfix">
												<div class="ui-igupload-progressbar-container ui-helper-clearfix" title="${fileItem.fileOriName}">				
													<span id="igUpload1_${status.index}__icn" class="ui-icon ui-icon-image ui-igupload-progressbar-icon ui-igupload-progressbar-icon-images"></span>				
													<span class="ui-igupload-progressbar-filename" id="igUpload1_${status.index}__pbrflnm"><a href="javascript:window.open('${pageContext.request.contextPath}/upload${fileItem.filePath}/${fileItem.fileSysName}')">${fileItem.fileOriName}</a></span>				
													<span class="ui-igupload-progressbar-filesize" id="igUpload1_${status.index}__pbrflsz"><fmt:formatNumber value="${fileItem.fileSize}" type="number"/>Byte/<fmt:formatNumber value="${fileItem.fileSize}" type="number"/>Byte</span>			
												</div>
											</div>	
										</div>
									
								</c:forEach>
								</div>
								
								<div class="ui-helper-clearfix">
									<button id="igUpload1_spbtncncl" title="Upload" class="ui-button-text-only ui-button ui-igbutton ui-widget ui-widget-content ui-corner-all ui-state-default ui-igupload-summary-button" 
										role="button" aria-disabled="false" style="display:none;">
										<span class="ui-button-text" id="igUpload1_spbtncncl_lbl">Upload</span>
									</button>
								</div>
							</div>
								
								
						</div>
					</div>
						
					<div class="tools">
	<%-- 					<img src="${pageContext.request.contextPath}/img/icon/attach.png" id="attach" width="19px" height="19px"> --%>
							<button type="button" class="detailNoneButton" id="deleteButton" onclick="javascript:deletes(${param.cardNo});">삭제</button>
							<button type="button" class="detailNoneButton" id="detailNoneButton">수정</button>
					</div>
					
				</div>
			</form>
				
				
			</div>
		</div>
	</div>
	
	<form id="commentWrite" action="#" method="post">
		<input type="hidden" id="cardContentNo" value="${param.cardContentNo}" />
		<input type="hidden" id="commentUserNo" value="${user.userNo}"/>
	</form>

		<%-- 댓글 관련 파트 시작 --%>		
		<!-- <div id="comment">
			<form id="rForm" class="form-inline"> -->
			
<!--  			    <div class="form-group"> -->
<!--  				    <input type="text" name="commentContent" id="commentContent" class="form-control input-wp1" placeholder="내용을 입력하세요"> -->
<!--  			    </div> -->
<!-- 			  	<button type="button" id="reg" class="btn btn-primary">등록</button> -->
			
		<!-- 	</form>					
		</div> -->
		
		<%-- 댓글 관련 파트 끝 --%>		
		
	 <section class="page">
        <div class="course-meta">
            <h1>댓글 등록</h1>
        </div>
           
        <section class="center">
        
            <ol class="posts" >
                <li class="add-post">
                    <textarea cols="100" maxlength="100" name="commentContent" id="commentContent" class="add-post-textarea" placeholder="댓글을 입력하세요"></textarea>
                <button type="button" id="reg" class="btn btn-primary">등록</button>
                </li>
               
               
                <li class="post" id="commentList" style="margin-top: 80px;">
				</li>
			</ol>
		</section>
	</section>


<script type="text/javascript" language="javascript">
// $(function () {
//     $("#upload").igUpload({
//         mode: "single",
//         autostartupload: true,
//         // to upload a file, you need a server-side handler
//         progressUrl: "IGUploadStatusHandler.ashx",
//         controlId: "serverID"
//     });
// });
</script>

</body>
</html>