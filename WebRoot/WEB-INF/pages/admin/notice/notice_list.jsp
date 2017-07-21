<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
<div id="right">
<div id="right_top01">
<table width="693" height="29" border="0" class="word01">
	<tr>
		<td width="63" align="center">公告主题</td>
		<td width="140" align="center">发布时间</td>
		<td width="70" align="center">详情</td>
		<td width="150" align="center">删除</td>
	</tr>
</table>
</div>
<div id="right_mid">
<div>
<table width="693" height="29" border="0">
	<c:forEach items="${publicinfoList}" var="p" varStatus="status">
		<tr>
			<td width="63" align="center">${p.title }</td>
			<fmt:parseDate value="${p.time}" var="date" pattern="yyyy-MM-dd HH:mm:ss"/>
            <td width="140" align="center"> <fmt:formatDate value="${date}" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
			<td width="70" align="center">
			<a href="${baseurl}admin/noticeItem.action?id=${p.id}">
			<img src="${baseurl}/css/images/rz_15.gif" width="21" height="16" />
			</a></td>
			<td width="150" align="center">
			<a href="#" onclick="drop(${p.id})">
			<img src="${baseurl}/css/images/rz_17.gif" width="15" height="16" />
			</a></td>
		</tr>
	</c:forEach>
</table>
</div>
</div>
  <div id="foot"></div>
</div>
</body>
<script type="text/javascript">
	function drop(id) {
		_confirm('您确定要删除吗?',null,
				function(){
					$.ajax({
						type : "POST",
						url : "${baseurl}admin/noticeDel.action",
						data : {"id":id},
						success : function(data){
							window.location.reload();
						}
					});
				}
		);
	}
</script>
</html>
