<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시글 작성"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="max-w-2xl mx-auto p-4">
	<div class="card shadow-lg bg-base-100">
		<div class="card-body space-y-4">
			<form action="../article/doWrite" method="POST" class="space-y-4">
				<div class="form-control">
					<label class="label"> <span class="label-text">게시판</span>
					</label> <select name="boardId" class="select select-bordered" required>
						<option disabled selected>게시판을 선택해주세요</option>
						<option value="1">공지사항</option>
						<option value="2">자유게시판</option>
						<option value="3">질문게시판</option>
					</select>
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">제목</span>
					</label> <input name="title" type="text" placeholder="제목" required autocomplete="off" class="input input-bordered" />
				</div>

				<div class="form-control">
					<label class="label"> <span class="label-text">내용</span>
					</label>
					<textarea name="body" placeholder="내용" required autocomplete="off" class="textarea textarea-bordered" rows="5"></textarea>
				</div>

				<div class="form-control mt-4">
					<div class="flex justify-between">
						<button type="submit" class="btn btn-primary">작성</button>
						<button type="button" onclick="history.back();" class="btn btn-secondary">뒤로가기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>