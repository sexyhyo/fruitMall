package com.cafe24.ksmart02.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cafe24.ksmart02.model.Article;
import com.cafe24.ksmart02.repository.ArticleDaoImpl;
import com.cafe24.ksmart02.repository.CommentDaoImpl;

@Service
public class ArticleServiceImpl {

	@Autowired
	private ArticleDaoImpl articleDao;
	
	@Autowired
	private CommentDaoImpl commentDao;
	

	@Transactional
	public int deleteArticleService(Map<String,Object> map) {
		
		
		commentDao.deleteComment(map);
		int result = articleDao.deleteArticle(map);
		
		
		return result;
	}
	
	
	public Article artilcleContentService(int articleNo){
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("articleNo", articleNo);
		
		return articleDao.selectArticleContent(articleNo);
	}
	
	
	public List<Article> selectArticleService() {
		return articleDao.selectArticle();
	}


	public List<Article> selectArticleSearchService(String search, String searchOption) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("searchOption", searchOption);
		return articleDao.selectArticleSearch(map);
	}
	public void insertArticleService(Article article) {
		articleDao.insertArticle(article);
		
	}
	
	public int updateArticleService(Article article){
		return articleDao.updateArticle(article);
	}
	
}
