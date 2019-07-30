# AppleScript Network Drive Utility
This utility was created for users to connect to be able to connect to network drives from their MacOS devices with input prompts that will appear asking for credidentials. 

This is a very easy solution for users to connect to network drives via SMB connections. 

Below script will check if *"Data"* drive exists before mounting. 
```AppleScript
if not (disk "Data" exists) then
	mount volume "smb://[LOCATION TO SERVER DRIVE]/Data" as user name user with password pass
	display notification "G Drive Successfully Mounted" with title "Drive Utility"
else
	display notification "G Drive has already been mounted." with title "Drive Utility"
end if
```

## Application Preview

*Username Prompt*

*Password Prompt*

*Notification Banner*
![Notification Banner](/images/notification_banner.png)

