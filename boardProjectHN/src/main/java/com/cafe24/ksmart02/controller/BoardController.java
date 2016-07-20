

package com.cafe24.ksmart02.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cafe24.ksmart02.model.Article;
import com.cafe24.ksmart02.model.Comment;
import com.cafe24.ksmart02.service.ArticleService;
import com.cafe24.ksmart02.service.ArticleServiceImpl;
import com.cafe24.ksmart02.service.CommentService;
import com.cafe24.ksmart02.service.CommentServiceImpl;

@Controller
public class BoardController {

	@Autowired
	private ArticleServiceImpl articleService;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping(value="/updateArticle" ,method=RequestMethod.GET)
	public String updateArticleForm(Model model, Article article){
		System.out.println("updateArticle매핑");
		Article articleUpdate = articleService.artilcleContentService(article.getArticleNo());
		
	//	model.addAttribute("articleUpdate", articleUpdate);

//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("/articleUpdate");
//		mv.addObject("articleNo", articleNo);
//		mv.addObject("articleUpdate", articleUpdate);

		model.addAttribute("articleNo", article.getArticleNo());
		model.addAttribute("articleUpdate", articleUpdate);
	
		//System.out.println(articleNo+ "->articleNo");
		
		return "/articleUpdate";
	}
	
	@RequestMapping(value="/updateArticle" ,method=RequestMethod.POST)
	public String updateArticle(Model model,
			Article article){
		
		articleService.updateArticleService(article);
		model.addAttribute("articleNo", article.getArticleNo());

		return "redirect:/articleContent";
	}
	
	@RequestMapping(value="/deleteArticle", method = RequestMethod.GET)
	public String deleteArticleForm(Model model, Article article){
		model.addAttribute("articleNo", article.getArticleNo());
		
		return "/articleDelete";
	}
	//article삭제 처리
	@RequestMapping(value="/deleteArticle", method = RequestMethod.POST)
	public String deleteArticle(Model model, Article article){
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("articleNo", article.getArticleNo());
		map.put("articlePw", article.getArticlePw());
		int result = articleService.deleteArticleService(map);
		
		//실패시 해당 아디클삭제폼으로가기위해서 articleNo를 가져가주자
		model.addAttribute("articleNo", article.getArticleNo());
		
		if(result == 0){
			System.out.println("삭제실패");
			return "redirect:/articleDelete";
		}
			
			
			System.out.println("삭제성공");
		
		return "redirect:/articleList";
	}
	
	
	@RequestMapping(value="/articleAdd", method= RequestMethod.GET)
	public String articleAdd(){
		return "/articleAdd";
	}
	
	@RequestMapping(value="/articleAdd", method= RequestMethod.POST)
	public String articleAdd(Model modle,Article article){
		articleService.insertArticleService(article);
		
		return "redirect:/articleList";
	}
	@RequestMapping(value="/articleList", method= RequestMethod.GET)
	public String articleList(Model model){
		
		List<Article> articleList = articleService.selectArticleService();
		model.addAttribute("articleList", articleList);
		
		return "articleList";
	}
	
	//글을 검색한다
	@RequestMapping(value="/articleSearch", method= RequestMethod.POST)
	public String articleSearch(@RequestParam("search") String search,
								@RequestParam("searchOption") String searchOption,
								Model model){
		
		
		
		List<Article> searchList = articleService.selectArticleSearchService(search, searchOption);
		model.addAttribute("searchList", searchList);
		
		return "articleList";
	}
	
	
	/**
	 * get요청으로 들어오면 articleNo과 page(미구현)을받아서 articleContnt를 보여준다.
	 * 
	 * 1.articleNo으로 articleContent.jsp에 보여줄 article정보를 받아서 model에 담는다
	 * 2.articleNo으로 comment정보를 받아서 model에 담는다
	 * 3.articleContent화면으로 가기위해 리턴한다.
	 * @param model
	 * @param articleNo
	 * @return
	 */
	@RequestMapping(value="/articleContent" ,method=RequestMethod.GET)
	public String selectArticleDetail(Model model,
			@RequestParam(value="articleNo") int articleNo){
		
		Article articleContent 		= articleService.artilcleContentService(articleNo);
		List<Comment> commentList 	= commentService.selectCommentListService(articleNo);
		
		model.addAttribute("articleContent", articleContent);
		model.addAttribute("commentList", commentList);
		
		
		return "articleContent";
		
	}
	

	@RequestMapping(value="/insertComment" ,method=RequestMethod.POST)
	public String insertComment(Model model,Comment comment){
		
		commentService.insertCommentService(comment);
		
		return "redirect:/articleContent?articleNo="+comment.getArticleNo();
	}
	
	@RequestMapping(value="/updateComment" ,method=RequestMethod.POST)
	public String updateComment(Model model,Comment comment){
		commentService.updateCommentService(comment);
		
		return "redirect:/articleContent?articleNo="+comment.getArticleNo();
	}
	
	@RequestMapping(value="/deleteComment" ,method=RequestMethod.POST)
	public String deleteComment(Model model,Comment comment){
		
		commentService.deleteCommentService(comment);
		
		return "redirect:/articleContent?articleNo="+comment.getArticleNo();
	}
	
	
	
	
	
	
	
}
