<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import = "com.abc.pay.client.ebus.*" %>
<%@ page import = "com.abc.pay.client.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "test.*" %>
<% response.setHeader("Cache-Control", "no-cache"); %>
<%
	//²ÎÊýË¢ÐÂ
	MerchantParaFactory factoryDB = new MerchantParaFromDB();
	factoryDB.refreshConfig();

%>