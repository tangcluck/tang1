<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<div id="right">
<div id="right_top01">
<table width="693" height="29" border="0" class="word01">
	<tr>
		<td width="140" align="center">订单号</td>
		<td width="60" align="center">总金额</td>
		<td width="63" align="center">消费者</td>
		<td width="70" align="center">支付方式</td>
		<td width="140" align="center">创建时间</td>
		<td width="70" align="center">订单状态</td>
		<td width="150" align="center">修改</td>
	</tr>
</table>
</div>
<div id="right_mid">
<div id="tiao">
<table width="693" height="29" border="0">
	<c:forEach items="${ordersList}" var="o" varStatus="status">
		<tr>
			<td width="140" align="center">${o.orderid }</td>
			<td width="60" align="center">${o.totalprice }</td>
			<td width="63" align="center">${o.name }</td>
			<td width="70" align="center">${o.paymentway }</td>
			<fmt:parseDate value="${o.createtime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
            <td width="112" align="center"> <fmt:formatDate value="${date}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
			<td width="70" align="center">${o.orderstate}</td>
			<td width="150" align="center">
			<c:set value="${baseurl}admin/orderSelect.action?orderid=${o.orderid}" var="order_select"></c:set>
				<input type="button" value="更新订单状态" onclick="openWindow('${order_select}',350,150);"></td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
 <s:url var="first">
	<s:param name="pageNo" value="1"></s:param>
</s:url>
<s:url var="previous">
	<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
</s:url>
<s:url var="last">
	<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
</s:url>
<s:url var="next">
	<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
</s:url>
<s:include value="/WEB-INF/pages/front/page.jsp"></s:include>
  <div id="foot"></div>
</div>
</body>
</html>
