function showCalendar1() {

	xmlHttpCal=GetXmlHttpObject()

	if (xmlHttpCal==null) {
		alert ("Your browser does not support AJAX!");
		return;
	}

	var url="Calendar.asp";
	url=url+"?Date=" + document.schedules.Date.value;

	xmlHttpCal.onreadystatechange=stateChangedCalendar1;
	xmlHttpCal.open("GET",url,true);
	xmlHttpCal.send(null);
}

function stateChangedCalendar1() {

	if (xmlHttpCal.readyState==4) {
		var strResponse = xmlHttpCal.responseText;

		var cal = document.getElementById('Calendar1');
		cal.innerHTML = strResponse;
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
