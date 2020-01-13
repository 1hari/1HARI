<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	//형남 0110 인증번호 창
		$(function(){
			var authNum = '${authNum}';
			console.log(authNum);
			
			$('#authNumCheck').click(function() {
				//console.log($('#userAuthNum').val());
				
				//인증번호 입력값 체크 
				if($('#userAuthNum').val() == null){
					alert("인증번호가 입력되지 않았습니다.");
					$('#authNumCheck').focus();
				}else if($('#userAuthNum').val() != authNum){
					alert("인증번호가 맞지 않습니다.");
				//인증번호 일치
				}else if($('#userAuthNum').val() == authNum){
					alert("인증되었습니다.");
					$('#emailCheckReturn', parent.opener.document).val("true");
					$('#newPassword', parent.opener.document).removeAttr('disabled');
					$('#newPassword2', parent.opener.document).removeAttr('disabled');
					$('#chagePassword', parent.opener.document).removeAttr('disabled');
					$('#emailSend', parent.opener.document).attr('disabled', 'disabled');
					$('#email', parent.opener.document).attr("readonly", "readonly");
					$('#emailcheck', parent.opener.document).text("이메일 인증이 완료되었습니다.");
					window.self.close();
				}
			});
		});
	</script>
	<form method="post" action="" name="emailcheck">
		<div class="form-group" style="text-align:center">
			<br>
			<label class="control-label" for="email">인증번호를 입력하세요.</label>
			<br>
			<input type="text" class="form-control " id="userAuthNum" name="userAuthNum" style="width:80%;text-align:center;display:inline;"/>
			<br>
				<div style="padding-top: 15px">
				<button type="button" class="btn btn-primary" id="authNumCheck">확인</button>
			</div>
		</div>
	</form>
	
	
