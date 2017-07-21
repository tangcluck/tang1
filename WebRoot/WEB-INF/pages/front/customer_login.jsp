<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>

	<script type="text/javascript">
		function submit(){
			jquerySubByFId('customerform',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tofirst()", 1000);
			}
	 	}
	 	function tofirst(){
	 		window.location = '${baseurl}first.action';
	 	}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/pages/front/head.jsp"%>
<div id="box">
<div id="mid">
    <div id="denglu">
      <form id="customerform" action="${baseurl}customer/login.action" method="post">
      <table width="100%" height="94" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="70" height="35" align="right">会员名：</td>
          <td width="121" align="left">
          <input type="text" name="userid" cssClass="bian" size="18">
          </td>
        </tr>
        <tr>
          <td height="35" align="right">密　码：</td>
          <td align="left">
          <input type="password" name="pwd">
          </td>
        </tr>
        <tr>
          <td height="24" colspan="2" align="center">
          <a href="javascript:void(0)" onclick="submit()"><img src="${baseurl}css/images/dl_06.gif"></a>
          <a href="${baseurl}customer/toregiste.action">
          <img src="${baseurl}css/images/dl_08.gif" width="68" height="24" />
          </a>
          </td>
        </tr>
      </table>
      </s:form>
    </div>
  </div>
  <div id="foot"></div>
</div>
</body>
</html>