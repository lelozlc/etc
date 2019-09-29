<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
<title>人事管理系统——修改员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/css.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="js/ligerUI/skins/Aqua/css/ligerui-dialog.css">
<link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
<script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerDialog.js"
	type="text/javascript"></script>
<script src="js/ligerUI/js/plugins/ligerResizable.js"
	type="text/javascript"></script>
<link href="css/pager.css" type="text/css" rel="stylesheet">
<script language="javascript" type="text/javascript"
	src="js/My97DatePicker/WdatePicker.js"></script>
<link href="js/My97DatePicker/skin/WdatePicker.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
$(document).ready(function() {
	var flag = $("#flag").val();
	if (flag == 1) {
		alert("修改失败");
	}
});
    $(function(){
		// 控制文档加载完成以后 选中性别 

		/** 员工表单提交 */
		$("#update").click(function(){
		var name = $("#name");
		var cardId = $("#cardId");
		var education = $("#education");
		var email = $("#email");
		var phone = $("#phone");
		var tel = $("#tel");
		var party = $("#party");
		var qqNum = $("#qqNum");
		var address = $("#address");
		var postCode = $("#postCode");
		var birthday = $("#birthday");
		var race = $("#race");
		var speciality = $("#speciality");
		var hobby = $("#hobby");
		var msg = "";
		if ($.trim(name.val()) == "") {
			msg = "姓名不能为空！";
			name.focus();
		} else if ($.trim(cardId.val()) == "") {
			msg = "身份证号码不能为空！";
			cardId.focus();
		} else if (!/^[1-9]\d{16}[0-9A-Za-z]$/.test($.trim(cardId.val()))) {
			msg = "身份证号码格式不正确！";
			cardId.focus();
		} else if ($.trim(education.val()) == "") {
			msg = "学历不能为空！";
			education.focus();
		} else if ($.trim(email.val()) == "") {
			msg = "邮箱不能为空！";
			email.focus();
		} else if (!/^\w+@\w{2,3}\.\w{2,6}$/.test($.trim(email.val()))) {
			msg = "邮箱格式不正确！";
			email.focus();
		} else if ($.trim(phone.val()) == "") {
			msg = "手机号码不能为空！";
			phone.focus();
		} else if (!/^1[3|5|8]\d{9}$/.test($.trim(phone.val()))) {
			msg = "手机号码格式不正确！";
			phone.focus();
		} else if ($.trim(tel.val()) == "") {
			msg = "电话号码不能为空！";
			tel.focus();
		} else if (!/^0\d{2,3}-?\d{7,8}$/.test($.trim(tel.val()))) {
			msg = "电话号码格式不正确！";
			tel.focus();
		} else if ($.trim(party.val()) == "") {
			msg = "政治面貌不能为空！";
			party.focus();
		} else if ($.trim(qqNum.val()) == "") {
			msg = "QQ号码不能为空！";
			qqNum.focus();
		} else if (!/^\d{6,}$/.test($.trim(qqNum.val()))) {
			msg = "QQ号码格式不正确！";
			qqNum.focus();
		} else if ($.trim(address.val()) == "") {
			msg = "地址不能为空！";
			address.focus();
		} else if ($.trim(postCode.val()) == "") {
			msg = "邮政编码不能为空！";
			postCode.focus();
		} /* else if (!/^[1-9]\d{5}$/.test($.trim(postCode.val()))) {
			msg = "邮政编码格式不正确！";
			postCode.focus();
		} */ else if ($.trim(birthday.val()) == "") {
			msg = "出生日期不能为空！";
			birthday.focus();
		} else if (!birthday.val()) {
			//					!/^\d{4}-\d{2}-\d{2}$/.test($.trim(birthday.val()))
			msg = "出生日期格式不正确！";
			birthday.focus();
		} else if ($.trim(race.val()) == "") {
			msg = "民族不能为空！";
			race.focus();
		} else if ($.trim(speciality.val()) == "") {
			msg = "专业不能为空！";
			speciality.focus();
		} else if ($.trim(hobby.val()) == "") {
			msg = "爱好不能为空！";
			hobby.focus();
		}
		if (msg != "") {
			$.ligerDialog.error(msg);
			return false;
		} else {
			alert("正在提交");
			$("#employeeForm").submit();
			return true;
		}
		
		});
	})
