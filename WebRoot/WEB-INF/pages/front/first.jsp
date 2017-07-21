<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="" %>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>GO购网络商城</title>
<STYLE type="text/css">
</STYLE>

</head>
<body>
<%@include file="/WEB-INF/pages/front/head.jsp"%>
<div id="box">
<div id="left">
<div id="left_s01">
	<a href="${baseurl}customer/tologin.action"><img src="${baseurl}/css/images/index_23.gif" class="imgx5" /></a>
	<a href="${baseurl}customer/toregiste.action"><img src="${baseurl}/css/images/index_26.gif" class="imgx5" /></a>
	<img src="${baseurl}/css/images/index_27.gif" /></div>
<div id="left_s02"><img
	src="${baseurl}/css/images/index_25.gif" width="489" height="245"
	class="imgz5" /></div>
<!-- 类别 -->
<div id="left_x">
<div id="left122">
<table style="float: left;height: auto;width: auto; vertical-align: middle; ">
    <tr>   
       <td class="word14" style="width: 22px; padding-left: 10px;">
           
       </td>
        <td style="padding-bottom: 3px;"> 
			<div id="left122_y">
				
			</div>
       </td>
    </tr>
</table>
</div>
</div>
</div>
<div id="right">
<!-- 人气排行 -->
<div id="rqpgb">
<table width="195" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td width="195" height="31"><img
			src="${baseurl}/css/images/index_28.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top">
			<div id="rq" style="width: 206px"></div>
		</td>
	</tr>
</table>
</div>
<br>
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
<table width="195" border="0" cellpadding="0"
	cellspacing="0">
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
<div id="foot" ></div>

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
		$.ajax({
			type : "POST",
			url : "noticelist.action",
			success : function(response){
			$("#left122_y").html(response); 
			}
		});
	});
</script>
</html>