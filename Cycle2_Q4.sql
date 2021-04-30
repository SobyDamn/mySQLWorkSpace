delimiter #
create procedure OddEven(n INT)
begin
    declare count int;
    declare oddNum int;
    declare evenNum int;
    set count=1;
    set oddNum = 1;
    set evenNum = 2;
    create temporary table numbers(S_No int primary key AUTO_INCREMENT,ODD int,EVEN int);
    while count<=n
    do
        insert into numbers( ODD, EVEN) values (oddNum,evenNum);
        set count = count + 1;
        set oddNum = oddNum + 2;
        set evenNum = evenNum + 2;
    end while;
    select * from numbers;

end#
delimiter ;