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
<div id="rqpgb">
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
<!-- 商品信息列表 -->
<div id="right_sp">
	<div id="zitiao">
		<img src="${baseurl}/css/images/${string}">
	</div>
<c:choose>
<c:when test="${not empty productinfoCustomList}">
<c:forEach items="${productinfoCustomList}" var="l" varStatus="status">
	<ul>
		<li>
			<table border="0" width="100% " cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="5" width="160">
						<a href="${baseurl}customer/selectproduct.action?id=${l.id}">
						<img width="100%" src="${baseurl}upload/${l.path}"/>
						</a>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">商品名称：</td>
					<td>
					<a href="${baseurl}customer/selectproduct.action?id=${l.id}">
						${l.name}
					<a>
					</td>
				</tr>
				<tr>
					<td align="right" width="90">市场价格：</td>
					<td>
					<font style="text-decoration: line-through;">
					${l.marketprice }
					</font>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">天下淘价格：</td>
					<td>
						${l.sellprice}&nbsp;
						<c:if test="${l.sellprice <= l.marketprice}">
							<font color="red">节省${l.marketprice-l.sellprice} </font>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<a href="${baseurl}customer/selectproduct.action?id=${l.id}">
							<img src="${baseurl}/css/images/gm_06.gif" width="136" height="32" />
						</a>
					</td>
				</tr>
			</table>
		</li>
	</ul>
</c:forEach>
	<div style="text-align: right; margin-top: 20px;margin-right: 20px;">
		<a href="${baseurl}${pageModel.path}?currentPage=${pageModel.first}">首页</a> 
		<c:if test="${pageModel.currentPage>pageModel.first }">
			<a href="${baseurl}${pageModel.path}?currentPage=${pageModel.currentPage-1}">上一页</a>
		</c:if>
		<SPAN style="color: red;">
		　[${pageModel.currentPage }]　
		</SPAN>
		<c:if test="${pageModel.currentPage<pageModel.last }">
			<a href="${baseurl}${pageModel.path}?currentPage=${pageModel.currentPage+1}">下一页</a>
		</c:if>
		<a href="${baseurl}${pageModel.path}?currentPage=${pageModel.last}">尾页</a>
	</div>
</c:when>
	
<c:otherwise>
	<p>对不起，还没有添加商品信息。</p>
	<a href="${baseurl}customer/first.action">返回主页</a>
</c:otherwise>
</c:choose>
		
	

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