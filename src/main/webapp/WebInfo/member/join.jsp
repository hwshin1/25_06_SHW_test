<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="max-w-xl mx-auto p-6">
	<div class="card shadow-lg bg-base-100">
		<div class="card-body space-y-4">
			<h2 class="text-2xl font-bold">회원가입</h2>
			<form action="../member/doJoin" method="POST" class="space-y-4">

				<div class="form-control">
					<label class="label"> <span class="label-text">아이디</span>
					</label> <input name="loginId" type="text" placeholder="아이디 입력" autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">비밀번호</span>
					</label> <input name="loginPw" type="password" placeholder="비밀번호 입력" autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">이름</span>
					</label> <input name="name" type="text" placeholder="이름 입력" autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">닉네임</span>
					</label> <input name="nickName" type="text" placeholder="닉네임 입력" autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">이메일</span>
					</label> <input name="email" type="text" placeholder="이메일 입력" autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control mt-4">
					<div class="flex justify-between gap-4">
						<button type="submit" class="btn btn-primary flex-1">가입</button>
						<button type="button" onclick="history.back();" class="btn btn-secondary flex-1">뒤로가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>