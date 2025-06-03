package com.KoreaIT.shw.repository;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.shw.vo.Board;

@Mapper
public interface BoardRepository {
	public Board getBoardById(int boardId);
}
