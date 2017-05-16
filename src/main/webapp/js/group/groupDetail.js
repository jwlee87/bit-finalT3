$(function(){
	
	$.ajax({
		url:"groupDetailList.do",
		type: "POST",
		data: {
			"groupHeaderNo": $("#GroupHeaderNo").val()
		},
		dataType:"json"
	}).done(function (result) {
		$("#nContent").append('<input type="text" id="groupname" class="ip" value="'+result.name+'">');
		
		var data = [];
		var defaultTag="";
		var order="";
		
		var allUser = [];
		
		
		for(var i = 0; i < result.allUserList.length; i++) {
			var userInfo = result.allUserList[i];
			console.log(userInfo.userNickName);
			allUser.push({
				value : userInfo.userNickName,
				text: userInfo.userNickName,
//				order: userInfo.userOrder
			}) 
//			defaultTag += userInfo.userNickName + ",";
//			order += userInfo.userOrder + ",";
//		}
//		var arrOrder = order.split(",");
//		for(var i=0; i<arrOrder.length; i++) {
//			if(arrOrder[i] != ",") $("#input-tags").attr("data-order", arrOrder[i]);
		}
		
		
		
		for (var i=0; i < result.userList.length; i++){
			
			var user = result.userList[i];
			data.push({
				id: i,
				text: user.userNickName,
				order: user.userOrder
			})
			defaultTag += user.userNickName + ",";
			order += user.userOrder + ",";
		}
		var arrOrder = order.split(",");
		for(var i=0; i<arrOrder.length; i++) {
			if(arrOrder[i] != ",") $("#input-tags").attr("data-order", arrOrder[i]);
		}
		
		$("#input-tags").val(defaultTag.substring(0, defaultTag.length-1));
		
		$('#input-tags').selectize({
			plugins: ['remove_button'],
			persist: false,
			create: true,
			options: allUser,
			render: {
				item: function(allUser, escape) {
					return '<div id="userNick" >' + escape(allUser.text) + '</div>';
//					console.log("머머머머머머fffff : " + $("#userNick").getAttribute("data-value"));
//					return console.dir("이게 무슨 소리임매 : " + $("#userNick").text());
				}
			},
			onDelete: function(values) {
				
				if($('#input-tags').val() != ""  && $('#input-tags').val().indexOf(",") == -1) {
					swal("", "그룹 생성자는 구성원에서 삭제할 수 없습니다.", "info");
					return false;
				} else {
					return swal({
						title: "",
						text: values.length > 1 ? values.length + ' items?' : '"' + values[0] + '"님을 삭제하시겠습니까?',	
						type: "warning",
			    		confirmButtonColor: "#DD6B55",
			    		confirmButtonText: "삭제"
					});
				}
			}
		});
		
		
		$(".selectize-input>div:eq(0)>a").remove();
		$(".selectize-input>div:eq(0)").removeAttr("data-value");
		
//		console.log("으하하하하하ㅏ핳 : " + $(".selectize-input>div:eq(0)").text());
		if ($(".selectize-input>div:eq(0)").text() == result.loginUser.userNickName) {
			$("#y").css("display", "block");
		} else {
			$("#n").css("display", "block");
		}
		
	});
	
	
	//  버튼 클릭 시 수정 ajax 실행
	$("[name=uButton]").on("click", function (){
		var userData = [];
//		var arrUser = new Array();
		
		
		var len = $(".selectize-input #userNick").length;
//	    alert($(".selectize-input > div:eq(0)").text())
		userData[0] = $(".selectize-input > div:eq(0)").text();
	    for(var i = 1; i < len; i++) {
	    	if($(".selectize-input > div:eq(" + i + ")").attr("data-value") != undefined) {
//	            alert($(".selectize-input > div:eq(" + i + ")").attr("data-value"));
	            userData[i] = $(".selectize-input > div:eq(" + i + ")").attr("data-value");
	            
	        }
	        console.log(userData);
	    }
		
		console.log("바뀜 : " + userData);
		console.dir("바뀜2 : " + userData);
		
		
		$.ajaxSettings.traditional = true;
//		console.log("확인 : " + arrUser.push(userData));
		$.ajax ({
			url: "groupUpdate.do",
			type: "POST",
			dataType: "json",
			data: {
				"groupHeaderName": $("#groupname").val(),
				"groupHeaderNo": $("#GroupHeaderNo").val(),
				userNickName: userData
		}
		}).done(function(result){
			
			swal({
				title: "수정 완료",
				text: "스터디 그룹 정보가 수정되었습니다.",
				confirmButtonText: "확인",
			}, 
			function (isConfirm) {
				if(isConfirm) {
					parent.location.href ="groupList.do";
					parent.$.colorbox.close();
				}
			})
			
		}); 
		
	/* 	$.ajax ({
			url: "groupUpdate.do",
			type: "POST",
			dataType: "json",
			data: {
				"groupHeaderNo": $("#GroupHeaderNo").val(),
				"groupHeaderName": $("#groupname").val(),
				"userNo": $("#groupmem").val()
				}
		}).done(function(result){
		});  */
		
	}); 
	
});



	/** 그룹 삭제 **/
	function deleteGrp(groupHeaderNo) {
		swal({
			title: "",
			text: "그룹을 삭제하시겠습니까?",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "삭제",
			cancelButtonText: "취소",
			closeOnConfirm: false
		},
		function(){
			$.ajax ({
				url: "groupDelete.do",
				type: "POST",
				data: {
					"groupHeaderNo": groupHeaderNo
				},	
				dataType: "json"
			}).done(function(result){
				swal({
					title: "삭제 완료",
					text: "그룹이 삭제되었습니다.",
					type: "success"	
				},
				function(){
					window.open('/bit-finalT3/group/groupList.do','_parent').parent.close();
				})			
			});
		});
	};
	