</script>
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tbody>
			<tr>
				<td height="10"></td>
			</tr>
			<tr>
				<td width="15" height="32"><img src="images/main_locleft.gif"
					width="15" height="32"></td>
				<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：员工管理
					&gt; 修改员工</td>
				<td width="15" height="32"><img src="images/main_locright.gif"
					width="15" height="32"></td>
			</tr>
		</tbody>
	</table>
	<form action="employee/employeeUpdate.do" id="employeeForm">
		<table width="100%" height="90%" border="0" cellpadding="5"
			cellspacing="0" class="main_tabbor">
			<tbody>
				<tr valign="top">
					<td>
										<!-- 隐藏表单，flag表示添加标记 --> <input type="hidden" id="flag"
										value="${param.msg}"> <input type="hidden" name="id"
										value="${param.id }">
										<table width="100%" border="0" cellpadding="0"
											cellspacing="10" class="main_tab">
											<tbody>
												<tr>
													<td class="font3 fftd">
														<table>
															<tbody>
																<tr>
																	<td class="font3 fftd">姓名：<input type="text"
																		name="name" id="name" size="20"
																		value="${getemployee.name}"></td>
																	<td class="font3 fftd">身份证号码：<input type="text"
																		name="cardId" id="cardId" size="20"
																		value="${getemployee.cardId}"></td>
																</tr>
																<tr>
																	<td class="font3 fftd">性别： <select name="sex"
																		style="width: 143px;">
																			<option value="1" ${getemployee.sex==1?"selected":"" }>男</option>
																			<option value="2" ${getemployee.sex==2?"selected":"" }>女</option>
																	</select>
																	</td>
																	<td class="font3 fftd">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位：
																		<select name="job.id" id="jobid" style="width: 143px;">
																			<c:forEach items="${jobList}" var="job">
																				<option value="${job.id }"
																					${getemployee.job.id==job.id?"selected":"" }>${job.name }</option>
																			</c:forEach>
																	</select>
																	</td>
																</tr>
																<tr>
																	<td class="font3 fftd">学历：<input name="education"
																		id="education" size="20"
																		value="${getemployee.education}"></td>
																	<td class="font3 fftd">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：<input
																		name="email" id="email" size="20"
																		value="${getemployee.email}"></td>
																</tr>
																<tr>
																	<td class="font3 fftd">手机：<input name="phone"
																		id="phone" size="20" value="${getemployee.phone}"></td>
																	<td class="font3 fftd">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话：<input
																		name="tel" id="tel" size="20"
																		value="${getemployee.tel}"></td>
																</tr>

															</tbody>
														</table>
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td class="font3 fftd">政治面貌：<input name="party"
														id="party" size="40" value="${getemployee.party}">&nbsp;&nbsp;
														QQ&nbsp;&nbsp;号码：<input name="qqNum" id="qqNum" size="20"
														value="${getemployee.qqNum}">
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td class="font3 fftd">联系地址：<input name="address"
														id="address" size="40" value="${getemployee.address}">&nbsp;&nbsp;
														邮政编码：<input name="postCode" id="postCode" size="20"
														value="${getemployee.postCode}">
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td class="font3 fftd">出生日期：<input class="Wdate"
														value="<fmt:formatDate pattern='yyyy-MM-dd' value='${getemployee.createtime}'/>"  name="birthday" id="birthday" size="40"/>&nbsp;&nbsp;
														民&nbsp;&nbsp;&nbsp;&nbsp;族：<input name="race" id="race"
														size="20" value="${getemployee.race}">
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td class="font3 fftd">所学专业：<input name="speciality"
														id="speciality" size="40"
														value="${getemployee.speciality}">&nbsp;&nbsp;
														爱&nbsp;&nbsp;&nbsp;&nbsp;好：<input name="hobby" id="hobby"
														size="20" value="${getemployee.hobby}">
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td class="font3 fftd">备&nbsp;&nbsp;&nbsp;&nbsp;注：<input
														name="remark" id="remark" size="40"
														value="${getemployee.remark}"> &nbsp;&nbsp;所属部门： <select
														name="dept.id" id="deptid" style="width: 100px;">
															<c:forEach items="${deptList }" var="dept">
																<option value="${dept.id}"
																	${getemployee.dept.id==dept.id?"selected":"" }>${dept.name }</option>
															</c:forEach>
													</select>
													</td>
												</tr>
												<tr>
													<td class="main_tdbor"></td>
												</tr>

												<tr>
													<td align="left" class="fftd"><input type="button"
														id="update" value="修改">&nbsp;&nbsp;<input
														type="reset" value="取消 "></td>
												</tr>
											</tbody>
										</table>

					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<div style="height: 10px;"></div>

</body>
</html>