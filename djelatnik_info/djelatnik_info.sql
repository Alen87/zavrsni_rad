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
  radna_odjeca_obuca varchar(50),
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
    trajanje_edukacije varchar(20)
    );

create table sanitarna_iskaznica(
    sifra int not null primary key auto_increment,  
    djelatnik int not null,
    broj_iskaznice varchar(30),
    datum_obavljenog_pregleda datetime,
    vrijedi_do datetime,
    cijena decimal(18,2)
    );

    create table djelatnik_edukacija (
        sifra int not null primary key auto_increment,
        djelatnik int,
        edukacija int,
        ocjena varchar(40)
    );

     #definiranje vanjskih  kljuceva

    alter table sanitarna_iskaznica add foreign key (djelatnik) references djelatnik(sifra);
    alter table mobitel add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (edukacija) references edukacija(sifra);


insert into djelatnik(sifra,ime,prezime,oib,kontakt,email,pocetak_rada,loyality_kartica,radna_odjeca_obuca,ugovor,zavrseno_zanimanje)
values (null,'Danko','Štefančić','57493056784','092/9299848','danko.štefančić@live.com',
       '2015-09-25','5647893054728','hlače 2kom 52,majica 3kom L,papuče 42','na neodređeno','Autoelektričar'),
       (null,'Igor','Brstilo','09457384956','091/1144104','brki80@gmail.com',
       '2005-11-03','8455674893485','hlače 2kom 56,majica 3kom XL,papuče 46','na neodređeno','Pekar'),
       (null,'Denis','Štefanac','63784900963','091/1238790',null,
       '2005-05-11','7589047859443','hlače 2kom 50,majica 3kom L,papuče 42','na neodređeno','Pekar'),
       (null,'Josip','Nađ','76950455637','091/2452235','jole.nađ@gmail.com',
       '2005-03-15','90870964538759','hlače 2kom 48,majica 3kom L,papuče 43','na neodređeno','Pekar'),
       (null,'Igor','Horvat','85475698567','098/8790654','igor.horvat@live.com',
       '2007-04-21','9854776735645','hlače 2kom 50,majica 3kom L,papuče 44','na neodređeno','Pekar'),      
       (null,'Branimir','Simić','22375889465','098/6757745','branimir.simic@gmail.com',
       '2015-03-02','9578784765647','hlače zimske 2kom 50,majica 3kom L,papuče 44,duksa L','vrijedi do 01.12.2022  ','Prehrambeni tehničar');      





