<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div id="right">
	<div id="right_top"><img
		src="${baseurl}/css/images/blue.gif" width="16" height="16" /> <span
		class="word01">公告详情</span></div>
	<form>
		<h1 style="font-family: inherit;">${publicinfo.title }</h1>
		<a></a>	
		<h2 style="font-style: oblique;" align="center">发布时间:&nbsp;${publicinfo.time }</h2>
		<div style="font-family: monospace;color: #000000;font-size: 18px">${publicinfo.text}</div>
	</form>
</body>
</html>