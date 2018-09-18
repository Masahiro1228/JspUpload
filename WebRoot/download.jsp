<%@ page language="java" pageEncoding="GBK"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>


<%
	//下载文件页面
	SmartUpload down = new SmartUpload();
	//初始化环境
	down.initialize(pageContext);
	
	//得到下载文件参数名称
	String file =(String)request.getParameter("file");
	
	//重新设置字符编码 如果有必要
	//file = new String(file.getBytes("ISO8859_1-1"),"GBK");

		try{			
			down.setContentDisposition(null);
			String descFileName = file;
			byte[] b = descFileName.getBytes();
			char[] c = new char[b.length];
			for (int x = 0; x < b.length; x++)c[x] = (char) (b[x] & 0x00FF);
			descFileName = new String(c);
			down.downloadFile("upload/"+file,"text/xml/txt",descFileName);
			out.clear();
			out = pageContext.pushBody();
	}catch(Exception ex){
		System.out.println("下载文件失败!<br>");
		out.println("下载文件失败!<br>");
		out.println("错误原因：<br>"+ex.toString());
	}
%>