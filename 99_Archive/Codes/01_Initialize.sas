%let root=C:\Home\01_Projects\TechOps\CDM;
%let scripts_folder=&root.\Scripts;
%let batfile=&root.\03_Scheduled\Scheduled_today.bat;

libname cdm "&root\CDM SASTables";
filename fileref "&root.\03_Scheduled\Scheduled_today.bat";
