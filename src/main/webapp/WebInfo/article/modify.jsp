<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시글 작성"></c:set>
<%@ include file="../common/head.jspf"%>

<section>
	<div>
		<form action="../article/doModify" method="POST">
			<input type="hidden" name="id" value="${article.id }" />
			<table border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<tbody>
					<tr>
						<th class="text-center">번호</th>
						<td class="text-center">${article.id }</td>
					</tr>
					<tr>
						<th class="text-center">작성날짜</th>
						<td class="text-center">${article.regDate }</td>
					</tr>
					<tr>
						<th class="text-center">수정날짜</th>
						<td class="text-center">${article.updateDate }</td>
					</tr>
					<tr>
						<th class="text-center">작성자 닉네임</th>
						<td class="text-center">${article.extra__write }</td>
					</tr>
					<tr>
						<th class="text-center">새 제목</th>
						<td class="text-center"><input class="text-center" name="title" type="text" placeholder="제목" autocomplete="off" /></td>
					</tr>
					<tr>
						<th class="text-center">새 내용</th>
						<td class="text-center"><input class="text-center" name="body" type="text" placeholder="내용" autocomplete="off" /></td>
					</tr>
					<tr>
						<th></th>
						<td class="text-center">
							<button type="submit" class="btn btn-primary">수정</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div>
			<button class="btn btn-secondary" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>