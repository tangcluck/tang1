<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单确认</title>
	<script type="text/javascript">
		function submit(){
			jquerySubByFId('orderform',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {
				setTimeout("tofirst()", 1000);
			}
	 	}
	 	function tofirst(){
	 		window.location = '${baseurl}customer/orderlist.action';
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
      <div id="right_tiao">　&gt;　订单确认</div>
      <div id="biaodan">
      <form id="orderform" action="${baseurl}customer/saveOrder.action" method="post">
      	<input type="hidden" name="name" value="${orders.name}">
      	<input type="hidden" name="address" value="${orders.address}">
      	<input type="hidden" name="mobile" value="${orders.mobile}">
      	<input type="hidden" name="paymentway" value="${orders.paymentway}">
      <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#e7f3c3"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="green">
              <tr>
                <td width="213" height="30" align="center">商品名称</td>
                <td width="130" align="center">市场价</td>
                <td width="130" align="center">价格</td>
                <td width="104" align="center">数量</td>
              </tr>
            </table></td>
          </tr>
          <c:forEach items="${cart}" var="c" varStatus="status">
          <c:set var="sumall" value="${sumall+ c.productprice*c.amount}" scope="session"></c:set>
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="30" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="213" height="30" align="center">${c.productname}</td>
                  <td width="130" align="center"><span style="text-decoration: line-through;">
                  ￥${c.productMarketprice}元</span>
                  </td>
                  <td width="130" align="center">￥${c.productprice}元<br>
			为您节省：￥${c.productMarketprice*c.amount-c.productprice*c.amount}元</td>
                  <td width="104" align="center" class="red">${c.amount }</td>
                </tr>
              </table>
            </div></td>
          </tr>
           </c:forEach>
           <tr>
            <td width="688" height="25" align="right">
          </tr>
          <tr>
            <td width="688" height="25"><div id="bd_xt">我的信息</div></td>
          </tr>
          <tr>
            <td height="60" align="center" valign="middle">
            <table width="100%">
	<tr>
		<td align="right" width="90">收货人姓名：</td>
		<td align="left">${orders.name}</td>
	</tr>
	<tr>
		<td align="right" width="90">收货人地址：</td>
		<td align="left">${orders.address}</td>
	</tr>
	<tr>
		<td align="right" width="90">收货人电话：</td>
		<td align="left">${orders.mobile}</td>
	</tr>
	<tr>
		<td align="right" width="90">货款支付方式：</td>
		<td align="left">${orders.paymentway}</td>
	</tr>
</table>
            </td>
          </tr>
          <tr>
          	<td colspan="2" align="center">
          	<button onclick="submint()"><img src="${baseurl}/css/images/zh01_03.gif"></button>
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