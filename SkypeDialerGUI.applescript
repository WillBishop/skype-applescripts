property conference_phone_number : "+1.888.371.8922"
property conference_code : "31066047#"

on run {}
	display dialog �
		"Conferencing phone number" default answer conference_phone_number �
		buttons {"Cancel", "OK"} �
		default button 2
	copy the result as list to {conference_phone_number, button_pressed}
	
	display dialog �
		"Conference code" default answer conference_code �
		buttons {"Cancel", "OK"} �
		default button 2
	copy the result as list to {conference_code, button_pressed}
	
	tell application "Finder"
		set visible of process "SkypeDialerGUI" to false
	end tell
	
	tell application "SkypeDialer"
		do_the_call(conference_phone_number, conference_code)
		quit
	end tell
end run
