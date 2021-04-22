
Data Schedule_today;
set Schedule_INFO;
script_path=cats("&scripts_folder"||'\',script_name);
run;

data _null_;
set Schedule_today;
   file fileref;
   if _N_=1 then do; put "@echo off";put "start /wait cmd /c   "  script_path;end;
   else do;  put "start /wait cmd /c   " script_path; end;
run;


data _test1;
   x "&batfile.";
run;