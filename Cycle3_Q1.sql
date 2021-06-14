CREATE TABLE Consumer(
CID INT primary key,
Name VARCHAR(30),
Address varchar(60),
LRead int,
CRead int,
Month int,
Year int,
UnitCharge int DEFAULT 2
);
INSERT INTO Consumer(CID, Name, Address, LRead, CRead,Month,Year,UnitCharge)
VALUES
(10, 'Sritabh', 'Patna', 110, 230,6,2021,5),
(11, 'Timothy', 'Ernakulam', 280, 510, 5,2021,3),
(12, 'Utkrisht', 'Patna', 200, 400, 6,2021, 2);
delimiter #
drop procedure if exists electricityBill;
create procedure electricityBill(ID int,CUR_READ int)
begin
    declare bill int;
    declare charge int;
    declare LastDate Date;
    declare consumed_unit int;
    declare cname varchar(30);
    declare L_READ int;
    DECLARE Y INT;
    DECLARE M INT;
    declare cur cursor for select Name,LRead,Month,Year,UnitCharge from Consumer where CID = ID;
    OPEN CUR;
    FETCH CUR INTO cname,L_READ,M,Y,charge;
    SET LastDate = DATE_ADD(CURDATE(),Interval 10 DAY);
    SET consumed_unit = CUR_READ-L_READ;
    SET bill = consumed_unit * charge;
    CREATE TABLE Bill(CID INT, Name CHAR(50), LastDate DATE, consumed_unit int, Charge int);
    INSERT INTO Bill values(CID, cname, LastDate, consumed_unit, bill);
    SELECT*FROM Bill;
    DROP TABLE Bill;
    CLOSE CUR;

    UPDATE Consumer SET CRead=CUR_READ WHERE CID=ID;
end#
delimiter ;