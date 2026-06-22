
# Loading additional proc with user specified bodies to compute parameter values.
source [file join [file dirname [file dirname [info script]]] gui/myip_v1_0.gtcl]

# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "G_PROBES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "G_SAMPLES" -parent ${Page_0}

  #Adding Page
  set ILA [ipgui::add_page $IPINST -name "ILA"]
  ipgui::add_param $IPINST -name "G_WIDTH_1" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_2" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_3" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_4" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_5" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_6" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_7" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_8" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_9" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_10" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_11" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_12" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_13" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_14" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_15" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_16" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_17" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_18" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_19" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_20" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_21" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_22" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_23" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_24" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_25" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_26" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_27" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_28" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_29" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_30" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_31" -parent ${ILA}
  ipgui::add_param $IPINST -name "G_WIDTH_32" -parent ${ILA}


}

proc update_PARAM_VALUE.G_WIDTH_10 { PARAM_VALUE.G_WIDTH_10 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_10 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_10 ${PARAM_VALUE.G_WIDTH_10}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_10_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_10
	} else {
		set_property enabled false $G_WIDTH_10
	}
}

proc validate_PARAM_VALUE.G_WIDTH_10 { PARAM_VALUE.G_WIDTH_10 } {
	# Procedure called to validate G_WIDTH_10
	return true
}

proc update_PARAM_VALUE.G_WIDTH_11 { PARAM_VALUE.G_WIDTH_11 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_11 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_11 ${PARAM_VALUE.G_WIDTH_11}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_11_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_11
	} else {
		set_property enabled false $G_WIDTH_11
	}
}

proc validate_PARAM_VALUE.G_WIDTH_11 { PARAM_VALUE.G_WIDTH_11 } {
	# Procedure called to validate G_WIDTH_11
	return true
}

proc update_PARAM_VALUE.G_WIDTH_12 { PARAM_VALUE.G_WIDTH_12 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_12 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_12 ${PARAM_VALUE.G_WIDTH_12}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_12_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_12
	} else {
		set_property enabled false $G_WIDTH_12
	}
}

proc validate_PARAM_VALUE.G_WIDTH_12 { PARAM_VALUE.G_WIDTH_12 } {
	# Procedure called to validate G_WIDTH_12
	return true
}

proc update_PARAM_VALUE.G_WIDTH_13 { PARAM_VALUE.G_WIDTH_13 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_13 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_13 ${PARAM_VALUE.G_WIDTH_13}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_13_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_13
	} else {
		set_property enabled false $G_WIDTH_13
	}
}

proc validate_PARAM_VALUE.G_WIDTH_13 { PARAM_VALUE.G_WIDTH_13 } {
	# Procedure called to validate G_WIDTH_13
	return true
}

proc update_PARAM_VALUE.G_WIDTH_14 { PARAM_VALUE.G_WIDTH_14 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_14 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_14 ${PARAM_VALUE.G_WIDTH_14}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_14_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_14
	} else {
		set_property enabled false $G_WIDTH_14
	}
}

proc validate_PARAM_VALUE.G_WIDTH_14 { PARAM_VALUE.G_WIDTH_14 } {
	# Procedure called to validate G_WIDTH_14
	return true
}

proc update_PARAM_VALUE.G_WIDTH_15 { PARAM_VALUE.G_WIDTH_15 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_15 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_15 ${PARAM_VALUE.G_WIDTH_15}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_15_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_15
	} else {
		set_property enabled false $G_WIDTH_15
	}
}

proc validate_PARAM_VALUE.G_WIDTH_15 { PARAM_VALUE.G_WIDTH_15 } {
	# Procedure called to validate G_WIDTH_15
	return true
}

proc update_PARAM_VALUE.G_WIDTH_16 { PARAM_VALUE.G_WIDTH_16 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_16 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_16 ${PARAM_VALUE.G_WIDTH_16}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_16_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_16
	} else {
		set_property enabled false $G_WIDTH_16
	}
}

proc validate_PARAM_VALUE.G_WIDTH_16 { PARAM_VALUE.G_WIDTH_16 } {
	# Procedure called to validate G_WIDTH_16
	return true
}

