package com.KoreaIT.shw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.shw.repository.BoardRepository;
import com.KoreaIT.shw.vo.Board;

@Service
public class BoardService {
	@Autowired
	private BoardRepository boardRepository;

	public Board getBoardById(int boardId) {
		return boardRepository.getBoardById(boardId);
	}	
}
