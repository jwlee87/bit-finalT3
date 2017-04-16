$(function(){
	
	
	
	
	
// 		alert("번호 : " +  $("#GroupHeaderNo").val());
	$.ajax({
		url:"groupDetailList.do",
		type: "POST",
		data: {
			"groupHeaderNo": $("#GroupHeaderNo").val()
		},
		dataType:"json"
	}).done(function (result) {
		
		var data = [];
		for (var i=0; i < result.userList.length; i++){
			
			var user = result.userList[i];
			data.push({
				id: i,
				title: user.nickName,
				url: user.email
			})
			
			var defaultTag = user.nickName+ ",";
			
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
				return confirm(values.length > 1 ? 'Are you sure you want to remove these ' + values.length + ' items?' : 'Are you sure you want to remove "' + values[0] + '"?');
			}
		});
			
	});

	
	
	
	
	//  버튼 클릭 시 수정 ajax 실행
	$("#uButton").click(function (){
		
	/*   	console.log($("#GroupHeaderNo").val());
	  		console.log(document.getElementById("groupname").innerHTML);
	  		console.log($("#groupname").html());
	  		console.log(document.getElementById("groupmem").innerHTML); */
		
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
