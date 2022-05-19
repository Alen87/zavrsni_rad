# C:\xampp\mysql\bin>mysql -uroot --default_character_set=utf8 < C:\Users\Alen\Documents\GitHub\Alen87\baze_zadaca\djelatnik_info\djelatnik_info.sql

drop database if exists djelatnik_info;
create database djelatnik_info;
use djelatnik_info;


create table djelatnik(
  sifra int not null primary key auto_increment,
  ime_prezime varchar(50) not null,
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
        edukacija int
    );

     #definiranje vanjskih  kljuceva

    alter table sanitarna_iskaznica add foreign key (djelatnik) references djelatnik(sifra);
    alter table mobitel add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (djelatnik) references djelatnik(sifra);
    alter table djelatnik_edukacija add foreign key (edukacija) references edukacija(sifra);