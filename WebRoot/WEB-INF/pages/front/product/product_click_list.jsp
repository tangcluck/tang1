<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>

<table width="195" height="23" border="0" cellpadding="0" cellspacing="0">
	<c:forEach items="${productinfoCustomList}" var="p" varStatus="status">
	<tr>
		<td width="187" valign="middle">
			<img src="${baseurl}/css/images/h_32.gif" width="23" height="17" />
			<a href="${baseurl}customer/selectproduct.action?id=${p.id}" style="text-decoration: none;">
				${p.name} 人气：<span class="red">${p.clickcount}</span>
			</a>
		</td>
	</tr>
	</c:forEach>
</table>