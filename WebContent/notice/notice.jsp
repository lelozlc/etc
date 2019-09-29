<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="${pageContext.request.contextPath}/">
	<title>人事管理系统 ——公告管理</title>
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
	$(document).ready(function() {
		var flag = $("#flag").val();
		if (flag == 1) {
			alert("删除成功");
		}
		if (flag == 2) {
			alert("删除失败");
		}
		if (flag == 3) {
			alert("修改成功");
		}
	});
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
	    	$("tr[id^='data_']").hover(function(){
	    		$(this).css("backgroundColor","#eeccff");
	    	},function(){
	    		$(this).css("backgroundColor","#ffffff");
	    	})
	    	
	    	
	 	   /** 删除公告绑定点击事件 */
	 	   $("#delete").click(function(){
	 		   /** 获取到公告选中的复选框  */
	 		   var checkedBoxs = boxs.filter(":checked");
	 		   if(checkedBoxs.length < 1){
	 			   $.ligerDialog.error("请选择一个需要删除的公告！");
	 		   }else{
	 			   /** 得到公告选中的所有的需要删除的ids */
	 			   var ids = checkedBoxs.map(function(){
	 				   return this.value;
	 			   })
	 			   
	 			   $.ligerDialog.confirm("确认要删除吗?","删除公告",function(r){
	 				   if(r){
	 					   window.location = "notice/removeNotice.do?ids=" + ids.get();
	 				   }
	 			   });
	 		   }
	 	   })
		
		/** 给预览绑定点击事件 */
		$("a[id^='prev_'").click(function(){
			 var noticeId = this.id.replace('prev_',''); 
			var noticetitle=$("#noticetitle_"+noticeId);
			var noticecontent=$("#noticecontent_"+noticeId);
			$.ligerDialog.open({ 
				title:'预览公告',
				height: 500, 
				url: 'notice/previewNotice.jsp?title='+noticetitle.text()+'&content='+noticecontent.text(), 
				width: 750, 
				showMax: true, 
				showToggle: true, 
				showMin: true, 
				isResize: true, 
				slide: false 
				});
		});
		
	    	//输入页数跳转
			$("#pagejump").click(function() {
				var currentPage = parseInt($("#LASTPAGE").val());
				$("#currentPage").attr("value", currentPage);
				$("#searchForm").submit();

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
	  <tr><td height="10"></td></tr>
	  <tr>
	    <td width="15" height="32"><img src="images/main_locleft.gif" width="15" height="32"></td>
		<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：公告管理 &gt; 公告查询</td>
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
			  	<form action="notice/noticeSearch.do" method="post" id="searchForm">
			  	<input type="hidden" id="flag" value="${param.msg}" /> 
			  	<input type="hidden" id="currentPage" name="currentPage" value="1">
				    <table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr>
					    <td class="font3">
					    	公告名称：<input type="text" name="title">
					    	公告内容：<input type="text" name="content">
					    	 <input type="submit" value="搜索"/>
					    	<input id="delete" type="button" value="删除"/>
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
		  <table width="100%" border="1" cellpadding="5" cellspacing="0" style="border:#c2c6cc 1px solid; border-collapse:collapse;">
		    <tbody><tr class="main_trbg_tit" align="center">
			  <td><input type="checkbox" name="checkAll" id="checkAll"></td>
			  <td>公告名称</td>
			  <td>公告内容</td>
			  <td>创建时间</td>
			  <td>公告人</td>
			  
			  <td>操作</td>
			   
			  <td>预览</td>
			</tr>
			<c:forEach var="notice" items="${noticelist }" varStatus="status">
				<tr id="data_0" align="center" class="main_trbg" style="background-color: rgb(255, 255, 255);">
					<td><input type="checkbox" id="box_${notice.id }" value="${notice.id }"></td>
					 <td ><a id="noticetitle_${notice.id}">${notice.title }</a></td>
					  <td ><a id="noticecontent_${notice.id}">${notice.content }</a></td>
					  <td><fmt:formatDate pattern="yyyy年MM月dd日" value="${notice.create_date }"/></td>
					  <td>${notice.user.username} </td>
					  
					 <td align="center" width="40px;"><a href="notice/showUpdateNotice.jsp?title=${notice.title }&content=${notice.content }&id=${notice.id }">
							<img title="修改" src="images/update.gif"></a>
					  </td>
					   
					  <td align="center" width="40px;"><a href="javascript:void(0)" id="prev_${notice.id }">
							<img title="预览" src="images/prev.gif"></a>
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
	</table>
	<div style="height:10px;"></div>
</body>
</html>