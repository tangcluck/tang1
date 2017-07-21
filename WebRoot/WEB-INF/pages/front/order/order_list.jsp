<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单</title>
<script type="text/javascript">
	function drop(id){
	_confirm('您确定要收货吗?',null,
		function(){
			$.ajax({
				type : "POST",
				url : "${baseurl}updateStatus.action",
				data : {"orderid":id},
				success : function(data){
					message_alert(data);
					var type = data.resultInfo.type;
					if(type==1){
						setTimeout('window.location.reload()',1000);
					}
				}
			});
		}
	);
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
      <div id="right_tiao">　&gt;　我的订单</div>
      <div id="biaodan">
        <table width="688" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="30" bgcolor="#fff8ad"><table width="688" height="30" border="0" cellpadding="0" cellspacing="0" class="yellow">
              <tr>
                <td width="158" height="30" align="center">订单号码</td>
                <td width="90" align="center">订单总金额</td>
                <td width="66" align="center">收货人</td>
                <td width="119" align="center">收货地址</td>
                <td width="74" align="center">支付方式</td>
				 <td width="112" align="center">创建时间</td>
				  <td width="69" align="center">订单状态</td>
              </tr>
            </table></td>
          </tr>
          <c:forEach items="${ordersList}" var="o" varStatus="status">
          <tr>
            <td><div id="xiaotiao">
              <table width="688" height="60" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="158" height="30" align="center">${o.orderid}</td>
                  <td width="90" align="center">${o.totalprice}</td>
                  <td width="66" align="center">${o.name}</td>
                  <td width="119" align="center">${o.address}</td>
                  <td width="74" align="center">${o.paymentway}</td>
                  <fmt:parseDate value="${o.createtime}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
                  <td width="112" align="center"> <fmt:formatDate value="${date}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
                  
                  <td width="69" align="center">${o.orderstate}
                  	<c:if test="${o.orderstate == '已发货'}"><br>
                  	<a href="#" onclick="drop('${o.orderid}')">确认收货</a>
                  	</c:if>
                  	<c:if test="${o.orderstate == '交易完成'}"><br>
                  	<a href="${baseurl}customer/orderItem.action?orderId=${o.orderid}" style="text-decoration: none;">评论</a>
                  	</c:if>
                  </td>
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