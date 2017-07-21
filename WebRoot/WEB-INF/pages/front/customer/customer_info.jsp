<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的资料</title>
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
      <div id="right_tiao">　&gt;　我的资料</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#fff8ad"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="yellow">
              <tr>
                <td width="158" height="30" align="center">账号</td>
                <td width="90" align="center">昵称</td>
                <td width="66" align="center">年龄</td>
                <td width="119" align="center">联系方式</td>
                <td width="74" align="center">邮箱地址</td>
				 <td width="112" align="center">家庭地址</td>
				  <td width="69" align="center">编辑</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="60" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="158" height="30" align="center">${customer.userid}</td>
                  <td width="90" align="center">${customer.username}</td>
                  <td width="66" align="center">${customer.age}</td>
                  <td width="119" align="center">${customer.phone}</td>
                  <td width="74" align="center">${customer.email}</td>
                  <td width="112" align="center">${customer.addr }</td>
                  <td width="69" align="center">
                  <a href="${baseurl}customer/editCustomer.action?id=${customer.id}"><img src="${baseurl}/css/images/rz_15.gif" width="21" height="16" /></a>
                  </td>
                </tr>
              </table>
            </div></td>
          </tr>
        </table>
      </div>
    </div>
 <s:url var="first">
	<s:param name="pageNo" value="1"></s:param>
</s:url>
<s:url var="previous">
	<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
</s:url>
<s:url var="last">
	<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
</s:url>
<s:url var="next">
	<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
</s:url>
<s:include value="/WEB-INF/pages/front/page.jsp"></s:include>
  <div id="foot"></div>
</div>
</body>
</html>