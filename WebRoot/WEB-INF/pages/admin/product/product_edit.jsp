<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/admin/common_admin.jsp" %>
<script type="text/javascript">
		function submit(){
			jquerySubByFId('form',update_callback,null,"json");
	 	}
	 	function update_callback(data){
	 		message_alert(data);
	 		var type = data.resultInfo.type;
	 		if (1 == type) {//如果登录成功，这里1秒后执行跳转到首页
				setTimeout("tofirst()", 1000);
			}
	 	}
	 	function tofirst(){
	 		window.location = '${baseurl}admin/productList.action';
	 	}
	</script>
<form id="form" action="${baseurl}admin/productSave.action" enctype="multipart/form-data" method="post">
	<input type="hidden" name="id" value="${productinfoCustom.id}">
	<input type="hidden" name="clickcount" value="${productinfoCustom.clickcount}">
	<input type="hidden" name="sellcount" value="${productinfoCustom.sellcount}">
	<input type="hidden" name="uploadfile" value="${productinfoCustom.uploadfile}">
<div id="right">
<div id="right_top"><img src="${baseurl}/css/images/blue.gif" width="16"
	height="16" /> <span class="word01">编辑商品</span></div>
<div id="right_mid">
<div id="tiao">
<table width="685" height="24" border="0">
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品名称：</td>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">
				<input type="text" name="name" value="${productinfoCustom.name}">
			</td>
			<td rowspan="7">
				<img width="270" height="180" border="1" src="${baseurl}/upload/${productinfoCustom.path}">
			</td> 
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">选择类别：</td>
			<td>
				<select name="categoryid">
					<c:forEach items="${productcategoryCustomList}" var="p" varStatus="status">
						<option value="${p.id }" ${p.id==productinfoCustom.categoryid?"selected":""}>${p.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">采购价格：</td>
			<td colspan="2">
				<input type="text" name="baseprice" value="${productinfoCustom.baseprice}">
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">市场价格：</td>
			<td colspan="2">
				<input type="text" name="marketprice" value="${productinfoCustom.marketprice}">
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">销售价格：</td>
			<td colspan="2">
				<input type="text" name="sellprice" value="${productinfoCustom.sellprice}">
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">是否为推荐：</td>
			<td><input type="radio" name="commend" value="1" ${productinfoCustom.commend=="true"?"checked='checked'":""}>是
				<input type="radio" name="commend" value="0" ${productinfoCustom.commend=="false"?"checked='checked'":""}>否
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">所属性别：</td>
			<td><select name="sexrequest">
				<option value="BOY" ${productinfoCustom.sexrequest=="BOY"?"selected":""}>男</option>
				<option value="GIRL" ${productinfoCustom.sexrequest=="GIRL"?"selected":""}>女</option>
				<option value="ALL" ${productinfoCustom.sexrequest=="ALL"?"selected":""}>不限</option>
				</select>
			</td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">上传图片：</td>
			<td ><input type="file" name="file"></td>
		</tr>
		<tr>
			<td width="105" height="22" bgcolor="#c6e8ff" align="right">商品说明：</td>
			<td colspan="2" >
				<textarea name="description" rows="6" cols="50" style="font-size: 15px" > ${productinfoCustom.description}</textarea>
			</td>
		</tr>
		<tr>
			<td><a onclick="submit()"><img src="${baseurl}/css/images/ht_02_18.gif"> </a></td>
		</tr>
	</table>
</div>
</div>
</div>
</form>
