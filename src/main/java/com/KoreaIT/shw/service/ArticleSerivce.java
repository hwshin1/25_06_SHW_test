package com.KoreaIT.shw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.shw.repository.ArticleRepository;
import com.KoreaIT.shw.util.Ut;
import com.KoreaIT.shw.vo.Article;
import com.KoreaIT.shw.vo.ResultData;

@Service
public class ArticleSerivce {
	@Autowired
	private ArticleRepository articleRepository;

	public Article doWrite(int memberId, String boardId, String title, String body) {
		articleRepository.doWrite(memberId, boardId, title, body);

		int id = articleRepository.getLastInsertId();
		
		int boardId2 = Integer.valueOf(boardId);
		
		Article article = new Article(id, memberId, boardId2, title, body);
		
		return article;
	}

	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public void doModify(int id, String title, String body) {
		articleRepository.doModify(id, title, body);
	}

	public void doDelete(int id, Article article) {
		articleRepository.doDelete(id, article);
	}

	public Article getForPrintArticle(int loginedMemberId, int id) {
		Article article = articleRepository.getForPrintArticle(loginedMemberId, id);
		
		return article;
	}

	public List<Article> getArticlesBoardId(int boardId) {
		return articleRepository.getArticlesBoardId(boardId);
	}

	public ResultData userCanModify(int loginedMemberId, Article article) {
		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 게시글에 대한 권한이 없습니다.", article.getId()));
		}
		
		return ResultData.from("S-1", Ut.f("%d번 게시글이 수정되었습니다.", article.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, Article article) {
		if (article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-A", Ut.f("%d번 게시글에 대한 권한이 없습니다.", article.getId()));
		}
		
		return ResultData.from("S-1", Ut.f("%d번 게시글이 삭제되었습니다.", article.getId()));
	}
}
