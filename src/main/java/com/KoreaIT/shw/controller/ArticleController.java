package com.KoreaIT.shw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.shw.service.ArticleSerivce;
import com.KoreaIT.shw.service.BoardService;
import com.KoreaIT.shw.util.Ut;
import com.KoreaIT.shw.vo.Article;
import com.KoreaIT.shw.vo.Board;
import com.KoreaIT.shw.vo.ResultData;
import com.KoreaIT.shw.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class ArticleController {
	@Autowired
	private Rq rq;
	
	@Autowired
	private ArticleSerivce articleService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("/article/write")
	public String showWrite() {
		return "/article/write";
	}
	
	@RequestMapping("/article/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, String boardId, String title, String body) {
		rq = (Rq) req.getAttribute("rq");
		
		if (rq.isLogined() == false) {
			return Ut.jsHistoryBack("F-A", Ut.f("로그인 하고 사용하세요."));
		}
		
		if (Ut.isEmptyOrNull(title)) {
			return Ut.jsHistoryBack("F-1", Ut.f("제목을 입력하세요."));
		}
		
		if (Ut.isEmptyOrNull(body)) {
			return Ut.jsHistoryBack("F-2", Ut.f("내용을 입력하세요."));
		}
		
		if (Ut.isEmptyOrNull(boardId)) {
			return Ut.jsHistoryBack("F-3", Ut.f("게시판을 선택하세요"));
		}
		
		Article article = articleService.doWrite(rq.getLoginedMemberId(), boardId, title, body);
		
		return Ut.jsReplace("S-1", Ut.f("%d번 게시글이 작성되었습니다.", article.getId()), "../article/list");
	}
	
	@RequestMapping("/article/list")
	public String showList(HttpServletRequest req, Model model, @RequestParam(required = false) Integer boardId) {
		List<Article> articles;
		
		if (boardId != null) {
			Board board = boardService.getBoardById(boardId);
			articles = articleService.getArticlesBoardId(boardId);
			model.addAttribute("board", board);
		} else {
			articles = getArticles();
		}
		
		model.addAttribute("articles", articles);
		return "/article/list";
	}
	
	@RequestMapping("/article/getArticles")
	@ResponseBody
	public List<Article> getArticles() {
		return articleService.getArticles();
	}
	
	@RequestMapping("/article/detail")
	public String showDetail(HttpServletRequest req, Model model, int id) {
		rq = (Rq) req.getAttribute("rq");
		
		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		
		model.addAttribute("article", article);
		
		return "/article/detail";
	}
	
	@RequestMapping("/article/modify")
	public String showModify(HttpServletRequest req, Model model, int id) {
		rq = (Rq) req.getAttribute("rq");
		
		Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
		
		if (article == null) {
			return Ut.jsHistoryBack("F-A", Ut.f("%d번 게시글은 없습니다.", id));
		}
		
		model.addAttribute("article", article);
		
		return "/article/modify";
	}
	
	@RequestMapping("/article/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, int id, String title, String body) {
		rq = (Rq) req.getAttribute("rq");
		
		if (rq.isLogined() == false) {
			return Ut.jsHistoryBack("F-A", Ut.f("로그인이 필요한 서비스 입니다."));
		}
		
		Article article = articleService.getArticle(id);
		
		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다.", id));
		}
		
		ResultData userCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);
		
		if (userCanModifyRd.isFail()) {
			return Ut.jsHistoryBack(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg());
		}

		if (userCanModifyRd.isSuccess()) {
			articleService.doModify(id, title, body);
		}
		
		return Ut.jsReplace(userCanModifyRd.getResultCode(), userCanModifyRd.getMsg(), "/article/detail?id=" + id);
	}
	
	@RequestMapping("/article/doDelete")
	@ResponseBody
	public String doDelete(HttpServletRequest req, int id) {
		rq = (Rq) req.getAttribute("rq");
		
		if (rq.isLogined() == false) {
			return Ut.jsHistoryBack("F-A", Ut.f("로그인이 필요한 서비스 입니다."));
		}
		
		Article article = articleService.getArticle(id);
		
		if (article == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 게시글은 없습니다.", id));
		}
		
		ResultData userCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);
		
		if (userCanDeleteRd.isFail()) {
			return Ut.jsHistoryBack(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg());
		}

		if (userCanDeleteRd.isSuccess()) {
			articleService.doDelete(id, article);
		}
		
		return Ut.jsReplace(userCanDeleteRd.getResultCode(), userCanDeleteRd.getMsg(), "../article/list");
	}
	
	@RequestMapping("/article/QnA")
	public String show(Model model) {
		int boardId = 3;
		Board board = boardService.getBoardById(boardId);
		
		List<Article> articles = articleService.getArticlesBoardId(boardId);
		
		model.addAttribute("board", board);
		model.addAttribute("articles", articles);
		
		return "/article/QnA";
	}
}
