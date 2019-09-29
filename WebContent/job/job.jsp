<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="${pageContext.request.contextPath}/">
	<title>人事管理系统 ——职位管理</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
	<meta http-equiv="description" content="This is my page" />
	<link href="css/css.css" type="text/css" rel="stylesheet" />
	<link rel="stylesheet" type="text/css" href="js/ligerUI/skins/Aqua/css/ligerui-dialog.css"/>
	<link href="js/ligerUI/skins/ligerui-icons.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
	<script src="js/ligerUI/js/core/base.js" type="text/javascript"></script>
	<script src="js/ligerUI/js/plugins/ligerDrag.js" type="text/javascript"></script> 
	<script src="js/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
	<script src="js/ligerUI/js/plugins/ligerResizable.js" type="text/javascript"></script>
	<link href="css/pager.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		$(function(){
	 	   /** 获取上一次选中的部门数据 */
	 	   var boxs  = $("input[type='checkbox'][id^='box_']");
	 	   
	 	  /** 给全选按钮绑定点击事件  */
	    	$("#checkAll").click(function(){
	    		// this是checkAll  this.checked是true
	    		// 所有数据行的选中状态与全选的状态一致
	    		boxs.attr("checked",this.checked);
	    	})
	    	
	 	  /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
	    	$("tr[id^='data_0']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	})
	    	
	    	
	 	   /** 删除员工绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到用户选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的职位！");
	 		   }else{
	 			   /** 得到用户选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
	 			   
	 			   $.ligerDialog.confirm("确认要删除吗?","删除职位",function(r){
	 				   if(r){
	 					    alert("删除："+ids.get());
	 					   // 发送请求
	 					   window.location.href = "job/jobdelete.do?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   });
	 	  
	 	  
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
		function search_job(){
			var name=$("#name").val();
		  window.location.href="job/jobSearch.do?currentPage=1&name="+name;
		}
	</script>
</head>
<body>
	<!-- 导航 -->
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：职位管理 &gt; 职位查询</td>
		<td width="15" height="32"><img src="images/main_locright.gif" width="15" height="32"></td>
	  </tr>
	</table>
	
	<table width="100%" height="90%" border="0" cellpadding="5" cellspacing="0" class="main_tabbor">
	  <!-- 查询区  -->
	  <tr valign="top">
	    <td height="30">
		  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
		    <tr>
			  <td class="fftd">
			  	
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	职位名称：<input type="text"  name="name" id="name">
					    	 <input type="button" value="搜索" onclick="search_job()"/>
					    	<input id="delete" type="button" value="删除"/>
					    </td>
					  </tr>
					</table>
				
			  </td>
			</tr>
		  </table>
		</td>
	  </tr>
	  
	  <!-- 数据展示区 -->
	  <tr valign="top">
	    <td height="20">
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tbody><tr class="main_trbg_tit" align="center">
			  <td>选择<input type="checkbox" name="checkAll" id="checkAll"></td>
			  <td>职位名称</td>
			  <td>详细信息</td>
			  
			  <td align="center">操作</td>
			   
			</tr>
				<c:forEach var="job" items="${jobList }" varStatus="status">
				<tr id="data_0" align="center" class="main_trbg" style="background-color: rgb(255, 255, 255);">
					<td><input type="checkbox" id="box_${job.id }" name="check_box" value="${job.id }"></td>
					 <td>${job.name }</td>
					  <td>${job.remark}</td>
					  <!-- 2019/9/6 -->	
					 <td align="center" width="40px;"><a href="job/showUpdateJob.jsp?id=${job.id}&name=${job.name }&remark=${job.remark}">
							<img title="修改" src="images/update.gif"></a>
					  </td>
					  
				</tr>
				
				</c:forEach>
		  </tbody></table>
		</td>
	  </tr>
	  <!-- 分页标签 -->
	  <tr valign="top"><td align="center" class="font3">
	  	<table width="100%" align="center" style="font-size:13px;" class="digg">
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
									action="job/jobSearch.do?name=${name }"
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
	  </td></tr>
	</table>
	<div style="height:10px;"></div>
</body>
</html>