
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
				
				var name = "";
				var cnt = 0;
				for (var i=0; i < result.userList.length; i++){
					var user = result.userList[i];
					
	// 				name += user.userNickName + '<button type="button" id="remove" > x ' + '</button>';
	// 				name += user.userNickName + '<a href="deleteMem('+user.userNo+')" class="remove" tabindex="-1">x' + '</a>';
		
				$(".selectize-input").append(
						  '<div class="item" data-value='+user.userNickName+'>'
						+ user.userNickName 
						+ '<a href="javascript:void(0)" class="remove" tabindex="-1" title="삭제">x' 
						+ '</a>'
						+ '</div>'
						);
					
						cnt += 1;
					}
					
					if (cnt == result.userList.length) {
						$(".selectize-input>:last-child").append(
						'<input type="text" autocomplete="off" tabindex="" id="input-tags3-selectized">'
						);
				}
				
				$("#nContent").append('<input type="text" id="groupname" value="'+result.name+'">');
			});
		});
	
	$('#input-tags3').selectize({
		plugins: ['remove_button'],
		delimiter: ',',
		persist: false,
		create: function(input) {
			return {
				value: input,
				text: input
			}
		}
	});
	
	
	
 	//  버튼 클릭 시 수정 ajax 실행
	 	
	  	$("#uButton").click(function (){
			
	/*   		console.log($("#GroupHeaderNo").val());
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
	