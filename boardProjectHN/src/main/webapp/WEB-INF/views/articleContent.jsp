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
// 				console.log(i+"클릭");
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
				글제목 : ${articleContent.articleTitle} 
				
				작성자 : ${articleContent.articleWriter}
			</div>
			<div align="center">
				작성일 : ${articleContent.articleDate}
			</div>
			<div>
			<textarea rows="30" cols="132" style="resize:none" readonly="readonly">${articleContent.articleContent}</textarea>
				
			</div>
			<div>
				<a href="/updateArticle?articleNo=${articleContent.articleNo}">수정</a><a href="/deleteArticle?articleNo=${articleContent.articleNo}">삭제</a><a href="/articleList">목록</a>
			</div>
		</div>

		<div>
			<form action="/insertComment" method="POST">
				<div>
					<input type="hidden" name="articleNo" value="${articleContent.articleNo}">
				</div>
				<div>
					댓글 : <input type="text" name=commentContent>
				</div>
				<div>
					작성자 : <input type="text" name="commentWriter">
				</div>
				<div>
					비밀번호 : <input type="password" name="commentPw">
				</div>
				<input type="submit" value="입력">				
			</form>
		</div>
		<c:forEach var="c" items="${commentList}">
			<div>
				작성일 : ${c.commentDate}
			</div>
			<div>
				<div>

					<div>
						작성자 : ${c.commentWriter} 
					</div>
					
					<form action="/updateComment" method="POST">
						<div>
							내용 : <input type="text" name="commentContent" value="${c.commentContent}">
						</div>
						<div>
							<input type="hidden" name="articleNo" value="${c.articleNo}">
							<input type="hidden" name="commentNo" value="${c.commentNo}">
							<input type="password" name="commentPw">
							<input type="submit" value="수정">
						</div>
					</form>
					
				</div>
			
				<div>
					<form action="/deleteComment" method="post">
						<input type="hidden" name="articleNo" value="${c.articleNo}">
						<input type="hidden" name="commentNo" value="${c.commentNo}">
						<input type="password" name="commentPw">
						<input type="submit" value="삭제">
					</form>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>