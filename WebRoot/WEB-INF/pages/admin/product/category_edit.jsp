<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	 		window.location = '${baseurl}admin/categoryList.action';
	 	}
	</script>
</head>
<body>
	<form id="form" action="${baseurl}admin/categorySave.action" method="post">
		<input type="hidden" name="id" value="${productcategory.id}">
		<input type="hidden" name="pid" value="${productcategory.id}">
		<input type="hidden" name="level" value="${productcategory.level }">
		<div id="right">
		<div id="right_top"><img
			src="${baseurl}/css/images/blue.gif" width="16" height="16" />
		<span class="word01">编辑商品类别</span></div>
		<div id="right_mid">
		<div id="tiao">
		<table width="685" height="24" border="0">
			<tr>
				<td width="105" height="22" bgcolor="#c6e8ff" align="right">类别名称：</td>
				<td><input type="text" name="name" value="${productcategory.name}"> </td>
			</tr>
		</table>
		</div>
		</div>
		<div id="right_foot">
		<a onclick="submit()"><img src="${baseurl}/css/images/ht_02_18.gif"> </a>
		</div>
		</div>
	</form>
</body>
</html>