<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�� ���</title>
</head>
<body>
<h1>�۸��</h1>
<!-- ��ü�۸�� -->
<div>
	<c:forEach var="list" items="${articleList}">
		<div> 
			�۹�ȣ: ${list.articleNo }, ������: <a href="/articleContent?articleNo=${list.articleNo }">${list.articleTitle }</a>,
			�۾���: ${list.articleWriter }, ��¥: ${list.articleDate}
		</div>
	</c:forEach>
</div>
<!-- �˻���� �۸�� -->
<div>
	<c:forEach var="searchList" items="${searchList}">
		<div> 
			�۹�ȣ: ${searchList.articleNo }, ������: <a href="/articleContent?articleNo=${searchList.articleNo }">${searchList.articleTitle }</a>,
			�۾���: ${searchList.articleWriter }, ��¥: ${searchList.articleDate}
		</div>
	</c:forEach>
</div>
<div>
	<form action="/articleSearch" method="post">
		<select name="searchOption">
			<option value="title">����</option>
			<option value="writer">�۾���</option>
		</select>
		<input type="text" name="search"/> <button>�˻�</button>
	</form>
</div>
</body>
</html>