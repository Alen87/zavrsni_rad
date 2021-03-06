# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\zavrsni_rad\djelatnik_info\djelatnik_info.sql

drop database if exists djelatnik_info;
create database djelatnik_info;
use djelatnik_info;


create table djelatnik(
  sifra int not null primary key auto_increment,
  ime varchar(40) not null,
  prezime varchar(40) not null,
  oib char(11) not null,
  kontakt varchar(30) not null,
  email varchar(30),
  pocetak_rada datetime,
  loyality_kartica char(13) not null,
  radna_odjeca_obuca varchar(100),
  ugovor varchar(30),
  zavrseno_zanimanje varchar(50)
);

create table mobitel(
    sifra int not null primary key auto_increment,
    djelatnik int,
    naziv varchar(40) not null,
    broj varchar(50) not null,
    datum_zaprimanja datetime not null,
    pravo_na_slijedeci datetime,
    serijski_broj varchar(50)
    );

create table edukacija(
    sifra int not null primary key auto_increment,
    naziv varchar(50),   
    datum datetime not null,
    voditelj_edukacije varchar(30) not null,
    trajanje_edukacije_min int
    );

create table sanitarna_iskaznica(
    sifra int not null primary key auto_increment,  
    djelatnik int not null,
    broj_iskaznice varchar(30),
    datum_obavljenog_pregleda datetime,
    vrijedi_do datetime,
    cijena_kn decimal(18,2)
    );

create table djelatnik_edukacija (
    sifra int not null primary key auto_increment,
    djelatnik int,
    edukacija int,
    ocjena int
    );

     #definiranje vanjskih  kljuceva

    alter table sanitarna_iskaznica add foreign key (djelatnik) references djelatnik(sifra);
    alter table mobitel add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (edukacija) references edukacija(sifra);


insert into djelatnik(sifra,ime,prezime,oib,kontakt,email,pocetak_rada,loyality_kartica,radna_odjeca_obuca,ugovor,zavrseno_zanimanje)
values (null,'Danko','Štefančić','57493056784','092/9299848','danko.štefančić@live.com',
       '2015-09-25','5647893054728','hlače 2kom 52,majica 3kom L,papuče 42','neodređeno','Autoelektričar'),
       (null,'Igor','Brstilo','09457384956','091/1144104','brki80@gmail.com',
       '2005-11-03','8455674893485','hlače 2kom 56,majica 3kom XL,papuče 46','neodređeno','Pekar'),
       (null,'Denis','Štefanac','63784900963','091/1238790',null,
       '2005-05-11','7589047859443','hlače 2kom 50,majica 3kom L,papuče 42','neodređeno','Pekar'),
       (null,'Josip','Nađ','76950455637','091/2452235','jole.nađ@gmail.com',
       '2005-03-15','90870964538759','hlače 2kom 48,majica 3kom L,papuče 43','neodređeno','Pekar'),
       (null,'Igor','Horvat','85475698567','098/8790654','igor.horvat@live.com',
       '2007-04-21','9854776735645','hlače 2kom 50,majica 3kom L,papuče 44','neodređeno','Pekar'),      
       (null,'Branimir','Simić','22375889465','098/6757745','branimir.simic@gmail.com',
       '2015-03-02','9578784765647','hlače zimske 2kom 50,majica 3kom L,cipele 44,duksa L','vrijedi do 30.11.2022','Prehrambeni tehničar'),      
       (null,'Mario','Šteko','67589456378','091/2233456','mario.steko@gmail.com',
       '2014-05-05','8759046758978','hlače zimske 2kom 56,majica 3kom L,cipele 44,duksa L','vrijedi do 31.12.2022','Ekonomist'), 
       (null,'Mario','Nađ','34859607885','091/5498765','mario.nad@gmail.com',
       '2008-06-14','4986776095873','hlače 2kom 58,majica 3kom XXL,cipele 45,duksa XXL','neodređeno','Pekar'),
       (null,'Gordana','Alebić','90586700968','091/4455678','goca.alebic@gmail.com',
       '2010-05-24','9006785946578','hlače 2kom 36,majica 3kom S,papuče 36,duksa S','neodređeno','Slastičar'),
       (null,'Ivica','Cindrić','88967584765','091/9065889','ivica.cindric@gmail.com',
       '2005-11-15','9906785094768','hlače 2kom 48,majica 3kom L,cipele 42,duksa L','neodređeno','Vozač');
       

 
