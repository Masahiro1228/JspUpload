<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@page import="simon.UploadDao"%>
<%@page import="simon.MyFile"%>
<html>
  <head>
    <title>��ʾ���е�������Դ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="css/styles.css">
  </head>
  <body>
   	<div id="mainDiv">
   		<h3 align="center">��Դ����ҳ��</h3>
   		<form action="dosearch.jsp" method="post" name="myform">
   			<div style="display:inline;margin-right:650px;">
   				<a href="index.jsp">�ϴ���Դ</a>
   			</div>
   			
   		</form>
   		<hr>
   		<%
   			UploadDao dao = new UploadDao();
   			ArrayList<MyFile> list = dao.getAlList();
   			
   			
   		 %>
   		<table width="80%" align="center" border="0" padding="2">
   			<tr>
   				<td width="5%">���</td>
   				<td width="15%">����<td>
   				<td width="40%">����</td>
   				<td width="10%">��С</td>
   				<td width="20%">�ϴ�ʱ��</td>
   				<td width="10%">&nbsp;</td>
   			</tr>
   		<%
   				for(int i=0;i<list.size();i++){
   					MyFile file = list.get(i);
   		%>
   			<tr>
   				<td width="5%"><%=i+1 %></td>
   				<td width="20%"><%=file.getName() %><td>
   				<td width="40%"><%=file.getNote() %> </td>
   				<td width="5%"><%=file.getSize()/1024 %> KB</td>
   				<td width="20%"><%=file.getUploadTime() %></td>
   				<td width="10%">
   					<a href="download.jsp?file=<%=file.getThePath()%>">����</a>
   				</td>
   			</tr>
   		<%
   				}
   		 %>
   		</table>
   	</div>
  </body>
</html>