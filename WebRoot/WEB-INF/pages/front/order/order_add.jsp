<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加订单</title>
<script type="text/javascript">
	function submit(){
			jquerySubByFId('orderform',update_callback,null,"json");
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
	<div id="wdzh_left">
      <div id="left_list"><a href="${baseurl}customer/cartlist.action">我的购物车</a></div>
	  <div id="left_list"><a href="${baseurl}customer/orderlist.action">我的订单</a></div>
	  <div id="left_list"><a href="${baseurl}customer/customerinfo.action">我的资料</a></div>
    </div>
     <form id="orderform" action="${baseurl}customer/orderConfirm.action" method="post">
    <div id="wdzh_right">
      <div id="right_tiao">　&gt;　我的订单</div>
      <div id="biaodan01">
     
        <table width="688" height="35" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" align="right" valign="middle">收货人姓名：</td>
            <td width="572" align="left" valign="middle">
            <input type="text" name="name" cssClass="bian" size="40" value="${orders.name}">
            </td>
          </tr>
        </table>
      </div>
	  <div id="biaodan02">
	    <table width="688" height="50" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" align="right" valign="middle">收货人地址：</td>
            <td width="572" align="left" valign="middle">
            <textarea name="address" cssClass="bian" >${orders.address }</textarea>
            </td>
          </tr>
        </table>
	  </div>
	  <div id="biaodan03">
	    <table width="688" height="35" border="0" cellpadding="0" cellspacing="0">
	    	<tr>
            	<td width="116" align="right" valign="middle">收货人电话：</td>
            	<td><input type="text" name="mobile" cssClass="bian" size="40" value="${orders.mobile}">
            	</td>
          	</tr>
	    </table>
	  </div>
	  <div id="biaodan04">
	    <table width="688" height="140" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="116" height="35" align="right" valign="middle">支付方式：</td>
            <td width="572" align="left" valign="middle">
            <p>
				<input type="radio" name="paymentway" value="网上银行">网上银行
			</p>
			<p>
				<input type="radio" name="paymentway" value="支付宝">支付宝
			</p>
			<p>
				<input type="radio" name="paymentway" value="货到付款">货到付款
			</p>
			<p>
				<input type="radio" name="paymentway" value="邮局汇款" checked="checked">邮局汇款<br>
				收款人地址：吉林省长春市xxx大厦xxx室  收款人姓名：xxx  收款人邮编：xxxx
			</p>
			</td>
          </tr>
        </table>
	  </div>
	  <div id="biaodan05">
	    <table width="688" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="688" align="center">
           	<button onclick="submint()"><img src="${baseurl}/css/images/zh01_03.gif"></button>
           </td>
          </tr>
        </table>
        
	  </div>
    </div>
 </s:form>
  <div id="foot"></div>
</div>
</body>
</html>