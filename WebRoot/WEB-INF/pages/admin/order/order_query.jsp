<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<form action="${baseurl}/admin/orderList.action" method="post">
	<div id="right">
	<div id="right_top"><img
		src="${baseurl}/css/images/blue.gif" width="16" height="16" /> <span
		class="word01">订单查询</span></div>
	<div id="right_mid">
	<div id="tiao">
	<table width="685" height="24" border="0">
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">订单号：</td>
			<td> <input type="text" name="orderid"> </td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">订单状态：</td>
			<td><input type="radio" name="orderstate" value="已发货" checked="checked">已发货
				<input type="radio" name="orderstate" value="交易完成" >交易完成
				<input type="radio" name="orderstate" value="已取消" >已取消
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">会员名：</td>
			<td><input type="text" name="username"> </td>
		</tr>
		<tr>
			<td>
				<input type="image" src="${baseurl}/css/images/ht_02_18.gif">
			</td>
		</tr>
	</table>
	</div>
	</div>
</form>