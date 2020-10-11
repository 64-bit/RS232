set_global_assignment -entity "Serial_PLL" -library "lib_Serial_PLL" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "Serial_PLL" -library "lib_Serial_PLL" -name IP_TOOL_VERSION "20.1"
set_global_assignment -entity "Serial_PLL" -library "lib_Serial_PLL" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_Serial_PLL" -name SPD_FILE [file join $::quartus(sip_path) "Serial_PLL.spd"]

set_global_assignment -library "lib_Serial_PLL" -name MISC_FILE [file join $::quartus(sip_path) "Serial_PLL_sim/Serial_PLL.vo"]
