<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品评论</title>
<script type="text/javascript">
		function submit(){
			jquerySubByFId('commentform',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tologin()", 1000);
			}
	 	}
	 	function tologin(){
	 		window.location = '${baseurl}orderlist.action';
	 	}
	</script>
</head>
<body>
<%@ include file="/WEB-INF/pages/front/head.jsp"%>
<div id="box">
<div id="wdzh_left">
      <div id="left_list"><a href="${baseurl}customer/cartlist.action">我的购物车</a></div>
	  <div id="left_list"><a href="${baseurl}customer/orderlist.action">我的订单</a></div>
	  <div id="left_list"><a href="${baseurl}customer/customerinfo.action">我的资料</a></div>
    </div>
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　商品评论</div>
      <div id="biaodan">
      	<form id="commentform" action="${baseurl}customer/comment.action" method="post">
      	<input type="hidden" name="productid" value="${productinfoCustom.id}">
        <table border="0" width="100%" cellpadding="0" cellspacing="0">
        		<tr>
					<td  align="center">
						<img src="${baseurl}upload/${productinfoCustom.path}"/>
					</td>
				</tr>
				<tr bgcolor="#f2eec9">
					<td align="center" width="90">商品名称：${productinfoCustom.name}</td>
				</tr>
				<tr>
					<td align="center">
						<textarea rows="4" cols="40" name="text"></textarea>
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="javascript:void(0)" onclick="submit()" style="width: 100px;height: 50px">发表</a>
					</td>
				</tr>
        </table>
  		</form>
      </div>
    </div>
  <div id="foot"></div>
</div>
</body>
</html>