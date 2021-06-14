create table Account(
 Acc_No int primary key NOT NULL,
 Acc_Name varchar(55) NOT NULL,
 Address varchar(55) NOT NULL,
 Pan_No varchar(15) NOT NULL,
 Acc_Type varchar(20) NOT NULL,
 Balance int default 0 NOT NULL,
 Phone varchar(15) NOT NULL
);

insert into Account (Acc_No, Acc_Name, Address, Pan_No, Acc_Type, Balance, Phone) values
(1000,"Sritabh Priyadarshi","Mumbai","EYTBE13489","Saving",115000,"7306597482"),
(1001,"Timothy Alex","Kochi","EYTBA74822","Current",57000,"9847327329"),
(1002,"Utkrisht Pathak","Patna","AGTBC98989","Saving",109000,"8545784578"),
(1003,"John Wick","Kolkata","TRYIE18889","Current",4000,"7730752189"),
(1004,"George Jr.","Bhubneshwar","EUYTD19837","Saving",215000,"8873687368"),
(1005,"Muhammad Siyad","Kochi","TREYW32456","Current",3000,"9199807824");

create table Transaction(
 id int primary key NOT NULL AUTO_INCREMENT,
 Acc_No int NOT NULL,
 Amount int NOT NULL,
 Type varchar(20) check(TYPE="DEPOSIT" OR TYPE="WITHDRAWL")
);

DELIMITER #
create trigger Transact
after insert on Transaction
for each row
begin
    if(new.Type="DEPOSIT") then
        update Account set Balance=Balance+new.Amount where Account.Acc_no=new.Acc_No;
    end if;
    if(new.Type="WITHDRAWL") then
        update Account set Balance=Balance-new.Amount where Account.Acc_no=new.Acc_No;
    end if;
end#

insert into Transaction value(10,1000,15000,"WITHDRAWL");
insert into Transaction value(11,1000,30000,"DEPOSIT");