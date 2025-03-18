<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/fullpage.dwt.cfm" codeOutsideHTMLIsLocked="false" -->

<head>
  	<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
  <link rel="shortcut icon" href="https://www.mesa.k12.co.us/favicon.ico" />
	<link rel="stylesheet" type="text/css"  href="https://www.mesa.k12.co.us/css/text.css" />
   <link rel="stylesheet" type="text/css"  href="https://www.mesa.k12.co.us/css/main.css" />
   <!--[if lte IE 6]><link rel="stylesheet" type="text/css" href="../css/olderIESupport.css" />
<![endif]-->
	<link rel="stylesheet" type="text/css"  href="https://www.mesa.k12.co.us/css/print.css" media="print" />
 <script src="https://www.mesa.k12.co.us/scripts/main.js" type="text/javascript"></script>
	<script src="https://www.mesa.k12.co.us/SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
	<link href="https://www.mesa.k12.co.us/SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />

	<!-- InstanceBeginEditable name="doctitle" -->
<title>Employee Directory - Results By Name</title>
<!-- InstanceEndEditable -->

</head>

<body>
<div id="wrapper">
	<div id="headercontainer">
  	<div id="headerimages">
			<img src="https://www.mesa.k12.co.us/images/logo.jpg" align="left" alt="Mesa County Valley School District 51">
 			<cfinclude template="/2003/templates/components/rotatingphotos.cfm" />
		</div>
		<div id="headersprybar">
  		<cfinclude template="/2003/templates/components/sprybar.cfm" />
		</div> 
	</div>
<!---	<div id="headersearchbar">
		<cfinclude template="/2003/templates/components/searchbar.cfm" />	
   </div>--->
	<div id="maincontainer">
  	<div id="maincontentfull">
    		<span class="heading">
					<!-- InstanceBeginEditable name="PageTitle" -->Employee
          Directory 
    <!-- InstanceEndEditable -->
   	  	</span><br />
				 <!-- InstanceBeginEditable name="Content" --><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> 
</font><CFINCLUDE template="EEDirInclude.cfm">
<! - - - get employee info - - - >
<!---<cfquery name="EEDirName" datasource="EmployeeDirectory" dbtype="ODBC">
SELECT     FirstName, LastName, FullAddress, Phone, Location, [Position], Subject, Email, Username, EmpId
FROM       DirName, EEDirUsernames
WHERE      Upper(FirstName) Like '%#Ucase(form.FirstName)#%' and Upper(LastName) Like
			'%#Ucase(form.LastName)#%' 
				<cfif Form.position eq ''>
				<cfelse>
					AND Upper(Position) LIKE '%#Ucase(form.Position)#%'
				</cfif>
				<cfif Form.Subject eq ''>
				<cfelse>
					AND Upper(Subject) LIKE '%#Ucase(form.Subject)#%'
				</cfif>
			 and SSN *= SocSecNum
GROUP BY 	Lastname, Firstname, FullAddress, Phone, Location, [Position], Subject, Email, Username, EmpID
ORDER BY   LastName, FirstName
</cfquery>--->
<!--- Getting Employee Informiation New 2/08/10 --->
<cfquery name="EEDirName2" datasource="NewEmpDirectory" dbtype="odbc" result="tmpResult">
SELECT	Lastname, firstname, homeaddress, Phonenumber, locationdesc, email, location, email, username, MI, Posdesc, EmpID, subject
FROM	IFAS_Employee_Directory
WHERE	 Upper(FirstName) Like '%#Ucase(form.FirstName)#%' and Upper(LastName) Like
			'%#Ucase(form.LastName)#%' 
	<cfif Form.position eq ''>
    <cfelse>
        AND Upper(Posdesc) LIKE '%#Ucase(form.Position)#%'
    </cfif>
    <cfif Form.Subject eq ''>
    <cfelse>
        AND Upper(Subject) LIKE '%#Ucase(form.Subject)#%'
    </cfif>
ORDER BY Lastname, Firstname
</cfquery>
<center>
<font size="+1" color="#003399" face="Verdana, Arial, Helvetica, sans-serif"><strong>
 Results by Name</strong></font>
</center>
<div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"></font></div>
<font face="Verdana, Arial, Helvetica, sans-serif"><cfoutput>
    </cfoutput></font><font size="-1"><cfoutput>
        </cfoutput></font><cfoutput><form action="EEDirPrintByName.cfm" method="post" name="PrintVer" id="PrintVer">
	      <font size="-1">		  <font face="Verdana, Arial, Helvetica, sans-serif">
		  </font></font><font size="-1">
		  </font>
		  <tr><td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
		  <a href="javascript:PrintVer.submit()">click here for printable version</a></font><font face="Verdana, Arial, Helvetica, sans-serif"><a href="javascript:PrintVer.submit()"></a>
		<input name="FirstName" type="hidden" value="#form.FirstName#" />
		<input name="LastName" type="hidden" value="#form.LastName#" />
		</font></td></tr>
		<font face="Verdana, Arial, Helvetica, sans-serif">
	    </font>
	</form>
	</cfoutput>
</center></h5>
	
      <font face="Verdana, Arial, Helvetica, sans-serif">
      <! - - - display employee info table - - - >

      </font>
      <table width="680" border="1" align="center">

  <font size="2">
  <tr> 
  <font face="Verdana, Arial, Helvetica, sans-serif"><!---<CFOUTPUT query="EEDirName2"></CFOUTPUT>--->
    </font></tr>
	<cfif #tmpResult.RecordCount# eq 0>
    	<tr><td align="center">Search Returned No Results</td></tr>
    <cfelse>
	<CFOUTPUT query="EEDirName2"><tr> 
      <td height="21" valign="top" background="../images/BKgrey.jpg"><font color="##003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#LastName#</strong></font></td>
      <td valign="top" background="../images/BKgrey.jpg"><font color="##003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#FirstName#</strong></font></td>
      <td valign="top" background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#Location#</font></td>
      <td valign="top" background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#PosDesc#</font></td>
      <td valign="top" background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#Subject#</font></td>
	  </tr>
      <font face="Verdana, Arial, Helvetica, sans-serif">
      </font>
      <tr> 
      <td height="21" colspan="3" valign="top"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#HOmeaddress#</font></td>
      <td height="21" colspan="5" valign="top"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#PHoneNumber#</font></td>
    </tr>
      <font face="Verdana, Arial, Helvetica, sans-serif">
	  </font>
      <tr>	
	<cfif #Email# GT " ">
    	<td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Email#">#Email#</a></font></td>
	<cfelseif #Username# GT " ">
    	<td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Username#@d51schools.org">#Username#@d51schools.org</a></font></td>
	<cfelse>
    	<td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Email Address Unavailable</font></td>
	</cfif>
		<td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Employee ID: #EmpId#&nbsp;</font></td>
	</tr>
      <font face="Verdana, Arial, Helvetica, sans-serif">
	  </font>
	  </CFOUTPUT></cfif></font>
</table>

  <p>		<font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><center>Subs and seasonal staff are excluded from the
      directory</center></font></p>
  <!-- InstanceEndEditable --> 	
  	</div>
	 	<br class="clearfloat" />
  	<div id="footer" class="noprint">
  	<cfinclude template="/2003/templates/components/footer.cfm">
  </div>
</div>
</div>
  <!-- end #footer -->

<!-- end #container -->

</body>
<!-- InstanceEnd --></html>