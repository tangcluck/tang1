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
						url : "${baseurl}admin/categoryDel.action",
						data : {"id":id},
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
<div id="right">
<div id="right_top01">
<table width="693" height="29" border="0" class="word01">
	<tr>
		<td width="53" height="27" align="center">ID</td>
		<td width="150" align="center">类别名称</td>
		<td width="150" align="center">子类别</td>
		<td width="100" align="center">添加子类别</td>
		<td width="100" align="center">所属父类</td>
		<td width="70" align="center">编辑</td>
		<td width="70" align="center">删除</td>
	</tr>
</table>
</div>    
<div id="right_mid">
<div id="tiao">
<table width="693" height="29" border="0">
<c:forEach items="${productcategoryCustomList }" var="p" varStatus="status">
	<tr>
		<td id="pid" width="50" height="27" align="center">${p.id}</td>
		<td width="150" align="center">
			<a href="${baseurl}admin/categoryAdd.action?pid=${p.id}">
				${p.name }
			</a>
		</td>
		<td width="150" align="center">
		<c:choose>
			<c:when test="${p.child==0}">
				没有子类别
			</c:when>
			<c:otherwise>
				<a href="${baseurl}admin/categoryList.action?pid=${p.id}" >
					有${p.child}个子类别
				</a>
			</c:otherwise>
		</c:choose>
		</td>
		<td width="100" align="center">
			<a href="${baseurl}admin/categoryAdd.action?pid=${p.id}">添加</a>
		</td>
		<td width="100" align="center">
			<c:choose>
			<c:when test="${empty p.parent}">
				无
			</c:when>
			<c:otherwise>
					${p.parent}
			</c:otherwise>
		</c:choose>
		</td>
		<td width="70" align="center">
			<a href="${baseurl}admin/categoryEdit.action?id=${p.id}">
				<img src="${baseurl}/css/images/rz_15.gif" width="21" height="16" />
			</a>
		</td>
		<td width="70" align="center">
			<a onclick="drop(${p.id})" href="#">
				<img src="${baseurl}/css/images/rz_17.gif" width="15" height="16" />
			</a>
		</td>
	</tr>
	</c:forEach>
</table>
</div>
</div>    

</div>
</div>