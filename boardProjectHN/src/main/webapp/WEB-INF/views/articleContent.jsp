<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script>
// 	$(document).ready(function() {
// 		var btn = $('.updateCommentBtn');
		
// 		for(var i=0; i < btn.length; i++){
// 			$(btn[i]).click(function(){
// 				console.log(i+"Ŭ��");
// 			});
// 		}
		
		
		
// 	});
</script>
</head>
<body>
<h1>ArticleContent</h1>
	<div>
		<div>
			<div>
				������ : ${articleContent.articleTitle} 
				
				�ۼ��� : ${articleContent.articleWriter}
			</div>
			<div align="center">
				�ۼ��� : ${articleContent.articleDate}
			</div>
			<div>
			<textarea rows="30" cols="132" style="resize:none" readonly="readonly">${articleContent.articleContent}</textarea>
				
			</div>
			<div>
				<a href="/updateArticle?articleNo=${articleContent.articleNo}">����</a><a href="/deleteArticle?articleNo=${articleContent.articleNo}">����</a><a href="/articleList">���</a>
			</div>
		</div>

		<div>
			<form action="/insertComment" method="POST">
				<div>
					<input type="hidden" name="articleNo" value="${articleContent.articleNo}">
				</div>
				<div>
					��� : <input type="text" name=commentContent>
				</div>
				<div>
					�ۼ��� : <input type="text" name="commentWriter">
				</div>
				<div>
					��й�ȣ : <input type="password" name="commentPw">
				</div>
				<input type="submit" value="�Է�">				
			</form>
		</div>
		<c:forEach var="c" items="${commentList}">
			<div>
				�ۼ��� : ${c.commentDate}
			</div>
			<div>
				<div>

					<div>
						�ۼ��� : ${c.commentWriter} 
					</div>
					
					<form action="/updateComment" method="POST">
						<div>
							���� : <input type="text" name="commentContent" value="${c.commentContent}">
						</div>
						<div>
							<input type="hidden" name="articleNo" value="${c.articleNo}">
							<input type="hidden" name="commentNo" value="${c.commentNo}">
							<input type="password" name="commentPw">
							<input type="submit" value="����">
						</div>
					</form>
					
				</div>
			
				<div>
					<form action="/deleteComment" method="post">
						<input type="hidden" name="articleNo" value="${c.articleNo}">
						<input type="hidden" name="commentNo" value="${c.commentNo}">
						<input type="password" name="commentPw">
						<input type="submit" value="����">
					</form>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>