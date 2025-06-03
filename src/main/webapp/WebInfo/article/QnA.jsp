<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="질문 게시판"></c:set>
<%@ include file="../common/head.jspf"%>

<div class="max-w-4xl mx-auto px-4 py-8">
  <h1 class="text-3xl font-bold mb-6 text-center">질문</h1>

  <div class="space-y-4">
    <c:forEach var="article" items="${articles}">
      <div class="border border-gray-300 rounded p-4 bg-white mt-4">
        <button class="text-lg">
          ${article.title}
        </button>
        <div class="mt-2 text-gray-700">
          ${article.body}
        </div>
      </div>
    </c:forEach>
  </div>
</div>

<%@ include file="../common/foot.jspf"%>