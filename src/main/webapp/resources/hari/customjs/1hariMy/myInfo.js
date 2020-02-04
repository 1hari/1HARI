/*
작성자: 김진호
내용: 사용자 프로필 수정 페이지
*/
	$(function() {
		let pwdReg = /^[A-Za-z0-9]{4,16}$/; // 4~16자리의 영문+숫자 조합의 비밀번호 정규표현식
		let phoneReg = /^01[016789]-\d{3,4}-\d{4}$/; // 핸드폰번호 정규표현식
		let emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		//0부터9a부터zA부터Z까지 (-, _, . 가 있어도 되고 없어도 되고, 0부터9a부터zA부터Z까지)반복횟수 상관없이가능
		//@기호포함  (-, _, . 가 있어도 되고 없어도 되고, 0부터9a부터zA부터Z까지)반복횟수 상관없이가능 .기호포함 2자~3자 이내 대소문자 구분안함

		let pwdValidation = true;

		// 비밀번호 입력 유효성 검사
		$('#password').keyup(function() {
			if (!pwdReg.test($('#password').val())) {
				$('#pwdCheck').text("4~16자리의 영문 + 숫자 조합의 비밀번호를 입력해주세요.");
				pwdValidation = false;
			} else {
				$('#pwdCheck').text("");
				pwdValidation = true;
			}
		})
		
		// 비밀번호 확인 입력 유효성 검사
		$('#passwordCheck').keyup(function() {
			if ($('#password').val() != $('#passwordCheck').val()) {
				$('#pwdReCheck').text("비밀번호가 일치하지 않습니다.");
				pwdValidation = false;
			} else {
				$('#pwdReCheck').text("비밀번호가 확인되었습니다.");
				pwdValidation = true;
			}
		})
        
		/* 핸드폰번호 입력 시 자동 (-) 삽입  */
		$('#phoneNum').keyup(function() {
			var number = this.value.replace(/[^0-9]/g, "");
			var phone = "";

			if (number.length < 4) {
				return number;
			} else if(number.length < 7) {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3);
			} else if(number.length < 11) {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 3);
				phone += "-";
				phone += number.substr(6);
			} else {
				phone += number.substr(0, 3);
				phone += "-";
				phone += number.substr(3, 4);
				phone += "-";
				phone += number.substr(7);
			}
			this.value = phone;
			
			if (phoneReg.test($('#phoneNum').val())) { // 정규표현식 유효성 검사
				$('#phoneNumCheck').text("");
			} else {
				$('#phoneNumCheck').text("핸드폰번호 형식이 잘못되었습니다.");
			}
		})

		//email 유효성체크 
        $('#email').keyup(function() {
            if (emailPattern.test($('#email').val()) != true) { // 정규표현식 유효성 검사
                $('#emailCheck').text("이메일 형식이 잘못되었습니다.");
            } else {
                $('#emailCheck').text("");
            }
        });

		//전송
		$('#submitButton').click(function() {
			if (phoneReg.test($('#phoneNum').val()) != false && emailPattern.test($('#email').val()) != false && pwdValidation != false) {
				$('#example-form').submit();
			} else {
				swal({
					text: "핸드폰번호나 이메일을 다시 확인해주세요.",
					icon: "warning",
					button: "닫기"
				}).then((value) => {
					$('#phoneNum').focus();
				});
			}
		});//이벤트 끝
	})