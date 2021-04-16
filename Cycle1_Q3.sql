create table KERALA(
 SNO int primary key not null AUTO_INCREMENT,
 Name varchar(50) not null,
 Literacy Decimal(5,2) not null,
 Population INT,
 Area INT
);
create table TAMILNADU(
 SNO int primary key not null AUTO_INCREMENT,
 Name varchar(50) not null,
 Literacy Decimal(5,2) not null,
 Population INT,
 Area INT
);

insert into KERALA (Name, Literacy, Population, Area) values
("Malappuram",93.00,4112920,3554),
("Thiruvananthapuram",93.00,3301427,2189),
("Ernakulam",96.00,3282388,3063),
("Thrissur",95.00,3121200,3027),
("Kozhikode",95.00,3086293,2345),
("Palakad",89.00,2809934,3005);

insert into TAMILNADU (Name, Literacy, Population, Area) values
("Chennai",89.00,4646732,3554),
("Kancheepuram",84.00,3998252,2189),
("Vellore",79.00,3936331,3063),
("Thiruvallur",84.00,3728104,3027),
("Salem",72.00,3482056,2345),
("Viluppuram",71.00,3458873,3005);

--A--
select K.Name as KERALA_District, T.Name as TAMILNADU_District,K.Literacy as Literacy from KERALA as K,TAMILNADU as T where T.Literacy = K.Literacy;

--B--
select K.Name as Kerala_District,T.Name as TamilNadu_District from KERALA as K,TAMILNADU as T where T.SNO = K.SNO;
--C--
Select K.Literacy as Kerala_Literacy, T.Literacy as TamilNadu_Literacy from KERALA as K,TAMILNADU as T where K.SNO = T.SNO;

SELECT K.Literacy FROM KERALA as K
LEFT JOIN
    TAMILNADU USING (Literacy)
WHERE
    TAMILNADU.Literacy IS NULL;