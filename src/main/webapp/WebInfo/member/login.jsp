<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="로그인"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="max-w-md mx-auto p-6">
	<div class="card bg-base-100 shadow-lg">
		<div class="card-body space-y-4">
			<h2 class="text-2xl font-bold text-center">로그인</h2>
			<form action="../member/doLogin" method="POST" class="space-y-4">

				<div class="form-control">
					<label class="label"> <span class="label-text">아이디</span>
					</label> <input class="input input-bordered" name="loginId" type="text" placeholder="아이디 입력" autocomplete="off"/>
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">비밀번호</span>
					</label> <input class="input input-bordered" name="loginPw" type="password" placeholder="비밀번호 입력" autocomplete="off"/>
				</div>

				<div class="form-control">
					<div class="flex gap-4">
						<button type="submit" class="btn btn-primary flex-1">로그인</button>
						<button type="button" onclick="history.back();" class="btn btn-secondary flex-1">뒤로가기</button>
					</div>
				</div>

			</form>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>