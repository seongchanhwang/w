
$(function(){
	
	$('#save-btn').on('click',function(){
		alert('tq');
		
		const serializeValue = $("#frm").serializeObject();
		console.log(JSON.stringify(serializeValue));
		
		$.ajax({
			url : "/master",
			method : "PUT",
			dataType : "text",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(serializeValue),
			success : function(data) {
				alert('성공');
			},error : function(data){
				console.log('error');
			}
		});
	});
	
	$("#email1").change(function(){
		if($("#email21 option:selected").val() == "self"){
			console.log('self');
			$("#email31").removeClass("disable");
			$("#email31").removeAttr("readonly");
		} else {
			$("#email31").addClass("disable");
			$("#email31").val("");
			$("#email31").prop("readonly","readonly");
		}
	});
	
	
	
	
});
