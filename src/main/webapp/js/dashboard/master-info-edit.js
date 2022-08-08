
$(function(){
	
	$('#save-btn').on('click',function(){
		
		let $nowPw = $('#nowPw');
		let $chgPw = $('#chgPw');
		let $chgPw2 = $('#chgPw2');
		
		if($nowPw.val().length === 0 || $nowPw.val() === undefined){
			alert("현재 비밀번호를 입력해 주세요.");
			$nowPw.focus();
			return ; 
		}
		
		if($chgPw.val().length === 0 || $chgPw.val() === undefined){
			alert("변경할 비밀번호를 입력해 주세요.");
			$chgPw.focus();
			return ; 
		} 
		
		if($chgPw2.val().length === 0 || $chgPw2.val() === undefined){
			alert("비밀번호 확인을 입력해 주세요.");
			$chgPw2.focus();
			return ; 
		} 
		
		const queryString = $('#frm').serialize();
		console.log(queryString);

		
		$.ajax({
			url : "/master",
			method : "PUT",
			dataType : "text",
			data : queryString,
			success : function(data) {
				alert("회원정보 변경 성공")
				location.href="memberList.do";
			},error : function(data){
				alert(data  + ' 비밀번호를 확인해 주세요')
				
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
