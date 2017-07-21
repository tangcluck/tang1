<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<c:forEach items="${commentList}" var="c" varStatus="status">
<table width="195" height="23" border="0" cellpadding="0" cellspacing="0">
	<tr>
			<b style="color: #000000">${c.createname}&nbsp;在 ${c.createtime} 发表评论:</b>
	</tr>
	<tr>
			<textarea style="width: 500px">${c.text}</textarea>
	</tr>
	
</table>
</c:forEach>