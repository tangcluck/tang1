<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<script type="text/javascript">
	function drop(id) {
		_confirm('您确定要删除吗?',null,
				function(){
					$.ajax({
						type : "POST",
						url : "${baseurl}admin/productDel.action",
						data : {"id":id},
						success : function(data){
							window.location.reload();
						}
					});
				}
		);
	}
</script>
<div id="right">
<div id="right_top01">
<table width="693" height="29" border="0" class="word01">
	<tr>
		<td width="37" height="27" align="center">ID</td>
		<td width="120" align="center">商品名称</td>
		<td width="78" align="center">所属类别</td>
		<td width="79" align="center">采购价格</td>
		<td width="79" align="center">销售价格</td>
		<td width="79" align="center">是否推荐</td>
		<td width="79" align="center">适应性别</td>
		<td width="52" align="center">编辑</td>
		<td width="52" align="center">删除</td>
	</tr>
</table>
</div>
<div id="right_mid">
<div id="tiao">
<table width="693" height="29" border="0">
	<c:forEach items="${productinfoCustomList}" var="p" varStatus="status">
		<tr>
			<td width="37" height="27" align="center">${p.id}</td>
			<td width="120" align="center">
				<a href="${baseurl}admin/productEdit.action?id=${p.id}">${p.name }</a>
			</td>
			<td width="78" align="center">${p.pname }
			</td>
			<td width="79" align="center">${p.baseprice}</td>
			<td width="79" align="center">${p.sellprice}</td>
			<td width="79" align="center">
				<c:choose>
					<c:when test="${p.commend eq true}">
						是
					</c:when>
					<c:otherwise>
						否
					</c:otherwise>
				</c:choose>
			</td>
			<td width="79" align="center">
				<c:choose>
					<c:when test="${p.sexrequest=='BOY'}">
						男
					</c:when>
					<c:otherwise>
						女
					</c:otherwise>
				</c:choose>
			<td width="52" align="center">
			<a href="${baseurl}admin/productEdit.action?id=${p.id}"> <img src="${baseurl}/css/images/rz_15.gif" width="21" height="16" /></a>
			</td>
			<td width="52" align="center">
			<a  onclick="drop(${p.id})" href="javascript:;"><img src="${baseurl}/css/images/rz_17.gif" width="15" height="16" /></a>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
