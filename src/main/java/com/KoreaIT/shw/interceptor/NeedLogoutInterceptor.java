package com.KoreaIT.shw.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.KoreaIT.shw.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class NeedLogoutInterceptor implements HandlerInterceptor{
	@Autowired
	private Rq rq;
	
	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
		rq = (Rq) req.getAttribute("rq");
		
		if (rq.isLogined()) {
			System.err.println("로그아웃 하고 사용해야 합니다.(NeedLogoutInterceptor)");
			
			rq.printHistoryBack("로그아웃 하고 사용하세요!");
			
			return false;
		}
		
		return HandlerInterceptor.super.preHandle(req, resp, handler);
	}
}
