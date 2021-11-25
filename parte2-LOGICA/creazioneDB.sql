CREATE SCHEMA delivery;

use delivery;

create table ristorante(
	nome varchar(50),
    indirizzo varchar(150),
    maxPrenotazioni int not null,
    valutazioneMedia double precision not null,
    telefono varchar(20) not null,
  	PRIMARY KEY(nome,indirizzo)
);

create table societa(
	iva varchar(20) primary key,
    nome varchar(50) not null
);

create table amministratore(
	cf char(16) primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    indirizzo varchar(150) not null,
    dataNascita date not null,
    email varchar(50) not null,
    ivaSocieta varchar(20),
    FOREIGN KEY(ivaSocieta) references societa(iva) ON UPDATE CASCADE
);

create table rider(
	cf char(16) primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    indirizzo varchar(150) not null,
    dataNascita date not null,
    email varchar(50) not null,
    dataPrimoImpiego date not null,
    disponibilita bit not null, 			#1) Disponibile          0) non Disponibile
    nSocietaAttuali int not null,
    tipoVeicolo enum("Autoveicolo","Motociclo","Ciclomotore","Bicicletta"),
    targa char(7),
    tipo enum("Non Automunito", "Automunito") default "Non Automunito" not null
);

create table cliente(
	cf char(16) primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    indirizzo varchar(150) not null,
    dataNascita date not null,
    email varchar(50) not null,
    dataRegistrazione date not null
);

create table valutazione(
	dataValutazione date not null,
    score enum ("1","2","3","4","5") not null,
    cfCliente char(16) ,
    cfRider char(16) ,
    FOREIGN KEY (cfCliente) references cliente(cf), 
    FOREIGN KEY (cfRider) references rider(cf),
    PRIMARY KEY(cfCliente, cfRider)
);

create table delivery_interno(
	codice varchar(4) primary key,
    descrizione varchar(256) not null,
    cadenzaSettimanale varchar(100) not null,
    dataInizio date not null,
    nomeRistorante varchar(50),
    indirizzoRistorante varchar(150),
    FOREIGN KEY (nomeRistorante, indirizzoRistorante) references ristorante(nome, indirizzo),
    UNIQUE(nomeRistorante,indirizzoRistorante)
);

create table delivery_esterno(
	codice varchar(4),
    descrizione varchar(256) not null,
    cadenzaSettimanale varchar(100) not null,
    dataInizio date not null,
    nomeRistorante varchar(50),
    indirizzoRistorante varchar(150),
    ivaSocieta varchar(20),
    FOREIGN KEY (nomeRistorante, indirizzoRistorante) references ristorante(nome, indirizzo),
    foreign key(ivaSocieta) references societa(iva),
    PRIMARY KEY(codice,nomeRistorante,indirizzoRistorante,ivaSocieta)
);

create table dipendente(
	cf char(16) primary key,
    nome varchar(50) not null,
    cognome varchar(50) not null,
    indirizzo varchar(150) not null,
    dataNascita date not null,
    email varchar(50) not null,
    shortCurriculum varchar(1024) not null,
    disponibilita bit not null, 			#1) Disponibile          0) non Disponibile
	anniEsperienza int not null,
    tipoContratto enum("Part-Time", "Full-Time") not null,
    dataInizio date not null,
    codiceDelivery varchar(4),
    FOREIGN KEY (codiceDelivery) references delivery_interno(codice)
);

create table telefono(
	numero varchar(20) primary key,
    cfAmministratore char(16),
    cfDipendente char(16),
    cfRider char(16),
    cfCliente char(16),
    FOREIGN KEY (cfAmministratore) references amministratore(cf),
    FOREIGN KEY (cfDipendente) references dipendente(cf),
	FOREIGN KEY (cfRider) references rider(cf),
	FOREIGN KEY (cfCliente) references cliente(cf)
);

create table ordine(
	nOrdine int auto_increment,
    dataOrdinazione date not null,
    orarioEffettivo time(2) not null,
    stato enum("Ordinato", "Espletato", "Consegnato") default "Ordinato" not null,
    tipo varchar(40) not null,
    orarioConsegnaPresunto time(2) not null,
    nominativoRitiro varchar(100) not null,
    nomeRistorante varchar(50),
    indirizzoRistorante varchar(150),
	cfDipendente char(16),
    cfRider char(16),
    cfCliente char(16),
    FOREIGN KEY (nomeRistorante, indirizzoRistorante) references ristorante(nome, indirizzo),
	FOREIGN KEY (cfDipendente) references dipendente(cf),
	FOREIGN KEY (cfRider) references rider(cf),
    FOREIGN KEY (cfCliente) references cliente(cf),
    PRIMARY KEY(nOrdine,nomeRistorante,indirizzoRistorante)
);

create table lavorare_e(
	dataInizio date not null,
    quotaOraria double precision not null,
    ivaSocieta varchar(20),
    cfRider char(16),
    FOREIGN KEY (ivaSocieta) references societa(iva),
    FOREIGN KEY (cfRider) references rider(cf),
    primary key(ivaSocieta,cfrider)
);



