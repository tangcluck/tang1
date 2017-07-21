<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<div id="top">
	<div id="toptiao">
		<img src="${baseurl}/css/images/flower.gif" width="12" height="12" /> 
		您好，管理员：${user.username} ！　
		<a href="${baseurl}customer/first.action">
		<img src="${baseurl}/css/images/ht_02_02.gif" width="55" height="20" align="middle" />
		</a>
	</div>
</div>