proc update_PARAM_VALUE.G_WIDTH_17 { PARAM_VALUE.G_WIDTH_17 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_17 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_17 ${PARAM_VALUE.G_WIDTH_17}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_17_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_17
	} else {
		set_property enabled false $G_WIDTH_17
	}
}

proc validate_PARAM_VALUE.G_WIDTH_17 { PARAM_VALUE.G_WIDTH_17 } {
	# Procedure called to validate G_WIDTH_17
	return true
}

proc update_PARAM_VALUE.G_WIDTH_18 { PARAM_VALUE.G_WIDTH_18 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_18 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_18 ${PARAM_VALUE.G_WIDTH_18}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_18_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_18
	} else {
		set_property enabled false $G_WIDTH_18
	}
}

proc validate_PARAM_VALUE.G_WIDTH_18 { PARAM_VALUE.G_WIDTH_18 } {
	# Procedure called to validate G_WIDTH_18
	return true
}

proc update_PARAM_VALUE.G_WIDTH_19 { PARAM_VALUE.G_WIDTH_19 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_19 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_19 ${PARAM_VALUE.G_WIDTH_19}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_19_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_19
	} else {
		set_property enabled false $G_WIDTH_19
	}
}

proc validate_PARAM_VALUE.G_WIDTH_19 { PARAM_VALUE.G_WIDTH_19 } {
	# Procedure called to validate G_WIDTH_19
	return true
}

proc update_PARAM_VALUE.G_WIDTH_2 { PARAM_VALUE.G_WIDTH_2 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_2 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_2 ${PARAM_VALUE.G_WIDTH_2}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_2_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_2
	} else {
		set_property enabled false $G_WIDTH_2
	}
}

proc validate_PARAM_VALUE.G_WIDTH_2 { PARAM_VALUE.G_WIDTH_2 } {
	# Procedure called to validate G_WIDTH_2
	return true
}

proc update_PARAM_VALUE.G_WIDTH_20 { PARAM_VALUE.G_WIDTH_20 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_20 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_20 ${PARAM_VALUE.G_WIDTH_20}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_20_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_20
	} else {
		set_property enabled false $G_WIDTH_20
	}
}

proc validate_PARAM_VALUE.G_WIDTH_20 { PARAM_VALUE.G_WIDTH_20 } {
	# Procedure called to validate G_WIDTH_20
	return true
}

proc update_PARAM_VALUE.G_WIDTH_21 { PARAM_VALUE.G_WIDTH_21 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_21 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_21 ${PARAM_VALUE.G_WIDTH_21}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_21_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_21
	} else {
		set_property enabled false $G_WIDTH_21
	}
}

proc validate_PARAM_VALUE.G_WIDTH_21 { PARAM_VALUE.G_WIDTH_21 } {
	# Procedure called to validate G_WIDTH_21
	return true
}

proc update_PARAM_VALUE.G_WIDTH_22 { PARAM_VALUE.G_WIDTH_22 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_22 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_22 ${PARAM_VALUE.G_WIDTH_22}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_22_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_22
	} else {
		set_property enabled false $G_WIDTH_22
	}
}

proc validate_PARAM_VALUE.G_WIDTH_22 { PARAM_VALUE.G_WIDTH_22 } {
	# Procedure called to validate G_WIDTH_22
	return true
}

proc update_PARAM_VALUE.G_WIDTH_23 { PARAM_VALUE.G_WIDTH_23 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_23 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_23 ${PARAM_VALUE.G_WIDTH_23}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_23_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_23
	} else {
		set_property enabled false $G_WIDTH_23
	}
}

proc validate_PARAM_VALUE.G_WIDTH_23 { PARAM_VALUE.G_WIDTH_23 } {
	# Procedure called to validate G_WIDTH_23
	return true
}

proc update_PARAM_VALUE.G_WIDTH_24 { PARAM_VALUE.G_WIDTH_24 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_24 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_24 ${PARAM_VALUE.G_WIDTH_24}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_24_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_24
	} else {
		set_property enabled false $G_WIDTH_24
	}
}

proc validate_PARAM_VALUE.G_WIDTH_24 { PARAM_VALUE.G_WIDTH_24 } {
	# Procedure called to validate G_WIDTH_24
	return true
}

