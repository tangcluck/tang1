<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/pages/tag.jsp"%>
<%@ include file="/WEB-INF/pages/common_css.jsp"%>
<%@ include file="/WEB-INF/pages/common_js.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员登录</title>
<link href="${baseurl}css/style_ht.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript">
	function submit(){
			jquerySubByFId('adminform',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tofirst()", 1000);
			}
	 	}
	 	function tofirst(){
	 		window.location = '${baseurl}admin/tomain.action';
	 	}
	
</script>
</head>
<body>
<form id="adminform" action="${baseurl}admin/login.action" method="post">
	<div id="boxdl">
	<table width="229" height="94" border="0">
		<tr>
			<td width="66" height="33">管理员：</td>
			<td width="153"><input type="text" name="username"> </td>
		</tr>
		<tr>
			<td height="33">密 码：</td>
			<td><input type="password" name="password"></td>
		</tr>
		<tr>
			<td height="26" colspan="2" align="center">
			<a href="javascript:void(0)" onclick="submit()"><img src="${baseurl}/css/images/an_06.gif"> </a>
			</td>
		</tr>
	</table>
	</div>
</form>
</body>
</html>