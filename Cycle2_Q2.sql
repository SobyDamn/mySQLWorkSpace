create table Account(
 Acc_No int primary key NOT NULL,
 Acc_Name varchar(55) NOT NULL,
 Balance int default 0 NOT NULL
);

create table Transaction(
 Trans_Id int primary key NOT NULL,
 Acc_No int NOT NULL,
 Trans_Date DATE NOT NULL,
 Amount int NOT NULL,
 Trans_Type varchar(20) NOT NULL
);

insert into Account (Acc_No, Acc_Name,Balance) values
(232732821,"Sritabh Priyadarshi",115000),
(232213112,"Timothy Alex",57000),
(210938477,"Utkrisht Pathak",109000),
(452837467,"John Wick",4000),
(273646718,"George Jr.",215000),
(374728172,"Muhammad Siyad",3000);

insert into Transaction (Trans_Id, Acc_No, Trans_Date, Amount, Trans_Type) values
(1000,210938477,'2021-4-12',10000,"Sales"),
(1008,210938477,'2021-4-10',5000,"Sales"),
(1001,232213112,'2021-1-2',15000,"Purchase"),
(1002,232732821,'2020-1-2',19000,"Payments"),
(1003,232732821,'2021-1-5',50000,"Purchase"),
(1004,374728172,'2020-5-20',105000,"Sales"),
(1009,374728172,'2021-5-23',50000,"Purchase"),
(1005,452837467,'2020-9-1',150000,"Purchase"),
(1006,374728172,'2021-12-2',10000,"Purchase"),
(1010,210938477,'2021-5-12',5000,"Sales"),
(1007,273646718,'2019-4-2',10000,"Sales"),
(1011,210938477,'2021-4-14',50000,"Purchase");

select * from Account
select * from Transaction
---a---
select from Account
where Balance = (select max(Balance) from Account);

---b---
select distinct(Acc_Name),T.Acc_No, count(T.Acc_No) from Transaction as T,Account as A
where A.Acc_No = T.Acc_No group by T.Acc_No, extract(week from Trans_Date)
having count(T.Acc_No)>1;

---c---
select distinct(Acc_Name),Balance from (
    select Acc_No from Transaction
    where Trans_Date like "2021-04-%" and Amount>2500
) as T, Account as A where T.Acc_No = A.Acc_No;
---d---
select distinct(Acc_Name)as Name from (
    select Acc_No from Transaction
    where Trans_Date not like "2021-04-%" and
    Acc_No not in (
        select Acc_No from Transaction
    where Trans_Date like "2021-04-%"
    )
) as T, Account as A where T.Acc_No = A.Acc_No;