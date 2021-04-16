create table DEPARTMENT(
 DNO int primary key NOT NULL,
 DNAME varchar(50),
 D_HOD varchar(50)
);
create table EMPLOYEE(
 ENO int primary key NOT NULL AUTO_INCREMENT,
 ENAME varchar(55) NOT NULL,
 SALARY int NOT NULL,
 DNO int,
 MNGRNO int,
 DOJ DATE NOT NULL,
 JOB varchar(55),
 ADDRESS varchar(255),
 CITY ENUM('KOCHI','MUMBAI','CHENNAI'),
 PINCODE int
);
ALTER TABLE EMPLOYEE AUTO_INCREMENT=1;
insert into DEPARTMENT( DNO, DNAME, D_HOD)
values (10, 'Delivery', 'Reventh'),(20, 'Sales', 'Sritabh Priyadarshi'),(30,'Accounts','Anusha Maiti'),(40,'Tax','Kevin');
insert into DEPARTMENT( DNO, DNAME, D_HOD)
values (50,"Quality Assurance","Nayan");

insert into EMPLOYEE (ENAME, SALARY, DNO, MNGRNO, DOJ, JOB, ADDRESS, CITY, PINCODE) values
("Janvi Gupta",11000,10,NULL,"2002-11-2","Clerk","Ambala","Mumbai",400022),
("Juke Guy",10000,30,NULL,"2000-11-2","Worker","South Kalamessary","KOCHI",600022),
("Sritabh Priyadarshi",10000,30,NULL,"1999-10-2","Worker","South Kalamessary","KOCHI",600022),
("Utkrisht Pathak",9000,20,NULL,"2000-11-4","Clerk","Dadar Nagar","MUMBAI",400012),
("Timothy Alex",15000,40,NULL,"1997-11-4","Worker","Anna Nagar","CHENNAI",600012),
("Anusha Maiti",7000,30,122,"2000-1-12","Manager","Navi Mumbai","MUMBAI",400112),
("Revanth",6000,10,NULL,"1997-11-4","Clerk","Nijam Nagar","MUMBAI",400102),
("Johnson",8000,40,NULL,"2000-11-14","Worker","Anna Nagar","CHENNAI",600012),
("Sruthi Nair",9000,20,121,"2001-1-2","Manager","Mahali Nagar","MUMBAI",400112),
("Nisha Pathak",11000,20,NULL,"1997-10-4","Clerk","Maveli","MUMBAI",400232),
("Abhishek Randhawa",5000,40,123,"2000-11-4","Manager","Panchal Nagar","CHENNAI",601012),
("Kevin",10000,10,120,"2002-11-12","Manager","Navi Nagar","MUMBAI",400136);


--A---
select * from DEPARTMENT;
select * from EMPLOYEE natural join DEPARTMENT;
SELECT ENAME as HOD,E.DNO,DNAME,JOB FROM EMPLOYEE as E,DEPARTMENT as D WHERE E.ENAME=D.D_HOD;

--B--
select * from EMPLOYEE as E left join DEPARTMENT as D on E.DNO = D.DNO group by E.ENO;
select * from EMPLOYEE as E right join DEPARTMENT as D on E.DNO = D.DNO;

(select * from EMPLOYEE as E left join DEPARTMENT as D on E.DNO = D.DNO group by E.ENO)
union
(select * from EMPLOYEE as E right join DEPARTMENT as D on E.DNO = D.DNO);