proc update_PARAM_VALUE.G_WIDTH_25 { PARAM_VALUE.G_WIDTH_25 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_25 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_25 ${PARAM_VALUE.G_WIDTH_25}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_25_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_25
	} else {
		set_property enabled false $G_WIDTH_25
	}
}

proc validate_PARAM_VALUE.G_WIDTH_25 { PARAM_VALUE.G_WIDTH_25 } {
	# Procedure called to validate G_WIDTH_25
	return true
}

proc update_PARAM_VALUE.G_WIDTH_26 { PARAM_VALUE.G_WIDTH_26 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_26 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_26 ${PARAM_VALUE.G_WIDTH_26}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_26_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_26
	} else {
		set_property enabled false $G_WIDTH_26
	}
}

proc validate_PARAM_VALUE.G_WIDTH_26 { PARAM_VALUE.G_WIDTH_26 } {
	# Procedure called to validate G_WIDTH_26
	return true
}

proc update_PARAM_VALUE.G_WIDTH_27 { PARAM_VALUE.G_WIDTH_27 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_27 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_27 ${PARAM_VALUE.G_WIDTH_27}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_27_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_27
	} else {
		set_property enabled false $G_WIDTH_27
	}
}

proc validate_PARAM_VALUE.G_WIDTH_27 { PARAM_VALUE.G_WIDTH_27 } {
	# Procedure called to validate G_WIDTH_27
	return true
}

proc update_PARAM_VALUE.G_WIDTH_28 { PARAM_VALUE.G_WIDTH_28 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_28 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_28 ${PARAM_VALUE.G_WIDTH_28}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_28_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_28
	} else {
		set_property enabled false $G_WIDTH_28
	}
}

proc validate_PARAM_VALUE.G_WIDTH_28 { PARAM_VALUE.G_WIDTH_28 } {
	# Procedure called to validate G_WIDTH_28
	return true
}

proc update_PARAM_VALUE.G_WIDTH_29 { PARAM_VALUE.G_WIDTH_29 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_29 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_29 ${PARAM_VALUE.G_WIDTH_29}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_29_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_29
	} else {
		set_property enabled false $G_WIDTH_29
	}
}

proc validate_PARAM_VALUE.G_WIDTH_29 { PARAM_VALUE.G_WIDTH_29 } {
	# Procedure called to validate G_WIDTH_29
	return true
}

proc update_PARAM_VALUE.G_WIDTH_3 { PARAM_VALUE.G_WIDTH_3 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_3 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_3 ${PARAM_VALUE.G_WIDTH_3}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_3_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_3
	} else {
		set_property enabled false $G_WIDTH_3
	}
}

proc validate_PARAM_VALUE.G_WIDTH_3 { PARAM_VALUE.G_WIDTH_3 } {
	# Procedure called to validate G_WIDTH_3
	return true
}

proc update_PARAM_VALUE.G_WIDTH_30 { PARAM_VALUE.G_WIDTH_30 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_30 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_30 ${PARAM_VALUE.G_WIDTH_30}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_30_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_30
	} else {
		set_property enabled false $G_WIDTH_30
	}
}

proc validate_PARAM_VALUE.G_WIDTH_30 { PARAM_VALUE.G_WIDTH_30 } {
	# Procedure called to validate G_WIDTH_30
	return true
}

proc update_PARAM_VALUE.G_WIDTH_31 { PARAM_VALUE.G_WIDTH_31 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_31 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_31 ${PARAM_VALUE.G_WIDTH_31}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_31_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_31
	} else {
		set_property enabled false $G_WIDTH_31
	}
}

proc validate_PARAM_VALUE.G_WIDTH_31 { PARAM_VALUE.G_WIDTH_31 } {
	# Procedure called to validate G_WIDTH_31
	return true
}

proc update_PARAM_VALUE.G_WIDTH_32 { PARAM_VALUE.G_WIDTH_32 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_32 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_32 ${PARAM_VALUE.G_WIDTH_32}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_32_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_32
	} else {
		set_property enabled false $G_WIDTH_32
	}
}

proc validate_PARAM_VALUE.G_WIDTH_32 { PARAM_VALUE.G_WIDTH_32 } {
	# Procedure called to validate G_WIDTH_32
	return true
}

