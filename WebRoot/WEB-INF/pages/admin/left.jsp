<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp" %>

<div id="left">
<div id="left_top"></div>
<div id="left_mid">
<div id="category_title">类别管理</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/categoryAdd.action">添加类别</a>
</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/categoryList.action">查看所有类别</a>
</div>
<div id="category_title">商品管理</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/productAdd.action">添加商品</a>
</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/productList.action">查看所有商品</a>
</div>
<div id="category_title">订单管理</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/orderList.action">查看订单</a>
</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/orderQuery.action">订单查询</a>
</div>
<div id="category_title">公告栏管理</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/tonotice.action">添加公告</a>
</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/noticelist.action">所有公告</a>
</div>
<div id="category_title">用户管理</div>
<div id="category_sub">
	<a target="abc" href="${baseurl}admin/customerList.action">所有用户</a>
</div>
</div>
</div>