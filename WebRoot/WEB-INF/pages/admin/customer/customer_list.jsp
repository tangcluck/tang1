<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp" %>
<script type="text/javascript">
	function drop(id) {
		_confirm('您确定要删除吗?',null,
				function(){
					$.ajax({
						type : "POST",
						url : "${baseurl}admin/customerDel.action",
						data : {"id":id},
						success : function(data){
							window.location.reload();
						}
					});
				}
		);
	}
</script>
<div id="right">
<div id="right_top01">
<table width="693" height="29" border="0" class="word01">
	<tr>
		<td width="53" height="27" align="center">账号</td>
		<td width="150" align="center">昵称</td>
		<td width="150" align="center">年龄</td>
		<td width="100" align="center">联系方式</td>
		<td width="100" align="center">邮箱地址</td>
		<td width="100" align="center">家庭地址</td>
		<td width="70" align="center">编辑</td>
		<td width="70" align="center">删除</td>
	</tr>
</table>
</div>    
<div id="right_mid">
<div id="tiao">
<table width="693" height="29" border="0">
<c:forEach items="${customerList }" var="c" varStatus="status">
	<tr>
		<td width="50" height="27" align="center" >${c.userid}</td>
		<td width="150" align="center">${c.username}</td>
		<td width="150" align="center">${c.age}</td>
		<td width="100" align="center">${c.phone}</td>
		<td width="100" align="center">${c.email}</td>
		<td width="100" align="center">${c.addr}</td>
		<td width="70" align="center">
			<a href="${baseurl}admin/customerEdit.action?id=${c.id}">
				<img src="${baseurl}/css/images/rz_15.gif" width="21" height="16" />
			</a>
		</td>
		<td width="70" align="center">
			<a href="javascript:void(0)" onclick="drop('${c.id}')" ><img src="${baseurl}/css/images/rz_17.gif" width="15" height="16" /></a>
		</td>

	</tr>
	</c:forEach>
</table>
</div>
</div>    

</s:url>
</div>
</div>