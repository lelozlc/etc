<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>人事管理系统 ——用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<link href="css/css.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="js/ligerUI/skins/Aqua/css/ligerui-dialog.css" />
<link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"></script>
<link href="css/pager.css" type="text/css" rel="stylesheet" />

<script type="text/javascript">
	$(function() {
		/** 获取上一次选中的部门数据 */
		var boxs = $("input[type='checkbox'][id^='box_']");

		/** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
		$("tr[id^='data_']").hover(function() {
			$(this).css("backgroundColor", "#eeccff");
		}, function() {
			$(this).css("backgroundColor", "#ffffff");
		})

		/** 删除员工绑定点击事件 */
		$("#delete").click(
				function() {
					/** 获取到用户选中的复选框  */
					var checkedBoxs = boxs.filter(":checked");
					if (checkedBoxs.length < 1) {
						$.ligerDialog.error("请选择一个需要删除的用户！");
					} else {
						/** 得到用户选中的所有的需要删除的ids */
						var ids = checkedBoxs.map(function() {
							return this.value;
						})

						$.ligerDialog.confirm("确认要删除吗?", "删除用户", function(r) {
							if (r) {
								alert("删除：" + ids.get());
								// 发送请求
								window.location = "user/userDelete.do?ids="
										+ ids.get();
							}
						});
					}
				})

		$("#pagejump").click(function() {
			var page_jump = $("#currentPage");
			if ($.trim(page_jump.val()) != "") {
				$("#jump_Form").submit();
			} else {
				$.ligerDialog.error("请输入需要跳转的页面");
			}
		})

		//标签跳转
		$("a[id^='replacepage_'").click(function() {
			var page = $(this).text();
			$("#currentPage").attr("value", page);
			$("#jump_Form").submit();
		});

		//上一页
		 $("#prepage").click(function(){
			var currentPage=parseInt($("#CP").text());
			currentPage-=1;
			$("#currentPage").attr("value", currentPage);
			$("#jump_Form").submit();
		});
		//下一页
		 $("#nextpage").click(function(){
			var currentPage=parseInt($("#CP").text());
			currentPage+=1;
			$("#currentPage").attr("value", currentPage);
			$("#jump_Form").submit();
		});
		 

	})
</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="10"></td>
		</tr>
		<tr>
			<td width="15" height="32"><img src="images/main_locleft.gif"
				width="15" height="32"></td>
			<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：用户管理
				&gt; 用户查询</td>
			<td width="15" height="32"><img src="images/main_locright.gif"
				width="15" height="32"></td>
		</tr>
	</table>

	<table width="100%" height="90%" border="0" cellpadding="5"
		cellspacing="0" class="main_tabbor">
		<!-- 查询区  -->
		<tr valign="top">
			<td height="30">
				<table width="100%" border="0" cellpadding="0" cellspacing="10"
					class="main_tab">
					<tr>
						<td class="fftd">
							<form action="user/userSeacher.do?currentPage=1" method="post"
								id="show_Form">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="font3">用户名：<input type="text" name="username"
											value="${username }"> 用户状态：<select name="status">
												<option value="">全部</option>
												<option value="1" ${status==1?"selected":"" }>管理员</option>
												<option value="0" ${status==0?"selected":"" }>普通用户</option>
										</select> <input type="submit" value="搜索" />
										 <input type="button"  id="delete" value="删除" style="font-size: 15px">
										</td>
									</tr>
								</table>
							</form>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<!-- 数据展示区 -->
		<tr valign="top">
			<td height="20">
				<table width="100%" border="1" cellpadding="5" cellspacing="0"
					style="border: #c2c6cc 1px solid; border-collapse: collapse;">
					<tbody>
						<tr class="main_trbg_tit" align="center">
							<td>选择</td>
							<td>登录名</td>
							<td>密码</td>
							<td>用户名</td>
							<td>状态</td>
							<td>创建时间</td>
							<td align="center">操作</td>
						</tr>
						<form id="formId" action="user/deleteUser.do" method="post">
							<c:forEach var="user" items="${uList }" varStatus="status">
								<tr id="data_${status.index }" align="center" class="main_trbg"
									style="background-color: ${status.index%2==0?'rgb(255, 255, 255)':'rgb(238, 204, 255)'};">
									<td><input type="checkbox" id="box_" name="check_box"
										value="${user.id }"></td>
									<td>${user.loginname }</td>
									<td>${user.password }</td>
									<td>${user.username }</td>
									<td>${user.status==1?"管理员":"普通用户" }</td>
									<td><fmt:formatDate pattern="yyyy年MM月dd日"
											value="${user.createdate }" /></td>
									<td align="center" width="40px;"><a
										href="user/showUpdateUser.jsp?id=${user.id }&username=${user.username}&loginname=${user.loginname}&status=${user.status}">修改</a>

									</td>

								</tr>
							</c:forEach>
						</form>
					</tbody>
				</table>
			</td>
		</tr>
		<!-- 分页标签 -->
		<tr valign="top">
			<td align="center" class="font3">
				<table width="100%" align="center" style="font-size: 13px;"
					class="digg">
					<tbody>
						<tr>
							<td
								style="COLOR: #0061de; MARGIN-RIGHT: 3px; PADDING-TOP: 2px; TEXT-DECORATION: none">

								<span id="prepage" class="${page.currentPage==1?'disabled':''}">上一页</span>
								<c:if test="${not empty page.pageStr}">
									<c:forTokens items="${page.pageStr}" delims="," var="str">
										<c:if test="${not(str>page.totalPage)}">
										 <c:choose>
											<c:when test="${str==page.currentPage}">
												<a  id="CP" style="background-color: red;">${str}</a>
											</c:when>
											<c:otherwise>
												<a  id="replacepage_${str}">${str}</a>
											</c:otherwise>
										</c:choose>
										</c:if>
									</c:forTokens>
								</c:if> <span id="nextpage"
								class="${page.currentPage==page.totalPage?'disabled':''}">下一页</span>
								共有${page.totalPage}页&nbsp;跳转到&nbsp;&nbsp;


								<form style="display: inline-block"
									action="user/userSeacher.do?username=${username }&status=${status}"
									id="jump_Form" method="post">
									<input type="text" id="currentPage" name="currentPage">
									<a id="pagejump">确定</a>
								</form>
						</tr>
						<tr align="center">
							<td style="font-size: 13px;"></td>
						</tr>
						<tr>
							<td
								style="COLOR: #0061de; MARGIN-RIGHT: 3px; PADDING-TOP: 2px; TEXT-DECORATION: none">总共
								<font color="red">${page.total}</font>条记录，当前显示${page.start+1}到${page.end}记录。

								<br>
							</td>
						</tr>
					</tbody>
				</table>
	</table>
	<div style="height: 10px;"></div>
</body>
</html>