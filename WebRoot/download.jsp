<%@ page language="java" pageEncoding="GBK"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>


<%
	//�����ļ�ҳ��
	SmartUpload down = new SmartUpload();
	//��ʼ������
	down.initialize(pageContext);
	
	//�õ������ļ���������
	String file =(String)request.getParameter("file");
	
	//���������ַ����� ����б�Ҫ
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
		System.out.println("�����ļ�ʧ��!<br>");
		out.println("�����ļ�ʧ��!<br>");
		out.println("����ԭ��<br>"+ex.toString());
	}
%>