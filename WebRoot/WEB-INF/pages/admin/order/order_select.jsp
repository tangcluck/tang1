<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>更新订单状态</title>
	<script type="text/javascript">
		function submit(){
			$("#form").submit();
			windows.close();
		}
	</script>
<style type="text/css">
	p{
		font-size: 12px;
	}
</style>
</head>
<body>
<h3>更新订单状态</h3>
<div align="center">
<form id="form" action="${baseurl}admin/updateState.action" method="post">
	<input type="hidden" name="orderid" value="${orders.orderid}">
	<p>
	订单状态:
	<input type="radio" name="orderstate" value="已发货" ${orders.orderstate=='已发货'?"checked='checked'":""}>已发货
	<input type="radio" name="orderstate" value="交易完成" ${orders.orderstate=='交易完成'?"checked='checked'":""}>交易完成
	<input type="radio" name="orderstate" value="已取消" ${orders.orderstate=='已取消'?"checked='checked'":""}>已取消
	</p>
	<input type="submit" value="更新订单状态" onclick="submint()">
</form>
</div>
</body>
</html>