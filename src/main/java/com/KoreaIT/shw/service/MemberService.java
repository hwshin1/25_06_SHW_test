package com.KoreaIT.shw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.shw.repository.MemberRepository;
import com.KoreaIT.shw.vo.Member;

@Service
public class MemberService {
	@Autowired
	private MemberRepository memberRepository;

	public Member doJoin(String loginId, String loginPw, String name, String nickName, String email) {
		memberRepository.doJoin(loginId, loginPw, name, nickName, email);
		
		int id = memberRepository.getLastInsertId();
		
		Member member = new Member(id, loginId, loginPw, name, nickName, email);
		
		return member;
	}

	public Member getMemberByLoginId(String loginId) {
		Member member = memberRepository.getMemberByLoginId(loginId);
		return member;
	}
}
