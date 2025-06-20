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
<title>Employee Directory - Login</title>
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
          Directory Login 
    <!-- InstanceEndEditable -->
   	  	</span></h1>
				 <!-- InstanceBeginEditable name="Content" -->
         <p>&nbsp;</p>        
         
<cfapplication 	name="LanAccounts" 	sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,20,0)#"	clientmanagement="Yes"	setclientcookies="Yes">
  
  
 
<cfif not isdefined ('session.username')>
	<center>Please Log In.</center>	
	</cfif>

<!--- User Login --->
<cfif not isdefined ('session.username') and not isdefined ('submitform')>
    <p>&nbsp;</p>
    <cfif isdefined('tryagain')>
        <span class="red">Invalid Username or Password or you are unauthorized - Try again</span>
        </div> </cfif>

    <div style="text-align: center;">
        <cfform name="form2" method="post" action="" width="500" height="550">

            <table align="center">
                <tr>
                    <td align="center">
                        <div>
                            <label for="username_input">Username:</label>
                            <cfinput name="username" type="text" size="20" id="username_input"
                                onkeydown="if(Key.isDown(Key.ENTER)) Submituser.dispatchEvent({type:'click'});">
                            <br />
                        </div>

                        <div>
                            <label for="password_input">Password:</label>
                            <cfinput name="password" type="password" size="20" id="password_input"
                                onkeydown="if(Key.isDown(Key.ENTER)) Submituser.dispatchEvent({type:'click'});">
                            <br />
                        </div>

                        <cfinput type="submit" name="Submituser" value="Submit">
                    </td>
                </tr>
            </table>
        </cfform>
    </div>
</cfif>
  
    <!--- Check Username and Password --->
	<cfif isdefined ("form.submituser")>        
		<!--- Test Validation vs AD --->
        <cfldap action="query" 
           server="chief.mesa.k12.co.us" 
           name="GetAccounts" 
           start="DC=mesa,DC=k12,DC=co,DC=us"
           filter="(&(objectclass=user)(SamAccountName=#form.username#))"
           username="mesa\#form.username#" 
           password="#form.password#" 
           attributes = "cn,o,l,st,sn,c,mail,telephonenumber, givenname,homephone, streetaddress, postalcode, SamAccountname, physicalDeliveryOfficeName, department, memberof">
        <cfif getaccounts.recordcount eq 0>
            <cflocation url="index.cfm?tryagain" addtoken="no">
        <cfelse>
			<cfset Session.Username = '#GetAccounts.cn#'>
            <cfset Session.Building = '#GetAccounts.physicaldeliveryofficename#'>
            <cfset Session.email = '#GetAccounts.mail#'>
            <cfquery name="GetUserinfo" datasource="accounts">
                SELECT     
                    Accounts.Username, Accounts.Building, Building.building_number, Accounts.Full_Name, Accounts.Groups, Accounts.SocSecNum
                FROM         
                    Accounts INNER JOIN
                              Building ON Accounts.Building = Building.Building
                WHERE
                    (ACCOUNTS.USERNAME = '#session.username#')
        	</cfquery>
            <cfif #GetUserInfo.RecordCount# gt 0>
				<cfset Session.BuildingNum = '#GetUserInfo.Building_number#'>
                <cfset Session.FullName = '#GetUserInfo.Full_Name#'>
                <cfset Session.Groups = '#GetUserInfo.Groups#'>
                <cfset Session.SSN = '#GetUserInfo.SocSecNum#'>
                <cflocation url="EEDirSearchForm.cfm" addtoken="no">
            <cfelse>
            	<cflocation url="index.cfm?tryagain" addtoken="no">
            </cfif>
        <!---<cfelse>
        	<cflocation url="index.cfm?tryagain" addtoken="no">--->
        </cfif>    
    </cfif>
	
  
  
  
<!---
  <cfset User = AUTH_USER>
  <cfif Left(User,5) eq "mesa\">
    <cfset User = Mid(User, 6, 15)>
  </cfif>
  
  <table width="37%" border="1" cellpadding="0" cellspacing="0" align="center">
    <tr>
      <td>
        <table width="100%" border="0">
          <tr>
            <td background="../images/BKblue.jpg">
              <div align="center"><strong>Login</strong></div>
            </td>
          </tr>
          <tr>
            <td><cfoutput> </cfoutput><cfoutput><form action="index.cfm" method="post" name="LoginForm" id="LoginForm">
<table width="100%" border="0">
  <tr>
                      <td width="31%">User&nbsp;Name</td>
                      <td width="3%">&nbsp;</td>
                      <td width="66%"><input name="UserName" type="hidden" id="UserName" value="#User#" />
#User# &nbsp; </td>
                    </tr>
                    <tr>
                      <td width="31%">Password</td>
                      <td width="3%">&nbsp;</td>
                      <td width="66%"><input name="Password" type="password" id="Password" /></td>
                    </tr>
                    <tr>
                      <td width="31%">&nbsp;</td>
                      <td width="3%">&nbsp;</td>
                      <td width="66%"><input type="submit" name="Submit" value="Login" /></td>
                    </tr>
                </table>
                </form>
                <script>
									document.LoginForm.Password.focus();
								</script>
            </cfoutput> </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
  --->
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