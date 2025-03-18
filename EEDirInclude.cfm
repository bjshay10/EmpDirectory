<CFAPPLICATION 	NAME="LanAccounts" 	SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes"><p>&nbsp;</p>
<CFSET LoggedIn=True/>
<!---
<CFLOCK TIMEOUT="20" SCOPE="session" Type="Exclusive">
	
	<CFIF IsDefined("SESSION.xpUUID")>
		<CFIF NOT SESSION.xpUUID EQ CLIENT.URLToken>
			<CFSET LoggedIn=False/>
  			<meta http-equiv="refresh" content="0;URL=Index.cfm">
		<CFELSE>
			<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		</CFIF>
	<CFELSE>
		<CFSET LoggedIn=False/>
		<meta http-equiv="refresh" content="0;URL=Index.cfm">
		<cfabort>
	</CFIF>
</CFLOCK>
--->
