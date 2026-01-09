if {[file exists "/dev/input/by-id/usb-Logitech_Logitech_Dual_Action-joystick"]} {
    # Ensure you have the correct device name string. You can find this by running lsusb or checking /dev/input/by-id/ in your terminal.
    
    # -W waits for the component to be ready before continuing
    loadusr -W hal_input -KRAL "Logitech Dual Action"

    # You can also run standard HAL commands inside TCL using 'hal'
    hal source joypad_jog_speed.hal
    hal source joypad_xyz.hal
    hal source joypad_extras.hal

} else {
    # Log a message to the terminal instead of crashing LinuxCNC
    puts "Joypad not found: Skipping hal_input loading."
}
