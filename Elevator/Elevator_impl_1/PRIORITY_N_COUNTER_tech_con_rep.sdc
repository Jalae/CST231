###################################################################################
# Mentor Graphics Corporation
#
###################################################################################

#################
# Attributes
#################
set_attribute -name no_enable_dff -value "TRUE" -instance modgen_counter_COUNT_reg_q(1) -design gatelevel 
set_attribute -name no_enable_dff -value "TRUE" -instance modgen_counter_COUNT_reg_q(0) -design gatelevel 


##################
# Clocks
##################
