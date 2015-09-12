<%
response.expires=-1

Dim datDate

if len(trim(request("Date"))) > 0 then
	datDate = trim(request("Date"))
	datCurDate = trim(request("Date"))
else
	datDate = Date()
	datCurDate = Date()
end if
intCurMonth = Month(datDate)
intCurYear = Year(datDate)
%>
<link rel="stylesheet" type="text/css" href="../css/main.css">
  <table class="calendar" border="0" cellpadding="0" cellspacing="0" width="183" id="AutoNumber1">
    <tr>
      <td class="topcalnav" width="181" height="21" colspan="7" align="center" style="vertical-align: middle;"><a class="pagenav" href="JavaScript:void(null);" onclick="showCalendar1('<%=DateAdd("m", -1, datCurDate)%>');" onFocus="if(this.blur)this.blur()" title="Previous Month">
      &lt;&lt;</a>&nbsp;&nbsp;<font face="Arial"><b><%=MonthName(intCurMonth)%>&nbsp;&nbsp;<%=intCurYear%></b></font>&nbsp;&nbsp;<a class="pagenav" href="JavaScript:void(null);" onclick="showCalendar1('<%=DateAdd("m", 1, datCurDate)%>');" onFocus="if(this.blur)this.blur()" title="Next Month">&gt;&gt;</a></td>
    </tr>
    <tr>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">S</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">M</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">T</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">W</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">T</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="border-right: 1px solid #FFFFFF; color:#ffffff; vertical-align: middle;">F</td>
      <td class="sm_caldays" width="25" height="25" bgcolor="#000000" align="center" style="color:#ffffff; vertical-align: middle;">S</td>
    </tr>
<%
function GetWeekdayMonthStartsOn(ByVal dAnyDayInTheMonth)
	dim dTemp
	Rem -Deduct (Day Of Month - 1) from date to Get the date on first day of Month
	dTemp = DateAdd("d", -(Day(dAnyDayInTheMonth) - 1), dAnyDayInTheMonth)
	GetWeekdayMonthStartsOn = WeekDay(dTemp)
end function

Select Case intCurMonth
	Case 4, 6, 9, 11
		intDays = 30
	Case 2
		If intCurYear mod 4 = 0 Then
			intDays = 29
		Else
			intDays = 28
		End If
	Case Else
		intDays = 31
End Select

iWeekday = GetWeekdayMonthStartsOn(CDate(Month(datDate) & "/1/" & Year(datDate)))

' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
if iWeekday <> 1 then
	iPosition = iWeekday
	Response.Write	"        <tr>" & vbNewLine & _
			"          <td class='sm_calblank' colspan=""" & iPosition - 1 & """ width=""" & (iPosition - 1) * 26 & """>&nbsp;</td>" & vbNewLine
end if

' -Write days of month in proper day slots
'Dim strReturnFunc, dCell, strClass, blnOnClick
iCurrent = 1
iPosition = iWeekday
'dDate = DateValue(dDate)
do while iCurrent <= intDays
	' If we're at the begginning of a row then write tr
	if iPosition = 1 then
		Response.Write	"        <tr>" & vbNewLine
	end if

	' If we're at the endof a row then write /tr
	if iPosition > 7 then
		Response.Write	"        </tr>" & vbNewLine
		iPosition = 1
	end if

	' Check if there are any .ics files for this date!

	Response.Write	"          <td class='sm_caldis' title=""" & WeekDayName(WeekDay(MonthName(intCurMonth) & " " & iCurrent & ", " & intCurYear)) & "  " & MonthName(intCurMonth) & " " & iCurrent & ", " & intCurYear & """ valign=""top"" align=""left"" width=""25"" height=""25"">" & vbNewLine
	if datCurDate =  cDate(intCurMonth & "/" & iCurrent & "/" & intCurYear) then
%>
			<font color="#000000"><b>&nbsp;<%=iCurrent%></b></font>
<%
	else
%> &nbsp;<%=iCurrent%>
<%
	end if

	Response.Write	vbNewLine
	Response.Write	"          </td>" & vbNewLine

	' -Increment variables
	iCurrent = iCurrent + 1
	iPosition = iPosition + 1
'	response.flush
loop

' Write spacer cells at beginning of first row if month doesn't start on a Sunday.
if iPosition-1 < 7 then
	Response.Write	"          <td class='sm_calblank' colspan=""" & 7 - (iPosition - 1) & """ width=""" & (7 - (iPosition - 1)) * 26 & """>&nbsp;</td>" & vbNewLine
	Response.Write	"        </tr>" & vbNewLine
end if
%>
  </table>