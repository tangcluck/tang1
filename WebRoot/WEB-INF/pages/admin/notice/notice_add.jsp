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
	 		window.location = '${baseurl}admin/noticelist.action';
	 	}
	</script>
</head>
<body>
<form id="form" action="${baseurl}admin/addnotice.action" method="post">
	<div id="right">
	<div id="right_top"><img
		src="${baseurl}/css/images/blue.gif" width="16" height="16" /> <span
		class="word01">添加公告栏</span></div>
	<div id="right_mid">
	<div id="tiao">
	<table border="0" width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td align="left"><b style="color: #000000;font-size: 20"> 公告主题：</b></td>
		</tr>
		<tr>
			<td><input type="text" name="title" style="width:500px;height:30px"> </td>
		</tr>
		<tr>
			<td align="left"><b style="color: #000000;font-size: 20"> 正文：</b></td>
		</tr>
		<tr>
			<td> <textarea rows="3" cols="50" name="text" ></textarea></td>
		</tr>
		<tr>
			<td> <a href="javascript:void(0)" onclick="submit()"><img src="${baseurl}/css/images/ht_02_18.gif"> </a></td>
		</tr>
	</table>
	</div>
	</div>
	<div id="right_foot">
		
	</div>
</form>
</body>
</html>