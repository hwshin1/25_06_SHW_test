<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게시글 상세"></c:set>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../article/detail">
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
						<th class="text-center">게시판</th>
						<td class="text-center">${article.boardName }</td>
					</tr>
					<tr>
						<th class="text-center">제목</th>
						<td class="text-center">${article.title }</td>
					</tr>
					<tr>
						<th class="text-center">내용</th>
						<td class="text-center">${article.body }</td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<button type="button" onclick="history.back();">뒤로가기</button>
				<a href="../article/modify?id=${article.id }">수정</a>
				<a href="../article/doDelete?id=${article.id }">삭제</a>
			</div>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>