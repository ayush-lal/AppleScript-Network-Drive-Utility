# PPSHS BYOx Connector - For STAFF Devices v2
# AppleScript to mount network drives for BYOx Devices (STAFF VERSION)
# Created by Ayush Lal
------------------------------------------------------------------------------------

-- Diaglog box to gather user's domain username
set username to (display dialog "Please enter your school username:" default answer "")
set user to the text returned of username

-- Dialog box to gather user's password in a secure string
set userpass to display dialog "Please enter your school password:" default answer "" with hidden answer
set pass to the text returned of userpass

-- Begin logic for mounting network drives
tell application "Finder"
	-- G Drive Mounting
	if not (disk "Data" exists) then
		mount volume "smb://[LOCATION TO SERVER DRIVE]/Data" as user name user with password pass
		display notification "G Drive Successfully Mounted" with title "Drive Utility"
	else
		display notification "G Drive has already been mounted." with title "Drive Utility"
	end if
	
	-- S Drive Mounting
	if not (disk "StudentData$" exists) then
		mount volume "smb://[LOCATION TO SERVER DRIVE]/StudentData$" as user name user with password pass
		display notification "S Drive Mounted" with title "Drive Utility"
	else
		display notification "S Drive has already been mounted." with title "Drive Utility"
	end if
	
	-- W Drive Mounting
	if not (disk "SchoolWeb$" exists) then
		mount volume "smb://[LOCATION TO SERVER DRIVE]/SchoolWeb$" as user name user with password pass
		display notification "W Drive Mounted" with title "Drive Utility"
	else
		display notification "W Drive has already been mounted." with title "Drive Utility"
	end if
	
	-- Q Drive Mounting
	if not (disk "apps" exists) then
		mount volume "smb://[LOCATION TO SERVER DRIVE]/apps" as user name user with password pass
		display notification "Q Drive Mounted" with title "Drive Utility"
	else
		display notification "Q Drive has already been mounted." with title "Drive Utility"
	end if
	
-- Display notification dialog based on connection success or failure
-- Below script will test connection to "Data" drive before determining whether or not it is success failure or success
	if exists disk "Data" then
		display dialog "Connection Success!" & "
You should now have access to all network drives." with title "Drive Utility" buttons {"Continue"} default button "Continue" with icon file {"System:Library:CoreServices:CoreTypes.bundle:Contents:Resources:ToolBarInfo.icns"}
	else
		display dialog "Connection Failed!" & "
Something went wrong with the connection process. Please try again." with title "Drive Utility" buttons {"Continue"} default button "Continue" with icon stop
	end if
	
	-- End function	
end tell