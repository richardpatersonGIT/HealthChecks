set outputfile=%1%
set compute=%2%
set configuration_directory=%3%

REM %compute% -log %configuration_directory%\SASApp\BatchServer\Logs\Test_#Y.#m.#d_#H.#M.#s.log  -batch -noterminal -logparm "rollover=session" -sysin C:\Home\01_Projects\TechOps\Healthchecks\03_application\Healthchecks_Library\SAS\hc004.sas -sysparm "%outputfile%"
%compute% -batch -noterminal -sysin C:\Home\01_Projects\TechOps\Healthchecks\03_application\Healthchecks_Library\SAS\hc017.sas -sysparm "%outputfile%"