#INSERIMENTO DEI RISTORANTI
INSERT INTO ristorante values ("Mamma mia", "Via Roma 43 Napoli", 120, 0, "+390818216547");
INSERT INTO ristorante values ("Da coccobello", "Via Napoli 72 Napoli", 100, 0, "+390812815657");
INSERT INTO ristorante values ("Ristorante Della Delizia", "Via San Francesco 215 Roma", 200, 0, "+390818281644");
INSERT INTO ristorante values ("Da gino", "Viale della lana 124 Milano", 80, 0, "+390819413744");

#INSERIMENTO DELLE SOCIETA'
INSERT INTO societa values("31557080053","Just Eat");
INSERT INTO societa values("69978110554","Glovoo");
INSERT INTO societa values("11940360172","MagnammApp");

#INSERIMENTO DEGLI AMMINISTRATORI
INSERT INTO amministratore values ("TPJPRL39S20B493L","Mario","Rossi","Via Roma 92 Milano","1974-12-24","mariorossi@gmail.com","31557080053");
INSERT INTO amministratore values ("ZGKHYF40C43H218U","Giuseppe","Verdi","Via Napoli 42 Napoli","1969-07-20","peppeverdi69@gmail.com","11940360172");
INSERT INTO amministratore values ("FMJGMC89C16H287C","Alfredo","Gialli","Via Torino 12 Pescara","1970-01-10","giallialfredo@hotmail.com","69978110554");

#INSERIMENTO DEI RIDER
INSERT INTO rider values ("KTCTGF67D42D143N","Gina","Padovesi","Via Rocca de Baldi, 132","1963-12-18","GinaPadovesi@dayrep.com","2000-12-24",1,1,null,null,"Non Automunito");
INSERT INTO rider values ("LTZCHM53T06F151C","Gaetana","Mazzi","Via Antonio da Legnago, 34","1970-10-18","GaetanaMazzi@jourrapide.com","2002-02-10",1,2,"Autoveicolo","CF728SL","Automunito");
INSERT INTO rider values ("GNFGFM28A10G111R","Delmo","Capon","Via Vico Ferrovia, 35","1968-08-30","DelmoCapon@armyspy.com","1995-02-10",1,4,"Bicicletta","AB123CD","Automunito");

#INSERIMENTO DEI CLIENTI
INSERT INTO cliente values("BHGSNS81E16B505U","Alessandro","Borghese","Via Roma 87",'1973-12-18', "alexborghese@hotmail.it",'2017-12-25');
INSERT INTO cliente values("DGXVEA62T17I550O","Michael","Rossi","Via Napoli 812", '2004-11-01', "mcd123456@hotmail.it",'2019-12-24');
INSERT INTO cliente values("HBQZTC69D43I438Q","Tibio","Cracco","Via Delle Rose 95", '2008-11-01', "playgames123@hotmail.it",'2019-07-02');

#INSERIMENTO DELLE VALUTAZIONI
INSERT INTO valutazione values('2018-12-12', "2", "BHGSNS81E16B505U","KTCTGF67D42D143N");
INSERT INTO valutazione values('2018-12-13', "3", "BHGSNS81E16B505U","LTZCHM53T06F151C");
INSERT INTO valutazione values('2019-12-25', "5", "BHGSNS81E16B505U","GNFGFM28A10G111R");

#INSERIMENTO DEI DELIVERY INTERNI
INSERT INTO delivery_interno values("AB12","Consegne che arriveranno a casa vostra in poco tempo, non esitate ad ordinare","L/M/M/G",'2008-11-01', "Mamma mia", "Via Roma 43 Napoli");
INSERT INTO delivery_interno values("7373","Consegne che forse arriveranno a casa vostra in moooolto tempo, non ordinare","Weekend",'2019-11-01', "Ristorante Della Delizia", "Via San Francesco 215 Roma");

#INSERIMENTO DEI DELIVERY ESTERNI
INSERT INTO delivery_esterno values("SL23","Consegnamo sempre abbiamo tante offerte","L/M/M/G",'2019-11-01', "Mamma mia", "Via Roma 43 Napoli","31557080053");
INSERT INTO delivery_esterno values("ABCD","Pure quest'altro abbiamo","Weekend",'2020-11-07', "Ristorante Della Delizia", "Via San Francesco 215 Roma","31557080053");
INSERT INTO delivery_esterno values("AB23","Compra anche da qui","Weekend",'2020-11-07', "Ristorante Della Delizia", "Via San Francesco 215 Roma","11940360172");

#INSERIMENTO DEI DIPENDENTI
INSERT INTO dipendente values("CPFRLP61H66B595D","Alfredo","Della Valle", "Via nun ta ric 154?", '2002-11-07',"msiajid@sadjksajka.com","Sono un bravo ragazzo, un pò fuori di testa",0,1,"Part-Time",'2019-04-07',"AB12");
INSERT INTO dipendente values("RBDFHJ42B22C958I","Maria","Della Valle", "Via nun ta ric 152?", '2001-11-07',"dsfgeffe@sadjksajka.com","Sono una bravo ragazza, un pò fuori di testa",1,2,"Full-Time",'2018-04-12',"7373");

#INSERIMENTO DEI TELEFONI
INSERT INTO telefono values("3345113254",null,null,"KTCTGF67D42D143N",null);
INSERT INTO telefono values("3315464167","FMJGMC89C16H287C",null,null,null);
INSERT INTO telefono values("0812454654",null,null,null,"HBQZTC69D43I438Q");

#INSERIMENTO IN lavorare_e

INSERT INTO lavorare_e values('2002-11-07',3.50,"31557080053","KTCTGF67D42D143N");
INSERT INTO lavorare_e values('2005-12-07',8,"31557080053","LTZCHM53T06F151C");



#INSERIMENTO DEGLI ORDINI
INSERT INTO ordine values(0, '2020-11-07','19:30',"Ordinato","Primo Piatto", '20:00',"Francesco Cracco", "Mamma mia", "Via Roma 43 Napoli",null,"KTCTGF67D42D143N","BHGSNS81E16B505U");
INSERT INTO ordine values(0, '2020-11-07','17:30',"Consegnato","Pizza", '18:00',"Francesco Paciello", "Mamma mia", "Via Roma 43 Napoli","CPFRLP61H66B595D",null,"HBQZTC69D43I438Q");
INSERT INTO ordine values(0, '2020-11-07','17:30',"Consegnato","Pesce", '18:00',"Michael Del Piero", "Mamma mia", "Via Roma 43 Napoli","CPFRLP61H66B595D",null,"DGXVEA62T17I550O");
INSERT INTO ordine values(0, '2020-11-07','19:30',"Consegnato","Pizza", '18:50',"Mario Verdi", "Ristorante Della Delizia", "Via San Francesco 215 Roma","RBDFHJ42B22C958I",null,"HBQZTC69D43I438Q");