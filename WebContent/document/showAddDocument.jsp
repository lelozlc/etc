<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<base href="${pageContext.request.contextPath}/">
		<title>人事管理系统 ——后台管理</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<link href="fkjava.ico" rel="shortcut icon" type="image/x-icon" />
		<link href="css/css.css" type="text/css" rel="stylesheet" />
		<script type="text/javascript" src="js/jquery-1.11.0.js"></script>
        <script type="text/javascript" src="js/jquery-migrate-1.2.1.js"></script>
		<script type="text/javascript" src="js/tiny_mce/tiny_mce.js"></script>
		<script type="text/javascript" src="js/jquery.form.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			var flag = $("#flag").val();
			if (flag == 1) {
				alert("添加成功");
			}
			if (flag == 2) {
				alert("添加失败");
			}
		});
	
	    $(document).ready(function() {
	        
	        /** 表单提交的校验 */
	        $("#btn").click(function(){
	        	var title = $("#title").val(); 
	            var file = $("#file").val();
	            var msg = "";
	        	if($.trim(title).length <= 2){
	        		
	        		alert("请输入两个字符以上的标题");
	        		return  false;
	        	}else if(!file){
	        		alert("请上传文档！");
	        		return false;
	        	}else{
	        		alert("已提交");
	        		$("#documentForm").submit();
	        	}
	        	
	        })
	    });
			
			
		</script>
	</head>
	<body>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
			 <tr><td height="10"></td></tr>
			 <tr>
			    <td width="15" height="32"><img src="images/main_locleft.gif" width="15" height="32"></td>
				<td class="main_locbg font2"><img src="images/pointer.gif">&nbsp;&nbsp;&nbsp;当前位置：文档管理  &gt; 上传文档
</td>
				<td width="15" height="32"><img src="images/main_locright.gif" width="15" height="32"></td>
			 </tr>
		</table>
	<form action="document/documentAdd.do" id="documentForm" enctype="multipart/form-data" method="post">
		<table width="100%" height="90%" border="0" cellpadding="10" cellspacing="0" class="main_tabbor">
		  	<tr valign="top">
			    <td>
			    
				 
                        <!-- 隐藏表单，flag表示添加标记 -->
    	 			<input type="hidden" id="flag" value="${param.msg}" /> 
				  <table width="100%" border="0" cellpadding="0" cellspacing="10" class="main_tab">
                        
					    <tr>
					    <td class="font3 fftd">
					      文档标题：<input type="text" name="title" size="30" id="title"/>
					     提交人：   <input type="text" name="username" readonly="readonly" value="${sessionScope.sess_user.username}"/>   
					     <input type="hidden" name="user_id"  value="${sessionScope.sess_user.id}"/>     
					   </td>
					                
					    </tr>
						<tr><td class="main_tdbor"></td></tr>
						
						
						<tr><td class="font3 fftd">文档描述：<br/>
							<textarea name="remark" cols="88" rows="11" id="content"></textarea>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						
							<tr><td class="font3 fftd">文档：<br/>
							<input type="file" name="file" id="file"  size="30"/>
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
						<tr><td class="font3 fftd">
								<input type="button" id="btn" value="上传">
								<input type="reset" value="重置">
						</td></tr>
						<tr><td class="main_tdbor"></td></tr>
				  </table>
				 
				</td>
		  	</tr>
		</table>
		</form>
		<div style="height:10px;"></div>
	</body>
</html>