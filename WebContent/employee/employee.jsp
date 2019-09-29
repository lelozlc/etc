<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>人事管理系统 ——员工管理</title>
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
	$(document).ready(function() {
		var flag = $("#flag").val();
		if (flag == 1) {
			alert("查无此人");
		}
		if (flag == 2) {
			alert("修改成功");
		}
	});
	$(function() {
		/** 获取上一次选中的部门数据 */
		var boxs = $("input[type='checkbox'][id^='box_']");

		/** 给全选按钮绑定点击事件  */
		$("#checkAll").click(function() {
			// this是checkAll  this.checked是true
			// 所有数据行的选中状态与全选的状态一致
			boxs.attr("checked", this.checked);
		})

		/** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
		$("tr[id^='data_']").hover(function() {
			$(this).css("backgroundColor", "#eeccff");
		}, function() {
			$(this).css("backgroundColor", "#ffffff");
		})

		/** 删除员工绑定点击事件 */
		$("#delete")
				.click(
						function() {
							/** 获取到用户选中的复选框  */
							var checkedBoxs = boxs.filter(":checked");
							if (checkedBoxs.length < 1) {
								$.ligerDialog.error("请选择一个需要删除的员工！");
							} else {
								/** 得到用户选中的所有的需要删除的ids */
								var ids = checkedBoxs.map(function() {
									return this.value;
								})

								$.ligerDialog
										.confirm(
												"确认要删除吗?",
												"删除员工",
												function(r) {
													if (r) {
														alert("删除：" + ids.get());

														window.location = "employee/deleteEmployee.do?ids="
																+ ids.get();
													}
												});
							}
						});
		//输入页数跳转
		$("#pagejump").click(function() {
			var currentPage = parseInt($("#LASTPAGE").val());
			$("#currentPage").attr("value", currentPage);
			$("#searchForm").sAubmit();

		})

		//标签跳转
		$("a[id^='replacepage_'").click(function() {
			var page = $(this).text();
			$("#currentPage").attr("value", page);
			$("#searchForm").submit();
		});

		//上一页
		$("#prepage").click(function() {
			var currentPage = parseInt($("#CP").text());
			currentPage -= 1;
			$("#currentPage").attr("value", currentPage);
			$("#searchForm").submit();
		});
		//下一页
		$("#nextpage").click(function() {
			var currentPage = parseInt($("#CP").text());
			currentPage += 1;
			$("#currentPage").attr("value", currentPage);
			$("#searchForm").submit();
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
			<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理
				&gt; 员工查询</td>
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
							<form action="employee/employeeSearch.do" id="searchForm">
								<input type="hidden" id="flag" value="${param.msg}" /> 
								<input type="hidden" id="currentPage" name="currentPage" value="1">
								<table width="100%" border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td class="font3">职位： <select name="job.id" id="jobid"
											style="width: 143px;">
												<option value="0" ${job.id==0?"selected":""}>--请选择职位--</option>
												<c:forEach items="${jobList}" var="job">
													<option value="${job.id }"
														${lastemployee.job.id==job.id?"selected":"" }>${job.name }</option>
												</c:forEach>
										</select> 姓名：<input type="text" name="name" id="name"
											value="${lastemployee.name}"> 身份证号码：<input
											type="text" name="cardId" maxlength="18"
											value="${lastemployee.cardId}">
										</td>
									</tr>
									<tr>
										<td class="font3">性别： <select name="sex"
											style="width: 143px;">
												<option value="0" ${lastemployee.sex==0?"selected":"" }>--请选择性别--</option>
												<option value="1" ${lastemployee.sex==1?"selected":"" }>男</option>
												<option value="2" ${lastemployee.sex==2?"selected":"" }>女</option>
										</select> 手机：<input type="text" name="phone"
											value="${lastemployee.phone}"> 所属部门：<select
											name="dept.id" id="deptid" style="width: 100px;">
												<option value="0" ${dept.id==0?"selected":""}>--部门选择--</option>
												<c:forEach items="${deptList }" var="dept">
													<option value="${dept.id}"
														${lastemployee.dept.id==dept.id?"selected":"" }>${dept.name }</option>
												</c:forEach>
										</select>&nbsp; <input type="submit" value="搜索" /> <input id="delete"
											type="button" value="删除" />
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
							<td>选择<input type="checkbox" name="checkAll" id="checkAll"></td>

							<td>姓名</td>
							<td>性别</td>
							<td>手机号码</td>
							<td>邮箱</td>
							<td>学历</td>
							<td>身份证号码</td>
							<td>部门</td>
							<td>职位</td>
							<td>联系地址</td>
							<td>建档日期</td>

							<td align="center">操作</td>

						</tr>
						<c:forEach var="employee1" items="${employeelist }">
							<tr id="data_0" class="main_trbg" align="center"
								style="background-color: rgb(255, 255, 255);">
								<td><input type="checkbox" id="box_${employee1.id}"
									value="${employee1.id}"></td>
								<td>${employee1.name}</td>
								<td>${employee1.sex==1?"男":"女"}</td>
								<td>${employee1.phone}</td>
								<td>${employee1.email}</td>
								<td>${employee1.education}</td>
								<td>${employee1.cardId}</td>
								<td>${employee1.dept.name}</td>
								<td>${employee1.job.name}</td>
								<td>${employee1.address}</td>
								<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${employee1.createtime}" /></td>
								<td align="center" width="40px;"><a
									href="employee/searchEmployeeById.do?id=${employee1.id }">
										<img title="修改" src="images/update.gif">
								</a></td>
							</tr>
						</c:forEach>
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
													<a id="CP" style="background-color: red;">${str}</a>
												</c:when>
												<c:otherwise>
													<a id="replacepage_${str}">${str}</a>
												</c:otherwise>
											</c:choose>
										</c:if>
									</c:forTokens>
								</c:if> <span id="nextpage"
								class="${page.currentPage==page.totalPage?'disabled':''}">下一页</span>
								共有${page.totalPage}页&nbsp;跳转到&nbsp;&nbsp; <!-- 跳转框 --> <input
								type="text" id="LASTPAGE" name="LASTPAGE"> <a
								id="pagejump">确定</a>
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
			</td>
		</tr>
	</table>

	<div style="height: 10px;"></div>
</body>
</html>