<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>ArticleUpdate</h1>
	<form action="/updateArticle" method="POST">
		<div>
			<input type="hidden" name="articleNo" value="${articleUpdate.articleNo}">
			���� : <input type="text" name="articleTitle" id="articleTitle"  value="${articleUpdate.articleTitle}" style="width:400px">
			�۾��� : <input type="text" name="articleWriter" id="articleWriter" readonly="readonly" value="${articleUpdate.articleWriter}">
		</div>
		<div>
		<!-- ���� -->
			<textarea style="resize:none" name="articleContent" id="articleContent" rows="30" cols="120">${articleUpdate.articleContent}</textarea>
		</div>
		<div>
			��й�ȣ : <input type="password" name="articlePw" id="articlePw"/>
		</div>
		<input type="submit" value="���"> 
	</form>
</body>
</html>