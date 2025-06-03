package com.KoreaIT.shw;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.KoreaIT.shw.interceptor.BeforeArticleInterceptor;
import com.KoreaIT.shw.interceptor.NeedLoginInterceptor;
import com.KoreaIT.shw.interceptor.NeedLogoutInterceptor;

@Configuration
public class MyMvcConfigurer implements WebMvcConfigurer {
	@Autowired
	BeforeArticleInterceptor beforeArticleInterceptor;
	
	@Autowired
	NeedLoginInterceptor needLoginInterceptor;
	
	@Autowired
	NeedLogoutInterceptor needLogoutInterceptor;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 모든 요청이 들어오기 전에 before 인터셉터를 활용하겠다.
		registry.addInterceptor(beforeArticleInterceptor).addPathPatterns("/**");
		
		registry.addInterceptor(needLoginInterceptor).addPathPatterns("/article/write").addPathPatterns("/article/doWrite")
		.addPathPatterns("/article/modify").addPathPatterns("/article/doModify").addPathPatterns("/article/doDelete")
		.addPathPatterns("/member/doLogout");
		
		registry.addInterceptor(needLogoutInterceptor).addPathPatterns("/member/login").addPathPatterns("/member/doLogin")
		.addPathPatterns("/member/join").addPathPatterns("/member/doJoin");
	}
}
