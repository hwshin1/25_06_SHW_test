package com.KoreaIT.shw.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.KoreaIT.shw.vo.Article;

@Mapper
public interface ArticleRepository {
	public int getLastInsertId();
	
	public List<Article> getArticles();

	public Article getArticle(int id);

	public void doModify(int id, String title, String body);

	public void doDelete(int id, Article article);

	public Article getForPrintArticle(int loginedMemberId, int id);

	public int doWrite(int memberId, String boardId, String title, String body);

	public List<Article> getArticlesBoardId(int boardId);
}