proc update_PARAM_VALUE.G_WIDTH_4 { PARAM_VALUE.G_WIDTH_4 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_4 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_4 ${PARAM_VALUE.G_WIDTH_4}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_4_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_4
	} else {
		set_property enabled false $G_WIDTH_4
	}
}

proc validate_PARAM_VALUE.G_WIDTH_4 { PARAM_VALUE.G_WIDTH_4 } {
	# Procedure called to validate G_WIDTH_4
	return true
}

proc update_PARAM_VALUE.G_WIDTH_5 { PARAM_VALUE.G_WIDTH_5 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_5 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_5 ${PARAM_VALUE.G_WIDTH_5}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_5_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_5
	} else {
		set_property enabled false $G_WIDTH_5
	}
}

proc validate_PARAM_VALUE.G_WIDTH_5 { PARAM_VALUE.G_WIDTH_5 } {
	# Procedure called to validate G_WIDTH_5
	return true
}

proc update_PARAM_VALUE.G_WIDTH_6 { PARAM_VALUE.G_WIDTH_6 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_6 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_6 ${PARAM_VALUE.G_WIDTH_6}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_6_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_6
	} else {
		set_property enabled false $G_WIDTH_6
	}
}

proc validate_PARAM_VALUE.G_WIDTH_6 { PARAM_VALUE.G_WIDTH_6 } {
	# Procedure called to validate G_WIDTH_6
	return true
}

proc update_PARAM_VALUE.G_WIDTH_7 { PARAM_VALUE.G_WIDTH_7 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_7 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_7 ${PARAM_VALUE.G_WIDTH_7}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_7_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_7
	} else {
		set_property enabled false $G_WIDTH_7
	}
}

proc validate_PARAM_VALUE.G_WIDTH_7 { PARAM_VALUE.G_WIDTH_7 } {
	# Procedure called to validate G_WIDTH_7
	return true
}

proc update_PARAM_VALUE.G_WIDTH_8 { PARAM_VALUE.G_WIDTH_8 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_8 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_8 ${PARAM_VALUE.G_WIDTH_8}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_8_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_8
	} else {
		set_property enabled false $G_WIDTH_8
	}
}

proc validate_PARAM_VALUE.G_WIDTH_8 { PARAM_VALUE.G_WIDTH_8 } {
	# Procedure called to validate G_WIDTH_8
	return true
}

proc update_PARAM_VALUE.G_WIDTH_9 { PARAM_VALUE.G_WIDTH_9 PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_WIDTH_9 when any of the dependent parameters in the arguments change
	
	set G_WIDTH_9 ${PARAM_VALUE.G_WIDTH_9}
	set G_PROBES ${PARAM_VALUE.G_PROBES}
	set values(G_PROBES) [get_property value $G_PROBES]
	if { [gen_USERPARAMETER_G_WIDTH_9_ENABLEMENT $values(G_PROBES)] } {
		set_property enabled true $G_WIDTH_9
	} else {
		set_property enabled false $G_WIDTH_9
	}
}

proc validate_PARAM_VALUE.G_WIDTH_9 { PARAM_VALUE.G_WIDTH_9 } {
	# Procedure called to validate G_WIDTH_9
	return true
}

proc update_PARAM_VALUE.G_PROBES { PARAM_VALUE.G_PROBES } {
	# Procedure called to update G_PROBES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_PROBES { PARAM_VALUE.G_PROBES } {
	# Procedure called to validate G_PROBES
	return true
}

proc update_PARAM_VALUE.G_SAMPLES { PARAM_VALUE.G_SAMPLES } {
	# Procedure called to update G_SAMPLES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_SAMPLES { PARAM_VALUE.G_SAMPLES } {
	# Procedure called to validate G_SAMPLES
	return true
}

proc update_PARAM_VALUE.G_WIDTH_1 { PARAM_VALUE.G_WIDTH_1 } {
	# Procedure called to update G_WIDTH_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.G_WIDTH_1 { PARAM_VALUE.G_WIDTH_1 } {
	# Procedure called to validate G_WIDTH_1
	return true
}


proc update_MODELPARAM_VALUE.G_PROBES { MODELPARAM_VALUE.G_PROBES PARAM_VALUE.G_PROBES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_PROBES}] ${MODELPARAM_VALUE.G_PROBES}
}

