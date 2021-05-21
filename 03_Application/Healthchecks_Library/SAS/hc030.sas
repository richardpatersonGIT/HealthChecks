

proc printto log="&sysparm" new;

data _null_;
infile "!SASCFG\sasv9.cfg";
 input;
 put _infile_;
run;

proc printto;
run;

