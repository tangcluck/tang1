<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>

<div style="width: 195px;">
	<c:forEach items="${productinfoCustomList }" var="p" varStatus="status">
	<div style="float: left; width:45%; text-align: center;">
		<a href="${baseurl}customer/selectproduct.action?id=${p.id}">
			<img width="90" height="90" border="1" src="${baseurl }upload/${p.path}">
			<p style="width: 80px;">${p.name }</p>
		</a>
	</div>
	</c:forEach>
</div>
