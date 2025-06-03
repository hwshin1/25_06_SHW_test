<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:choose>
    <c:when test="${not empty board}">
        <c:set var="pageTitle" value="${board.code}" />
    </c:when>
    <c:otherwise>
        <c:set var="pageTitle" value="게시글 전체" />
    </c:otherwise>
</c:choose>
<%@ include file="../common/head.jspf"%>

<section class="mt-8 text-xl px-4">
	<div class="mx-auto">
		<form action="../article/list">
			<table border="1" cellspacing="0" cellpadding="5" style="width: 100%; border-collapse: collapse;">
				<thead>
					<tr>
						<th style="text-align: center;">번호</th>
						<th style="text-align: center;">작성 날짜</th>
						<th style="text-align: center;">제목</th>
						<th style="text-align: center;">작성자</th>
						<th style="text-align: center;">게시판</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="article" items="${articles }">
						<tr>
							<td style="text-align: center;">${article.id }</td>
							<td style="text-align: center;">${article.regDate.substring(0,10) }</td>
							<td style="text-align: center;"><a class="hover:underline" href="detail?id=${article.id }">${article.title }</a></td>
							<td style="text-align: center;">${article.extra__write }</td>
							<td style="text-align: center;">${article.boardName }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>