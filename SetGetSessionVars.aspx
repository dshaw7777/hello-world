<%@ Page Language="vb" Debug="true" AutoEventWireup="false" CodeBehind="Skyword-Consume-XML-Feed.aspx.vb" %>
<%@ Import Namespace="system.xml" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Get Set Session Variable AJAX Example</title>
	<script language="javascript" type="text/javascript">
	function setSessionVar() {

		xmlHttp=GetXmlHttpObject()

		if (xmlHttp==null) {
			alert ("Your browser does not support AJAX!");
			return;
		}

		var url="SetSessionVar.aspx";
		url=url+"?value=" + document.getElementById('value').value;

		xmlHttp.onreadystatechange=stateChangedSessionVar;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}
	function getSessionVar() {

		xmlHttp=GetXmlHttpObject()

		if (xmlHttp==null) {
			alert ("Your browser does not support AJAX!");
			return;
		}

		var url="GetSessionVar.aspx";

		xmlHttp.onreadystatechange=stateChangedSessionVar;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	}

	function stateChangedSessionVar() {

		if (xmlHttp.readyState==4) {
			var strResponse = xmlHttp.responseText;

			var resp = document.getElementById('response');
			resp.innerHTML = strResponse;
		}
	}

	function GetXmlHttpObject() {
	var xmlHttp=null;

		try {
			// Firefox, Opera 8.0+, Safari
			xmlHttp=new XMLHttpRequest();
		}
		catch (e) {
			// Internet Explorer
			try {
				xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
			}
			catch (e) {
				xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
		}

		return xmlHttp;

	}
	</script>
</head>
<body style="padding:30px;">
    <form id="form1" runat="server">
    <input type="text" size="50" id="value" />
    <input type="button" value="Set Value" onclick="setSessionVar();"/>
    <input type="button" value="Get Value" onclick="getSessionVar();"/>
    <div id="response" style="margin-top:30px;">
    </div>
    </form>
</body>
</html>
