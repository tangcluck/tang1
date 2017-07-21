<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
		function submit(){
			jquerySubByFId('form',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tofirst()", 1000);
			}
	 	}
	 	function tofirst(){
	 		window.location = '${baseurl}admin/productList.action';
	 	}
	</script>
</head>
<body>


<form id="form" action="${baseurl}admin/productSave.action" enctype="multipart/form-data" method="post">
	<div id="right">
	<div id="right_top"><img
		src="${baseurl}/css/images/blue.gif" width="16" height="16" /> <span
		class="word01">添加商品</span></div>
	<div id="right_mid">
	<div id="tiao">
	<table width="685" height="24" border="0">
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品名称：</td>
			
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">选择类别：</td>
			
			<td>
				<select name="categoryid">
					<c:forEach items="${productcategoryCustomList}" var="p" varStatus="status">
						<option value="${p.id }">${p.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">采购价格：</td>
			<td><input type="text" name="baseprice"> </td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">市场价格：</td>
			<td><input type="text" name="marketprice"> </td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">销售价格：</td>
			<td><input type="text" name="sellprice"> </td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">是否为推荐：</td>
			<td><input type="radio" name="commend" value="1" checked="checked">是
				<input type="radio" name="commend" value="0">否
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">所属性别：</td>
			<td><select name="sexrequest">
				<option value="BORY">男</option>
				<option value="GIRL">女</option>
				<option value="ALL">不限</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">上传图片：</td>
			<td><input type="file" name="file"></td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品说明：</td>
			<td>
				<textarea cols="50" rows="6" name="description"></textarea>
			</td>
		</tr>
		<tr>
			<td><a onclick="submit()"><img src="${baseurl}/css/images/ht_02_18.gif"> </a></td>
		</tr>
	</table>
	</div>
	</div>
	<div>
		
	</div>
</form>
</body>
</html>