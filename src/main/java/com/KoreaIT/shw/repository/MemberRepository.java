package com.KoreaIT.shw.repository;

import org.apache.ibatis.annotations.Mapper;

import com.KoreaIT.shw.vo.Member;

@Mapper
public interface MemberRepository {
	public int doJoin(String loginId, String loginPw, String name, String nickName, String email);

	public int getLastInsertId();

	public Member getMemberByLoginId(String loginId);
}
