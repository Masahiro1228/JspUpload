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
			//����һ��SmartUpload����
			SmartUpload su = new SmartUpload();
			//�ϴ���ʼ��
			su.initialize(pageContext);
			//�趨�ϴ�����  ÿ���ϴ��ļ�����󳤶�
			su.setMaxFileSize(1000000000);

			//�������ϴ����ݵ��ܳ���
			su.setTotalMaxFileSize(2000000000);

			//�����ϴ����ļ� ͨ����չ������  
			su.setAllowedFilesList("jpg,rar,dmp,gif,png,ppt");

			boolean sign = true;

			try {
				//�趨��ֹ�ϴ����ļ� ͨ����չ������
				su.setDeniedFilesList("exe,bat,jsp,html,htm");
				//�ϴ��ļ�
				su.upload();
				//�����Լ���Request ����
				Request myRequest = su.getRequest();
				//�õ�����
				String name = myRequest.getParameter("name");	
				//�õ��ļ���׺
				String ext = su.getFiles().getFile(0).getFileExt();
				//����Զ�����ļ�����
				MyPathUtil util = new MyPathUtil();
				String fileName = util.getIPTimeRand()+"."+ext;
				//�õ��ı�����
				String content = myRequest.getParameter("content");
				//�õ��ļ���С
				int longSize= su.getSize();
				//���ϴ��ļ����浽ָ��Ŀ¼
				 // �����ļ�
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
				out.println("<script>alert('�ϴ��ɹ���');</script>");
			}else{
				out.println("<script>alert('�ϴ�ʧ�ܣ�');</script>");
			}
			out.println("<script>location.href='index.jsp';</script>");
		%>
	</body>
</html>
