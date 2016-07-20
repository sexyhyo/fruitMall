<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>글 목록</title>
</head>
<body>
<h1>글목록</h1>
<!-- 전체글목록 -->
<div>
	<c:forEach var="list" items="${articleList}">
		<div> 
			글번호: ${list.articleNo }, 글제목: <a href="/articleContent?articleNo=${list.articleNo }">${list.articleTitle }</a>,
			글쓴이: ${list.articleWriter }, 날짜: ${list.articleDate}
		</div>
	</c:forEach>
</div>
<!-- 검색결과 글목록 -->
<div>
	<c:forEach var="searchList" items="${searchList}">
		<div> 
			글번호: ${searchList.articleNo }, 글제목: <a href="/articleContent?articleNo=${searchList.articleNo }">${searchList.articleTitle }</a>,
			글쓴이: ${searchList.articleWriter }, 날짜: ${searchList.articleDate}
		</div>
	</c:forEach>
</div>
<div>
	<form action="/articleSearch" method="post">
		<select name="searchOption">
			<option value="title">제목</option>
			<option value="writer">글쓴이</option>
		</select>
		<input type="text" name="search"/> <button>검색</button>
	</form>
</div>
</body>
</html>