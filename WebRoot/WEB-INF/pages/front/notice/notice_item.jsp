<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/front/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品信息列表</title>
<style type="text/css">
li {
	list-style: none;
	border-bottom: dashed #99CC66 1px;
	margin-bottom: 10px;
}
</style>

</head>
<body>
<div id="box">
<div id="right">
<!-- 人气排行榜 -->
<div id="rqphb">
<table width="195" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="199" height="31"><img src="${baseurl}/css/images/index_28.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"> </td>
	</tr>
	<tr>
		<td valign="top" id="t1">
			<div id="rq"></div>
		</td>
	</tr>
</table>
</div>
<!-- 推荐商品 -->
<div id="tjsp">
<table width="195" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="195" height="31"><img
			src="${baseurl}/css/images/08.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top">
			<div id="tj"></div>
		</td>
	</tr>
</table>
</div>
<!-- 热销商品 -->
<div id="rxsp">
<table width="195" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="195" height="31"><img
			src="${baseurl}/css/images/index_47.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top">
			<div id="rx"></div>
		</td>
	</tr>
</table>
</div>
</div>
<div id="right_sp" style="background-color: #FFFF66">
	<div id="zitiao">
		<img src="${baseurl}/css/images/${string}">
	</div>
<div>
<form>
		<h1 style="font-family: inherit;">${publicinfo.title }</h1>
		<a></a>	
		<h2 style="font-style: oblique;" align="center">发布时间:&nbsp;${publicinfo.time }</h2>
		<div style="font-family: monospace;color: #000000;font-size: 18px">${publicinfo.text}</div>
</form>
<br>

</div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		$.ajax({
			type : "POST",
			url : "findByClick.action",
			success : function(response){
			$("#rq").html(response); 
			}
		});
		$.ajax({
			type : "POST",
			url : "findByCommend.action",
			success : function(response){
			$("#tj").html(response); 
			}
		});
		$.ajax({
			type : "POST",
			url : "findBySellCount.action",
			success : function(response){
			$("#rx").html(response); 
			}
		});

	});
</script>
</html>