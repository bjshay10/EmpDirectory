<html>
<head>
<title>Employee Directory - Print By Location</title> 
	<CFINCLUDE template="EEDirInclude.cfm">
</head>

<! - - - get location info - - - >
<cfquery NAME="EEDirLoc" Datasource="EmployeeDirectory" DBTYPE="ODBC">
SELECT DISTINCT	LocNameLong, Address, ContactName, ContactPhone1, ContactPhone2
FROM			DirLoc
WHERE			LocNumber = '#form.GetLocation#'
</cfquery>
<!--- Old query keep for a bit 2/8/10
<! - - - get employee info - - - >
<cfquery NAME="EEDirName" Datasource="EmployeeDirectory" DBTYPE="ODBC">
SELECT		FirstName, LastName, FullAddress, Phone, Location, [Position], Subject, LocNumber, 
			FullName, LocPosSubj, Email, Address, CityState, Username
FROM		DirName, EEDirUsernames
WHERE		LocNumber = '#form.GetLocation#' and SSN *= SocSecNum
ORDER BY	LastName, FirstName 
</cfquery>--->
<!--- Getting Employee Informiation New 2/08/10 --->
<cfquery name="EEDirName2" datasource="NewEmpDirectory" dbtype="odbc">
SELECT	Lastname, firstname, homeaddress, Phonenumber, LONG_DESC, email, ifas_directory_loc_view.location, email, username, MI, Posdesc, subject
FROM	IFAS_Employee_Directory INNER JOIN IFAS_DIRECTORY_LOC_VIEW ON IFAS_EMPLOYEE_DIRECTORY.LOCATION = IFAS_DIRECTORY_LOC_VIEW.LOCATION
WHERE	ifas_directory_loc_view.Location = '#form.GetLocation#'
ORDER BY Lastname, Firstname
</cfquery>
<body>
<font face="Comic Sans MS">
<h4>
    <p align="right"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">District 51 Employee Directory - by Location</font></p>
</h4>
</font>

<! - - - display location info table - - - >

<font face="Comic Sans MS">
<table align="right" width="431" height="80" cellpadding="0" cellspacing="0" bordercolor="#000000">
  <font size="2"> 
  <tr> <cfoutput query="EEDirLoc"> 
    <tr> 
      <td align="right" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#LocNameLong#</font></td>
    </tr>
    <tr> 
      <td align="right" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#ContactName#</font></td>
    </tr>
    <tr>
      <td align="right" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#Address#</font></td>
    </tr>
    <tr> 
      <td align="right" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#ContactPhone1#</font></td>
	</tr>
	<tr>
      <td align="right" colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#ContactPhone2#</font></td>
    </tr>
  </cfoutput> </font> 
</table>
</font>

<h5> 
  <p align="right">&nbsp;</p>
  <p align="right">&nbsp;</p>
  <p align="right">&nbsp;</p>
  <p align="right">&nbsp;</p>
</h5>

<! - - - display employee info table - - - >

<p><font face="Comic Sans MS"> 
</font></p>
<div align="right">
  <table width="720" align="right">
    <tr> <cfoutput query="EEDirName2"> 
      <tr> 
        <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#LastName#, #Firstname# #MI#</strong></font></td>
        <cfif #Email# GT " ">
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Email#">#Email#</a></font></td>
          <cfelseif #Username# GT " ">
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Username#@d51schools.org">#Username#@d51schools.org</a></font></td>
          <cfelse>
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Email Address Unavailable</font></td>
        </cfif>
        <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#long_desc#,#posdesc#,#subject#</font></td>
      <tr> 
        <td><font size="1" face="Comic Sans MS">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif">#PhoneNumber#</font></font></td>
        <td colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#homeaddress#</font></td>
      </tr>
      <tr> </CFOUTPUT> 
  </table>
</div>
</body>
</html>