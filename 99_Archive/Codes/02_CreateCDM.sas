/****************************************************/
/*  Program Name: CreateCDM					        */
/*  Program Description:This is to create a         */
/*  CDM Sample Data Warehouse					    */
/*					                         		*/
/*													*/
/*												    */
/*												    */
/*												    */
/*												    */
/*****************************************************/



proc sql;
		/*	Customer general information on Solution and Server 	*/
         create table cdm.Customer (Customer_ID NUM, Customer_name CHAR(200), Customer_Current_IND CHAR(1));  
		 create table cdm.Solution   (Solution_id NUM,customer_id NUM,Solution_name CHAR(200)); 
		 /*Host Server Specific Tables*/
		 create table cdm.env_table ( Env_ID NUM, Solution_ID NUM, Environment_Name CHAR(100),Description CHAR(200),Site_ID NUM);
		 create table cdm.HostServer (Server_id NUM, Server_name CHAR(200), IP_address CHAR(40),OS_Type CHAR(200),OS_version CHAR(200),Java_Version CHAR(20), Env_id NUM ); 
		 create table cdm.Connection (Connect_ID NUM, Server_ID NUM, User_ID CHAR(40));
		 create table cdm.SMTP_info  (SMTP_ID NUM,Env_id NUM,SMTP_Host CHAR(25), SMTP_Port NUM, SMTP_Sender CHAR(100)); /*For Each SMTP id there can be multiple email recepients*/
		 create table cdm.AD_Sync  (Env_ID NUM, AD_Host CHAR(20),AD_Port NUM, TLS_Enabled_IND CHAR(1)); 
		 create table cdm.Notification_info (SMTP_ID NUM, Email_Recp CHAR(100), email_enable CHAR(1));
		 create table cdm.SAS (Site_ID NUM,LEV_Num Char(30), SAS_Home CHAR(200), SAS_Version CHAR(200), SAS_Config CHAR(200), Expiry_Date CHAR(20));
		 create table cdm.SAS_HF (Site_ID NUM,Products_Installed CHAR(100), Hotfix CHAR(10),Applied_IND CHAR(1));
		/*Scheduling Details*/
	    create table cdm.schedule (schedule_id NUM,Env_id NUM,HealthCheck_ID NUM, Frequency_ID CHAR(1), Description CHAR(200),Enable_ind CHAR(1)); 
	    create table cdm.healthcheck (HealthCheck_id NUM, Script_ID NUM, description CHAR(200));
	    create table cdm.scripts (Script_ID NUM, Script_Name CHAR(30),Script_Description CHAR(200));
		 
quit;

proc sql;

          insert into cdm.customer values(3001, 'Test CustomerA','Y') ; 
		  insert into cdm.solution  values(4001,3001,'Data Management');
		  insert into cdm.Env_table   values (1,4001,'Development','Single Machine Installation',76012356) 
														  values(2,4001,'Testing','Single Machine Installation',76012378)  
														  values(3,4001,'Production','Single Machine Installation',76012478);
	      insert into cdm.hostServer values(1001, 'OCSNL-DEV', '192.168.1.1','WIN','X64_PRO10','1.7.0_151',1)  
														  values(1002, 'OCSNL-TEST', '192.168.1.2','WIN','X64_PRO10','1.7.0_151',2) 
														   values(1003, 'OCSNL-PRD', '192.168.1.3','WIN','X64_PRO10','1.7.0_151',3);								
		  insert into cdm.connection  values(9001, 1001, 'dev\user1') values(9002,1002,'test\user2') values(9003,1003,'prod\user3');
		  insert into cdm.SMTP_info values (8001,1,'mail.testa.com',25,'dev@noreply.com') values(8002,2,'mail.testa.com',25,'test@noreply.com') values(8003,3,'mail.testa.com',25,'prod@noreply.com');
		  insert into cdm.ad_sync values(1,'ldap.testa.com',389,'N') values(2,'ldap.testa.com',389,'N') values(3,'ldap.testa.com',389,'N');
		  insert into cdm.Notification_info values (8001,'ambica.palamittam@ocs-consulting.com','Y') values(8001,'Richard.Paterson@ocs-consulting.com','Y');
		  insert into cdm.sas values (76012356,'Lev1','C:\Program Files\SASHome','SAS 9.04.M5','C:\SAS\DIServer','09DEC2021')
											values(76012378,'Lev1','C:\Program Files\SASHome','SAS 9.04.M5','C:\SAS\DIServer','09DEC2021') 
               							    values(76012478,'Lev1','C:\Program Files\SASHome','SAS 9.04.M5','C:\SAS\DIServer','09DEC2021');
     	  insert into cdm.SAS_HF values (76012356,'SAS Visual Analytics Explorer Logical Types','B2V001','N');		
		  insert into cdm.schedule  values(7001, 3, 6001, 'D', 'daily services healthcheck','Y') values(7002, 3, 6002, 'M', 'monthly directory space healthcheck','Y');
		  insert into cdm.healthcheck values(6001, 5002, "") 	values(6002, 5001, "general file system checks");
   		  insert into cdm.scripts  values(5001, 'ServerStatus.bat','check metadataServer service')  values(5002,'DiskSpace.bat', 'check disk space');
quit;



proc sql;
		 /*	Customer general information on Solution and Server 	*/
         create table cdm.Customer (Customer_ID NUM, Customer_name CHAR(200));  
		 create table cdm.Solution   (Solution_id NUM,customer_id NUM,Solution_name CHAR(200)); 
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
		  insert into cdm.solution  values(1,1,'SAS 9.4 Development Services');
		  insert into cdm.solution  values(2,1,'SAS Viya Development Services');
		  insert into cdm.hostServer values(1, 'OCSNL-VAPROD', '172.16.20.203');	
		  insert into cdm.hostServer values(2, 'OCSNL-VIYA1', '172.16.20.202');
		  insert into cdm.serverconfig values(1, 1, 1, 1);
          insert into cdm.sasinstallation values(1, 'C:\Program Files\SASHome');
          insert into cdm.sasconfiguration values(1,'Lev1','C:\SAS\DIserver\Lev1');
quit;


proc sql;
  create table scriptinput as
  select a.customer_id, a.customer_name, b.solution_id, b.solution_name, c.env_id, c.environment_name
  from cdm.customer a, cdm.solution b, cdm.env_table c
  where a.customer_id = b.customer_id and b.solution_id = c.solution_id;
quit;


left join cdm.env_table c
  on b.solution_id = c.solution_id
  left join cdm.hostserver d
  on c.env_id = d.env_id
  where a.customer_current_ind='Y';
quit;



proc sql ;
create table  Schedule_INFO as
select distinct
	d.customer_name, 
	b.Environment_Name,
	a.schedule_id, 
	a.healthcheck_id, 
	h.script_name,
	a.env_id,
	a.description,
	b.solution_id,
	c.solution_name,
	d.customer_id, 
	e.Server_id,
	e.Server_name,
    e.IP_address, 
	f.user_id
from cdm.schedule a
 ,cdm.env_table b
 ,cdm.healthcheck g
 ,cdm.scripts h
,cdm.solution c
,cdm.customer d
,cdm.hostServer e
,cdm.connection f 
where a.env_id = b.env_id 
and b.solution_id = c.solution_id 
and c.customer_id=d.customer_id 
and e.server_id=f.server_id
and a.env_id=e.env_id
and a.HealthCheck_id=g.HealthCheck_id
and g.script_id=h.script_id
and a.frequency_id='D';
quit;



proc setinit;
run;
