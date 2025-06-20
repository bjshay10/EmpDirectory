<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/fullpage.dwt.cfm" codeOutsideHTMLIsLocked="false" -->

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
<title>Employee Directory - Results By Location</title>
<!-- InstanceEndEditable -->

</head>

<body>
<div id="wrapper">
	<div id="headercontainer">
  	<div id="headerimages"> <a href="https://www.d51schools.org"><img src="https://www.mesa.k12.co.us/images/logo.jpg" align="left" alt="Mesa County Valley School District 51"></a>
 <!---			<cfinclude template="/2003/templates/components/rotatingphotos.cfm" />--->
		</div>
		<div id="headersprybar">
  		<!---<cfinclude template="/2003/templates/components/sprybar.cfm" />--->
		</div> 
	</div>
<!---	<div id="headersearchbar">
		<cfinclude template="/2003/templates/components/searchbar.cfm" />	
   </div>--->
	<div id="maincontainer">
  	<div id="maincontentfull">
    <main>
    	<h1><span class="heading"> 
					<!-- InstanceBeginEditable name="PageTitle" -->Employee
          Directory<!-- InstanceEndEditable -->
   	  	</span></h1>
				 <!-- InstanceBeginEditable name="Content" -->
  <cfinclude template="EEDirInclude.cfm">
  <! - - - get location info - - - >
  <!--- Keep Old
  <cfquery name="EEDirLoc" datasource="EmployeeDirectory" dbtype="ODBC">
SELECT DISTINCT LocNameLong, Address, ContactName, ContactPhone1, ContactPhone2
FROM DirLoc WHERE	LocNumber = '#form.GetLocation#'
  </cfquery>
  --->
  <cfquery name="EEDirLoc" datasource="NewEmpDirectory" dbtype="ODBC">
SELECT DISTINCT LONG_DESC AS LocNameLong, CONCAT(ST_1,', ',CITY,', ',STATE,' ',ZIP) AS Address, EVAL_NAME AS ContactName, PHONE_NO AS ContactPhone1, PHONE_NO2 as ContactPhone2
FROM IFAS_DIRECTORY_LOC_VIEW WHERE	Location = '#form.GetLocation#'
  </cfquery>
 <!--- Temporarily keep old query 2/8/10--->
  <! - - - get employee info - - - >
  <cfquery name="EEDirName" datasource="EmployeeDirectory" dbtype="ODBC">
SELECT FirstName, LastName, FullAddress, Phone, Location, [Position], Subject,
LocNumber, Email, Username, EmpID FROM DirName, EEDirUsernames WHERE LocNumber = '#form.GetLocation#'
and SSN = SocSecNum
ORDER BY	LastName, FirstName
  </cfquery>
<!--- Getting Employee Informiation New 2/08/10 --->
<cfquery name="EEDirName2" datasource="NewEmpDirectory" dbtype="odbc">
SELECT	Lastname, firstname, homeaddress, Phonenumber, locationdesc, email, location, email, username, MI, Posdesc, EmpID, subject
FROM	IFAS_Employee_Directory
WHERE	Location = '#form.GetLocation#'
ORDER BY Lastname, Firstname
</cfquery>
    <center>
    <strong>    <font face="Comic Sans MS"> <font color="#003399" size="+1" face="Verdana, Arial, Helvetica, sans-serif">Results
      by Location </font></font>
    </strong>
    </center>
    <div align="center"></p>
        <font face="Verdana, Arial, Helvetica, sans-serif"></font></div>
    <font face="Verdana, Arial, Helvetica, sans-serif"><cfoutput> </cfoutput><cfoutput>
      </cfoutput></font><cfoutput>
          <form action="EEDirPrintByLocation.cfm" method="post" name="PrintVer" id="PrintVer">
        <font face="Verdana, Arial, Helvetica, sans-serif">
          </font><font face="Verdana, Arial, Helvetica, sans-serif">
           </font>
          <tr>
            <td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"> <a href="javascript:PrintVer.submit()" class="printable-version-link">View Printable Version</a>
                  <input name="GetLocation" type="hidden" value="#form.GetLocation#" />
            </font></td>
          </tr>
           <font face="Verdana, Arial, Helvetica, sans-serif">
           </font><font face="Verdana, Arial, Helvetica, sans-serif">
           </font>
        </form>
      </cfoutput>
    </center>
  </h5>
  <font face="Verdana, Arial, Helvetica, sans-serif">
  <! - - - display location info table - - - >
  </font>
  <table width="431" height="90" border="1" align="center">
    <tr> 
    </tr><cfoutput query="EEDirLoc">
      <tr>
        <td colspan="2" class="blue-background-cell">
          <span class="heading-text">#LocNameLong#</span>
      </td>
      </tr>
      <tr>
        <td colspan="2"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#ContactName#</font></td>
      </tr>
      <tr>
        <td colspan="2"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#Address#</font></td>
      </tr>
      <tr>
        <td width="150"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#ContactPhone1#</font></td>
        <td width="120"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#ContactPhone2#</font></td>
      </tr>
    </cfoutput>
  </table>
<!---   <h4></h4> --->
  <font face="Verdana, Arial, Helvetica, sans-serif">
  <! - - - display employee info table - - - >
  </font>
  <table width="680" align="center" frame="border">
    <tr><td><font face="Verdana, Arial, Helvetica, sans-serif"></td></tr><cfoutput query="EEDirName2"><tr><td></font></td></tr>
    <tr>
      <td height="21" background="../images/BKgrey.jpg"><font color="##003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#LastName#</strong></font></td>
      <td background="../images/BKgrey.jpg"><font color="##003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif"><strong>#FirstName#</strong></font></td>
      <td background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#LocationDesc#</font></td>
      <td background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#Posdesc#</font></td>
      <td background="../images/BKgrey.jpg"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#subject#</font></td>
    </tr><tr>
      <td height="21" colspan="3"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#homeaddress#</font></td>
      <td height="21" colspan="5"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">#PhoneNumber#</font></td>
    </tr>
    <cfif #Email# GT " ">
    <tr><td><tr  ></td></tr><td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Email#">#Email#</a></font></td>
        <cfelseif #Username# GT " ">
        <td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><a href="mailto:#Username#@d51schools.org">#Username#@d51schools.org</a></font></td>
        <cfelse>
        <td colspan="4"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Email
            Address Unavailable</font></td>
    </cfif>
	<td><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Employee ID: #EmpId#&nbsp;</font></td>
    <tr><td><tr></td></tr><tr><td><font face="Verdana, Arial, Helvetica, sans-serif"></td></tr><tr><td><td bgcolor="##CCCCFF"></td></tr></CFOUTPUT><tr><td></font></td></tr>
  </table>
  
  <p>		<font size="-1" face="Verdana, Arial, Helvetica, sans-serif"><center>Subs and seasonal staff are excluded from the
      directory</center></font></p>
  <p>&nbsp;</p>
  <!-- InstanceEndEditable -->
     </main>        	
  	</div>
	 	<br class="clearfloat" />
  	<div id="footer" class="noprint">
    <footer>
  	<cfinclude template="/2003/templates/components/footer.cfm">
    </footer>
  </div>
</div>
</div>
  <!-- end #footer -->

<!-- end #container -->

</body>
<!-- InstanceEnd --></html>