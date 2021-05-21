REM using >> will append to file

powershell "get-service SAS* | format-table -autosize" >%1