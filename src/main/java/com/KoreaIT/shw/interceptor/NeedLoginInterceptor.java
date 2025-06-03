package com.KoreaIT.shw.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.KoreaIT.shw.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLoginInterceptor implements HandlerInterceptor{
	@Autowired
	private Rq rq;

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		rq = (Rq) req.getAttribute("rq");
		
		if (!rq.isLogined()) {
			// 콘솔 출력문
			System.err.println("로그인 하고 사용해야 합니다.(NeedLoginInterceptor)");
			// 화면에 나타나는 문구
			rq.printHistoryBack("로그인 하고 사용하세요!");
			
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
