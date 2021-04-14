
filename configs "C:\SAS\DIserver\Lev1\Utilities\configuration.properties";

data config_params;
  infile configs;
  input;
  put _infile_;
  parameter=scan(_infile_,1,'=');
  value=scan(_infile_,2,'=');
run;

proc printto print="&sysparm" new;
proc print data=config_params;
run;
proc printto;
run;