proc update_MODELPARAM_VALUE.G_SAMPLES { MODELPARAM_VALUE.G_SAMPLES PARAM_VALUE.G_SAMPLES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_SAMPLES}] ${MODELPARAM_VALUE.G_SAMPLES}
}

proc update_MODELPARAM_VALUE.G_WIDTH_1 { MODELPARAM_VALUE.G_WIDTH_1 PARAM_VALUE.G_WIDTH_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_1}] ${MODELPARAM_VALUE.G_WIDTH_1}
}

proc update_MODELPARAM_VALUE.G_WIDTH_2 { MODELPARAM_VALUE.G_WIDTH_2 PARAM_VALUE.G_WIDTH_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_2}] ${MODELPARAM_VALUE.G_WIDTH_2}
}

proc update_MODELPARAM_VALUE.G_WIDTH_3 { MODELPARAM_VALUE.G_WIDTH_3 PARAM_VALUE.G_WIDTH_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_3}] ${MODELPARAM_VALUE.G_WIDTH_3}
}

proc update_MODELPARAM_VALUE.G_WIDTH_4 { MODELPARAM_VALUE.G_WIDTH_4 PARAM_VALUE.G_WIDTH_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_4}] ${MODELPARAM_VALUE.G_WIDTH_4}
}

proc update_MODELPARAM_VALUE.G_WIDTH_5 { MODELPARAM_VALUE.G_WIDTH_5 PARAM_VALUE.G_WIDTH_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_5}] ${MODELPARAM_VALUE.G_WIDTH_5}
}

proc update_MODELPARAM_VALUE.G_WIDTH_6 { MODELPARAM_VALUE.G_WIDTH_6 PARAM_VALUE.G_WIDTH_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_6}] ${MODELPARAM_VALUE.G_WIDTH_6}
}

proc update_MODELPARAM_VALUE.G_WIDTH_7 { MODELPARAM_VALUE.G_WIDTH_7 PARAM_VALUE.G_WIDTH_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_7}] ${MODELPARAM_VALUE.G_WIDTH_7}
}

proc update_MODELPARAM_VALUE.G_WIDTH_8 { MODELPARAM_VALUE.G_WIDTH_8 PARAM_VALUE.G_WIDTH_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_8}] ${MODELPARAM_VALUE.G_WIDTH_8}
}

proc update_MODELPARAM_VALUE.G_WIDTH_9 { MODELPARAM_VALUE.G_WIDTH_9 PARAM_VALUE.G_WIDTH_9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_9}] ${MODELPARAM_VALUE.G_WIDTH_9}
}

proc update_MODELPARAM_VALUE.G_WIDTH_10 { MODELPARAM_VALUE.G_WIDTH_10 PARAM_VALUE.G_WIDTH_10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_10}] ${MODELPARAM_VALUE.G_WIDTH_10}
}

proc update_MODELPARAM_VALUE.G_WIDTH_11 { MODELPARAM_VALUE.G_WIDTH_11 PARAM_VALUE.G_WIDTH_11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_11}] ${MODELPARAM_VALUE.G_WIDTH_11}
}

proc update_MODELPARAM_VALUE.G_WIDTH_12 { MODELPARAM_VALUE.G_WIDTH_12 PARAM_VALUE.G_WIDTH_12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_12}] ${MODELPARAM_VALUE.G_WIDTH_12}
}

proc update_MODELPARAM_VALUE.G_WIDTH_13 { MODELPARAM_VALUE.G_WIDTH_13 PARAM_VALUE.G_WIDTH_13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_13}] ${MODELPARAM_VALUE.G_WIDTH_13}
}

proc update_MODELPARAM_VALUE.G_WIDTH_14 { MODELPARAM_VALUE.G_WIDTH_14 PARAM_VALUE.G_WIDTH_14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_14}] ${MODELPARAM_VALUE.G_WIDTH_14}
}

proc update_MODELPARAM_VALUE.G_WIDTH_15 { MODELPARAM_VALUE.G_WIDTH_15 PARAM_VALUE.G_WIDTH_15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_15}] ${MODELPARAM_VALUE.G_WIDTH_15}
}

proc update_MODELPARAM_VALUE.G_WIDTH_16 { MODELPARAM_VALUE.G_WIDTH_16 PARAM_VALUE.G_WIDTH_16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_16}] ${MODELPARAM_VALUE.G_WIDTH_16}
}

