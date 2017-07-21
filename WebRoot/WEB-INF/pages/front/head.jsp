<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/common_js.jsp"%>
<link href="${baseurl}css/style_index.css" rel="stylesheet"
	type="text/css" />
<style>

td {
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
	function searcher(){
		var name1 = $("#name").val();
		window.location = "${baseurl}customer/findByName.action?name="+name1;
	}
</script>
<div id="box">
<div id="dark"><a href="${baseurl}customer/cartlist.action" style="text-decoration: none;">
	<img src="${baseurl}css/images/index_03.gif" width="28"
		height="14" /> 我的购物车</a> | <a href="${baseurl}customer/orderlist.action" style="text-decoration: none;">我的订单</a>&nbsp;&nbsp;<a href="${baseurl}admin/tologin.action">管理员</a>　
<c:if test="${! empty customer}">
	欢迎 　${customer.username}
	<a href="${baseurl}customer/logout.action" style="text-decoration: none">退出</a>
</c:if>
</div>
<div id="logo">
<form  method="post">
<div id="sou">
	<input type="text" id="name" name="name"><br>
	<div style="margin-top: 5px;">
		<b>热搜商品：</b>
	</div>
</div>
<div id="sou_zi">
	 <a href="javascript:void(0)" onclick="searcher()" style="text-decoration: none;"><img src="${baseurl}css/images/index_09.gif""></a> 
</div>
</form>
<div id="sou_zi01">高级搜索<br />

使用帮助</div>
</div>
<div id="menu">
	<a href="${baseurl}customer/first.action"><img src="${baseurl}css/images/index_12.gif" width="92" height="33" /></a>
	<a href="${baseurl}customer/findNewProduct.action" ><img src="${baseurl}css/images/index_13.gif" width="100" height="33" /></a>
	<a href="${baseurl}customer/findSellProduct.action" ><img src="${baseurl}css/images/index_14.gif" width="99" height="33" /></a>
	<a href="${baseurl}customer/findCommendProduct.action" ><img src="${baseurl}css/images/index_15.gif" width="98" height="33" /></a>
	<a href="${baseurl}customer/findEnjoyProduct.action" ><img src="${baseurl}css/images/index_16.gif" width="100" height="33" /></a>
	<img src="${baseurl}css/images/index_19.gif" width="144" height="33" id="z300" /></div>
</div>

