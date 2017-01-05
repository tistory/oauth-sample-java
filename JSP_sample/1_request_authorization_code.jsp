<%@ page contentType="text/html;charset=utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
    <title>Tistory OAuth 2.0 JSP Sample - Example Authorization Code </TITLE>
    <style>
    .form { text-align:center; padding: 100px }
    .btn { padding:20px; font-size:24px }
    </style>
</head>
<body>

	<form class="form" method="GET" action="https://www.tistory.com/oauth/authorize/">
		<input type="hidden" name="client_id" value="{발급받은 client_id를 입력하세요}"/>
		<input type="hidden" name="redirect_uri" value="{등록시 입력한 redirect uri 를 입력하세요}"/>
		<input type="hidden" name="response_type" value="code"/> <!-- 이단계에서는 "code" 라고 반드시 입력 -->
	    <button class="btn" type="submit">Request Athorization Code</button>
	</form>

</body>
</html>
