
<html>
<head>
<title>Employee Directory -  Login</title>
  <CFAPPLICATION NAME="LanAccounts" SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes">
  <cfinvoke component="xpSecurity" method="Authenticate" returnVariable="WasAuthenticated" xpUsername="#FORM.Username#" xpPassword="#FORM.Password#" ></cfinvoke>
	<cfif WasAuthenticated>
		<CFLOCK TIMEOUT="20" SCOPE="session" Type="Exclusive">
   			<meta http-equiv="refresh" content="0;URL=EEDirSearchForm.cfm">
		</CFLOCK>
		<cfelse>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		</cfif>
</head>
<body>
<font face="Comic Sans MS">
<cfif WasAuthenticated>
<font color="#003399" face="Verdana, Arial, Helvetica, sans-serif">  <strong>Please Wait....</strong></font>  
<cfelse>
<font color="#003399"><strong>  <font face="Verdana, Arial, Helvetica, sans-serif">Login Failed!</font></strong></font><strong>
</strong>
</cfif>
</font>
<cfif WasAuthenticated>
</cfif>
</body>
</html>
