<cfcomponent>
	<cffunction name="Authenticate" access="public" returntype="boolean">
		<cfargument name="xpUsername" type="string" required="true">
		<cfargument name="xpPassword" type="string" required="true">
		<CFAPPLICATION 	NAME="LanAccounts" 	SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes">
		<cfquery name="accounts" datasource="lanaccounts" DBTYPE="ODBC">
			SELECT * FROM Accounts,Building WHERE Accounts.Building = Building.Building AND USERNAME='#arguments.xpUsername#' AND PASSWORD='#arguments.xpPassword#'
		</cfquery>
		<cfif accounts.recordCount and (FindNoCase("student","#accounts.Groups#") EQ 0)>
			<CFLOCK TIMEOUT="20" SCOPE="session" Type="Exclusive">
				<CFSET SESSION.xpUsername="#arguments.xpUsername#">
				<CFSET SESSION.xpUUID="#CLIENT.URLToken#">
				<CFIF Accounts.Building EQ "CC">
					<cfset SESSION.Building="CC">
				<CFELSE>
					<cfset SESSION.Building="#accounts.building_number#">
				</CFIF>
			</CFLOCK>
			<cfreturn True/>
		<cfelse>
			<CFIF IsDefined("SESSION.xpUserName")>
				<CFSET StructDelete(SESSION,"xpUserName")>
			</CFIF>
			<CFIF IsDefined("SESSION.xpUUID")>
				<CFSET StructDelete(SESSION,"xpUUID")>
			</CFIF>
			<cfreturn False/>
		</cfif>
	</cffunction>

	<cffunction name="AuthenticateByAuthUser" access="public" returntype="boolean">
		<CFAPPLICATION 	NAME="LanAccounts" 	SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes">
		<CFAPPLICATION 	NAME="LanAccounts" 	SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes"><p>&nbsp;</p>
		<cfset xpUsername = AUTH_USER>
		<cfif Left(xpUsername,5) eq "mesa\">
			<cfset xpUsername = Mid(xpUsername, 6, 15)>
		</cfif>
		<cfquery name="accounts" datasource="lanaccounts" DBTYPE="ODBC">
			SELECT * FROM Accounts,Building WHERE Accounts.Building = Building.Building AND USERNAME='#xpUsername#'
		</cfquery>
		<cfif accounts.recordCount>
			<CFLOCK TIMEOUT="20" SCOPE="session" Type="Exclusive">
				<CFSET SESSION.xpUsername="#xpUsername#">
				<CFSET SESSION.xpUUID="#CLIENT.URLToken#">
				<CFIF Accounts.Building EQ "CC">
					<cfset SESSION.Building="CC">
				<CFELSE>
					<cfset SESSION.Building="#accounts.building_number#">
				</CFIF>
			</CFLOCK>
			<cfreturn True/>
		<cfelse>
			<CFIF IsDefined("SESSION.xpUserName")>
				<CFSET StructDelete(SESSION,"xpUserName")>
			</CFIF>
			<CFIF IsDefined("SESSION.xpUUID")>
				<CFSET StructDelete(SESSION,"xpUUID")>
			</CFIF>
			<cfreturn False/>
		</cfif>
	</cffunction>

	<cffunction name="Logout" access="public" returntype="boolean">
		<CFAPPLICATION 	NAME="LanAccounts" 	SESSIONMANAGEMENT="Yes" SESSIONTIMEOUT="#CreateTimeSpan(0,0,20,0)#"	CLIENTMANAGEMENT="Yes"	SETCLIENTCOOKIES="Yes">
		<CFLOCK TIMEOUT="20" SCOPE="session" Type="Exclusive">
			<CFIF IsDefined("SESSION.xpUUID")>
				<CFSET StructDelete(SESSION,"xpUUID")>
			</CFIF>
			<CFIF IsDefined("SESSION.xpUserName")>
				<CFSET StructDelete(SESSION,"xpUserName")>
			</CFIF>
			<CFIF IsDefined("SESSION.Building")>
				<CFSET StructDelete(SESSION,"Building")>
			</CFIF>
		</CFLOCK>
		<cfreturn True/>
	</cffunction>
	
</cfcomponent>

