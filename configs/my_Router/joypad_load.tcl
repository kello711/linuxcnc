#!/usr/bin/env haltcl
# This is a haltcl file, which allows Tcl scripting within the HAL environment.

puts "Attempting to load joypad configuration..."

# Use 'catch' to attempt loading the hal_input component.
# The '-W' flag makes it a userspace component and returns an error if the device isn't found/loaded.
# Replace 'MyJoypad' with a descriptive name and ensure appropriate -d options are used if needed.
if [catch {
    loadusr -W hal_input -KRAL Dual # This will fail if no device is connected
} result] {
    # This block executes if an error (exception) is "caught" during the loadusr attempt.
    puts "INFO: Could not load the joypad component: $result"
    puts "INFO: Joypad not found or an error occurred. Continuing without joypad support."
} else {
    # This block executes if the loadusr command was successful.
    puts "INFO: Joypad loaded successfully. Connecting pins."

    # *** Add your specific joypad pin connections here ***
    # The pin names will typically start with the name you provided with '-n', e.g., 'MyJoypad.0.abs-x'.

    # Example connections (adjust pin names based on your device):
    # net joy-x MyJoypad.0.abs-x => halui.joint.0.analog
    # net joy-y MyJoypad.0.abs-y => halui.joint.1.analog
    # net estop-btn MyJoypad.0.btn-trigger => halui.estop.activate

    # Load additional HAL components or files needed ONLY when the joypad is present
    # source my_joypad_logic.hal
    source joypad_jog_speed.hal
    source joypad_xyz.hal
    source joypad_extras.hal
}
