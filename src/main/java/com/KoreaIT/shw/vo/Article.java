package com.KoreaIT.shw.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Article {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private int boardId;
	private String title;
	private String body;
	
	private String extra__write;
	private String boardName;
	private boolean userCanModify;
	private boolean userCanDelete;

	public Article(int id, int memberId, int boardId, String title, String body) {
		this.id = id;
		this.memberId = memberId;
		this.boardId = boardId;
		this.title = title;
		this.body = body;
	}
}
