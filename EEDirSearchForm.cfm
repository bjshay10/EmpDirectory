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
<title>Employe Directory -  Search</title>
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
					<!-- InstanceBeginEditable name="PageTitle" --> 
    Employee Directory<!-- InstanceEndEditable -->
   	  	</span></h1>
				 <!-- InstanceBeginEditable name="Content" --><font size="-1" face="Verdana, Arial, Helvetica, sans-serif"></font>
    <cfinclude template="EEDirInclude.cfm">
   <cfquery name="Locations" datasource="EmployeeDirectory" dbtype="ODBC">
SELECT DISTINCT LocNameLong, LocNumber FROM	DirLoc
  </cfquery>
    <! - - - Log Out button - - - >
  
  <form action="EEDirLOGOUT.cfm" method="post" name="logout" id="logout">
  <input name="Logout" type="submit" value="Logout" />
  </form>
    <table width="100%">
  	<tr>
		<td>
			<! - - - Search Results by Name - - - >
		  <form action="EEDirResultsByName.cfm" method="post" name="SearchForm" id="SearchForm">
			<table width="100%" border="1" cellpadding="0" cellspacing="0" align="center">
			  <tr>
				<td>
				  <table width="100%" border="0">
					<tr>
					  <td class="blue-background-cell">
						<div class="centered-text">
							<span class="heading-text">Search the Employee Directory by Name</span>
						</div>
					</td>
					</tr>
					<tr>
					  <td>
						<table width="100%" border="0">
						  <tr>
							<!--- <td width="22%"><font color="#003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif">First&nbsp;Name </font></td> --->
							<!--- <td width="1%">&nbsp; </td> --->
							<td width="100%">
								<label for="firstNameInput"><font color="#003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif">First Name:</font></label>
								<input type="text" name="FirstName" id="firstNameInput" />
							</td>
						  </tr>
						  <tr>
							<!--- <td width="22%">
								<span class="form-label-text">Last Name</font></span>
							</td>
							<td width="1%">&nbsp;</td> --->
							<td width="100%">
								<label for="lastNameInput" class="sr-only"><font color="#003399" size="-1" face="Verdana, Arial, Helvetica, sans-serif">Last Name</font></label> 
								<input type="text" name="LastName" id="lastNameInput" />
							</td>
						  </tr>
						  <tr>
							<!--- <td width="22%">&nbsp; </td>
							<td width="1%">&nbsp; </td> --->
							<td width="100%"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
							  <input type="submit" name="Submit" value="Search" />
							  <input type="reset" name="Submit2" value="Reset" />
							</font>
							</td>
						  </tr>
						</table>
						
						<font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
						<script>
									document.SearchForm.FirstName.focus();
								</script>
					  </font></td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
			<input type="hidden" name="Subject" value="" />
			<input type="hidden" name="Position" value="" />
		  </form>
		</td>
		<td>
			<form action="EEDirResultsByName.cfm" method="post" name="SearchForm3" id="SearchForm3">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" align="center">
				  <tr>
					<td>
					  <table width="100%" border="0" >
						<tr>
						  <td class="blue-background-cell">
							<div class="centered-text">
								<span class="heading-text">Click Here For an Alphabetical List of Employees</span>
							</div>
						</td>
						</tr>
						<tr>
						  <td>
							<table width="100%" border="0">
							  <tr>
								<td width="77%" align="center"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
								  <input type="submit" name="Submit" value="Click for Alpha List" />
								</font></td>
							  </tr>
							</table>
						  </td>
						</tr>
					  </table>
					</td>
				  </tr>
				</table>
				<input type="hidden" name="FirstName" value="" />
				<input type="hidden" name="LastName" value="" />
				<input type="hidden" name="Position" value="" />
				<input type="hidden" name="Subject" value="" />
			  </form>
		</td>
	</tr>
	<tr>
		<td>
			<!--- Search By Position --->
			 <cfform name="SearchForm_Position" action="EEDirResultsByName.cfm" method="post">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<table width="100%" border="0">
								<tr>
									<td class="blue-background-cell" colspan="3">
										<div class="centered-text">
											<span class="heading-text">Search the Employee Directory By Position</span>
										</div>
									</td>
								</tr>
								<tr>
									<!--- <td width="22%">
										<span class="form-label-text">Position</span>
									</td>
									<td width="1%">&nbsp;</td> --->
									<td width="100%">
										<label for="positionInput" class="sr-only">Position</label>
										<input type="text" name="Position" id="positionInput" />
									</td>
								</tr>
								<tr>
									<td align="center" colspan="3">
										<input type="submit" name="Submit" value="Search" />
										<input type="reset" name="Submit2" value="Reset" />
									</td>
								</tr>
						  </table>
						</td>
					</tr>	
				</table>	
				<input type="hidden" name="FirstName" value="" />
				<input type="hidden" name="LastName" value="" />
				<input type="hidden" name="Subject" value="" />
			 </cfform>	
		</td>
		<td>
			<!--- Search By Subject --->
			 <cfform name="SearchForm_Subject" action="EEDirResultsByName.cfm" method="post">
				<table width="100%" border="1" cellpadding="0" cellspacing="0" align="center">
					<tr>
						<td>
							<table width="100%" border="0">
								<tr>
									<td class="blue-background-cell" colspan="3">
										<div class="centered-text">
											<span class="heading-text">Search the Employee Directory By Subject Taught</span>
										</div>
									</td>
								</tr>
								<tr>
									<!--- <td width="22%">
										<span class="form-label-text">Subject</span>
									</td>
									<td width="1%">&nbsp;</td> --->
									<td width="100%">
										<label for="subjectInput" class="sr-only">Subject</label>
										<input type="text" name="Subject" id="subjectInput" />
									</td>
								</tr>
								<tr>
									<td align="center" colspan="3">
										<input type="submit" name="Submit" value="Search" />
										<input type="reset" name="Submit2" value="Reset" />
									</td>
								</tr>
							</table>
						</td>
					</tr>	
				</table>	
				<input type="hidden" name="FirstName" value="" />
				<input type="hidden" name="LastName" value="" />
				<input type="hidden" name="Position" value="" />
			 </cfform>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<! - - - Search Results by Location - - - >
			  <form action="EEDirResultsByLocation.cfm" method="post" name="SearchForm2" id="SearchForm2">
				<table width="37%" border="1" cellpadding="0" cellspacing="0" align="center">
				  <tr>
					<td>
					  <table width="100%" border="0" >
						<tr>
						  <td class="blue-background-cell">
							<div class="centered-text">
								<span class="heading-text">Search the Employee Directory by Location</span>
							</div>
						</td>
						</tr>
						<tr>
						  <td>
							<table width="100%" border="0">
							  <tr>
								<!--- <td width="22%">
									<span class="form-label-text">Location</span>
								</td>
								<td width="1%">&nbsp;</td> --->
								<td width="100%">
									<label for="getLocationSelect" class="sr-only">Location</label>
									<select name="GetLocation" id="getLocationSelect">
										<option value="None" selected="selected">- - Click to Select - -</option>
										<cfoutput query="Locations">
											<option value="#LocNumber#">#LocNameLong#</option>
										</cfoutput>
									</select>
								</td>
								</font></td>
							  </tr>
							  <tr>
								<!--- <td width="22%">&nbsp; </td>
								<td width="1%">&nbsp; </td> --->
								<td width="100%"><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">
								  <input type="submit" name="Submit" value="Search" />
								  <input type="reset" name="Submit2" value="Reset" />
								</font></td>
							  </tr>
							</table>
						  </td>
						</tr>
					  </table>
					</td>
				  </tr>
				</table>
			  </form>
		</td>
	</tr>
  </table>
  
  
	  

 
 
  <p><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">You can search by either name or location. For
      a Name search, you do not need to enter the full name, you can enter part
      of either first name or last name. A Location search will return everyone
      at that location.</font></p>
  <p><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">For example,
      if you were looking for Karol Joslyn-Benroth, you could enter &quot;Benr&quot; in the last name field and not need to
      know Karol was spelled with a &quot;K&quot; or that her last name is under &quot;J&quot; for
      Joslyn-Benroth&quot;.</font></p>
  <p><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Subs and seasonal staff are excluded from the
      directory, as they always have been.</font></p>
  <p><font size="-1" face="Verdana, Arial, Helvetica, sans-serif">Please report any questions or problems regarding
      the functionality of the Online Employee Directory to <a href="mailto:bshay@d51schools.org">bshay@d51schools.org</a>.
      Please report any incorrect data to <a href="mailto:Rachel.Talley@d51schools.org">Rachel.Talley@d51schools.org</a>.</font></p>
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