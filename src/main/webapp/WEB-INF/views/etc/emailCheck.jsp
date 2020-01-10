<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var authNum = '${authNum}';
			console.log(authNum);
			
			$('#authNumCheck').click(function() {
				console.log($('#userAuthNum').val());
				
				//입력값이 없다 
				if($('#userAuthNum').val() == null){
					alser("인증번호가 입력되지 않았습니다.");
					$('#authNumCheck').focus();
					
				//인증번호가 안맞는다					
				}else if($('#userAuthNum').val() != authNum){
					alert("인증번호가 맞지 않습니다.");
					window.self.close();
					
				//인증번호 일치
				}else if($('#userAuthNum').val() == authNum){
					alert("인증되었습니다.");
					$('#emailCheckReturn', parent.opener.document).val("true");
					$('#password', parent.opener.document).removeAttr('disabled');
					$('#password2', parent.opener.document).removeAttr('disabled');
					$('#chaagePassword', parent.opener.document).removeAttr('disabled');
					$('#email', parent.opener.document).attr("readonly", "readonly");
					$('#emailcheck', parent.opener.document).text("이메일 인증이 완료되었습니다.");
					window.self.close();
					//opener.document.joinForm.emailCheckReturn.value = 1;
				}
			});
		});
	</script>

	<form method="post" action="" name="emailcheck">
		<div class="form-group" style="text-align:center">
			<label class="control-label" for="email">인증번호를 입력하세요.</label>
			<input type="text" class="form-control " id="userAuthNum" name="userAuthNum" style="width:80%;text-align:center;display:inline;"/>
			<div style="padding-top: 15px">
				<button type="button" class="btn btn-primary" id="authNumCheck">확인</button>
			</div>
		</div>
	</form>
	
	
