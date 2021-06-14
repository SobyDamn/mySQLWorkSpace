CREATE TABLE Student_Marks(
    RNo INT primary key,
    Name VARCHAR(30),
    m1 int,
    m2 int,
    m3 int,
    m4 int,
    m5 int,
    m6 int
);

INSERT INTO Student_Marks
VALUES
(1, 'Aarya', 95,90,92,91,88,85),
(2, 'Anjli', 60, 51, 46, 51, 59, 58),
(3, 'Jack', 72,81,86,80,70,81),
(4, 'Sam', 40,35,64,55,71,30);


delimiter #
drop procedure if exists toGrade;
create procedure toGrade()
begin
    declare total int default 0;
    declare mark1,mark2,mark3,mark4,mark5,mark6 int;
    declare done int default 0;
    declare grade char(2);
    declare sname varchar(30);
    declare cur cursor for select Name, m1,m2,m3,m4,m5,m6 from Student_Marks;
    declare continue handler for not found set done=1;
    open cur;
    read_loop:LOOP
    fetch cur into sname,mark1,mark2,mark3,mark4,mark5,mark6;
    if done=1 then
        leave read_loop;
    end if;
    set total = mark1+mark2+mark3+mark4+mark5+mark6;
    IF total>480 THEN
        SET grade="A";
    ELSEIF total>400 THEN
        SET grade="B+";
    ELSEIF total>360 THEN
        SET grade="B";
    ELSEIF total>300 THEN
        SET grade="C";
    ELSE
        SET grade="F";
    END IF;
    CREATE TABLE Grades(Name varchar(30),Grade CHAR(2), TotalMarks int);
    INSERT INTO Grades values(sname,grade,total);
    select * from Grades;
    drop table Grades;
    END LOOP read_loop;
    CLOSE cur;
end #
delimiter ;