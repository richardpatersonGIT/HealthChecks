set outputfile=%1%
set compute=%2%
set configuration_directory=%3%

%compute% -batch -noterminal -sysin C:\Home\01_Projects\TechOps\Healthchecks\03_application\Healthchecks_Library\SAS\hc030.sas -sysparm "%outputfile%"