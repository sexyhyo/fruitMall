package com.cafe24.ksmart02.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cafe24.ksmart02.model.Comment;
import com.cafe24.ksmart02.repository.CommentDao;
import com.cafe24.ksmart02.repository.CommentDaoImpl;


@Service
public class CommentServiceImpl {

	@Autowired
	private CommentDaoImpl commentDao;
	
	public List<Comment> selectCommentListService(int articleNo){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleNo", articleNo);
		
		return commentDao.selectCommentList(map);
	}
	
	
	
	public void insertCommentService(Comment comment){
		commentDao.insertComment(comment);
	}
	/**
	 * 비밀번호 체크 후 업데이트
	 * @param commentNo
	 * @return
	 */
	public void updateCommentService(Comment comment){
		Comment deletecomment = commentDao.selectCommentPw(comment.getCommentNo());
		
		
		
		if(comment.getCommentPw().equals(deletecomment.getCommentPw())){
			comment.setCommentContent(comment.getCommentContent());
			commentDao.updateComment(comment);
			
		}

	
	}
	
	public void deleteCommentService(Comment comment){
		Comment deletecomment = commentDao.selectCommentPw(comment.getCommentNo());
		
		if(comment.getCommentPw().equals(deletecomment.getCommentPw())){
			commentDao.deleteComment(deletecomment.getCommentNo());
			
		}
		
	
	}
}
