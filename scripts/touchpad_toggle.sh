# toggleTouchpad by Brendon Dugan
# Toggles a touchpad on or off depending on it's current state or CLI argument
#
# To configure, run the command 'xinput list' in terminal and identify your touch pad.
# Using the output of the above command, change the touchpadString variable to a substring
# of your touchpad's description that is unique to that device.
#
# To run, simply type 'toggleTouchpad' to toggle your touchpad on or off, or
# 'toggleTouchpad on' to explicitly turn your touchpad on, or
# 'toggleTouchpad off' to explicitly turn it off.
#
# Enjoy!
touchpadString="TouchPad"
touchpadID=$(xinput list | grep "$touchpadString" | awk -F " " '{print $6}' | awk -F "=" '{print $2}')
touchpadEnabled=$(xinput list-props $touchpadID | grep "Device Enabled" | awk -F ":" '{print $2}')
 
# Check for arguments on the command line
if test $# -eq 1
then
    # Change the argument to lowercase
    arg1=$(echo $1 | tr [:upper:] [:lower:])
    cliArg=1
else
    # There is no argument.
    cliArg=0
fi
 
if [ $cliArg -eq 1 ]
then
    # If there's an argument, check to see whether it is on, off, or junk
    if [ $arg1 = 'on' ]
    then
        # The argument was 'on', so turn the touchpad on
        xinput --set-prop $touchpadID "Device Enabled" 1
    elif [ $arg1 = 'off' ]
    then
        # The argument was 'off', so turn the touchpad off
        xinput --set-prop $touchpadID "Device Enabled" 0
    else
        # The argument was junk, so do nothing
        sleep 1
    fi
else
    # There was no argument, so just toggle the touchpad to the opposite
    # of the state it has now.
    if [ $touchpadEnabled -eq 1 ]
    then
        xinput --set-prop $touchpadID "Device Enabled" 0
    else
        xinput --set-prop $touchpadID "Device Enabled" 1
    fi
fi
