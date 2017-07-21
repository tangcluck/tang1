<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
	<script type="text/javascript">
		function submit(){
			jquerySubByFId('customerform',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tologin()", 1000);
			}
	 	}
	 	function tologin(){
	 		window.location = '${baseurl}tologin.action';
	 	}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/pages/front/head.jsp"%>
<div id="box">
<div id="mid">
    <div id="zhuce">
	<form id="customerform" action="${baseurl}customer/registe.action" method="post">
	<table width="80%" border="0" cellpadding="0" cellspacing="0">
		<tr>
 				
    			<th width="70" height="35" align="right">账号：</th>
    			<td><input  type="text" name="userid">&nbsp;&nbsp;<font style="color: red">*必填</font> </td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">昵称：</th>
    			<td><input type="text" name="username" >&nbsp;&nbsp;<font style="color: red">*必填</font></td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">密码：</th>
    			<td><input type="password" name="pwd" >&nbsp;&nbsp;<font style="color: red">*必填</font></td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">年龄：</th>
    			<td><input type="text" name="age"> </td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">联系方式:</th>
    			<td><input type="text" name="phone" ></td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">邮箱地址：</th>
    			<td><input type="text" name="email" ></td>
    		</tr>
    		<tr>
    			<th width="70" height="35" align="right">家庭地址：</th>
    			<td><textarea name="addr" ></textarea></td>
    		</tr>
    		<tr>
    			<th  width="70" height="35" align="right">
    			 <a id="submit"  class="easyui-linkbutton"   iconCls="icon-ok" href="#" onclick="submit()">ok</a>
    			
    		</tr>
		
	</table>
	</form>
</div>
  </div>
  <div id="foot"></div>
</div>
</body>
</html>