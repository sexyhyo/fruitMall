<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>article 삭제폼입니다.</h1>
<span>넘어와야할값은 Article(articleNo) 입니다.</span>
<hr>
	<form action="/deleteArticle" method="post">	
		<label>password : </label>
		<input type="password" name="articlePw" />
		<input type="hidden" name="articleNo" value="${articleNo}" />
		<button>삭제완료</button>
	</form>
</body>
</html>