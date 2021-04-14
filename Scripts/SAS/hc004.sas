
%put &=sysparm;
proc printto log="&sysparm" new;

proc setinit;
run;

proc printto;
run;

