<%@ page language="java" pageEncoding="GBK"%>

<html>
	<head>
		<title>上传下载页面</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/styles.css">
	</head>
	<body>
		<div id="mainDiv">
			<h3 align="center">My upload and download</h3>
			<div style="text-align:right"><a href="showall.jsp">查看已上传文件</a></div>
			<hr>
			<form action="doupload.jsp" name="myform" method="post" enctype="multipart/form-data">
				<table width="50%" border="0" align="center">
					<tr>
						<td>
							Name:
						</td>
						<td>
							<input type="text" name="name" class="normalTxt">
							(允许上传的文件:doc,txt,jpg,rar,xls,gif,png,ppt)
						</td>
					</tr>
					<tr>
						<td>
							Path:
						</td>
						<td>
							<input type="file" name="path" class="longTxt">
						</td>
					</tr>
					<tr>
						<td>
							Note:
						</td>
						<td>
							<textarea rows="3" cols="52" name="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="normalBtn" value="确定">
							<input type="reset" class="normalBtn" value="重置">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</body>
</html>
