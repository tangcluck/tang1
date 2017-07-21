<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>订单明细</title>
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
      <div id="right_tiao">　&gt;　订单明细</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#fff8ad"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="yellow">
              <tr>
                <td width="158" height="30" align="center">订单号</td>
                <td width="90" align="center">商品名称</td>
                <td width="66" align="center">商品价格</td>
				 <td width="119" align="center">数量</td>
				 <td width="74" align="center">操作</td>
              </tr>
            </table></td>
          </tr>
          <c:forEach items="${orderitemList}" var="o" varStatus="status">
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="60" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="158" height="30" align="center">${o.orderid}</td>
                  <td width="90" align="center">${o.productname}</td>
                  <td width="66" align="center">${o.productprice}</td>
                  <td width="119" align="center">${o.amount}</td>
                  <td width="74" align="center"><a href="${baseurl}customer/toComment.action?productId=${o.productid}" style="text-decoration: none"> 评论</a></td>
                </tr>
              </table>
            </div></td>
          </tr>
		</c:forEach>
        </table>
      </div>
    </div>
  <div id="foot"></div>
</div>
</body>
</html>