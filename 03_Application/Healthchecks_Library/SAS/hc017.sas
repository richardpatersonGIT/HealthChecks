
%put &=sysparm;
proc printto log="&sysparm" new;

libname work list;

proc options;
run;

proc printto;
run;

