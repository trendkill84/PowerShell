# ==============================================================================================
# 
# Windows PowerShell Source File -- Created with SAPIEN Technologies PrimalScript 2016
# 
# NAME: 
# 
# AUTHOR: dleaman212@gmail.com , 
# DATE  : 11/19/2016
# 
# COMMENT: 
# 
# ==============================================================================================

for($x =0; $x -le 10; $x++) {
	Get-CimInstance -ClassName Win32_PnPDevice
}