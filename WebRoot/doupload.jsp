<%@ page language="java" pageEncoding="GBK"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="com.jspsmart.upload.Request"%>
<%@page import="simon.MyPathUtil"%>
<%@page import="simon.UploadDao"%>


<html>
	<head>
		<title>My JSP 'doupload.jsp' starting page</title>
	</head>
	<body>
		<%
			//创建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			//上传初始化
			su.initialize(pageContext);
			//设定上传限制  每个上传文件的最大长度
			su.setMaxFileSize(1000000000);

			//限制总上传数据的总长度
			su.setTotalMaxFileSize(2000000000);

			//允许上传的文件 通过扩展名限制  
			su.setAllowedFilesList("jpg,rar,dmp,gif,png,ppt");

			boolean sign = true;

			try {
				//设定禁止上传的文件 通过扩展名限制
				su.setDeniedFilesList("exe,bat,jsp,html,htm");
				//上传文件
				su.upload();
				//创建自己的Request 对象
				Request myRequest = su.getRequest();
				//得到名称
				String name = myRequest.getParameter("name");	
				//得到文件后缀
				String ext = su.getFiles().getFile(0).getFileExt();
				//组成自定义的文件名称
				MyPathUtil util = new MyPathUtil();
				String fileName = util.getIPTimeRand()+"."+ext;
				//得到文本内容
				String content = myRequest.getParameter("content");
				//得到文件大小
				int longSize= su.getSize();
				//将上传文件保存到指定目录
				 // 保存文件
   				su.getFiles().getFile(0).saveAs(getServletContext().getRealPath("/") +"upload//"+fileName) ;
				
				UploadDao dao = new UploadDao();
				int res = dao.addFile(name,fileName,longSize,content);
				
				if(res<=0){
					sign=false;
				}
				
			} catch (Exception e) {
				sign = false;
			}
			
			if(sign){
				out.println("<script>alert('上传成功！');</script>");
			}else{
				out.println("<script>alert('上传失败！');</script>");
			}
			out.println("<script>location.href='index.jsp';</script>");
		%>
	</body>
</html>
