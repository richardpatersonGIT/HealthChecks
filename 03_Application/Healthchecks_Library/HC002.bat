sc query "SAS [DIserver-Lev1] Deployment Tester Server" >%1

sc query "SAS [DIserver-Lev1] SASMeta - Metadata Server" >%1

powershell get-service SAS* >>%1