proc update_MODELPARAM_VALUE.G_WIDTH_17 { MODELPARAM_VALUE.G_WIDTH_17 PARAM_VALUE.G_WIDTH_17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_17}] ${MODELPARAM_VALUE.G_WIDTH_17}
}

proc update_MODELPARAM_VALUE.G_WIDTH_18 { MODELPARAM_VALUE.G_WIDTH_18 PARAM_VALUE.G_WIDTH_18 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_18}] ${MODELPARAM_VALUE.G_WIDTH_18}
}

proc update_MODELPARAM_VALUE.G_WIDTH_19 { MODELPARAM_VALUE.G_WIDTH_19 PARAM_VALUE.G_WIDTH_19 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_19}] ${MODELPARAM_VALUE.G_WIDTH_19}
}

proc update_MODELPARAM_VALUE.G_WIDTH_20 { MODELPARAM_VALUE.G_WIDTH_20 PARAM_VALUE.G_WIDTH_20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_20}] ${MODELPARAM_VALUE.G_WIDTH_20}
}

proc update_MODELPARAM_VALUE.G_WIDTH_21 { MODELPARAM_VALUE.G_WIDTH_21 PARAM_VALUE.G_WIDTH_21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_21}] ${MODELPARAM_VALUE.G_WIDTH_21}
}

proc update_MODELPARAM_VALUE.G_WIDTH_22 { MODELPARAM_VALUE.G_WIDTH_22 PARAM_VALUE.G_WIDTH_22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_22}] ${MODELPARAM_VALUE.G_WIDTH_22}
}

proc update_MODELPARAM_VALUE.G_WIDTH_23 { MODELPARAM_VALUE.G_WIDTH_23 PARAM_VALUE.G_WIDTH_23 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_23}] ${MODELPARAM_VALUE.G_WIDTH_23}
}

proc update_MODELPARAM_VALUE.G_WIDTH_24 { MODELPARAM_VALUE.G_WIDTH_24 PARAM_VALUE.G_WIDTH_24 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_24}] ${MODELPARAM_VALUE.G_WIDTH_24}
}

proc update_MODELPARAM_VALUE.G_WIDTH_25 { MODELPARAM_VALUE.G_WIDTH_25 PARAM_VALUE.G_WIDTH_25 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_25}] ${MODELPARAM_VALUE.G_WIDTH_25}
}

proc update_MODELPARAM_VALUE.G_WIDTH_26 { MODELPARAM_VALUE.G_WIDTH_26 PARAM_VALUE.G_WIDTH_26 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_26}] ${MODELPARAM_VALUE.G_WIDTH_26}
}

proc update_MODELPARAM_VALUE.G_WIDTH_27 { MODELPARAM_VALUE.G_WIDTH_27 PARAM_VALUE.G_WIDTH_27 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_27}] ${MODELPARAM_VALUE.G_WIDTH_27}
}

proc update_MODELPARAM_VALUE.G_WIDTH_28 { MODELPARAM_VALUE.G_WIDTH_28 PARAM_VALUE.G_WIDTH_28 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_28}] ${MODELPARAM_VALUE.G_WIDTH_28}
}

proc update_MODELPARAM_VALUE.G_WIDTH_29 { MODELPARAM_VALUE.G_WIDTH_29 PARAM_VALUE.G_WIDTH_29 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_29}] ${MODELPARAM_VALUE.G_WIDTH_29}
}

proc update_MODELPARAM_VALUE.G_WIDTH_30 { MODELPARAM_VALUE.G_WIDTH_30 PARAM_VALUE.G_WIDTH_30 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_30}] ${MODELPARAM_VALUE.G_WIDTH_30}
}

proc update_MODELPARAM_VALUE.G_WIDTH_31 { MODELPARAM_VALUE.G_WIDTH_31 PARAM_VALUE.G_WIDTH_31 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_31}] ${MODELPARAM_VALUE.G_WIDTH_31}
}

proc update_MODELPARAM_VALUE.G_WIDTH_32 { MODELPARAM_VALUE.G_WIDTH_32 PARAM_VALUE.G_WIDTH_32 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.G_WIDTH_32}] ${MODELPARAM_VALUE.G_WIDTH_32}
}

