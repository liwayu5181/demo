<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import = "com.abc.pay.client.ebus.*" %>
<%@ page import = "com.abc.pay.client.*" %>
<%@ page import = "java.util.LinkedHashMap" %>
<%response.setHeader("Cache-Control", "no-cache"); 
request.setCharacterEncoding("GBK");
%>
<HTML>
<HEAD><TITLE>农行网上支付平台-商户接口范例-授权支付签约确认</TITLE></HEAD>
<BODY BGCOLOR='#FFFFFF' TEXT='#000000' LINK='#0000FF' VLINK='#0000FF' ALINK='#FF0000'>
<CENTER>授权支付签约确认<br>
<%
         //1、生成授权支付签约确认请求对象
        QuickAgentSignConfirm tRequest = new QuickAgentSignConfirm();
        tRequest.dicRequest.put("OrderNo", request.getParameter("txtOrderNo"));           //订单编号（必要信息）
        tRequest.dicRequest.put("VerifyCode", request.getParameter("txtVerifyCode"));     //验证码（必要信息）

        //2、传送授权支付签约确认请求
        JSON json = tRequest.postRequest();
        String ReturnCode = json.GetKeyValue("ReturnCode");
        String ErrorMessage = json.GetKeyValue("ErrorMessage");
        if (ReturnCode.equals("0000"))
        {
            //3、授权支付签约确认请求提交成功
            out.println("ReturnCode   = [" + ReturnCode + "]<br/>");
            out.println("ErrorMessage = [" + ErrorMessage + "]<br/>");
            out.println("TrxType   = [" + json.GetKeyValue("TrxType") + "]<br/>");
            out.println("OrderNo = [" + json.GetKeyValue("OrderNo") + "]<br/>");
            out.println("AgentSignNo = [" + json.GetKeyValue("AgentSignNo") + "]<br/>");
        }
        else
        {
            //4、授权支付签约请求提交失败，商户自定后续动作
            out.println("ReturnCode   = [" + ReturnCode + "]<br/>");
            out.println("ErrorMessage = [" + ErrorMessage + "]<br/>");
        }
%>
<a href='Merchant.html'>回商户首页</a></CENTER>
</BODY></HTML>