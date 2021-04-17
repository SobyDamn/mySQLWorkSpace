create table Account(
 Acc_No int primary key NOT NULL,
 Acc_Name varchar(55) NOT NULL,
 Address varchar(55) NOT NULL,
 Pan_No varchar(15) NOT NULL,
 Acc_Type varchar(20) NOT NULL,
 Balance int default 0 NOT NULL,
 Phone int NOT NULL
);

create table Transaction(
 Trans_Id int primary key NOT NULL,
 Acc_No int NOT NULL,
 Trans_Date DATE NOT NULL,
 Amount int NOT NULL,
 Trans_Type varchar(20) NOT NULL
);

insert into Account (Acc_No, Acc_Name, Address, Pan_No, Acc_Type, Balance, Phone) values
(232732821,"Sritabh Priyadarshi","Mumbai","EYTBE13489","Saving",115000,"7306597482"),
(232213112,"Timothy Alex","Kochi","EYTBA74822","Current",57000,"9847327329"),
(210938477,"Utkrisht Pathak","Patna","AGTBC98989","Saving",109000,"8545784578"),
(452837467,"John Wick","Kolkata","TRYIE18889","Current",4000,"7730752189"),
(273646718,"George Jr.","Bhubneshwar","EUYTD19837","Saving",215000,"8873687368")
(374728172,"Muhammad Siyad","Kochi","TREYW32456","Current",3000,"9199807824");

insert into Transaction (Trans_Id, Acc_No, Trans_Date, Amount, Trans_Type) values
(1000,210938477,'2021-4-12',10000,"Sales"),
(1001,232213112,'2021-1-2',15000,"Purchase"),
(1002,232732821,'2020-10-2',19000,"Payments"),
(1003,232732821,'2021-2-23',50000,"Purchase"),
(1004,374728172,'2020-1-20',105000,"Sales"),
(1005,452837467,'2020-9-1',150000,"Purchase"),
(1006,374728172,'2021-11-2',10000,"Purchase"),
(1007,273646718,'2019-4-2',10000,"Sales");

select * from Account;
select * from Transaction;

---a---
----a(i)----
create view Account_Current as
select Acc_Name,Acc_No,Pan_No
from Account
where Acc_Type = "Current";
----a(ii)----
create view Active_Trans as
select distinct(Acc_Name),Phone,Balance
from Account,Transaction
where Trans_Date not like "2021-04-%" and Balance>100000 and Account.Acc_No = Transaction.Acc_No;

---b---
select * from Account_Current;
select * from Active_Trans;

---c---
update Account set Acc_Type = "SB"
where Balance<5000;

select * from Account;

---d---
insert into Transaction (Trans_Id, Acc_No, Trans_Date, Amount, Trans_Type) 
select 1008, Acc_no,'2021-4-17',10000,"Purchase" from (
    (select T.Acc_No as Acc_No,Balance from Account, Transaction as T
    where Trans_Date not like "2021-04-%" and Balance>200000 and Account.Acc_No = T.Acc_No) as T
);