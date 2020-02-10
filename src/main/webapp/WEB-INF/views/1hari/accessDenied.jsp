<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
/*
 *  권한 없는 페이지 요청 시 경고창 띄운 후 메인으로 이동
 */
	swal({
		text: "권한이 없는 페이지입니다.",
		icon: "warning",
		button: "메인으로 돌아가기"
	}).then((value) => {
		location.href="${pageContext.request.contextPath}/main.hari";
	});
</script>

