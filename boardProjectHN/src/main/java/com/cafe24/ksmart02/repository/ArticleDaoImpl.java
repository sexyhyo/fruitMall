package com.cafe24.ksmart02.repository;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cafe24.ksmart02.model.Article;

@Repository
public class ArticleDaoImpl{

	
	private final String NS = "com.cafe24.ksmart02.repository.articleMapper";
	
	@Autowired
	private SqlSessionTemplate sqlSessionArt;//datasource,query접근
	
	public Article selectArticleContent(int articleNo){
		System.out.println("selectArticleContent실행");
		
		return sqlSessionArt.selectOne(NS+".selectArticleContent", articleNo);
	}

	public List<Article> selectArticle() {
		return sqlSessionArt.selectList(NS+".selectArticleList");
	}

	//검색 결과 글 목록을 보여줍니다

	public List<Article> selectArticleSearch(Map<String, Object> map) {
		return sqlSessionArt.selectList(NS+".searchArticle", map);
		
	}
	public void insertArticle(Article article) {
		sqlSessionArt.insert(NS+".insertArticle", article);	
	}
	
	public int deleteArticle(Map<String,Object> map) {
		
		return sqlSessionArt.delete(NS+".deleteArticle", map);
	}
	
	public int updateArticle(Article article){
		return sqlSessionArt.update(NS+".updateArticle", article);
	}

	
}
