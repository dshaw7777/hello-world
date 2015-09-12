<%@ Page Language="C#" EnableViewState="false" AutoEventWireup="true" %>
<%
Session["Value"] = Request["value"];
Response.Write("Success");
%>
