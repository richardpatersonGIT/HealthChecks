
proc sql;
		 /*	Customer general information on Solution and Server 	*/
         create table cdm.Customer (Customer_ID NUM, Customer_name CHAR(200));  
		 create table cdm.Solution   (Solution_id NUM,customer_id NUM,Solution_name CHAR(200), host_id NUM); 
		 create table cdm.HostServer (host_id NUM, host_name CHAR(200), IP_address CHAR(40)); 
		 /*Host Server Specific Tables*/
		 create table cdm.serverconfig (serverconfig_ID NUM, host_id NUM, SASInstallation_ID NUM, SASConfiguration_ID NUM);
		 create table cdm.sasinstallation (sasinstallation_id NUM, Installation_directory CHAR(200));
         create table cdm.sasconfiguration (sasconfiguration_id NUM, config_level CHAR(30), configuration_directory CHAR(200));


quit;


proc sql;
   delete From cdm.customer;
   delete from cdm.solution;
   delete from cdm.env_table;
   delete from cdm.HostServer;
   delete from cdm.serverconfig;
   delete from cdm.sasinstallation;
   delete from cdm.sasconfiguration;
quit;

proc sql;
          insert into cdm.customer values(1, 'OCS Managed Services') ;
          insert into cdm.customer values(2, 'DESI') ;  
		  insert into cdm.solution  values(1,1,'SAS 9.4 Development Services',1);
		  insert into cdm.solution  values(2,1,'SAS Viya Development Services',2);
		  insert into cdm.solution  values(3,2,'DESI',3);
		  insert into cdm.hostServer values(1, 'OCSNL-VAPROD', '172.16.20.203');	
		  insert into cdm.hostServer values(2, 'OCSNL-VIYA1', '172.16.20.202');
		  insert into cdm.hostServer values(3, 'DESI1', '172.16.20.222');
		  insert into cdm.serverconfig values(1, 1, 1, 1);
          insert into cdm.sasinstallation values(1, 'C:\Program Files\SASHome');
          insert into cdm.sasconfiguration values(1,'Lev1','C:\SAS\DIserver\Lev1');
quit;

/* get all customers, solutions and host servers */
proc sql;
  create table scriptinput as
  select a.customer_id, a.customer_name, b.solution_id, b.solution_name, b.host_id, c.host_name, c.IP_address
 from cdm.customer a, cdm.solution b, cdm.hostserver c
 where a.customer_id = b.customer_id and b.host_id = c.host_id;
quit;