insert into mobitel(sifra,djelatnik,naziv,broj,datum_zaprimanja,pravo_na_slijedeci,serijski_broj)
values(null,4,'Samsung Galaxy A12','091/4322238','2021-05-25','2023-05-25','R59R93QPG4J'),
      (null,5,'Samsung Galaxy A12','091/4322239','2022-01-20','2024-01-20','R60R94QPF6Z'),
      (null,7,'Samsung Galaxy A12','091/4322241','2021-03-21','2023-03-21','R80R96QPF4M'),
      (null,1,'Samsung Galaxy A12','091/4322242','2021-05-20','2023-05-20','R80R88QRF4M'),
      (null,2,'Samsung Galaxy A12','091/4322263','2022-03-12','2024-03-12','R90R81QPF4M'),
      (null,3,'Samsung Galaxy A12','091/4322267','2022-02-04','2024-02-04','R56R34QPF4M'),
      (null,10,'Huawei P40','091/4322289','2022-04-13','2024-04-13','R80R4567P450'),
      (null,9,'Huawei P40','091/4322290','2022-02-13','2024-02-13','R80R0987P450'),
      (null,8,'Huawei P40','091/4322292','2022-01-23','2024-01-23','R80R4567P890'),
      (null,6,'Huawei P40','091/4322278','2022-01-15','2022-01-15','R80R7654P450');


insert into edukacija(sifra,naziv,datum,voditelj_edukacije,trajanje_edukacije_min)
values(null,'HACCP-CCP','2022-05-20 12:50:00','Igor Đuza',20),
      (null,'Metal detektor','2022-03-02 13:50:00','Igor Đuza',30),
      (null,'Upravljanje alergenima','2021-11-05 08:00:00','Josip Nađ',80),
      (null,'Opasnost od stranih tijela','2022-04-10 12:00:00','Igor Đuza',50);


insert into djelatnik_edukacija(sifra,djelatnik,edukacija,ocjena)
values(null,1,2,4),
      (null,6,2,3),
      (null,7,2,5);

insert into djelatnik_edukacija(sifra,djelatnik,edukacija,ocjena)
values(null,3,3,4),
      (null,2,3,4),
      (null,5,3,5);

insert into djelatnik_edukacija(sifra,djelatnik,edukacija,ocjena)
values(null,4,1,5),
      (null,1,1,3),
      (null,6,1,4),
      (null,7,1,4); 


insert into djelatnik_edukacija(sifra,djelatnik,edukacija,ocjena)
values(null,1,4,5),
      (null,3,4,3),
      (null,5,4,5),
      (null,7,4,3);      
 



insert into sanitarna_iskaznica(sifra,djelatnik,broj_iskaznice,datum_obavljenog_pregleda,vrijedi_do,cijena_kn)
values (null,1,'B276485','2022-02-15','2023-02-15',200.00),
       (null,2,'B857437','2022-05-10','2023-05-10',200.00),
       (null,3,'B768958','2022-01-17','2023-01-17',200.00),
       (null,4,'B890546','2022-04-01','2023-04-01',200.00),
       (null,5,'B098634','2022-05-03','2023-05-03',200.00),
       (null,6,'B780598','2022-03-15','2023-03-15',200.00),
       (null,7,'B436678','2022-03-25','2023-03-25',200.00),
       (null,8,'B436098','2022-03-11','2023-03-11',200.00),
       (null,9,'B436012','2022-05-20','2023-05-20',200.00),
       (null,10,'B436639','2022-04-23','2023-04-23',200.00);





