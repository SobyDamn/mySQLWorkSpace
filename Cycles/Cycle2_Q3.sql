delimiter #
create procedure fib(n INT)
begin
    declare first INT;
    declare second INT;
    declare count INT;
    declare sum INT;
    set first=0,second=1,sum=0,count=0;
    create table fs(num INT);
    insert into fs values(first);
    insert into fs values(second);
    while count<n-2
    do
        set sum = first+second;
        insert into fs values(sum);
        set first = second;
        set second = sum;
        set count = count+1;
    end while;
    select * from fs;
    drop table fs;
end#