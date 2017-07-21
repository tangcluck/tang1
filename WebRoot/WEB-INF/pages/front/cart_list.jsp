<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的购物车</title>
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
      <div id="right_tiao">　&gt;　我的购物车</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="688" height="25" align="right">
          </tr>
          <tr>
            <td height="30" bgcolor="#e7f3c3"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="green">
              <tr>
                <td width="213" height="30" align="center">商品名称</td>
                <td width="130" align="center">市场价</td>
                <td width="130" align="center">价格</td>
                <td width="104" align="center">数量</td>
                <td width="111" align="center">删除</td>
              </tr>
            </table></td>
          </tr>
          
          <c:forEach items="${cart}" var="c" varStatus="status">
          <c:set var="sumall" value="${sumall+c.productprice*c.amount }" scope="page"></c:set>
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
                  <td width="111" align="center">
                  <a href="${baseurl}customer/deleteCartOne.action?productid=${c.productid}">
					<img src="${baseurl}/css/images/zh03_03.gif" width="52" height="23" />
				</a>
                  </td>
                </tr>
               
              </table>
            </div></td>
          </tr>
           </c:forEach>
          <tr>
            <td height="60" align="center" valign="middle">
            <a href="${baseurl}customer/clearCart.action">
			<img src="${baseurl}/css/images/zh03_07.gif" width="105" height="32" />
            </a>　　
			<a href="${baseurl}customer/first.action">
            <img src="${baseurl}/css/images/zh03_09.gif" width="150" height="32" />　
            </a>　　
            <a href="${baseurl}customer/addOrder.action" >
            <img src="${baseurl}/css/images/zh03_11.gif" width="105" height="32" />
            </a>
            </td>
          </tr>
        </table>
      </div>
    </div>
 
  <div id="foot"></div>
</div>
</body>
</html>