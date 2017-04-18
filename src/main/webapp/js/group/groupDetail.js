$(function(){
	
	$.ajax({
		url:"groupDetailList.do",
		type: "POST",
		data: {
			"groupHeaderNo": $("#GroupHeaderNo").val()
		},
		dataType:"json"
	}).done(function (result) {
		$("#nContent").append('<input type="text" id="groupname" value="'+result.name+'">');
		
		var data = [];
		var defaultTag="";
		var order="";
		for (var i=0; i < result.userList.length; i++){
			
			var user = result.userList[i];
			data.push({
				id: i,
				text: user.userNickName,
				order: user.userOrder
			})
//			alert(user.userNickName);
			defaultTag += user.userNickName+ ",";
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
			options: data,
			render: {
				item: function(data, escape) {
					return '<div>"' + escape(data.text) + '"</div>';
				}
			},
			onDelete: function(values) {
				return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : '"' + values[0] + '"님을 삭제하시겠습니까?');
			}
		});
			
	});

	
	
	
	
	//  버튼 클릭 시 수정 ajax 실행
	$("#uButton").click(function (){
		
		$.ajax ({
			url: "groupUpdate.do",
			type: "POST",
			dataType: "json",
			data: {
				"groupHeaderName": $("#groupname").val(),
				"groupHeaderNo": $("#GroupHeaderNo").val()
				}
		}).done(function(result){
			swal("수정 완료");
			parent.location.href ="groupList.do";
			parent.$.colorbox.close();
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
