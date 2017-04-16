
	/** 팝업 **/
	$(document).ready(function(){
		$(".iframe").colorbox({iframe:true, width:"650px", height:"380px"});
		
		
		/** 새로운 그룹 등록 **/
		$("#maker").click(function () {
			$.ajax({
				url: "groupHeaderWrite.do",
				type: "POST",
				dataType:"json"
			})
			.done (function(result){
				var html = '<div class="sticky">'
					+ '<div class="setting">'
//					+ '<img src="'+${pageContext.request.contextPath}+'/img/icon/trash.png" width="19px" height="19px" onclick="deleteGrp('+result.groupHeaderNo+')"/>'
					+ '<img src="/bit-finalT3/img/icon/trash.png" width="19px" height="19px" onclick="deleteGrp('+result.groupHeaderNo+')"/>'
					+ '<a class="iframe" href="groupDetail.do?groupHeaderNo='+result.groupHeaderNo+'">'
//					+ '<img src="'+${pageContext.request.contextPath}+'/img/icon/setting.png" width="19px" height="19px" />'
					+ '<img src="/bit-finalT3/img/icon/setting.png" width="19px" height="19px" />'
					+ '</a>'
					+ '</div>'
					+ result.groupHeaderName
					+ '</div>';
				
				$("#maker").after(html);
				$(".iframe").colorbox({iframe:true, width:"650px", height:"380px"});
				
				swal({
					title: "그룹 등록 완료",
					type: "success"	
				})
			});
		});
	});

	
	/** 그룹 삭제 **/
	function deleteGrp(groupHeaderNo) {
		$.ajax ({
			url: "groupDelete.do",
			type: "POST",
			data: {
				"groupHeaderNo": groupHeaderNo
			},	
			dataType: "json"
		}).done(function(result){
			swal({
				title: "그룹 삭제 완료",
				type: "success"	
			},
			function(){
				location.href = "groupList.do"
			})			
		});
	};
	
	