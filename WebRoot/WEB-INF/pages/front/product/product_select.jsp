<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<%@ include file="/WEB-INF/pages/front/head.jsp"%>
<div id="box">
<div id="right">
<!-- 商品排行 -->
<div id="rqpgb">
<table width="195" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td width="199" height="31"><img
			src="${baseurl}/css/images/index_28.gif" width="195" height="29" /></td>
	</tr>
	<tr>
		<td height="5"></td>
	</tr>
	<tr>
		<td valign="top">
			<div id="rq"></div>
		</td>
	</tr>
</table>
</div>
<!-- 推荐商品 -->
<div id="xpss">
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
<!-- 商品信息 -->
<div id="right_sp">
<div id="zitiao"><img src="${baseurl}/css/images/05.gif"
	width="676" height="31" /></div>
<div id="xshangpin">
	<ul>
		<li>
			<table border="0" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td rowspan="5" width="160">
					<input type="hidden" id="productId" value="${productinfoCustom.id}">
					<a href="${baseurl}customer/selectproduct.action?id=${productinfoCustom.id}">
						<img width="200" height="200" src="${baseurl}/upload/${productinfoCustom.path}">
					</a>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">商品名称：</td>
					<td>
					<a href="${baseurl}customer/selectproduct.action?id=${productinfoCustom.id}">
						${productinfoCustom.name}
					</a>
					</td>
				</tr>
				<tr>
					<td align="right" width="90">市场价格：</td>
					<td>
					<font style="text-decoration: line-through;">
					${productinfoCustom.marketprice }
					</font>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="right" width="90">天下淘价格：</td>
					<td>
						${productinfoCustom.sellprice}&nbsp;
						<c:if test="${productinfoCustom.sellprice <= productinfoCustom.marketprice}">
							<font color="red">节省${productinfoCustom.marketprice-productinfoCustom.sellprice} </font>
						</c:if>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<a href="${baseurl}customer/addcart.action?productId=${productinfoCustom.id}" >
							<img src="${baseurl}/css/images/gm_06.gif" width="136" height="32" />
						</a>
						<p style="margin-top: 10px;">
						<span style=" color: gray; text-decoration:underline; ">
						[  配送说明 ]</span>　　　
						<span style="color: gray; text-decoration:underline; ">
						[  付款方式 ] 
						</span>
						</p>
					</td>
				</tr>
			</table>
		</li>
	</ul>
	<ul>
		<li>
			<hr>
		</li>
	</ul>
	<ul>
		<li>
			<div style="background-color: #eedb97;">
				<img src="${baseurl}/css/images/cp_11.gif" width="98" height="28" />
			</div>
			<p style="margin-top: 15px;">
				${productinfoCustom.description }
			</p>
		</li>
		<li>
			<div style="background-color: #eedb97;">
				<b style="color: #000000;font-size: 20px">买家评论：</b> 
			</div>
			<div id="pl"></div>
		</li>
	</ul>
</div>
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
		$.ajax({
			type : "POST",
			url : "commentInfo.action",
			data: {productId:$("#productId").val()},
			success : function(response){
			$("#pl").html(response); 
			}
		});
	});
</script>
</html>