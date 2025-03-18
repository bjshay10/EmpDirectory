<html>
<head>
<title>Employee Directory - Print by Name</title> 
	<CFINCLUDE template="EEDirInclude.cfm">
</head>

<! - - - get employee info - - - >
<!---<cfquery NAME="EEDirName" Datasource="EmployeeDirectory" DBTYPE="ODBC">
SELECT     Phone, Email, Username, FullName, LocPosSubj, Address, CityState, FullAddress
FROM       DirName, EEDirUsernames
WHERE      Upper(FirstName) Like '%#Ucase(form.FirstName)#%' and Upper(LastName) Like
			'%#Ucase(form.LastName)#%' and SSN *= SocSecNum
ORDER BY   FullName
</cfquery>--->

<!--- Getting Employee Informiation New 2/08/10 --->
<cfquery name="EEDirName2" datasource="NewEmpDirectory" dbtype="odbc">
SELECT	Lastname, firstname, homeaddress, Phonenumber, locationdesc, email, location, email, username, MI, Posdesc, EmpID, subject
FROM	IFAS_Employee_Directory 
WHERE	 Upper(FirstName) Like '%#Ucase(form.FirstName)#%' and Upper(LastName) Like
			'%#Ucase(form.LastName)#%'
ORDER BY Lastname, Firstname
</cfquery>

<body>
<p align="center"><strong><font face="Verdana, Arial, Helvetica, sans-serif">District 51 Employee Directory - by Name</font></strong></p>

<! - - - display employee info table - - - >

<div align="right">
  <table align="right" width="710">
    <tr> <cfoutput query="EEDirName2"> 
      <tr> 
        <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#lastname#, #firstname#</strong></font></td>
        <cfif #Email# GT " ">
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Email#">#Email#</a></font></td>
          <cfelseif #Username# GT " ">
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Username#@d51schools.org">#Username#@d51schools.org</a></font></td>
          <cfelse>
          <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">Email Address Unavailable</font></td>
        </cfif>
        <td><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#locationdesc#, #posdesc#, #subject#</font></td>
      <tr> 
        <td><font size="1" face="Comic Sans MS">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face="Verdana, Arial, Helvetica, sans-serif">#PhoneNumber#</font></font></td>
        <td colspan="2"><font size="1" face="Verdana, Arial, Helvetica, sans-serif">#HomeAddress#</font></td>
      </tr>
      <tr> </CFOUTPUT> 
  </table>
</div>
</body>
</html>