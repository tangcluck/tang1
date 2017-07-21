<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>

<table width="195" height="23" border="0" cellpadding="0" cellspacing="0">
	<c:forEach items="${publicinfoList}" var="p" varStatus="status">
	<tr>
			
			<a href="${baseurl }customer/noticeItem.action?id=${p.id}" style="text-decoration: none;font-size: 16px;margin-left: 18px">
			公告：${p.title }
			</a>
			<b style="text-decoration: none;font-family: sans-serif;font-size: 15px">
			<fmt:parseDate value="${p.time }" var="date" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			（<fmt:formatDate value="${date }" pattern="dd/MM/yy"/>）
			</b>
	</tr>
	<br>
	<a></a>
	</c:forEach>
</table>