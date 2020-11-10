create table DIOCESE (
  ID bigint not null,
  NAME varchar(100) not null,
  ID_OLD bigint null default null,
  CREATE_DATE timestamp,
  UPDATE_DATE timestamp,
  primary key (ID)
);
create table AGENCY (
  ID bigint not null,
  DIOCESE_ID bigint not null,
  NAME varchar(100) not null,
  DESCRIPTION varchar(2600) null default null,
  POSTCODE varchar(5) null default null,
  CITY varchar(100) null default null,
  IS_TEAM_AGENCY tinyint not null default 0,
  CONSULTING_TYPE tinyint null default 0,
  IS_OFFLINE tinyint not null default 0,
  ID_OLD bigint null default null,
  CREATE_DATE timestamp,
  UPDATE_DATE timestamp,
  DELETE_DATE timestamp null default null,
  primary key (ID),
  foreign key (DIOCESE_ID) references DIOCESE(ID)
);
create table AGENCY_POSTCODE_RANGE (
  ID bigint not null,
  AGENCY_ID bigint not null,
  POSTCODE_FROM varchar(5) not null,
  POSTCODE_TO varchar(5) not null,
  CREATE_DATE timestamp,
  UPDATE_DATE timestamp,
  primary key (ID),
  foreign key (AGENCY_ID) references AGENCY(ID)
);
insert into DIOCESE (ID, NAME, ID_OLD, CREATE_DATE, UPDATE_DATE)
values (
  0,
  'Aachen',
  1,
  '2018-12-11 11:18:20',
  '2019-04-08 11:28:57'
), (
  1,
  'Köln',
  2,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  2,
  'Münster',
  3,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  3,
  'Bamberg',
  4,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  4,
  'Virtuelle Diözese',
  8,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  5,
  'Augsburg',
  9,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  6,
  'Berlin',
  10,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  7,
  'Dresden-Meißen',
  11,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  8,
  'Eichstätt',
  12,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  9,
  'Erfurt',
  13,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  10,
  'Essen',
  14,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  11,
  'Freiburg',
  15,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  12,
  'Fulda',
  16,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  13,
  'Görlitz',
  17,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  14,
  'Hamburg (Erzdiözese)',
  18,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  15,
  'Hildesheim',
  19,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  16,
  'Limburg',
  20,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  17,
  'Magdeburg',
  21,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  18,
  'Mainz',
  22,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  19,
  'München und Freising',
  24,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  20,
  'Osnabrück',
  25,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  21,
  'Paderborn',
  26,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  22,
  'Passau',
  27,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  23,
  'Regensburg',
  28,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  24,
  'Rottenburg-Stuttgart',
  29,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  25,
  'Speyer',
  30,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  26,
  'Trier',
  31,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  27,
  'Würzburg',
  32,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
), (
  28,
  'Oldenburg',
  33,
  '2018-12-11 11:18:20',
  '2018-12-11 11:18:20'
);
insert into AGENCY (ID, DIOCESE_ID, NAME, DESCRIPTION, POSTCODE, CITY, IS_TEAM_AGENCY,
  CONSULTING_TYPE, IS_OFFLINE, ID_OLD, CREATE_DATE, UPDATE_DATE, DELETE_DATE
)
values (
  0,
  1,
  'Fachambulanz Sucht Caritas/Diakonie Bonn',
  'Beratung , Behandlung und Betreuung von Alkohol-, Drogen-  und Medikamentenabhängige , Spielsüchtige und  Angehörige.',
  '53113',
  'Bonn',
  1,
  0,
  0,
  9,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  1,
  1,
  'JUGEND SUCHT BERATUNG Köln, SKM e.V. Köln',
  'Offene Sprechstunden für Jugendliche und junge Erwachsene: Dienstag 16.00-18.00 Uhr Mittwoch 16.00-17.00 Uhr Freitag 13.00-14.00 Uhr',
  '50672',
  'Köln',
  0,
  0,
  0,
  10,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  2,
  1,
  'Caritas Suchthilfe des Rheinisch-Bergischer Kreises',
  null,
  '51465',
  'Bergisch Gladbach',
  0,
  0,
  0,
  11,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  3,
  1,
  'update Fachstelle für Suchtprävention - Kinder-, Jugend-, Elternberatung',
  'Die Fachstelle update versteht sich als spezialisierte Einrichtung für die Beratung, Behandlung, Betreuung und Prävention von Kindern und Jugendlichen bis zum 21. Lebensjahr und deren Angehörige in Bonn.Darüber hinaus stellen wir ein umfangreiches Angebot an Informationsveranstaltungen, Fortbildungen, erlebnispädagogischen Projekten und Beratungen zu suchtspezifischen und Persönlichkeit stärkenden Themen bereit.',
  '53127',
  'Bonn',
  0,
  0,
  0,
  12,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  4,
  1,
  'Fachstelle für Beratung, Therapie und Suchtprävention Düsseldorf',
  'Die Fachstelle ist Ihr Ansprechpartner - bei Problemen mit Alkohol, Nikotin, Medikamenten und Essstörungen- für Betroffene und Angehörige',
  '40219',
  'Düsseldorf',
  0,
  0,
  0,
  13,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  5,
  1,
  'komm-pass Drogenberatung Düsseldorf',
  'komm-pass ist Ihr Ansprechpartner- bei Problemen mit illegalen Drogen- für Betroffene und Angehörige',
  '40210',
  'Düsseldorf',
  0,
  0,
  0,
  14,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  6,
  1,
  'Psychosoziale Beratungsstelle des Caritasverbandes für den Rhein-Erftkreis e.V.',
  null,
  '50170',
  'Kerpen-Sindorf',
  0,
  0,
  0,
  15,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  7,
  1,
  'Suchtberatungs- und Behandlungsstelle der Caritas Suchthilfe Euskirchen',
  null,
  '53879',
  'Euskirchen',
  0,
  0,
  0,
  16,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  8,
  1,
  'Caritas- Suchthilfe Oberberg e.V. - Gummersbach',
  null,
  '51643',
  'Gummersbach',
  0,
  0,
  0,
  17,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  9,
  1,
  'Caritas-Suchthilfe Mettmann',
  null,
  '42489',
  'Wülfrath',
  0,
  0,
  0,
  18,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  10,
  1,
  'Fachambulanz für Suchtkranke Neuss',
  null,
  '41464',
  'Neuss',
  0,
  0,
  0,
  19,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  11,
  1,
  'Caritas Suchtkrankenhilfe Rheinbach/Bornheim',
  null,
  '53359',
  'Rheinbach',
  0,
  0,
  0,
  20,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  12,
  1,
  'Caritas Suchtkrankenhilfe Siegburg/Eitorf',
  null,
  '53721',
  'Siegburg',
  0,
  0,
  0,
  21,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  13,
  1,
  'Suchtberatung für Alkohol- und Medikamentenabhängige und Angehörige Solingen',
  'Das Angebot der Suchtberatungsstelle des Caritasverbandes für die Stadt Solingen e.V. richtet sich an - volljährige Menschen- mit einer Alkoholabhängigkeit,- ohne festen Wohnsitz und einer Alkoholabhängigkeit,- mit einer Medikamentenabhängigkeit,- mit einer Glücksspielsucht,- die eine eigene Gefährdung bei sich vermuten,- die einen nahe stehenden Menschen mit den genannten Problematiken haben',
  '42651',
  'Solingen',
  0,
  0,
  0,
  22,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  14,
  1,
  'Ökumenische Suchtberatung Wuppertal',
  null,
  '42103',
  'Wuppertal',
  0,
  0,
  0,
  23,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  15,
  24,
  'Psychosoziale Beratungsstelle Caritas Bodensee-Oberschwaben, Ravensburg',
  'Die Suchtberatungsstelle der Caritas im Landkreis avensburg bietet Information, Beratung und Behandlung bei Abhängigkeiten von Suchtmitteln wie Alkohol, Medikamente, Nikotin und illegalen Drogen. Außerdem sind wir Ansprechpartner zum Thema Glücksspiel',
  '88214',
  'Ravensburg',
  0,
  0,
  0,
  7040,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  16,
  24,
  'Psychosoziale Beratungs- u. ambulante Behandlungsstelle für Suchtkranke, Suchtgefährdete, Angehörige',
  null,
  '88400',
  'Biberach',
  0,
  0,
  0,
  7042,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  17,
  5,
  'Suchtfachambulanz Donauwörth (Cafè Connection)',
  'Information, Beratung und Behandlung bei Problemen mit legalen und illegalen Drogen, sowie nichtstoffgebundenen Süchten (z.B. pathologischer Internetkonsum, Automatenspiel, Essstörungen) Zielgruppe: Betroffene, Angehörige. Tätigkeitsbereich: Vorbereitung und Vermittlung von ambulanten und stationären Entwöhnungsbehandlungen, Durchführung von ambulanter ehabilitation, Nachsorge, Frühintervention bei jungen SuchtstoffkonsumentInnen, Präventionsveranstaltungen, Selbsthilfe Elternkreis. Die Suchtfachambulanz bietet über die Homepage das Café Connection eine anonyme Einzel,-  und Gruppenchatberatung an.',
  '86609',
  'Donauwörth',
  0,
  0,
  0,
  7027,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  18,
  5,
  'Kontaktladen und Beratung für Drogengefährdete und Abhängige - Café Connection',
  'Kontaktladen für Drogengefährdete und Abhängige',
  '86609',
  'Donauwörth',
  0,
  0,
  0,
  7026,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  19,
  5,
  'Suchtberatungs- und Behandlungsstelle, Augsburg',
  'Kurzbeschreibung:  Information, Beratung und Behandlung bei Problemen mit Alkohol,Medikamenten und nichtstoffgebundenen Süchten (z.B. pathologisches Spiel) Zielgruppe:  Betroffene,Angehörige,sonstige Bezugspersonen (z.B.Arbeitgeber),Selbsthilfegruppen Tätigkeitsbereich:  Vorbereitung und Vermittlung von ambulanten und stationären Entwöhnungsbehandlungen, Durchführung von ambulanter ehabilitation, Nachsorge (nachstationäre ambulante Weiterbehandlung), Vermittlung ergänzender Hilfen, Durchführung spezifischer Angebote (z.B. Gruppen für alkoholauffällige Kraftfahrer, Beratung bei Magersucht, Bulimie,Übergewicht für Erwachsene, betriebliche Präventionsveranstaltungen.  Beschreibung:  Wir sind eine durch die Kostenträger anerkannte Einrichtung für die medizinische ehabilitation bei Suchterkrankungen. ',
  '86152',
  'Augsburg',
  0,
  0,
  0,
  7023,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  20,
  19,
  'Fachambulanz für Suchtkranke im Landkreis Ebersberg',
  null,
  '85567',
  'Grafing',
  0,
  0,
  0,
  7021,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  21,
  19,
  'Caritas - Fachambulanz für Suchtkranke Bad Reichenhall',
  'Die Caritas - Fachambulanz Berchtesgadener Land ist eine Beratungsstelle für jegliche Art von Suchterkrankungen. Die Beratung ist kostenlos. Bei einer ambulanten Behandlung übernimmt die Kosten der jeweilige Versicherungsträger, bei speziellen Maßnahmen, wie z. B. Schulung für alkoholauffällige Kraftfahrer, fallen Kursgebühren an.',
  '83435',
  'Bad Reichenhall',
  0,
  0,
  0,
  7007,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  22,
  19,
  'Fachambulanz für Suchterkrankungen',
  'Wir beraten und informieren suchtgefährdete und suchtkranke Menschen sowie deren Angehörige bei Suchtproblemen mit Alkohol, Medikamenten, illegale Drogen und nichtstoffgebundenen Süchten.<br><br>Darüber hinaus vermitteln wir in stationäre Behandlung, unterstützen durch Betreuung und Begleitung im ahmen des Ambulant Betreuten Einzelwohnens und/oder im ahmen der Substitutionsbehandlung. Zudem bieten wir die Möglichkeit zur ambulanten Therapie bei Suchtmittelabhängigkeit sowie zur Nachsorge im Anschluss an eine stationäre Entwöhnungsbehandlung.',
  '82256',
  'Fürstenfeldbruck',
  1,
  0,
  0,
  7002,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  23,
  19,
  'Fachambulanz für Essstörungen',
  'Beratung, Ernährungsberatung, Vermittlung und Behandlung,<br>Anorexie, Bulimie, Übergewicht und starkes Übergewicht,<br>Multiplikatoren-Schulungen, In-House-Schulungen',
  '80634',
  'München',
  1,
  0,
  0,
  6997,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  24,
  11,
  'Suchtberatung Müllheim',
  'Unser Angebot richtet sich an alle die legale Suchtmittel konsumieren, missbrauchen oder abhängig sind. Ebenso Beraten wir Bezugspersonen (Eltern, PartnerInnen, FreundInnen) und bei beruflichen oder privaten Fragen zu Suchtmitteln, Konsum und Abhängigkeit. Spezielle Angebote kurz notiert: Einzel- und Gruppengespräche im Bereich Beratung, Behandlung und Nachsorge/ Vorbereitung auf die MPU/ aucherentwöhnungskurse. In der Außenstelle in 79206 Breisach besteht an zwei Tagen die Möglichkeit Gesprächstermine zu vereinbaren.',
  '79379',
  'Müllheim',
  0,
  0,
  0,
  6990,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  25,
  11,
  'Jugend- und Drogenberatungsstelle Emma, Emmendingen',
  'Wir bieten at und Hilfe für Jugendliche und Erwachsene mit Problemen wegen illegalen Drogen, für Jugendliche und Heranwachsende (bis 21 Jahre) mit Alkohol- und Medikamentenproblemen und für Menschen, deren Angehörige, Freunde oder Bekannte mit illegalen Drogen zu tun haben.',
  '79312',
  'Emmendingen',
  0,
  0,
  0,
  6986,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  26,
  11,
  'MAKS Modellprojekt Arbeit mit Kindern von Suchtkranken',
  'MAKS bietet Beratung und Hilfe rund um das Thema `Kinder aus suchtbelasteten Familiensystemen´. Zielgrupppe sind daher alle Kinder, Jugendliche und Heranwachsende die in einer suchtbelasteten Familie leben bzw. gelebt haben. Ebenso können sich die Eltern und andere Angehörige an uns wenden, die Beratungsbedarf und Fragen bzgl. der Situation der Kinder aus suchtbelasteten Familien haben.',
  '79104',
  'Freiburg',
  0,
  0,
  0,
  6983,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  27,
  11,
  'Suchtberatung - Psychosoziale Beratung, ambulante Behandlung Konstanz',
  null,
  '7531',
  'Konstanz',
  0,
  0,
  0,
  6980,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  28,
  25,
  'Caritas Suchtberatung Germersheim',
  null,
  '76726',
  'Germersheim',
  0,
  0,
  0,
  6973,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  29,
  24,
  'Caritasverband für Stuttgart e.V. Fachdienst Drogen, Stuttgart',
  'Der Fachdienst Drogen ist spezialisiert auf Probleme mit illegalen Drogen. Onlineberatung findet auch zu anderen suchtbezogenen Themen statt.',
  '70178',
  'Stuttgart',
  0,
  0,
  0,
  6955,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  30,
  25,
  'Caritas Suchtberatung Kaiserslautern',
  null,
  '67657',
  'Kaiserslautern',
  0,
  0,
  0,
  6951,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  31,
  25,
  'Caritas-Zentrum Speyer, Suchtberatung ',
  'Fachambulanz für Abhängigkeitserkrankungen: Alkohol- und Medikamentenabhängigkeit, Pathologisches Glücksspiel, Essstörungen. Durch die enten- und Krankenversicherungsträger zur Durchführung ambulanter ehabilitation anerkannt.',
  '67346',
  'Speyer',
  0,
  0,
  0,
  6949,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  32,
  25,
  'Caritaszentrum Ludwigshafen Suchtberatung- Fachambulanz für Suchtkranke ',
  'Fachambulanz für Abhängigkeitserkrankungen: Alkohol- und Medikamentenabhängigkeit, Pathologisches Glücksspiel, Essstörungen. Durch die enten- und Krankenversicherungsträger zur Durchführung ambulanter ehabilitation anerkannt.',
  '67059',
  'Ludwigshafen/Rhein',
  0,
  0,
  0,
  6948,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  33,
  26,
  'Beratungs- und Behandlungszentrum des Caritasverbandes für die Region Schaumberg-Blies e.V.',
  'Das Beratungs- und Behandlungszentrum gliedert sich in zwei Bereiche:1. DIE BIGG - Fachstelle Beratung und Behandlung für Jugendliche und junge Erwachsene- Fachstelle Suchtprävention- Fachstelle Suchtberatung in der Justizvollzugsanstalt- Fachstelle Sozialraumorientierte Jugend- und Familienhilfe im Familienberatungszentrum2. Psychosozialer Dienst- Fachstelle Beratung und Behandlung für Erwachsene mit Suchtproblemen',
  '66538',
  'Neunkirchen',
  0,
  0,
  0,
  6941,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  34,
  25,
  'Suchtberatung Saarpfalz',
  null,
  '66424',
  'Homburg',
  0,
  0,
  0,
  6940,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  35,
  26,
  'Performance Test BS',
  'Beratungsstelle für Performance Tests',
  '66666',
  'Performhausen',
  0,
  0,
  0,
  6937,
  '2018-12-11 11:19:13',
  '2019-07-24 09:51:44',
  null
), (
  36,
  24,
  'Psychosoziale Beratungs- und Behandlungsstelle für Suchtkranke und deren Angehörige, Ulm',
  null,
  '89073',
  'Ulm',
  0,
  0,
  0,
  7044,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  37,
  18,
  'Caritasverband Darmstadt/Suchtberatung-Online',
  'Wir sind zuständig für: Stadt Darmstadt, Landkreis Darmstadt-Dieburg, Odenwaldkreis und Kreis Bergstrasse',
  '64283',
  'Darmstadt',
  0,
  0,
  0,
  6904,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  38,
  27,
  'Psychosoziale Beratungsstelle für Suchtkranke und deren Angehörige, Miltenberg',
  null,
  '63897',
  'Miltenberg',
  0,
  0,
  0,
  6901,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  39,
  27,
  'Psychosoziale Beratungsstelle für Suchtprobleme',
  'Die Psychosoziale Beratungsstelle für Suchtprobleme in Aschaffenburg berät und behandelt Menschen mit Suchtproblemen und -risiken, deren Angehörige und andere Bezugspersonen.',
  '63739',
  'Aschaffenburg',
  0,
  0,
  0,
  6900,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  40,
  16,
  'Fachambulanz für Suchtkranke des Caritasverbandes Frankfurt',
  null,
  '60311',
  'Frankfurt',
  0,
  0,
  0,
  6872,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  41,
  21,
  'Psychosoziale Beratungs- und Behandlungsstelle des Caritasverbandes Brilon',
  null,
  '59929',
  'Brilon',
  0,
  0,
  0,
  6870,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  42,
  2,
  'quadro - Sucht- und Drogenberatung Ahlen',
  null,
  '59229',
  'Ahlen',
  0,
  0,
  0,
  6863,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  43,
  21,
  'Suchtberatungs- und Behandlungsstelle Caritasverband der Stadt Hamm',
  'Beratung und Behandlung für Alkohol- und Medikamentenabhängige, Gefährdete und deren Angehörige',
  '59065',
  'Hamm',
  0,
  0,
  0,
  6861,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  44,
  21,
  'Psychosoziale Suchtberatung Caritasverband Iserlohn',
  'Wir beraten Alkoholkonsumenten, Medikamentenkonsumenten, Glücksspieler und Essgestörte. Wir betreuen Menschen in persönlichen Lebenskrisen, bei denen sich bereits ein problematisch-kritischer Suchtmittelkonsum eingestellt hat, der zu einem Missbrauch oder bereits zu einer Abhängigkeit geführt hat. Weiter unterstützen wir Angehörige und Kontaktpersonen von Menschen mit missbräuchlichem, beziehungsweise abhängigem Verhalten. Auf Wunsch informieren wir Firmen, Betriebe, Institutionen und Gruppen oder Personen zu diesem Problemfeld.',
  '58644',
  'Iserlohn',
  0,
  0,
  0,
  6860,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  45,
  10,
  'Caritas-Suchthilfezentrum Schwelm/Ennepetal/Breckerfeld, Schwelm',
  null,
  '58332',
  'Schwelm',
  0,
  0,
  0,
  6858,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  46,
  21,
  'Caritas-AufWind/ Suchtberatung ',
  'Unser Angebot richtet sich an Menschen, die Probleme mit Alkohol, Drogen, Medikamenten oder pathologischem Spielen haben. Wir beraten sowohl Betroffene als auch deren Bezugspersonen. In der Präventionsfachstelle bieten wir darüber hinaus interessierten Personen und Einrichtungen Unterstützung in allen Fragen zum Thema Gesundheitsförderung oder Betriebsprävention an.Sie finden uns an 5 Standorten im Kreis Olpe: Attendorn, Finnentrop, Lennestadt, Olpe und Wenden.In kostenlosen Beratungsgesprächen klären wir mit Ihnen offene Fragen und suchen gemeinsam geeignete Hilfen. Bei Bedarf vermitteln wir Sie in eine qualifizierte Entgiftung, Therapie, Substitution oder andere Angebote und unterstützen Sie bei den Vorbereitungen.',
  '57482',
  'Wenden',
  0,
  0,
  0,
  6855,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  47,
  26,
  'Psychosozialer Dienst des Caritasverbandes Westeifel, Bitburg',
  null,
  '54634',
  'Bitburg',
  0,
  0,
  0,
  6842,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  48,
  26,
  'Fachambulanz für Suchtkranke und Angehörige, Trier',
  null,
  '54290',
  'Trier',
  0,
  0,
  0,
  6838,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  49,
  20,
  'Fachambulanz für Suchtprävention und Rehabilitation, Emsland',
  'Caritasverband für den Landkreis Emsland',
  '49716',
  'Meppen',
  0,
  0,
  0,
  6795,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  50,
  2,
  'Beratungsstelle für  Suchtkranke/Angehörige, Ibbenbüren',
  null,
  '49477',
  'Ibbenbüren',
  0,
  0,
  0,
  6790,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  51,
  20,
  'Fachambulanz für Suchtprävention und Rehabilitation, Osnabrück',
  'Caritasverband für die Stadt und den Landkreis Osnabrück',
  '49074',
  'Osnabrück',
  0,
  0,
  0,
  6778,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  52,
  2,
  'Beratungsstelle für Menschen mit Suchtproblemen, Coesfeld',
  null,
  '48653',
  'Coesfeld',
  0,
  0,
  0,
  6776,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  53,
  2,
  'Institut für Gesundheitsförderung (IfG)  Hörstel ',
  null,
  '48477',
  'Hörstel',
  1,
  0,
  0,
  6773,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  54,
  2,
  'Caritasverband Rheine, Ambulante Suchtkrankenhilfe',
  null,
  '48429',
  'Rheine',
  0,
  0,
  0,
  6769,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  55,
  2,
  'Suchtberatung des Caritasverbandes für die Stadt Münster e. V.',
  null,
  '48151',
  'Münster',
  0,
  0,
  0,
  6764,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  56,
  0,
  'Beratungsstelle für Alkohol- und Drogenfragen',
  'des Caritasverbandes für die egion Krefeld e.V.',
  '47798',
  'Krefeld',
  0,
  0,
  0,
  6758,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  57,
  10,
  'Psychosoziale Beratungsstelle für Suchtkranke, Gladbeck',
  null,
  '45964',
  'Gladbeck',
  0,
  0,
  0,
  6737,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  58,
  2,
  'Suchtberatung und Behandlung der Caritasverbände Dorsten u. Haltern',
  null,
  '45721',
  'Haltern',
  0,
  0,
  0,
  6731,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  59,
  2,
  'Suchtberatung des Caritasverbandes f. d. Stadt Recklinghausen e. V.',
  null,
  '45659',
  'Recklinghausen',
  0,
  0,
  0,
  6729,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  60,
  10,
  'Caritas-Suchthilfezentrum Hattingen/Sprockhövel',
  'Zuständigkeit:- Suchtberatung- Drogenberatung- Suchtprophylaxe',
  '45525',
  'Hattingen',
  0,
  0,
  0,
  6727,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  61,
  10,
  'Psychosoziale Beratungsstelle des Caritasverbandes mit betreutem Wohnen, Mülheim a.d. Ruhr',
  null,
  '45472',
  'Mülheim a.d. Ruhr',
  0,
  0,
  0,
  6725,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  62,
  21,
  'Psychosoziale Beratungs- und Behandlungsstelle, Dortmund',
  'Information, Beratung und Behandlung von Personen mit Problemen im Umgang mit Alkohol, Medikamenten oder Glücksspiel.Die Suchtberatung bietet von Abhängigkeit betroffenen oder gefährdeten Personen sowie deren Angehörigen ein individuelles, auf sie zugeschnittenes Informations-, Beratungs- - und falls erforderlich - Behandlungsangebot an.Die Beratung kann in Form von Online-Beratung erfolgen oder bei uns vor Ort in Form von Einzel-, Paar- und Familiengesprächen. Wir bieten unterschiedliche Therapie- und therapievorbereitende Gruppen an. Wir vermitteln auf Wunsch in stationäre ehabilitationseinrichtungen (Fachkliniken) und bieten für Alkohol-/ Medikamentenabhängige sowie für pathologische GlücksspielerInnen ambulante ehabilitation in unserem Hause an. Zur Weiterbehandlung nach stationärer ehabilitation bieten wir die Möglichkeit der ambulanten Nachsorge. Wir kooperieren eng mit der Schuldnerberatungsstelle des SKM in Dortmund.',
  '44137',
  'Dortmund',
  0,
  0,
  0,
  6716,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  63,
  21,
  'Psychosoziale Beratungs- und Behandlungsstelle für Sucht- gefährdete und Suchtkranke Caritasverband,',
  'Wir beraten bei Problemen mit Alkohol, Medikamenten, Drogen und Nikotin. Wir bieten Betroffenen als auch Angehörigen, Betrieben und Kirchengemeinden etc. Unterstützung bei der Überwindung konkreter Problemsituationen und akuter Notlagen an.Gleichzeitig sind wir auch eine anerkannte ambulante medizinische Therapieeinrichtung.',
  '33602',
  'Bielefeld',
  0,
  0,
  0,
  6689,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  64,
  21,
  'Beratungszentrum  Brakel - Sucht- und Drogenberatung -',
  'Wir beraten bei Problemen mit Alkohol, Drogen, Glücksspiel, Medikamenten, Nikotin und Essstörungen sowie zu Fragen der Suchtvorbeugung. Ansprechbar sind wir für Angehörige, Betroffene und Multiplikatoren. Ein weiteres Angebot ist die ambulante medizinische ehabilitation Sucht.',
  '33034',
  'Brakel',
  0,
  0,
  0,
  6681,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  65,
  15,
  'Suchthilfe Hildesheim - Sarstedt',
  'In unseren anerkannten Fachstellen für ehabilitation und Suchtprävention beraten und behandeln Fachleute Menschen mit Suchtproblemen, ihre Angehörigen und Bezugspersonen. Schwerpunkte unserer Arbeit sind Abhängigkeit und Missbrauch von Alkohol, Medikamenten und Glücksspiel, damit zusammenhängende psychosoziale Probleme und psychische Erkrankungen. aucherentwöhnung, Selbstkontrolltraining, Suchtprävention und betriebliche Gesundheitsförderung kommen hinzu.Die Beratung ist freiwillig, kostenlos und vertraulich. Die Mitarbeiter unterliegen der Schweigepflicht.Unser Angebot:Beratung, Information und MotivationEinzelgespräche, Paar- und Familiengespräche, GruppentherapiePrävention und betriebliche GesundheitsförderungAmbulante ehabilitation als Entwöhnungsbehandlung vor OrtVermittlung in qualifizierte Entgiftung und stationäre BehandlungWeiterbehandlung im Anschluß an eine stationäre Behandlung in der KlinikKombitherapie als Entwöhnungsbehandlung vor Ort und in der KlinikVermittlung in und Zusammenarbeit mit der Selbsthilfe in unserem HausBeratungstermine nach telefonischer VereinbarungSprechstunde ohne Terminvereinbarung Mittwochs von 15-17UhrKontaktcafé Trockendock Mittwochs von 16-18Uhr',
  '31134',
  'Hildesheim',
  0,
  0,
  0,
  6680,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  66,
  6,
  'Integrative Suchtberatung Königsberger 11, Berlin (Steglitz-Zehlendorf)',
  null,
  '12207',
  'Berlin (Steglitz-Zehlendorf)',
  1,
  0,
  0,
  6664,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  67,
  7,
  'Suchtberatungs- und Behandlungsstelle',
  null,
  '01099',
  'Dresden',
  0,
  0,
  0,
  6656,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  68,
  9,
  'Beratungs- u. Behandlungsstelle im Suchthilfe-Zentrum S 13',
  null,
  '99097',
  'Erfurt',
  0,
  0,
  0,
  7080,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  69,
  27,
  'Psychosoziale Beratungsstelle Sucht- und Drogenberatung, Lohr/Main',
  null,
  '97816',
  'Lohr/Main',
  0,
  0,
  0,
  7078,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  70,
  11,
  'Suchtberatung der agj im Main-Tauber-Kreis',
  null,
  '97941',
  'Tauberbischofsheim',
  0,
  0,
  0,
  7079,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  71,
  27,
  'Psychosoziale Beratungsstelle für Suchtprobleme, Bad Kissingen',
  null,
  '97688',
  'Bad Kissingen',
  0,
  0,
  0,
  7077,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  72,
  27,
  'Psychosoziale Beratungsstelle, Bad Neustadt',
  'Alkohol, Medikamenten und Drogenprobleme - Suchtberatung -',
  '97616',
  'Bad Neustadt',
  0,
  0,
  0,
  7076,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  73,
  27,
  'Psychosoziale Beratungsstelle - Suchtberatung -  Haßfurt',
  null,
  '97437',
  'Haßfurt',
  0,
  0,
  0,
  7075,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  74,
  27,
  'Psychosoziale Beratungsstelle für Suchtprobleme, Kitzingen',
  null,
  '97318',
  'Kitzingen',
  0,
  0,
  0,
  7074,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  75,
  27,
  'Psychosoziale Beratungsstelle für Suchtprobleme, Würzburg',
  null,
  '97070',
  'Würzburg',
  0,
  0,
  0,
  7073,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  76,
  23,
  'Fachambulanz für Suchtprobleme; Tirschenreuth',
  'Psychosoziale Beratung und Behandlung',
  '95643',
  'Tirschenreuth',
  0,
  0,
  0,
  7071,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  77,
  23,
  'Fachambulanz für Suchtprobleme, Straubing',
  'Psychosoziale Beratung und Behandlung',
  '94315',
  'Straubing',
  0,
  0,
  0,
  7070,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  78,
  22,
  'Psychosoziale Beratung und Behandlung, Passau',
  'Beratung und Behandlung bei einer Abhängigkeit von Alkohol, illegalen Drogen oder Medikamenten, zudem bei Essstörungen oder Spielsucht. Die Beratung und Behandlung wird auch für Angehörige angeboten. Ebenso gehören stationäre Vermittlungen, sowie die ambulante ehabilitation nach einer stationären Therapie zu unserem Aufgabengebiet.  ',
  '94032',
  'Passau',
  0,
  0,
  0,
  7063,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  79,
  23,
  'Fachambulanz für Suchtprobleme Kelheim',
  '<b>Wege aus der Abhängigkeit - suchtfrei leben</b><br><br><b>Wer kann zu uns kommen?</b><br><br>Personen, die Probleme im Umgang mit Alkohol, Medikamente und Drogen haben, <br>Angehörige,<br> Personen mit problematischem Spielverhalten, <br>Personen mit Essstörungen, <br>Multiplikatoren. <br><br><b>Die Fachambulanz arbeitet</b><br><br>offen für alle, <br>kostenfrei,<br>auf freiwilliger Basis, <br>auf Wunsch anonym, <br>dem Datenschutz verpflichtet, <br>nur in Absprache mit dem atsuchenden, <br>nach den Grundsätzen des Leitbildes und Qualitätsleitlinien der Caritas. <br><br><b>Unsere Angebote</b><br><br>Wir beraten und informieren. <br>Wir unterstützen Sie bei Kontakten zu Behörden, wie Arbeitsamt, Jugendamt, Krankenkassen und entenversicherungsträgern. <br>Teilnahme an ambulanter Behandlung und Nachsorge in Gruppen- und Einzelgesprächen. <br>Wir vermitteln Sie in ein Fachkrankenhaus und übernehmen die Beantragung und egelung der Kostenfrage. <br>Wir informieren Sie über Selbsthilfegruppen. <br>Wir beraten Sie im ahmen einer Bewährungsauflage. <br>Ohrakupunktur nach dem NADA-Protokoll. Die Ohrakupunktur kann ergänzend bei der Behandlung von Suchterkrankungen angewendet werden. <br>SKOLL - Selbstkontrolltraining. Bundesmodellprojekt, welches in Gruppenform angeboten wird. <br>Kompetenznetzwerk Glücksspielsucht. Beratung Pathologisches Glückspiel. <br>Angehörigengruppe. <br>Gemeinsam-Aktiv-Gruppe<br><br><b>Kosten </b><br><br>Für den Klienten entstehen keine Kosten',
  '93309',
  'Kelheim',
  1,
  0,
  0,
  7061,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  80,
  23,
  'Fachambulanz für Suchtprobleme; Dingolfing',
  null,
  '84130',
  'Dingolfing',
  0,
  0,
  0,
  7334,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  81,
  23,
  'Fachambulanz für Suchtprobleme; Regensburg',
  'Psychosoziale Beratung und Behandlung- bei Problemen mit Alkohol, Drogen, Medikamenten, bei Ess-Störungen und problematischem Glücksspielverhalten- für Betroffene und Personen aus dem sozialen Umfeld- besondere Angebote: Ambulante ehabilitation Sucht, aucherentwöhnung',
  '93047',
  'Regensburg',
  0,
  0,
  0,
  7058,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  82,
  8,
  'Caritas-Kreisstelle Ingolstadt Suchtambulanz',
  'Wir beraten und informieren suchtgefährdete und suchtkranke Menschen sowie deren Angehörige bei Problemen mit Alkohol, Medikamenten, illegalen Drogen, Spielsucht oder Essstörungen. Darüber hinaus vermitteln wir in stationäre Behandlung und bieten ambulante Behandlung bzw. Nachsorgebehandlung an sowie psychosoziale Begleitung von Substituierten.',
  '85049',
  'Ingolstadt',
  0,
  0,
  0,
  7669,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  83,
  16,
  'Fachambulanz für Suchtkranke, Caritasverband Wiesbaden e.V.',
  'Als kompetente AnsprechpartnerInnen aus dem Bereich Beratung und Behandlung stehen zur Verfügung: Ulrike Kesternich, Iris oth, Maria Jox-Doppler und Heinz Vallböhmer',
  '65185',
  'Wiesbaden',
  0,
  0,
  0,
  7426,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  84,
  11,
  'Suchtberatung Sigmaringen - Psychosoziale Beratung / Ambulante Behandlung / Prävention',
  'Beratung und Behandlung bei Suchtproblemen (Alkohol, Medikamente, Drogen, Spielsucht, Essstörungen) - für Betroffene und Angehörige / Suchtprävention / Hilfe bei Führerscheinentzug',
  '72488',
  'Sigmaringen',
  0,
  0,
  0,
  7425,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  85,
  16,
  'Jugendberatung- und Suchthilfe Am Merianplatz, Frankfurt',
  'Substitutionsfachambulanz Fachstelle für synthetische Drogen',
  '60316',
  'Frankfurt',
  0,
  0,
  0,
  7458,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  86,
  25,
  'Caritas Suchtberatung Wörth',
  null,
  '76744',
  'Wörth',
  0,
  0,
  0,
  7459,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  87,
  21,
  'Caritasverband für den Kreis Gütersloh e. V. Fachbereich Sucht und Drogenhilfe',
  'Online-Beratung für Suchtgefährdete, Suchtkranke (Alkohol, Medikamente, Drogen), Suchtprävention und Eß-Störungen im Kreis Güterslohoonstraße 22, 33330 Gütersloh, Tel. 05241-994070',
  '33330',
  'Gütersloh',
  0,
  0,
  0,
  7461,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  88,
  15,
  'Psychosoziale Beratungsstelle für Suchtkranke, Suchtgefährdete und deren Angehörige, Duderstadt',
  null,
  '37115',
  'Duderstadt',
  0,
  0,
  0,
  7462,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  89,
  20,
  'Fachambulanz  Norddeutschland für Suchtprävention und Rehabilitation des DiCV Osnabrück',
  null,
  '49074',
  'Osnabrück',
  0,
  0,
  0,
  7463,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  90,
  9,
  'Caritasregion Eichsfeld-Nordthüringen Suchtberatung Leinefelde',
  null,
  '37327',
  'Leinefelde',
  0,
  0,
  0,
  7500,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  91,
  10,
  'Caritasverband für die Stadt Gelsenkirchen e.V.',
  'Fachbereich Gesundheit und Soziales',
  '45879',
  'Gelsenkirchen',
  0,
  0,
  0,
  7619,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  92,
  21,
  'Suchtkrankenhilfe im Caritasverband Paderborn e. V., Paderborn',
  'Suchtberatung im legalen/illegalen Drogenbereich, Erwachsene und Kinder/Jugendliche',
  '33098',
  'Paderborn',
  0,
  0,
  0,
  7620,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  93,
  21,
  'Suchtberatung Menden',
  'Wir- sind Ansprechpartner für Menschen mit Problemen wie  Alkoholmissbrauch, Medikamentenmissbruch und Spielsucht- sind Ansprechpartner für Betroffene, Angehörige (auch Kinder) und alle Interessierten',
  '58706',
  'Menden',
  0,
  0,
  0,
  7664,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  94,
  2,
  'quadro Sucht- und Drogenberatung Warendorf',
  null,
  '48231',
  'Warendorf',
  0,
  0,
  0,
  7672,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  95,
  2,
  'Psychologische Beratungs- und Behandlungsstelle für Suchtkranke des Caritasverbandes Marl e. V.',
  null,
  '45768',
  'Marl',
  0,
  0,
  0,
  7673,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  96,
  22,
  'Fachambulanz für Suchtkranke im Landkreis Altötting',
  'Wir beraten Sie gerne bei allen Fragen zu den Themen Alkohol, Nikotin, illegale Drogen, Essstörungen, pathologischer Internetgebrauch, Automatenspielsucht, Kaufsucht. Alle MitarbeiterInnen unterliegen der Schweigepflicht und behandeln Ihre Anfragen streng vertraulich. ',
  '84503',
  'Altötting',
  1,
  0,
  0,
  11212,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  97,
  3,
  'Psychosoziale Beratungsstelle Caritasverband für die Stadt und den Landkreis Fürth e.V. ',
  null,
  '90762',
  'Fürth',
  0,
  0,
  0,
  11671,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  98,
  4,
  'Online-Suchtberatung',
  null,
  null,
  null,
  0,
  0,
  0,
  11668,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  99,
  5,
  'Virtuelle Beratungsstelle des Diözesancaritasverbandes Augsburg f.  Lindau, Sonthofen und Kempten',
  'Beteiligte Träger sind:<br><br>Suchtfachambulanz Lindau<br>Fischergasse 14<br>88131 Lindau<br>Tel.: 08382 - 948688<br>FAX: 08382 - 948699<br>l.rauch@caritas-augsburg.de<br>suchtfachambulanz.lindau@caritas-augsburg.de<br><br>Suchtfachambulanz Sonthofen<br>Martin-Luther-Str.3<br>87527 Sonthofen<br>Tel.: 08321 - 7889437<br>FAX: 08321 - 7889438<br>kr.elgert@caritas-augsburg.de<br>suchtfachambulanz.sonthofen@caritas-augsburg.de<br><br>Talk Inn - Anlaufstelle f. KonsumentInnen illegaler Drogen<br>Kontaktladen u. Drogenberatung<br>Brennergasse 15<br>87435 Kempten<br>Tel.: 0831 - 28635<br>FAX: 0831 -  5127204<br>c.arendt@caritas-augsburg.de<br>dkl.kempten@caritas-augsburg.de<br>',
  null,
  null,
  0,
  0,
  0,
  11661,
  '2018-12-11 11:19:13',
  '2019-06-24 14:53:58',
  null
), (
  100,
  2,
  'Test-Beratungsstelle',
  'Dies ist nur ein Test',
  '99999',
  null,
  1,
  0,
  0,
  999999999,
  '2019-04-05 20:02:38',
  '2019-06-24 14:53:58',
  null
), (
  101,
  1,
  'U25 Beratungsstelle',
  'U25 DEV Test-Beratungsstelle',
  '25252',
  'Teenagetown',
  1,
  1,
  0,
  0,
  '2019-05-14 07:50:43',
  '2019-06-24 14:54:24',
  null
), (
  110,
  11,
  '[U25] Freiburg',
  null,
  '79102',
  'Freiburg',
  1,
  1,
  0,
  10813,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  111,
  3,
  '[U25] Nürnberg',
  null,
  '90443',
  'Nürnberg',
  1,
  1,
  0,
  11682,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  112,
  20,
  '[U25] Emsland',
  null,
  '49808',
  'Lingen(Ems)',
  1,
  1,
  0,
  11683,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  113,
  6,
  '[U25] Berlin',
  null,
  '10115',
  'Berlin',
  1,
  1,
  0,
  11626,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  114,
  10,
  '[U25] Gelsenkirchen',
  null,
  '45879',
  'Gelsenkirchen',
  1,
  1,
  0,
  11319,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  115,
  7,
  '[U25] Dresden',
  null,
  '01067',
  'Dresden',
  1,
  1,
  0,
  11607,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  116,
  14,
  '[U25] Hamburg',
  null,
  '20255',
  'Hamburg',
  1,
  1,
  0,
  11625,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  117,
  24,
  '[U25] Biberach',
  null,
  '88400',
  'Biberach',
  1,
  1,
  0,
  11674,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  118,
  21,
  '[U25] Dortmund',
  null,
  '44147',
  'Dortmund',
  1,
  1,
  0,
  11675,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  119,
  21,
  '[U25] Paderborn',
  null,
  '33098',
  'Paderborn',
  1,
  1,
  0,
  11672,
  '2019-06-06 06:11:22',
  '2019-06-24 14:54:24',
  null
), (
  121,
  11,
  '[U25] Friedrichshafen',
  null,
  '88045',
  'Friedrichshafen',
  1,
  1,
  0,
  null,
  '2019-08-06 13:48:25',
  '2019-08-06 13:50:33',
  null
), (
  123,
  4,
  'Online-Beratungsstelle für Angehörige von Straffälligen',
  'Wir beraten Angehörige von Straffälligen. Bundesweit. Anonym. Sicher. Kostenlos. Unser Team besteht aus Mitarbeiterinnen und Mitarbeitern der Straffälligenhilfe der verbandlichen Caritas in Deutschland.',
  '79104',
  'Freiburg',
  0,
  11,
  0,
  11244,
  '2019-08-22 12:49:04',
  '2019-10-14 14:21:09',
  null
), (
  200,
  4,
  'Bundesweite Beratungsstelle der AIDS Beratung',
  null,
  '79104',
  null,
  0,
  12,
  0,
  11615,
  '2019-08-22 09:31:42',
  '2019-08-28 08:35:24',
  null
), (
  201,
  1,
  'Sozialdienst katholischer Frauen e.V. Bonn und Rhein-Sieg-Kreis',
  'Allgemeine Sozialberatung     Beratung in sozialen, familiären, erzieherischen und   existenziellen Notlagen    ',
  '53721',
  'Siegburg',
  1,
  6,
  0,
  7698,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  202,
  1,
  'Caritasverband Mettmann  Wohnungslosenhilfe, Allgemeine Sozialberatung online',
  'Öffnungszeiten:   Mo. - Do. 9.30 - 14.30 Uhr  Fr.            9.30 - 13.30 Uhr  und nach Vereinabarung',
  '40822',
  'Mettmann',
  0,
  6,
  0,
  7699,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  203,
  1,
  'Allgemeine Sozialberatung des Caritasverbandes für die Stadt Bonn e.V.',
  'Stadtteil- bzw. gemeindenahe Beratung und Betreuung von Menschen, die sich in sozialen, psychosozialen, finanziellen oder gesundheitlichen Notlagen befinden.',
  '53113',
  'Bonn',
  0,
  6,
  0,
  7700,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  204,
  1,
  'Caritasverband Köln',
  'Sozialrechtliche Beratung  Information über sozialrechtliche Ansprüche  Existenzsicherung ',
  '50825',
  'Köln',
  0,
  6,
  0,
  7701,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  205,
  1,
  'Sozialdienst katholischer Frauen e.V., Neuss',
  null,
  '41460',
  'Neuss',
  0,
  6,
  0,
  7702,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  206,
  1,
  'SKM Leverkusen e.V.',
  'Wir beraten Sie in Fragen zu sozialen Belangen: ALG-Probleme, Männer-Beratung, Trennung und Scheidung, Behörden-Gänge,...    Unsere Öffnungszeiten für die Allgemeine Soziale Beratung: Sie können uns entweder Montags, Mittwochs oder Freitags in einer offenen Sprechstunde zwischen 15 - 16 Uhr erreichen oder per eMail-Beratung. ',
  '51379',
  'Leverkusen',
  0,
  6,
  0,
  7703,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  207,
  1,
  'Caritasverband Wuppertal',
  null,
  '42103',
  'Wuppertal',
  0,
  6,
  0,
  7705,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  208,
  1,
  'Allgemeine Sozialberatung, Langenfeld',
  'Beratung und Unterstützung für Menschen, die Unterstützung bei der Bewältigung von sozialen und psychosozialen Problemlagen bedürfen ',
  '40764',
  'Langenfeld',
  0,
  6,
  0,
  7711,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  209,
  25,
  'Caritas-Zentrum Speyer',
  null,
  '67346',
  'Speyer',
  0,
  6,
  0,
  7730,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  210,
  25,
  'Caritas-Zentrum Germersheim',
  null,
  '76727',
  'Germersheim',
  0,
  6,
  0,
  7733,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  211,
  25,
  'Caritas-Zentrum Landau',
  null,
  '76829',
  'Landau',
  0,
  6,
  0,
  7734,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  212,
  25,
  'Caritas-Zentrum Ludwigshafen',
  null,
  '67059',
  'Ludwigshafen',
  0,
  6,
  0,
  7735,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  213,
  25,
  'Caritas-Zentrum Kaiserslautern',
  null,
  '67657',
  'Kaiserslautern',
  0,
  6,
  0,
  7736,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  214,
  25,
  'Caritas-Zentrum Saarpfalz',
  null,
  '66386',
  'St. Ingbert',
  0,
  6,
  0,
  7737,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  215,
  25,
  'Caritas-Zentrum Pirmasens',
  null,
  '66953',
  'Pirmasens',
  0,
  6,
  0,
  7739,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  216,
  3,
  'Soziale Beratungsstelle, Kronach',
  null,
  '96317',
  'Kronach',
  0,
  6,
  0,
  7744,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  217,
  3,
  'Caritasverband für den Landkreis Bamberg e.V. - Soziale Beratungsstelle -',
  'Soziale Beratung für den Landkreis Bamberg, Kur- und Erholungsaufenthalte für Kinder, Mütter, Väter und Senioren, Vermittlung von Familienpflege, Josefslädchen - der etwas andere Laden (Lebensmittel für Bedürftige)',
  '96052',
  'Bamberg',
  0,
  6,
  0,
  7745,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  218,
  3,
  'Allgemeine Soziale Beratung, Lauf',
  null,
  '91207',
  'Lauf an der Pegnitz',
  0,
  6,
  0,
  7746,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  219,
  8,
  'CKS Neumarkt',
  null,
  '92318',
  'Neumarkt',
  0,
  6,
  0,
  7905,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  220,
  8,
  'Caritas - Kreisstelle Roth, Allgemeine Sozialberatung',
  null,
  '91154',
  'Roth',
  0,
  6,
  0,
  7906,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  221,
  8,
  'Caritas-Kreisstelle Nürnberg-Süd',
  'Allgemeine Sozialberatung, Migrationsberatung, Seniorenberatung, Gesetzliche Betreuungen, Müttergenesungskuren für Mütter /Mütter mit Kind(ern), Kindererholungen, Kleiderkammer  zwei Außenstellen in 90518 Altdorf, Oberer Markt 21 und 905451 Nürnberg-Eibach, Eibenweg 10',
  '90473',
  'Nürnberg',
  0,
  6,
  0,
  7912,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  222,
  8,
  'CKS Ingolstadt',
  null,
  '85049',
  'Ingolstadt',
  0,
  6,
  0,
  7919,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  223,
  9,
  'Caritas in Gotha',
  null,
  '99867',
  'Gotha',
  0,
  6,
  0,
  7932,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  224,
  9,
  'Caritas in Suhl',
  null,
  '98527',
  'Suhl',
  0,
  6,
  0,
  7934,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  225,
  20,
  'Caritasverband Bremen e.V.',
  null,
  '28209',
  'Bremen',
  0,
  6,
  0,
  7968,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  226,
  11,
  'Caritasverband Karlsruhe e.V.',
  'Caritassozialdienst (CSD) im Beratungszentrum Caritashaus  Beratung in persönlichen Lebensfragen  Beratung über Sozialleistungen  Hilfe im Rahmen der Existenzsicherung  Information und Vermittlung über bzw. an andere Fachdienste und Einrichtungen',
  '76133',
  'Karlsruhe',
  0,
  6,
  0,
  8000,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  227,
  11,
  'Caritasverband für den Landkreis Rastatt e.V.',
  null,
  '76437',
  'Rastatt',
  0,
  6,
  0,
  8017,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  228,
  11,
  'Caritasverband für den Schwarzwald-Baar-Kreis e.V.',
  null,
  '78050',
  'Villingen-Schwenningen',
  0,
  6,
  0,
  8023,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  229,
  11,
  'Caritasverband Linzgau e.V.',
  null,
  '88662',
  'Überlingen',
  0,
  6,
  0,
  8037,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  230,
  21,
  'Caritasverband Brilon e.V.',
  null,
  '59929',
  'Brilon',
  0,
  6,
  0,
  8070,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  231,
  21,
  'Caritasverband für den Kreis Lippe und die Stadt Bad Pyrmont e.V.',
  null,
  '32756',
  'Detmold',
  0,
  6,
  0,
  8073,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  232,
  21,
  'Caritasverband Dortmund e.V., Bernhard-März-Haus',
  null,
  '44145',
  'Dortmund',
  0,
  6,
  0,
  8075,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  233,
  21,
  'Sozialdienst katholischer Frauen e.V., Dortmund-Hörde',
  null,
  '44263',
  'Dortmund-Hörde',
  0,
  6,
  0,
  8076,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  234,
  21,
  'Caritasverband für die Stadt Hamm e.V.',
  null,
  '59065',
  'Hamm',
  0,
  6,
  0,
  8078,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  235,
  21,
  'Sozialdienst katholischer Frauen e.V., Herford',
  null,
  '32052',
  'Herford',
  0,
  6,
  0,
  8079,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  236,
  21,
  'Sozialdienst katholischer Frauen e.V. Minden',
  'Allgemeine Sprechstunde in unseren Räumen:  Mittwoch: 14:00-16:00  Freitag:    10:30-12:30  Online sind wir selbstverständlich auch ausserhalb unserer Sprechzeiten erreichbar.',
  '32423',
  'Minden',
  0,
  6,
  0,
  8085,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  237,
  3,
  'Allgemeine Soziale Beratungsstelle Erlangen',
  null,
  '91052',
  'Erlangen',
  0,
  6,
  0,
  8131,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  238,
  3,
  'Allgemeine Soziale Beratung Bamberg Stadt',
  null,
  '96047',
  'Bamberg',
  0,
  6,
  0,
  8137,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  239,
  3,
  'Allgemeine Soziale Beratung Forchheim',
  null,
  '91301',
  'Forchheim',
  0,
  6,
  0,
  8138,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  240,
  20,
  'Allgemeine soziale Beratung des Caritasverbandes für die Diözese Osnabrück e.V. Region West',
  null,
  null,
  null,
  0,
  6,
  0,
  8214,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  241,
  15,
  'Online-Beratung für die Landkreise Harburg, Lüneburg, Cuxhaven und Stadt Bremerhav',
  'Diese Online-Beratungsstelle ist ein Zusammenschluß der folgenden Beratungsstelle:  Caritasverband für den Landkreis Harburg e.V., Elsternweg 1,21423 Winsen / L  caritas-harburg@t-online.de  Caritasverband Lüneburg, Johannisstr. 36, 21335 Lüneburg                                                   schweers@caritas-lueneburg.de  Caritasverband Bremerhaven und den Landkreis Cuxhaven, Fressenstr. 61, 27576 Bremerhaven  info@caritas-bremerhaven.de  ',
  null,
  null,
  0,
  6,
  0,
  8215,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  242,
  15,
  'Online-Beratungsstelle für die Bereiche und Landkreise Hildesheim, Hannover, Northeim.',
  'Diese Online-Beratungsstelle ist ein Zusammenschluss folgender Beratungsstellen:    Caritasverband für Stadt und Landkreis Hildesheim e.V., Pfaffenstieg 12, 31134 Hildesheim  alsb@caritas-hildesheim.de    Caritasverband Northeim, Breiter Weg 2, 37154 Northeim  Caritasverband-northeim@t-online.de  ',
  null,
  null,
  0,
  6,
  0,
  8216,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  243,
  21,
  'Sozialdienst katholischer Frauen e.V. Wanne-Eickel',
  null,
  '44649',
  'Herne',
  0,
  6,
  0,
  8221,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  244,
  15,
  ' 	Online-Beratung für Salzgitter und die Stadt und Kreis Wolfenbüttel ',
  'Caritasverband Salzgitter e. V.  Salderschestr. 3  38226 Salzgitter  Caritasverband für die Stadt und Kreis Wolfenbüttel   Krumme Str. 56  38300 Wolfenbüttel  ',
  null,
  null,
  0,
  6,
  0,
  8245,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  245,
  21,
  'Sozialdienst katholischer Frauen e. V. Dortmund',
  null,
  '44145',
  'Dortmund',
  0,
  6,
  0,
  8522,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  246,
  21,
  'SKM -Kath. Verein für soziale Dienste in Dortmund e.V.',
  null,
  '44137',
  'Dortmund',
  0,
  6,
  0,
  8523,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  247,
  21,
  'Katholischer Sozialdienst Olpe, Allgemeine Sozialberatung',
  'Unsere Aufgabengebiete:  - Sozialberatung  Ausweg   - Schwangerenberatung  - Gesetzliche Betreuung  - Jugendhilfe',
  '57462',
  'Olpe',
  0,
  6,
  0,
  8545,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  248,
  21,
  'Beratungsteam HSK',
  'Wir sind ein Zusammenschluss folgender Beratungsstellen:      SKF Hochsauerland:  Apothekerstr. 12,  59755 Arnsberg-Neheim -     Tel.:    02932/6398815   SKF Hochsauerland:  Steinstraße 12,  59872 Meschede -  Tel.:   0291/9974-13  CV Arnsberg-Sundern: Hellefelder Straße 27-29,  59821 Arnsberg -  Tel.:   02931/806611  SKF Brilon:  Steinweg 5,  59929 Brilon -  Tel.:   02961/96060',
  null,
  null,
  0,
  6,
  0,
  8554,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  249,
  12,
  'Onlineberatungsstelle des DICV Fulda',
  'Diese Virtuelle Beratungsstelle umfasst die folgenden 7 Beratungsstellen:     Kassel:  Die Freiheit 2, 34117 Kassel  -  Tel.:  0561/7004-221    Marburg:  Schückingstraße 28, 35037 Marburg  -  Tel.:  06421/26342   Fulda:  Wilhelmstraße 8, 36037 Fulda-  Tel.:  0661/2428-322   Hünfeld:  Kirchplatz 3, 36088 Hünfeld  -  Tel.:  06652/2513   Hanau:  Im Bangert 4, 63450 Hanau-  Tel.:  06181/92335-21    Geisa/Vacha: Schulstraße 28, 36419 Geisa- Tel.: 036967/592880   Dermbach: Hinter dem Schloss 1, 36466 Dermbach - Tel. 0151-10280879 ',
  '36037',
  'Fulda',
  0,
  6,
  0,
  8555,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  250,
  2,
  'Caritas Moers-Xanten e.V.',
  null,
  '47441',
  'Moers',
  0,
  6,
  0,
  10931,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  251,
  8,
  'Online-Beratungsstelle für Herrieden und Weißenburg',
  'Diese Virtuelle Online-Beratungsstelle ist ein Zusammenschluss aus folgenden zwei Beratungsstellen:     Caritas-Kreisstelle Herrieden  Deocarpl. 3   91567 Herrieden   Tel.: 09825/923880  Fax: 09825/9238888       Caritas-Kreisstelle Weißenburg   Holzgasse 12   91781 Weißenburg   Tel.: 09141/2616   Fax: 09141/72197 ',
  null,
  'Herrieden und Weißenburg',
  0,
  6,
  0,
  10994,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  252,
  8,
  'Caritas-Kreisstelle Eichstätt - Allgemeine Sozialberatung',
  null,
  '85072',
  'Eichstätt',
  0,
  6,
  0,
  11027,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  253,
  17,
  'Caritas Regionalverband Halle e.V. - Bereich Saalekreis',
  'Bereich Beratungstellen',
  '06217',
  'Merseburg',
  0,
  6,
  0,
  11203,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  254,
  20,
  'Allgemeine soziale Beratung des Caritasverbandes für die Diözese Osnabrück e.V. Region Ost',
  null,
  null,
  null,
  0,
  6,
  0,
  11264,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  255,
  21,
  'Sozialdienst katholischer Frauen e.V., Allgemeine Sozialberatung Gütersloh',
  null,
  '33330',
  'Gütersloh',
  0,
  6,
  0,
  11611,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  256,
  6,
  'Allgemeine Unabhängige Sozialberatung Charlottenburg-Wilmersdorf',
  'Standort Wilmersdorf  Pfalzburger Str. 18  10719 Berlin  Telefon: +49 30 666 33 963    Mobil: 49 174 160 28 25  Telefax: +49 30 666 33 961        offene Sprechstunde:  Dienstag  9.00 bis 12.00 Uhr  sowie Termine nach Vereinbarung    Standort Charlottenburg  Alt-Lietzow 31  10587 Berlin  Mobil: 49 174 160 28 25    offene Sprechstunde:  Donnerstag  9.00 bis 12.00 Uhr    13.00 bis 16.00 Uhr   ',
  '10719',
  'Berlin-Wilmersdorf',
  0,
  6,
  0,
  11694,
  '2019-08-22 09:58:17',
  '2019-08-22 09:58:17',
  null
), (
  257,
  4,
  'Online-Beratungsstelle für Angehörige von Straffälligen',
  'Wir beraten Angehörige von Straffälligen. Bundesweit. Anonym. Sicher. Kostenlos. Unser Team besteht aus Mitarbeiterinnen und Mitarbeitern der Straffälligenhilfe der verbandlichen Caritas in Deutschland.',
  '79104',
  'Freiburg',
  0,
  11,
  0,
  11244,
  '2019-08-22 12:49:15',
  '2019-08-28 08:36:20',
  null
), (
  258,
  2,
  'Gemeindepsychiatrische Dienste des Caritasverbandes für den Kreis Coesfeld e.V.',
  'Die Gemeindepsychiatrischen Dienste des Caritasverbandes wollen dazu beitragen, dass psychisch erkrankten und psychisch behinderten Menschen ein Leben in Ihrem Lebensumfeld möglich ist. Dazu gehören neben der eigenen Wohnung auch eine entsprechende Unterstützung bei der Gestaltung des Tages, Beratung in persönlichen Fragen und Begleitung bei schwierigen Problemen, sowie eine sinnvolle (all)tägliche Beschäftigung.  ',
  '48249',
  'Dülmen',
  0,
  8,
  0,
  11011,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  259,
  21,
  'Onlineberatungsstelle Josefsheim Bigge',
  null,
  '59939',
  'Olsberg',
  0,
  8,
  0,
  11006,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  260,
  1,
  'Virtuelle Onlineberatungsstelle der St. Augustinus-Behindertenhilfe',
  'Diese Virtuelle Beratungsstelle ist ein Zusammenschluss folgender Beratungsstellen:    St. Augustinus-Behindertenhilfe im Rhein-Erft-Kreis in 50126 Bergheim   St. Augustinus-Behindertenhilfe in Neuss in 41464 Neuss   St. Augustinus-Behindertenhilfe im Rhein-Kreis in 41539 Dormagen   St. Augustinus-Behindertenhilfe in Krefeld in 47805 Krefeld  ',
  '41460',
  'Neuss',
  0,
  8,
  0,
  10996,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  261,
  8,
  'Beratungsstelle für psychische Gesundheit  und Offene Hilfen',
  'Beratungsstelle für psychische Gesundheit: Beratung für psychisch Gefährdete und psychisch kranke Menschen (z.B. Depression, Ängste, Schizophrenie) und deren Angehörige. Menschen in seelischen Krisen und Notsituationen. Gerontopsychiatrischer Dienst für ältere psychisch kranke Menschen und deren Angehörige.   In Kooperation mit  St. Vinzenz Offene Hilfen : Offene Behindertenarbeit, Ambulant Betreutes Wohnen, Familienunterstützender Dienst.',
  '85049',
  'Ingolstadt',
  0,
  8,
  0,
  10991,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  262,
  1,
  'WiV - Wohnen im Veedel im Caritasverband für die Stadt Köln e.V.',
  'Betreutes Wohnen für Menschen mit Behinderungen',
  '50733',
  'Köln',
  0,
  8,
  0,
  10990,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  263,
  26,
  'Zentrum für Ambulante Dienste, Barmherzige Brüder',
  null,
  '66117',
  'Saarbrücken',
  0,
  8,
  0,
  10946,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  264,
  10,
  'Caritasverband Gladbeck e.V.',
  'Caritasverband Gladbeck e.V.  St.-Suitbert-Haus        ',
  '45968',
  'Gladbeck',
  0,
  8,
  0,
  10928,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  265,
  2,
  'Online-Beratungsstelle des Sozialwerk St. Georg Westfalen Nord ',
  null,
  '59387',
  'Ascheberg',
  0,
  8,
  0,
  10791,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  266,
  23,
  'Virtuelle Online-Beratungsstelle der KJF Regensburg',
  'Wir sind eine virtuelle Beratungsstelle für die Diözese Regensburg.',
  '93055',
  'Regensburg',
  0,
  8,
  0,
  10761,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  267,
  20,
  'St. Vitus-Werk GmbH - Onlineberatungsstelle',
  'Die Online-Beratungsstelle des St.-Vitus-Werkes gibt schwerpunktmäßig Hilfestellung zu Fragen aus den Bereichen:  Sprechen - Hören - Kommunikations- und Entwicklungsstörungen und drohende Behinderung bei Kindern und Jugendlichen.   Dies beinhaltet Informationen über mögliche Fördermaßnahmen, Förderdiagnostik und Fördermethoden (wie z.B. Hörerziehung, Sprachtherapie, Bewegungsförderung, Wahrnehmungsförderung, psychologische Begleitung u.v.m.) sowie Zugangswege zu Behandlungen und Maßnahmen.',
  '49716',
  'Meppen',
  0,
  8,
  0,
  10754,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  268,
  5,
  'Beratungs- & Service-Stelle des Dominikus-Ringeisen-Werks',
  'Die Beratungs- & Service-Stelle des Dominikus-Ringeisen-Werks richtet sich mit ihrem  Angebot an Menschen mit Behinderungen, deren Angehörige, gesetzliche Vertreter, Einrichtungen innerhalb und außerhalb der Behindertenhilfe, Fach- und Sozialdienste, Mitarbeiter von Ämtern und Behörden, Selbsthilfegruppen und Interessenten an Themen der Behindertenhilfe.    Sie hilft bei Fragen zu/m:     Angeboten und Konzepten der Behindertenhilfe allgemein  Zielgruppen-, alters-, und regionalspezifischen Lösungen  Persönlichen Budget  Angeboten und Konzepten des Dominikus-Ringeisen-Werks und deren Finanzierung  Angeboten und Konzepten anderer Träger der Behindertenhilfe  Einrichtungen und Diensten innerhalb und außerhalb der Behindertenhilfe  Vermittlung an Stellen mit speziellen Fachkompetenzen  ',
  '86513',
  'Ursberg',
  0,
  8,
  0,
  10749,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  269,
  3,
  'Regens Wagner Michelfeld',
  'Dienstleistungen für Menschen mit Behinderung und psychischer Erkrankung und deren Angehörigen  Wohnen, Arbeiten, Beratung, Offene Angebote',
  '91275',
  'Auerbach-Michelfeld',
  0,
  8,
  0,
  10746,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  270,
  2,
  'Beratungsstelle der Caritas Wohn- und Werkstätten Niederrhein für Menschen mit Behinderung',
  ' ',
  '47228',
  'Duisburg',
  0,
  8,
  0,
  10744,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  271,
  25,
  'Ökumenisches Gemeinschaftswerk Pfalz GmBH, mobile Dienste',
  null,
  '66849',
  'Landstuhl',
  0,
  8,
  0,
  10740,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  272,
  24,
  'Stiftung St. Franziskus Heiligenbronn, OB',
  null,
  '78713',
  'Schramberg',
  0,
  8,
  0,
  10741,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  273,
  2,
  'St. Rochus-Hospital Telgte',
  null,
  '48291',
  'Telgte ',
  0,
  8,
  0,
  10738,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  274,
  2,
  'St. Vincenz-Gesellschaft',
  null,
  '59227',
  'Ahlen',
  0,
  8,
  0,
  10739,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  275,
  24,
  'St. Elisabeth Stiftung, Service-Haus für Menschen mit geistiger Behinderung',
  'Kontakt- und Beratungsstelle für Menschen mit geistiger Behinderung, deren Angehörige, Betreuer und sonstige Interessierte.   Angebot: allgemeine Beratung, Freizeitangebote, Familienentlastender Dienst, Ambulant Betreutes Wohnen, Betreutes Wohnen in Familien, Vermittlung von Integrationsfachkräften für Kindertagesstätten, Schulbegleitung',
  '88400',
  'Biberach',
  0,
  8,
  0,
  10666,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  276,
  24,
  'Beratungsstelle der Stiftung Haus Lindenhof',
  'In der Beratungsstelle der Stiftung Haus Lindenhof arbeiten unterschiedliche Fachleute (u.a. Heilpädagogin, Sonderschullehrer, Sozialarbeiter).  Unsere Schwerpunkte sind Geistige Behinderung und Körperbehinderung.   An uns wenden sich Betroffene, Angehörige, Fachleute und Interessierte.    Wir informieren, beraten, und vermitteln Hilfen insbesondere zu den Themen  - Frühförderung,  - Schule + Erziehung,  - Wohnen,  - berufliche Bildung + Arbeit,  - Freizeit + Bildung,  - Familienentlastende Dienste  - Nachteilsausgleiche.  ',
  '73525',
  'Schwäbisch Gmünd',
  0,
  8,
  0,
  10659,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  277,
  24,
  'Ambulant psychiatrische Hilfen',
  null,
  '74613',
  'Öhringen',
  1,
  8,
  0,
  10624,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  278,
  17,
  'Augustinuswerk e.V. - Leitung, zentrale Verwaltung -',
  'Wir beraten zu: Angebote für Kinder, Wohnen, Arbeit und Beschäftigung und offene Arbeit',
  '06886',
  'Lutherstadt Wittenberg',
  0,
  8,
  0,
  10144,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  279,
  6,
  'CaritasWohnen am Michaelkirchplatz',
  'Heim/Wohnheim für lernbehinderte/geistig behinderte Menschen',
  '10179',
  'Berlin',
  0,
  8,
  0,
  10117,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  280,
  21,
  'Online Beratung Sozialwerk St. Georg Westfalen Süd',
  'Beratungsstelle für erwachsene psychisch kranke/behinderte Menschen',
  '57392',
  'Schmallenberg',
  0,
  8,
  0,
  10100,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  281,
  8,
  'Regens Wagner Holnstein ',
  null,
  '92334',
  'Berching',
  0,
  8,
  0,
  9813,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  282,
  21,
  'Kontakt- und Beratungsstelle für Menschen mit Behinderung im Kreis Paderborn ',
  'Leben mit Behinderung stellt an Menschen und deren Lebensumfeld immer wieder neue Herausforderungen. Die Kontakt- und Beratungsstelle hilft durch gezielte und bedarfsgerechte Begleitung. Sie kooperiert eng mit Anbietern im Rahmen der Behindertenhilfe. Das Angebot richtet sich an Menschen jeden Alters mit Behinderung, ebenso an Familien, Angehörige, Betreuer, Freunde, Arbeitgeber und Kollegen.',
  '33104',
  'Paderborn',
  0,
  8,
  0,
  10020,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  283,
  21,
  'Caritasverband Dortmund e. V.  Beratungsstelle für Menschen mit Behinderung und deren Angehörige',
  'Information und Beratung für Menschen mit Behinderungen und deren Angehörige',
  '44137',
  'Dortmund',
  0,
  8,
  0,
  10035,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  284,
  2,
  'Kinderheilstätte Nordkirchen',
  'Wohnheim für geistig und mehrfach behinderte Kinder und Jugendliche, Interdisziplinärer Beratungsdienst für Eltern, Angehörige und MItarbeiter bei problematischem Verhalten von Menschen mit Behinderung',
  '59394',
  'Nordkirchen',
  0,
  8,
  0,
  9655,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  285,
  16,
  'Psychosoziale Kontakt- und Beratungsstelle frankfurter werkgemeinschaft e.V.',
  'Beratung für Menschen mit psychischer Erkrankung / seelischer Behinderung und in seelischer Not',
  '60316',
  'Frankfurt',
  0,
  8,
  0,
  9705,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  286,
  16,
  'St.Vincenzstift Aulhausen',
  'Das St. Vincenzstift Aulhausen ist eine caritative Einrichtung der Behindertenhilfe in kirchlicher Trägerschaft.    Wir bieten vielfältige Möglichkeiten der Förderung und Beschäftigung für Kinder, Jugendliche und Erwachsene mit geistiger Behinderung an.    Unser Angebot umfasst:    Wohnbereich für Menschen aller Hilfebedarfsgruppen (auch Kurzzeitbetreuungen)  Betreutes Wohnen  Familienentlastenden Dienst mit Einzel- und Gruppenangeboten  Beratung für Angehörige  Wohnschule   Integrative Kindertagesstätte  Schulen für Praktisch Bilbare, Lernhilfe, Erziehungshilfe  Werkstätten für Menschen mit Behinderung  Aktivierende Tagesbetreuung  Seniorenbetreuung  therapeutische und seelsorgerische Fachdienste  ',
  '65385',
  'Rüdesheim am Rhein',
  0,
  8,
  0,
  9730,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  287,
  2,
  'Beratungsstelle für Menschen mit Behinderung Caritasverband Emsdetten-Greven e.V.',
  'Beratungsstelle für Menschen mit Behinderung (einschließlich Hörbehindertenberatung),  Ambulante Wohnschule, Familiäre Assistenz, Schulassistenz, Beratung Persönliches Budget, Integrationsfachdienst für Hörbehinderte, Ambulant Betreutes Wohnen',
  '48282',
  'Emsdetten',
  0,
  8,
  0,
  9641,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  288,
  2,
  'Beratungsstelle für Menschen mit Behinderungen und deren Angehörige',
  'Beratungsstelle für Menschen mit Behinderungen und deren Angehörige (einschl. Familienunterstützende Dienste (FUD))',
  '48431',
  'Rheine',
  0,
  8,
  0,
  9579,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  289,
  26,
  'Barmherzige Brüder Schönfelderhof Wohnheim f. psych. Kranke',
  'Heim/Wohnheim für psychisch kranke/behinderte Menschen',
  '54313',
  'Zemmer',
  0,
  8,
  0,
  9216,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  290,
  3,
  'Beratungsstelle für seelische Gesundheit Sozialpsychiatrischer Dienst',
  'Wir sind zuständig für Menschen mit psychischen Problemen und deren Angehörige',
  '91217',
  'Hersbruck ',
  0,
  8,
  0,
  9023,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  291,
  11,
  'Caritasverband für den Schwarzwald-Baar-Kreis e. V.',
  'Bereich Behindertenhilfe und Gemeindepsychiatrie',
  '78050',
  'Villingen-Schwenningen',
  0,
  8,
  0,
  8967,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  292,
  11,
  'Caritasverband Bruchsal e.V. OB',
  'Beratungs-/Betreuungsstelle für behinderte Menschen (einschl. familienentlastende Dienste)',
  '76646',
  'Bruchsal',
  0,
  8,
  0,
  8975,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  293,
  11,
  'Caritasverband Pforzheim e. V. Beratungs- u. Betreuungsstelle für behinderte Menschen',
  'Beratungs-/Betreuungsstelle für psychisch erkrankte und behinderte Menschen (einschl. familienentlastende Dienste)',
  '75175',
  'Pforzheim',
  0,
  8,
  0,
  8964,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  294,
  11,
  'Caritasverband für den Landkreis Lörrach e.V.',
  'Ambulanter sozialpsychiatrischer Dienst',
  '79539',
  'Lörrach',
  0,
  8,
  0,
  8900,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  295,
  11,
  'Informations- und Beratungsstelle für Menschen mit Behinderung',
  null,
  '79108',
  'Freiburg',
  0,
  8,
  0,
  8952,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  296,
  1,
  'Sozialpsychiatrisches Zentrum Köln-Innenstadt',
  'Beratungsstelle für Betroffene und Angehörige bei seelischen Problemen, Psychiatrieerfahrung oder psychischer Behinderung',
  '50677',
  'Köln',
  0,
  8,
  0,
  8840,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  297,
  1,
  'ADOLPH-KOLPING-HAUS',
  'Heim/Wohnheim für lernbehinderte/geistig behinderte Menschen',
  '42719',
  'SOLINGEN',
  0,
  8,
  0,
  8814,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  298,
  1,
  'SOZIALPSYCHIATRISCHES ZENTRUM LINKSRHEINISCH',
  'Ambulanter sozialpsychiatrischer Dienst',
  '53340',
  'Meckenheim',
  0,
  8,
  0,
  8810,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  299,
  1,
  'Kontakt- und Beratungsstelle im Sozialpsychiatrischen Zentrum Rodenkirchen',
  null,
  '50996',
  'Köln',
  0,
  8,
  0,
  8671,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  300,
  13,
  'Caritas-Region Cottbus',
  'Kontakt- und Beratungsstelle (KBS)  für Menschen mit psychischen Beeinträchtigungen',
  '03149',
  'Forst',
  0,
  8,
  0,
  8688,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  301,
  1,
  'Sozialpsychiatrisches Zentrum Köln-Porz',
  'Beratungs-/Betreuungsstelle für behinderte Menschen (einschl. familienentlastende Dienste)',
  '51143',
  'KÖLN',
  0,
  8,
  0,
  8767,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  302,
  5,
  'Caritasverband für die Diözese Augsburg e.V., Sozialpsychiatrie',
  'Die Sozialpsychiatrischen Dienste des Caritasverbandes für die Diözese Augsburg mit den Standorten   -	Augsburg-Land  -	Günzburg  -	Neu-Ulm  bieten fachliche Beratung für Menschen mit psychischer Erkrankung oder Belastung sowie für deren Angehörige.    Wir sind für Sie da...     - wenn Sie unter psychischen Belastungen und Veränderungen im seelischen Erleben leiden, wie z. B. Ängsten, Depressionen, Zwangsvorstellungen, Schlafstörungen, Verfolgungsgefühlen, Selbstwertproblemen, Überforderungserlebnissen usw.   - wenn Sie wegen einer psychischen Störung, Erkrankung oder Behinderung in persönliche, familiäre, berufliche oder soziale Schwierigkeiten gekommen sind   - wenn Sie sich aufgrund von Verlusten oder Konflikten in einer schweren seelischen Krise befinden   - wenn Sie sich isoliert und verzweifelt fühlen oder wenn Ihnen Ihre Lebenssituation ausweglos erscheint   - wenn Ihnen die psychische Erkrankung oder Behinderung eines Angehörigen, Bekannten oder Kollegen zum Problem wird   - wenn Sie sich über psychiatrische Störungen, Krankheitsbilder und Behandlungsmöglichkeiten informieren wollen  ',
  '86152',
  'Augsburg',
  0,
  8,
  0,
  11019,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  303,
  2,
  'Kontakt- und Beratungsstelle KOKA, cbt Marl',
  null,
  '45768',
  'Marl',
  1,
  8,
  0,
  11162,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  304,
  5,
  'CAB Behindertenhilfe',
  'Die CAB ist ein modernes, soziales Dienstleistungsunternehmen: In 22 Einrichtungen bieten wir alten Menschen und erwachsenen behinderten Menschen Hilfe an. CAB steht für  Caritas Augsburg Betriebsträger gGmbH , das kleine  g  für gemeinnützig.     Richtschnur für unser unternehmerisches Handeln ist das Bekenntnis zur christlichen Caritas. Gemäß unserem Leitbild steht der Mensch im Mittelpunkt unseres Handelns. Unsere Einrichtungen erbringen die notwendigen Dienste und Dienstleistungen gegenüber dem Hilfesuchenden um des Menschen willen, nicht aus Gründen des Gewinnstrebens.      Dienstleistung in diesem Zusammenhang heißt für uns:    Wir achten den Menschen mit Behinderung, seine Würde, sein Wohl und seine Autonomie.    Wir beachten, begleiten und fördern seine persönliche Entwicklung in allen körperlichen, seelischen und geistigen Dimensionen und Fähigkeiten umfassend.    Die Werte  Personalität ,  Individualität  und  Normalisierung  setzen wir in der Betreuung um und realisieren sie.',
  '86153',
  'Augsburg',
  1,
  8,
  0,
  11182,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  305,
  1,
  'Caritasverband Rhein-Sieg e.V. -Lebensräume Hilfen für Menschen mit Behinderungen',
  null,
  '53721',
  'Siegburg',
  0,
  8,
  0,
  11205,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  306,
  16,
  'Caritasverband Frankfurt, Konrad-von-Preysing-Haus',
  'Wohnverbund für geistig behinderte Erwachsene',
  '60598',
  'Frankfurt am Main',
  1,
  8,
  0,
  11324,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  307,
  8,
  'Offene Hilfen für den Südl. Landkreis Ansbach',
  null,
  '91572',
  'Bechhofen',
  1,
  8,
  0,
  11657,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  308,
  5,
  'Offene Hilfen Neuburg-Schrobenhausen GbR ',
  'Angebote für Menschen mit Behinderung und Angehoerige',
  '86633',
  'Neuburg',
  0,
  8,
  0,
  11670,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  309,
  3,
  'Caritasverband im Landkreis Nürnberger Land e.V.',
  'Unser Angebot richtet sich an Menschen mit (drohenden) körperlichen, geistigen Behinderungen, chronisch Kranken jeden Alters und deren Angehörigen und Unterstützern.    Wir ermöglichen Ihnen  - Begleitung in psychosozialen Krisensituationen  - Informationen zu Fragen, die im Zusammenhang mit einer Behinderung entstehen  - Aufklärung über die individuellen, aktuellen gesetzlichen Hilfen bei (drohender) Behinderung  - Unterstützung in der Zusammenarbeit mit Behörden und Kostenträgern  - Freizeit-, Begegnungs- und Gruppenangebote für Betroffene und Angehörige  - Kooperation und Vernetzung mit anderen Diensten  - Mehrtägige Freizeiten in Kooperation mit den Rummelsberger Offenen Angebote',
  '91207',
  'Lauf',
  0,
  8,
  0,
  11692,
  '2019-08-22 12:57:50',
  '2019-08-22 12:57:50',
  null
), (
  310,
  19,
  'Beratungsstelle für Eltern, Kinder, Jugendliche und Familien,München Königswieser Straße 12',
  'Beratung bezüglich der Entwicklung und Erziehung von Kindern und Jugendlichen  Beratung/Therapie für Eltern, Familien, Jugendliche und junge Erwachsene  Beratung zu Partnerschaft, Trennung und Scheidung für Eltern  Psychodiagnostik  Schuleignungsdiagnostik  Beratung für pädagogische Fachkräfte  Informationsveranstaltungen für Eltern und Fachkräfte',
  '81475',
  'München',
  0,
  3,
  0,
  6548,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  311,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Titisee-Neustadt',
  null,
  '79822',
  'Titisee-Neustadt',
  0,
  3,
  0,
  6546,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  312,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Freiburg',
  null,
  '79111',
  'Freiburg',
  0,
  3,
  0,
  6544,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  313,
  25,
  'Caritas Erziehungs- Ehe- und Lebensberatung, Germersheim',
  null,
  '76726',
  'Germersheim',
  0,
  3,
  0,
  6539,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  314,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung Landau',
  'Beratung für Kinder und Jugendliche, Eltern und Familien  ',
  '76829',
  'Landau',
  0,
  3,
  0,
  6540,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  315,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Haslach',
  null,
  '77716',
  'Haslach',
  0,
  3,
  0,
  6542,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  316,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Schwetzingen',
  null,
  '68723',
  'Schwetzingen',
  0,
  3,
  0,
  6527,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  317,
  24,
  'Psychologische Familien- und Lebensberatung',
  null,
  '71332',
  'Waiblingen',
  0,
  3,
  0,
  6529,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  318,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Wiesloch',
  '  ',
  '68168',
  'Wiesloch',
  0,
  3,
  0,
  6526,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  319,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Mannheim',
  null,
  '68159',
  'Mannheim',
  0,
  3,
  0,
  6525,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  320,
  27,
  'Psychologische Beratungsstelle für Kinder, Jugendliche und Eltern, Miltenberg',
  null,
  '63897',
  'Miltenberg',
  0,
  3,
  0,
  6508,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  321,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung St.Ingbert',
  null,
  '66386',
  'St. Ingbert',
  0,
  3,
  0,
  6516,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  322,
  25,
  'Caritas Erziehungs-, Ehe und Lebensberatung, Pirmasens',
  'Hilfe und Rat für Jugendliche, Eltern und Kinder: Familiäre Spannungen, emotionale Probleme von Jugendlichen, Schul- und Leistungsschwierigkeiten, Verhaltensauffälligkeiten von Kindern, Fragen bei Trennung und Scheidung, Erziehungsunsicherheit und Durchsetzungschwierigkeiten bei Eltern, Beratung auch von Fachkräften',
  '66953',
  'Pirmasens',
  0,
  3,
  0,
  6522,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  323,
  27,
  'Beratungsstelle für Kinder, Jugendliche und Eltern im Landkreis Aschaffenburg',
  null,
  '63739',
  'Aschaffenburg',
  0,
  3,
  0,
  6506,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  324,
  27,
  'Beratungsstelle für Kinder, Jugendliche und Eltern, Aschaffenburg',
  null,
  '63739',
  'Aschaffenburg',
  0,
  3,
  0,
  6507,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  325,
  21,
  'Caritas-AufWind Olpe',
  ' Kath. Jugend- und Familiendienst',
  '57462',
  'Olpe',
  0,
  3,
  0,
  6482,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  326,
  16,
  'Eltern- und Jugendberatung Stadtmitte Frankfurt am Main',
  null,
  '60311',
  'Frankfurt am Main',
  0,
  3,
  0,
  6500,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  327,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Coesfeld',
  null,
  '48653',
  'Coesfeld',
  0,
  3,
  0,
  6449,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  328,
  21,
  'AufWind - Kath. Jugend- und Familiendienst, Attendorn',
  null,
  '57439',
  'Attendorn',
  0,
  3,
  0,
  6481,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  329,
  15,
  'Jugend-, Erziehungs- und Familienberatung Hildesheim',
  null,
  '31134',
  'Hildesheim',
  0,
  3,
  0,
  6400,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  330,
  15,
  'Erziehungsberatungsstelle Duderstadt ',
  'Angebot  der Beratung für Eltern, Kinder und Jugendliche aus den Gemeinden Duderstadt, Gieboldehausen, Bovenden, Gleichen und Radolfshausen',
  '37115',
  'Duderstadt',
  0,
  3,
  0,
  6408,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  331,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Leinefelde',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '37327',
  'Leinefelde / Heiligenstadt',
  0,
  3,
  0,
  6409,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  332,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Dülmen',
  null,
  '48249',
  'Dülmen',
  0,
  3,
  0,
  6443,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  333,
  14,
  'Onlineberatung für JUGENDLICHE UND JUNGE ERWACHSENE (ohne Kinder) des Caritasverbandes für Hamburg e',
  'Herzlich Willkommen in der Online-Beratung für JUGENDLICHE UND JUNGE ERWACHSENE von 14 bis 27 Jahren. Wir bemühen uns, alle Anfragen an Wochentagen innerhalb von 48 Stunden zu beantworten. Anfragen, die am Donnerstag oder später unsere Beratungsstelle erreichen, werden somit unter Umständen erst am Montag beantwortet.    Wir freuen uns immer über Rückmeldungen, positiv wie negativ! Wenn Ihr Lust habt von Euren Erfahrungen mit der Onlineberatung zu berichten, wendet Euch bitte an:  Frau Regina Seyer (Leitung der Onlineberatung), Tel. 040 - 280 140 - 600 oder per Mail an seyer@caritas-hamburg.de   - DANKE - ',
  '20099',
  'Hamburg',
  0,
  3,
  0,
  6395,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  334,
  1,
  'Beratungsstelle Kerpen ',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Kerpen.',
  '50171',
  'Kerpen',
  0,
  3,
  0,
  6082,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  335,
  1,
  'Katholische Beratungsstelle für Eltern, Kinder und Jugendliche, Köln',
  'Willkommen auf der Homepage der   Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln',
  '50678',
  'Köln',
  0,
  3,
  0,
  6081,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  336,
  1,
  'Internationale Familienberatung, Köln (Internationale Familienberatung)',
  'Willkommen auf der Homepage   der Internationalen Familienberatung  in Köln',
  '50672',
  'Köln (Internationale Familienberatung)',
  0,
  3,
  0,
  6080,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  337,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Porz',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln-Porz',
  '51143',
  'Köln (Porz)',
  0,
  3,
  0,
  6078,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  338,
  1,
  'Familienberatung der CSH, Köln (Mülheim)',
  'Willkommen bei der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln-Mülheim',
  '51063',
  'Köln (Mülheim)',
  0,
  3,
  0,
  6079,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  339,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Wuppertal',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Wuppertal',
  '42285',
  'Wuppertal',
  0,
  3,
  0,
  6073,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  340,
  1,
  'Erziehungs- und Familienberatungsstelle im Oberbergischen Kreis',
  'Herzlich willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Wipperfürth, mit Außenstellen in Lindlar und Radevormwald',
  '51688',
  'Wipperfürth',
  0,
  3,
  0,
  6074,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  341,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Leichlingen',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Leichlingen',
  '42799',
  'Leichlingen',
  0,
  3,
  0,
  6075,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  342,
  1,
  'Beratungsstelle Erftstadt',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Erftstadt-Lechenich',
  '50374',
  'Erftstadt',
  0,
  3,
  0,
  6076,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  343,
  1,
  'Erziehungs- und Familienberatungsstelle, Düsseldorf',
  null,
  '40210',
  'Düsseldorf Mitte',
  0,
  3,
  0,
  6077,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  344,
  1,
  'Erziehungs- und Familienberatungsstelle Grevenbroich',
  'Willkommen auf der Homepage der  Erziehungs- und Familienberatungsstelle  in Grevenbroich',
  '41515',
  'Grevenbroich',
  0,
  3,
  0,
  6070,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  345,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Leverkusen',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Leverkusen',
  '51373',
  'Leverkusen',
  0,
  3,
  0,
  6071,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  346,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Neuss',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Neuss',
  '41460',
  'Neuss',
  0,
  3,
  0,
  6072,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  347,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Bergisch Gladbach',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Bergisch Gladbach',
  '51465',
  'Bergisch Gladbach',
  0,
  3,
  0,
  6069,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  348,
  1,
  'Erziehungsberatungsstelle Bonn und Rhein-Sieg-Kreis',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  für Bonn und den Rhein-Sieg-Kreis',
  '53113',
  'Bonn',
  0,
  3,
  0,
  6068,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  349,
  1,
  'Erziehungs- und Familienberatungsstelle, Dormagen',
  'Willkommen auf der Homepage der   Erziehungs- und Familienberatungsstelle  in Dormagen',
  '41539',
  'Dormagen',
  0,
  3,
  0,
  6066,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  350,
  1,
  'Die Jugendberatung, SKFM Düsseldorf',
  'Info, Beratung und Therapie für Jugendliche, junge Erwachsene und Bezugsprsonen',
  '40476',
  'Düsseldorf',
  0,
  3,
  0,
  6067,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  351,
  19,
  'Erziehungs-, Jugend- und Familienberatungsstelle Ramersdorf / Perlach in München',
  null,
  '81737',
  'München',
  0,
  3,
  0,
  6549,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  352,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Taufkirchen',
  'Der schnelle und sichere Weg......  ...... zur Beratung und HIlfe  ...... für Kinder, Jugendliche und Erwachsene     Hilfe auf den ersten Klick ',
  '82024',
  'Taufkirchen',
  0,
  3,
  0,
  6550,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  353,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Landkreis Fürstenfeldbruck',
  null,
  '82256',
  'Fürstenfeldbruck',
  0,
  3,
  0,
  6553,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  354,
  5,
  'KJF Erziehungs-, Jugend- und Familienberatung Weilheim-Schongau',
  null,
  '82362',
  'Weilheim',
  0,
  3,
  0,
  6554,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  355,
  19,
  'Caritas Beratungsstelle für Eltern, Kinder, Jugendliche und Familien Garmisch-Partenkirchen',
  'Beratungsstelle für Eltern, Kinder, Jugendliche und Familien für den Landkreis Garmisch-Partenkirchen',
  '82467',
  'Garmisch-Partenkirchen',
  0,
  3,
  0,
  6556,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  356,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Traunstein',
  null,
  '83278',
  'Traunstein',
  0,
  3,
  0,
  6562,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  357,
  19,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Bad Reichenhall',
  null,
  '83435',
  'Bad Reichenhall',
  0,
  3,
  0,
  6565,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  358,
  19,
  'Ökumenische Beratungsstelle für Eltern, Kinder und Jugendliche, Bad Tölz-Wolfratshausen',
  'Neben der Beratungsstelle in Bad Tölz gibt es die Aussenstelle in 85253 Geretsried, Steiner Ring 159',
  '83646',
  'Bad Tölz',
  0,
  3,
  0,
  6570,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  359,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Mühldorf',
  '- Beratung von Eltern und Familien zu Fragen der Erziehung, des familiären Zusammenlebens und der kindlichen Entwicklung  - Beratung für Jugendliche und junge Erwachsene mit Problemen in der Familie, im Freundeskreis, in der Schule, am Arbeitsplatz oder mit persönlichen Schwierigkeiten  -Psychologische Diagnostik  - verschiedene Gruppenangebote: Kinder im Blick (für Eltern in Trennung);  Kinderscheidungsgruppe, Gruppe für Kinder von psychisch belasteten oder suchtkranken Eltern, Gruppe für Eltern von pubertierenden Jugendlichen,u.a.  - Beratung bei Trennung/Scheidung  - Familienmediation  - Elternkurse  - Beratung pädagogischer Fachkräfte  - präventive Angebote an Schulen, Kindergärten  - Begleiteter Umgang mit Samstagstreff  - Legasthenietherapie  - angegliedert: Sozialpädagogische Familienhilfe; Jugendsozialarbeit an Schulen  - Projekt Elterntalk',
  '84453',
  'Mühldorf',
  0,
  3,
  0,
  6575,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  360,
  19,
  'Jugend- und Elternberatung, Dachau',
  null,
  '85221',
  'Dachau',
  0,
  3,
  0,
  6581,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  361,
  19,
  'Jugend- und Elternberatung, Erziehungsberatungsstelle, Pfaffenhofen',
  null,
  '85276',
  'Pfaffenhofen',
  0,
  3,
  0,
  6582,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  362,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Freising',
  null,
  '85354',
  'Freising',
  0,
  3,
  0,
  6583,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  363,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Grafing',
  null,
  '85560',
  'Grafing',
  0,
  3,
  0,
  6585,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  364,
  24,
  'Psychologische Familien- und Lebensberatung im Landkreis Ravensburg',
  'Die OnlineBeratung im Landkreis Ravensburg leisten die Beraterinnen und Berater der drei Beratungsstellen in Ravensburg (zuständig für den Sozialraum Weingarten), in Leutkirch und in Bad Waldsee.    Psychologische Familen- und Lebensberatung  Erziehungs- und Familienberatung: Allmandstr. 10, 88212 Ravensburg, Tel. 0751-3590150  Beratung für Ehe-, Familien- und Lebensfragen, Allmandstr. 10, 88212 Ravensburg, Tel. 0751-32479  www.caritas-bodensee-oberschwaben.de    Psychologische Familen- und Lebensberatung  Marienplatz 11, 88299 Leutkirch  Tel. 07561-90660  www.caritas-bodensee-oberschwaben.de    Psychologische Familen- und Lebensberatung  Robert-Koch-Str. 52, 88339 Bad Waldsee  Tel. 07524-4011680  www.caritas-bodensee-oberschwaben.de',
  null,
  'Landkreis Ravensburg',
  0,
  3,
  0,
  6596,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  365,
  24,
  'Psychologische Familien- und Lebensberatung',
  null,
  '88400',
  'Biberach',
  0,
  3,
  0,
  6599,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  366,
  5,
  'KJF Erziehungs-Jugend- und Familienberatung Dillingen',
  null,
  '89407',
  'Dilllingen',
  0,
  3,
  0,
  6604,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  367,
  3,
  'Caritasverband Nürnberg e.V.   Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche',
  'Beratung und Therapie bei familiären, Erziehungs- und Beziehungsproblemen   Beratung für Mütter und Väter bei Fragen zu Partnerschaft, Trennung und Scheidung   Psychodiagnostik (Tests), auch bei Teilleistungsstörungen (z.B. Legasthenie)   Beratung bei Verhaltensauffälligkeiten, emotionalen Problemen (z.B. Angst), persönlichen Problemen , Entwicklungskrisen und psychosomatischen Problemen   Beratung bei schulischen Problemen und Essstörungen   Beratung bei Schwierigkeiten in der Ausbildung oder am Arbeitsplatz, sowie bei Schwierigkeiten mit Sekten und Problemen der Sinnfindung     Gruppenangebote:   Nürnberger Elterntraining (N.E.T.)  Bindungs- und Entwicklungsberatung (Safety - Geborgen bei mir) für Schwangere und junge Mütter/Eltern mit Säuglingen   Gruppen für Kinder im Kontext von Trennung und Scheidung   Soziale Kompetenzgruppen   Gruppen zur Förderung der Aufmerksamkeit   Gruppen für trauernde Kinder   ...    Die genannten Hilfen sind kostenfrei (Ausnahme: geringer Unkostenbeitrag beim Elterntraining und bei den Trennungs-Scheidungskinder-Gruppen), alle Mitarbeiterinnen und Mitarbeiter der Stelle unterliegen der gesetzlichen Schweigepflicht. Von Seiten der Ratsuchenden werden alle Hilfen freiwillig in Anspruch genommen     Eine Diplom-Psychologin der Stelle verfügt über perfekte Sprachkenntnisse in polnischer und russischer Sprache     Für die Klärung weiterer organisatorischer Fragen steht Ihnen unser Sekretariat (0911-2354241) zur Verfügung     Wir sind für alle Ratsuchenden, die mit minderjährigen Kindern und Jugendlichen zu tun haben offen, also für Eltern/Alleinerziehende, Erzieherinnen und Lehrkräfte und natürlich für die Kinder, Jugendlichen und jungen Erwachsenen selbst.     Bei der Online-Beratung müssen Sie natürlich nicht Ihre persönlichen Daten preisgeben, sondern können z.B. ein Pseudonym bzw. einen Nickname verwenden.  Zum Schutz der Mitarbeiterinnen und Mitarbeiter unserer Einrichtung arbeiten diese  mit den Pseudonymen Berater 1 bis Beraterin 6.  Bitte beachten Sie, dass Beraterin 5 prinzipiell nur freitags zur Verfügung steht, sowie Beraterin 2 von Montag bis einschließlich Donnerstag erreichbar ist. Beraterin 4 ist von Mittwoch bis Freitag ansprechbar.    Unsere Öffnungszeiten sind Montag bis Donnerstag von 9.00 - 12.00 und 14.00 - 16.00 Uhr sowie Freitag von 9.00 - 12.00.    Klienten aus Nürnberg können darüberhinaus bei Bedarf den Krisendienst Mittelfranken unter der zentralen Telefon-Nr. 0911 / 42 48 550 oder über das Internet www.krisendienst-mittelfranken.de erreichen.',
  '90403',
  'Nürnberg',
  0,
  3,
  0,
  6606,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  368,
  3,
  'Erziehungs- und Jugendberatungsstelle im Landkreis Nürnberger Land',
  'Gemeinsame Trägerschaft mit dem Diakonischen Werk   Hauptstelle in Lauf   Nebenstelle in Altdorf   Außenstelle in Hersbruck',
  '91207',
  'Lauf',
  0,
  3,
  0,
  6611,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  369,
  3,
  'Erziehungs-, Jugend- u. Familienberatungsstelle f. d. Landkreis Forchheim',
  null,
  '91301',
  'Forchheim',
  0,
  3,
  0,
  6612,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  370,
  23,
  'Erziehungs- Jugend- und Familienberatungsstelle, Cham',
  null,
  '93413',
  'Cham',
  0,
  3,
  0,
  6620,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  371,
  22,
  'Erziehungs-, Jugend- und Familienberatung, Deggendorf',
  null,
  '94469',
  'Deggendorf',
  0,
  3,
  0,
  6626,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  372,
  3,
  'Caritas-Beratungshaus, Beratungsstelle für Kinder, Jugendliche und Eltern, Bamberg',
  null,
  '96047',
  'Bamberg',
  0,
  3,
  0,
  6628,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  373,
  3,
  'Beratungsstelle für Kinder, Jugendliche und Eltern, Lichtenfels',
  null,
  '96215',
  'Lichtenfels',
  0,
  3,
  0,
  6629,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  374,
  3,
  'Beratungsstelle für Kinder, Jugendliche und Familien, Kronach',
  null,
  '96317',
  'Kronach',
  0,
  3,
  0,
  6630,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  375,
  27,
  'Beratungsstelle für Familien -Kinder, Jugendliche und Eltern-(Erziehungsberatung)',
  null,
  '97437',
  'Haßfurt',
  0,
  3,
  0,
  6633,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  376,
  27,
  'Eltern-, Jugendlichen- und Erziehungsberatungsstelle, Bad Neustadt an der Saale',
  null,
  '97616',
  'Bad Neustadt an der Saale',
  0,
  3,
  0,
  6634,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  377,
  27,
  'Erziehungsberatung, Bad Kissingen',
  null,
  '97688',
  'Bad Kissingen',
  0,
  3,
  0,
  6635,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  378,
  11,
  'Erziehungs- und Familienberatungsstelle, Tauberbischofsheim',
  'Wir unterstützen bei Erziehungsfragen, begleiten Familien in Krisen und beraten zum Thema sexuelle Gewalt.  ',
  '97941',
  'Tauberbischofsheim',
  0,
  3,
  0,
  6636,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  379,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Suhl',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '98527',
  'Suhl',
  0,
  3,
  0,
  6637,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  380,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Erfurt',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '99084',
  'Erfurt / Weimar / Jena / Gotha',
  0,
  3,
  0,
  6638,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  381,
  21,
  'Erziehungsberatung Sundern',
  null,
  '59846',
  'Sundern',
  0,
  3,
  0,
  7314,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  382,
  21,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Castrop-Rauxel, Diözese Paderborn',
  null,
  '44575',
  'Castrop-Rauxel',
  0,
  3,
  0,
  7315,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  383,
  21,
  'Erziehungsberatung Dortmund',
  null,
  '44147',
  'Dortmund',
  0,
  3,
  0,
  7316,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  384,
  21,
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '33378',
  'Rheda Wiedenbrück, Gütersloh (Stadt u. Kreis)',
  0,
  3,
  0,
  7317,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  385,
  21,
  'Erziehungsberatung Hamm',
  null,
  '59067',
  'Hamm',
  0,
  3,
  0,
  7318,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  386,
  21,
  'Erziehungsberatung Brakel',
  null,
  '33034',
  'Brakel/Höxter (Kreis)',
  0,
  3,
  0,
  7319,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  387,
  21,
  'Erziehungsberatung Menden/Iserlohn',
  null,
  '58706',
  'Iserlohn/Menden',
  0,
  3,
  0,
  7320,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  388,
  21,
  'Beratungsstelle für Eltern, Jugendliche und Kinder',
  null,
  '44534',
  'Lünen',
  0,
  3,
  0,
  7321,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  389,
  21,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Meschede/Schmallenberg',
  'mit Außenstelle in Schmallenberg, Oststraße 42, 57392 Schmallenberg, Telefon: 02972 2288, E-Mail: eb-schmallenberg@caritas-meschede.de ',
  '59872',
  'Meschede',
  0,
  3,
  0,
  7322,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  390,
  21,
  'Caritas- Aufwind Lennestadt und Kirchhundem',
  ' Kath. Jugend- und Familiendienst',
  '57368',
  'Lennestadt-Altenhundem',
  0,
  3,
  0,
  7323,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  391,
  21,
  'Beratungsstelle für Eltern, Kinder & Jugendliche Schloss Neuhaus',
  null,
  '33104',
  'Paderborn - Schloß Neuhaus - Büren',
  0,
  3,
  0,
  7324,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  392,
  21,
  'Erziehungsberatung Werl',
  null,
  '59457',
  'Werl',
  0,
  3,
  0,
  7325,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  393,
  21,
  'Familien- und Erziehungsberatungsstelle Arnsberg ',
  null,
  '59821',
  'Arnsberg',
  0,
  3,
  0,
  7339,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  394,
  2,
  'Beratungsstelle Ahaus, Gronau, Heek, Legden, Schöppingen, Stadtlohn, Südlohn, Vreden',
  null,
  '48683',
  'Ahaus',
  0,
  3,
  0,
  7370,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  395,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Ahlen',
  null,
  '59229',
  'Ahlen',
  0,
  3,
  0,
  7371,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  396,
  2,
  'Beratungsstelle Bocholt, Rhede, Isselburg',
  'Die Beratungsstelle ist Ansprechpartner für Eltern bei Erziehungs- und Entwicklungsfragen sowie für Fragen von Kindern, Jugendlichen und jungen Erwachsenen.  Eltern, Bezugspersonen, (pädagogische) Fachkräfte sowie Kinder und Jugendliche selbst sind uns herzlich willkommen.    Was tun, ...  wenn mein Kind keine Freunde findet?  ... wenn ich unsicher bin, ob mein Kind altersgemäß entwickelt ist?  ... wenn mein Kind viele Ängste zeigt?  ... wenn mein Kind sich nichts mehr sagen lässt?  ... wenn man unsicher ist, ob ein Kind die Trennung der Eltern verkraftet?    Auch Kinder, Jugendliche und junge Erwachsene haben manchmal Fragen oder Probleme, die sie mit jemand außerhalb der Familie besprechen wollen. Daher könnt ihr Euch - auf Wunsch auch ohne Eure Eltern - bei uns beraten lassen.    Ebenso beraten und coachen wir pädagogische Fachkräfte aus Kitas, Familienzentren, Schulen und anderen Einrichtungen, die Kinder und Jugendliche betreuen.    Wir bieten an, gemeinsam Lösungen zu entwickeln.  Die psychologischen und pädagogischen Fachkräfte unserer Beratungsstelle unterstützen Sie/Dich gerne, um Antworten und Lösungen für solche und andere Fragen   zu finden.    Der erste Kontakt erfolgt durch eine telefonische oder persönliche Anmeldung im Sekretariat der Beratungsstelle.  Innerhalb von 14 Tagen nach der Anmeldung gibt es einen Erstberatungstermin.    Unsere Hilfen sind für Ratsuchende kostenfrei.   Alle Gesprächsinhalte sind streng vertraulich und unterliegen der Schweigepflicht.    Termine finden nach Absprache in den Räumen der Beratungsstelle oder bei Bedarf außer Haus statt.    Wir freuen uns auf Ihren/Deinen Anruf oder Besuch!    Sprechzeiten: Mo.-Fr. 08:00 - 12:30, Mo.-Do. 14:00 -17:00 Uhr, sowie nach Vereinbarung  ',
  '46399',
  'Bocholt',
  0,
  3,
  0,
  7372,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  397,
  2,
  'Beratungsstelle Borken',
  null,
  '46325',
  'Borken',
  0,
  3,
  0,
  7373,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  398,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche Dorsten',
  null,
  '46284',
  'Dorsten',
  0,
  3,
  0,
  7375,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  399,
  2,
  'Beratungsstelle Emsdetten, Greven, Saerbeck',
  'Emsdetten:    Bachstr. 15  48282 Emsdetten  Telefon: 02572/157 39  Fax.: 02572/157 49     Greven:    Kirchstr. 5  48268 Greven  Telefon: 02571/800 90  Fax.: 02571/800 922 ',
  null,
  'Emsdetten und Greven',
  0,
  3,
  0,
  7376,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  400,
  2,
  'Beratungsstelle Geldern',
  null,
  '47608',
  'Geldern',
  0,
  3,
  0,
  7377,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  401,
  2,
  'Beratungsstelle für Eltern, Jugendliche und Kinder in Ibbenbüren',
  null,
  '49477',
  'Ibbenbüren',
  0,
  3,
  0,
  7378,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  402,
  2,
  'Beratungsstelle für Kinder, Jugendliche und Familien',
  'Nordkreis Kleve  Einzugsbereiche:  Kleve, Emmerich am Rhein, Goch, Bedburg-Hau, Kalkar, Kranenburg, Rees, Uedem ',
  '47533',
  'Kleve',
  0,
  3,
  0,
  7379,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  403,
  2,
  'Beratungsstelle Marl, Haltern',
  null,
  '45768',
  'Marl',
  0,
  3,
  0,
  7380,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  404,
  2,
  'Beratungsstelle Moers-Xanten',
  null,
  '47495',
  'Rheinberg',
  0,
  3,
  0,
  7381,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  405,
  2,
  'Beratungsstelle Münster',
  'Sie erreichen uns in den fünf     Caritas vor Ort-Beratungsstellen     im Stadtgebiet von Münster:     Mitte   -   Coerde   -   Gievenbeck   -   Hiltrup   -   Kinderhaus.     Die Adressen und Telefonnummern entnehmen Sie bitte unserer Homepage (s.u.).',
  null,
  'Münster',
  0,
  3,
  0,
  7382,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  406,
  2,
  'Beratungsstelle Rheine, Neuenkirchen, Wettringen',
  null,
  '48429',
  'Rheine',
  0,
  3,
  0,
  7383,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  407,
  2,
  'Beratungsstelle Warendorf',
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  '48231',
  'Warendorf',
  0,
  3,
  0,
  7384,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  408,
  2,
  'Beratungsstelle Wesel',
  'Rechtsrheinischer Teil Kreis Wesel    Städte Dinslaken-Wesel-Hamminkeln-Voerde sowie Gemeinden Schermbeck und Hünxe ',
  '46483',
  'Wesel, Dinslaken',
  0,
  3,
  0,
  7385,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  409,
  0,
  'Caritas Familienberatung Aachen',
  null,
  '52064',
  'Aachen',
  0,
  3,
  0,
  7390,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  410,
  0,
  'Kath. Beratungsstelle Alsdorf',
  null,
  '52477',
  'Alsdorf',
  0,
  3,
  0,
  7391,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  411,
  0,
  'Beratungsstelle für Kinder, Jugendliche und Eltern Düren',
  'Aussensstelle Nideggen, Bahnhofstr. 29, 52385 Nideggen  Tel.: 02427/6095  Fax: 02427/909940 ',
  '52353',
  'Düren, Nideggen',
  0,
  3,
  0,
  7392,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  412,
  0,
  'Beratungsstelle Erkelenz',
  'Erkelenz, Hückelhoven, Wassenberg, Wegberg    Im Rahmen des Wunsch- und Wahlrechtes der Rat Suchenden  der gesamte Kreis Heinsberg',
  '41812',
  'Erkelenz',
  0,
  3,
  0,
  7393,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  413,
  0,
  'Beratungsstelle Geilenkirchen',
  'Geilenkirchen, Übach-Palenberg, Gangelt, Selfkant    Im Rahmen des Wunsch- und Wahlrechtes der Ratsuchenden:  Gesamtgebiet Kreis Heinsberg',
  '52511',
  'Geilenkirchen',
  0,
  3,
  0,
  7394,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  414,
  0,
  'Kath. Beratungsstelle Kempen',
  null,
  '47906',
  'Kempen',
  0,
  3,
  0,
  7395,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  415,
  0,
  'Beratungsstelle für Eltern, Kinder und Jugendliche Monschau',
  'Monschau, Simmerath und Roetgen',
  '52156',
  'Monschau',
  0,
  3,
  0,
  7396,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  416,
  0,
  'Kath. Beratungsstelle Viersen',
  null,
  '41747',
  'Viersen',
  0,
  3,
  0,
  7397,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  417,
  0,
  'Beratungsstelle Krefeld',
  null,
  '47798',
  'Krefeld',
  0,
  3,
  0,
  7398,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  418,
  10,
  'Beratungsstelle Eltern- und Jugendberatung, Altena',
  null,
  '58762',
  'Altena',
  0,
  3,
  0,
  7401,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  419,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Bochum',
  'Caritas-Beratungsstelle für Erziehungs- und Familienfragen',
  '44789',
  'Bochum',
  0,
  3,
  0,
  7402,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  420,
  10,
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '46242',
  'Bottrop',
  0,
  3,
  0,
  7403,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  421,
  10,
  'Beratungsstelle Eltern- und Jugendberatung, Duisburg',
  null,
  '47051',
  'Duisburg',
  0,
  3,
  0,
  7404,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  422,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Essen',
  null,
  '45138',
  'Essen ',
  0,
  3,
  0,
  7406,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  423,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Gelsenkirchen',
  null,
  '45879',
  'Gelsenkirchen',
  0,
  3,
  0,
  7407,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  424,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Gladbeck',
  null,
  '45964',
  'Gladbeck',
  0,
  3,
  0,
  7408,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  425,
  10,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '45470',
  'Mülheim an der Ruhr',
  0,
  3,
  0,
  7409,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  426,
  10,
  'Erziehungsberatung / Familien- und Schulambulanz',
  'Unser Fachteam aus einer Psychologin/Psychotherapeutin sowie DiplomsozialpädagogInnen hilft Ihnen    - wenn Sie in ihrer Erziehungsaufgabe Unterstützung suchen  - wenn Sie sich Sorgen wegen einer auffälligen Entwicklung Ihres Kindes machen  - wenn Sie Schulprobleme Ihres Kindes diagnostisch klären möchten  - wenn Ihr Kind von schwierigen Familiensituationen betroffen ist und Hilfe benötigt  - wenn Sie allgemeine oder spezielle Erziehungsfragen haben    Die in unserem Haus integrierte Familien- und Schulambulanz bietet Ihren Kindern ab dem Schulalter vielfältige Förder- und Therapiemöglichkeiten.  ',
  '46049',
  'Oberhausen',
  0,
  3,
  0,
  7410,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  427,
  25,
  'Kinderschutzdienst Pirmasens',
  'Beratung und Hilfen für Kinder und Jugendliche,  inbesondere bei Problemen wie sexueller Missbrauch, Misshandlung, Vernachlässigung ;  Beratung von Eltern und Fachkräften',
  '66953',
  'Pirmasens',
  0,
  3,
  0,
  7423,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  428,
  14,
  'Onlineberatung für ELTERN UND FAMILIEN des Caritasverbandes für Hamburg e.V.',
  'Herzlich Willkommen in unserer Online-Beratung für ELTERN UND FAMILIEN. Wir bemühen uns, alle Anfragen an Wochentagen innerhalb von 48 Stunden zu beantworten. Anfragen, die am Donnerstag oder später unsere Beratungsstelle erreichen, werden somit unter Umständen erst am Montag beantwortet.    Wir freuen uns immer über Rückmeldungen, positiv wie negativ! Wenn Sie Lust haben von Ihren Erfahrungen mit der Onlineberatung zu berichten, wendet Sie sich bitte an:  Frau Regina Seyer (Leitung der Onlineberatung), Tel. 040 - 280 140 -37 oder per Mail an seyer@caritas-hamburg.de   - DANKE - ',
  '20099',
  'Hamburg',
  0,
  3,
  0,
  7424,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  429,
  26,
  'Lebensberatung Merzig',
  null,
  '66663',
  'Merzig',
  0,
  3,
  0,
  7589,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  430,
  26,
  'Lebensberatung Saarbrücken',
  null,
  '66111',
  'Saarbrücken',
  0,
  3,
  0,
  7590,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  431,
  26,
  'Lebensberatung St. Wendel',
  null,
  '66606',
  'St. Wendel',
  0,
  3,
  0,
  7591,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  432,
  26,
  'Lebensberatung Neunkirchen',
  null,
  '65538',
  'Neunkirchen',
  0,
  3,
  0,
  7592,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  433,
  26,
  'Lebensberatung Saarlouis',
  null,
  '66740',
  'Saarlouis',
  0,
  3,
  0,
  7593,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  434,
  26,
  'Lebensberatung Lebach',
  null,
  '66822',
  'Lebach',
  0,
  3,
  0,
  7594,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  435,
  26,
  'Lebensberatung Betzdorf',
  null,
  '57518',
  'Betzdorf',
  0,
  3,
  0,
  7595,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  436,
  26,
  'Lebensberatung Bad Kreuznach',
  null,
  '55543',
  'Bad Kreuznach',
  0,
  3,
  0,
  7596,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  437,
  26,
  'Lebensberatung Bad Neuenahr-Ahrweiler',
  null,
  '53474',
  'Bad Neuenahr-Ahrweiler',
  0,
  3,
  0,
  7597,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  438,
  26,
  'Lebensberatung Bitburg',
  null,
  '54634',
  'Bitburg',
  0,
  3,
  0,
  7598,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  439,
  26,
  'Lebensberatung Cochem',
  null,
  '56812',
  'Cochem',
  0,
  3,
  0,
  7599,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  440,
  26,
  'Lebensberatung Gerolstein',
  null,
  '54568',
  'Gerolstein',
  0,
  3,
  0,
  7600,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  441,
  26,
  'Lebensberatung Koblenz',
  null,
  '56068',
  'Koblenz',
  0,
  3,
  0,
  7601,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  442,
  26,
  'Lebensberatung Mayen',
  null,
  '56727',
  'Mayen',
  0,
  3,
  0,
  7602,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  443,
  26,
  'Lebensberatung Neuwied',
  null,
  '56564',
  'Neuwied',
  0,
  3,
  0,
  7603,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  444,
  26,
  'Lebensberatung Saarburg',
  null,
  '54439',
  'Saarburg',
  0,
  3,
  0,
  7604,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  445,
  26,
  'Lebensberatung Simmern',
  null,
  '55469',
  'Simmern',
  0,
  3,
  0,
  7605,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  446,
  26,
  'Lebensberatung Trier',
  null,
  '54290',
  'Trier',
  0,
  3,
  0,
  7606,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  447,
  26,
  'Lebensberatung Wittlich',
  null,
  '54516',
  'Wittlich',
  0,
  3,
  0,
  7607,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  448,
  26,
  'Lebensberatung Hermeskeil',
  null,
  '54411',
  'Hermeskeil',
  0,
  3,
  0,
  7608,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  449,
  25,
  'Kinderschutzdienst Speyer/Rheinpfalz-Kreis',
  null,
  '67346',
  'Speyer',
  0,
  3,
  0,
  7617,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  450,
  25,
  'Caritas- Zentrum Germersheim - Kinderschutzdienst',
  null,
  '76726',
  'Germersheim',
  0,
  3,
  0,
  7631,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  451,
  19,
  'Caritas Beratungsstelle für Eltern, Kinder, Jugendliche und Familien, München Hansastrasse 136',
  'Im Rahmen der Onlineberatung werden Erstkontakte (Mo - Do bis 16 Uhr ) innerhalb von 48 Stunden beantwortet; Emails, die in der Woche nach Donnerstag 16 Uhr die Stelle erreichen (also auch Fr, Sa, So) werden bis Montag 16 Uhr beantwortet.  Die Beratungsstelle ist vorrangig zuständig für Ratsuchende aus den Münchner Stadtteilen Sendling, Sendling-Westpark, Groß- und Neuhadern.   Ein Team bestehend aus neun qualifizierten Fachkräften (Diplom-PsychologInnen, Diplom-SozialpädagogInnen und Diplom-PädagogInnen) bietet Beratung für Eltern, Kinder, Jugendliche und Familien sowie weitere Bezugspersonen von Kindern und Jugendlichen an. Auch pädagogische Fachkräfte können sich an die Beratungsstelle wenden.  Ratsuchende mit Fragen hinsichtlich der Entwicklung von Kindern und Jugendlichen, bei Schwierigkeiten in Beziehungen (in der Familie oder im Umfeld), bei Schulproblemen oder bei Fragen im Zusammenhang mit Trennung und Scheidung werden anonym, vertraulich und kostenfrei sowie unabhägig von Konfession oder Weltanschauung beraten.  Darüber hinaus bietet die Stelle Elterngruppen sowie Informationsveranstaltungen für Fachleute an.',
  '81373',
  'München',
  0,
  3,
  0,
  7632,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  452,
  2,
  'Beratungsstelle Lüdinghausen',
  null,
  '59348',
  'Lüdinghausen',
  0,
  3,
  0,
  7668,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  453,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche Offenburg',
  null,
  '77652',
  'Offenburg',
  0,
  3,
  0,
  7670,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  454,
  11,
  'Psychologische Beratungsstellen für Eltern, Kinder und Jugendliche, Überlingen und Friedrichshafen',
  'Die Online-Beratung im Bodenseekreis leisten die Beraterinnen und Berater der beiden Beratungsstellen Überlingen und Friedrichshafen.  Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche  Mühlbachstr. 18  88692 Überlingen  07551/308560  www.psychologischeberatungsstelle-ueberlingen.de  Psychologische Familien- und Lebensberatung  Katharinenstr.16  88045 Friedrichshafen  07541/30000  www.caritas-bodensee-oberschwaben.de',
  null,
  'Überlingen und Friedrichshafen',
  0,
  3,
  0,
  7674,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  455,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung Ludwigshafen',
  null,
  '67063',
  'Ludwigshafen',
  0,
  3,
  0,
  7696,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  456,
  5,
  'Kinder- und Jugendhilfe Günzburg/ Neu-Ulm',
  'Erziehungs- Jugend- und Familienberatung  und Hilfe gegen Sexueller Gewalt',
  '89312',
  'Günzburg',
  0,
  3,
  0,
  7720,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  457,
  5,
  'Erziehungs- und Jugendhilfeverbund, Lindau',
  'Psychologische Beratung für Kinder, Jugendliche und Familien',
  '88131',
  'Lindau',
  0,
  3,
  0,
  7723,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  458,
  5,
  'Psychologische Beratungsstelle für Erziehungs-, Jugend- und Familienberatung, Aichach',
  null,
  '86551',
  'Aichach',
  0,
  3,
  0,
  7724,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  459,
  5,
  'Psychologische Beratungsstelle für Erziehungs-, Jugend- und Familienberatung, Mindelheim',
  null,
  '87719',
  'Mindelheim',
  0,
  3,
  0,
  7725,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  460,
  5,
  'KJF Erziehungs-, Jugend- und Familienberatung, Kaufbeuren',
  'Beratung für Eltern, Kinder, Jugendliche, junge Erwachsene und Familien  Gruppenangebote für Kinder und Eltern, z.B. Müttergruppe, Elternkurs, Trennungs- und Scheidungskindergruppe  Elternabende, Elternbildung  Beratung für Kindergärten und Schulen',
  '87600',
  'Kaufbeuren',
  0,
  3,
  0,
  7726,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  461,
  17,
  'Familienberatungsstelle Delitzsch - Eilenburg - Schkeuditz',
  'Wir beraten und unterstützen:    bei Erziehungsproblemen  - allgemeinen Erziehungsfragen  - in schierigen Entwicklungsphasen (z.B. Trotzalter, Einschulung, Pubertät, Ablösung vom        Elternhaus)  - bei Beziehungskonflikten zwischen Eltern und Kind und in Stief-, Adoptiv- und Pflegefamilien)    bei Trennung und Scheidung  - um für die Kinder weiter erreichbar zu sein und verantwortlich zu handeln  - um die anstehenden Veränderungen gemeinsam vorzubereiten und zu bewältigen    Kinder - und Jugendliche bei  - Schulproblemen  - Verhaltensauffälligkeiten (z.B. Lügen, Stehlen, Einnässen)  - körperlicher Misshandlung, sexuellem Missbrauch  - Ess-Störungen  - Angst, Selbstunsicherheit, Rückzug  - Agression (Selbst- und Fremdschädigung)  - Suizidgefährdung    Beim Umgang mit Lebenskrisen  - Begleitung von Betroffenen und Befähigung zur Bewältigung',
  '04509',
  'Delitzsch',
  0,
  3,
  0,
  7727,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  462,
  10,
  'Ehe-, Familien- und Lebensberatungsstelle Essen',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familiebei Trennung und Scheidungbei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)in Momenten des Alleinseins und der Ausweglosigkeitbei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssenbei sexuellen Problemenbei Sinn- und Glaubensfragen',
  '45127',
  'Essen',
  0,
  3,
  0,
  7751,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  463,
  10,
  'Ehe-, Familien- und Lebensberatung  Bochum',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '44789',
  'Bochum',
  0,
  3,
  0,
  7752,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  464,
  10,
  'Ehe- und Lebensberatungsstelle Gelsenkirchen',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '45879',
  'Gelsenkirchen',
  0,
  3,
  0,
  7753,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  465,
  10,
  'Ehe-, Familien- und Lebensberatungsstelle  Mülheim an der Ruhr, Duisburg und Oberhausen',
  'Wir beraten Sie...  >bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  >bei Trennung und Scheidung  >bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  >in Momenten des Alleinseins und der Ausweglosigkeit  >bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  >bei sexuellen Problemen  >bei Sinn- und Glaubensfragen',
  '45470',
  'Mülheim an der Ruhr',
  0,
  3,
  0,
  7754,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  466,
  10,
  'EFL Beratungsstelle Lüdenscheid',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '58509',
  'Lüdenscheid',
  0,
  3,
  0,
  7755,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  467,
  19,
  'Psychologischer Dienst für Ausländer',
  'Erziehungs- und Familienberatung  Lebensberatung  Sozialpsychiatrische Angebote  Wir beraten nur in folgenden Sprachen: Italienisch, Griechisch,Kroatisch,Spanisch und Russisch',
  '80336',
  'München',
  0,
  3,
  0,
  8209,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  468,
  3,
  'Erziehungs-, Jugend- und Familienberatungsstelle des Caritasverbandes ER/ERH für den Landkreis ERlan',
  null,
  '91074',
  'Herzogenaurach',
  0,
  3,
  0,
  8228,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  469,
  17,
  'Onlineberatung Caritas Familien- und Erziehungsberatung Saalekreis und Halle',
  'Diese Virtuelle Onlineberatungsstelle ist ein Zusammenschluss aus folgenden zwei Beratungsstellen:     Caritas Familien- und Erziehungsberatung Saalekreis, An der Hoffischerei 8, 06217 Merseburg  Caritas Familien- und Erziehungsberatung Halle, Mauerstr. 12, 06110 Halle  ',
  '06110',
  'Halle oder Merseburg',
  1,
  3,
  0,
  11190,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  470,
  25,
  'Caritas Erziehungs-, Ehe und Lebensberatung, Speyer',
  null,
  '67346',
  'Speyer',
  0,
  3,
  0,
  11322,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  471,
  1,
  'Familienberatung Düsseldorf Gerresheim',
  null,
  '40625',
  'Düsseldorf Gerresheim',
  0,
  3,
  0,
  11642,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  472,
  1,
  'Erziehungs- und Familienberatung Düsseldorf Rath',
  null,
  '40472',
  'Düsseldorf Rath',
  0,
  3,
  0,
  11643,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  473,
  1,
  'Erziehungs- und Familienberatung Düsseldorf Wersten',
  null,
  '40589',
  'Düsseldorf Wersten',
  0,
  3,
  0,
  11644,
  '2019-08-22 13:10:30',
  '2019-08-22 13:10:30',
  null
), (
  474,
  1,
  'Katholische Beratungsstelle für Eltern, Kinder und Jugendliche, Köln',
  'Willkommen auf der Homepage der   Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln',
  '50678',
  'Köln',
  0,
  14,
  0,
  11697,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  475,
  1,
  'Beratungsstelle Kerpen ',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Kerpen.',
  '50171',
  'Kerpen',
  0,
  14,
  0,
  11698,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  476,
  1,
  'Familienberatung der CSH, Köln (Mülheim)',
  'Willkommen bei der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln-Mülheim',
  '51063',
  'Köln (Mülheim)',
  0,
  14,
  0,
  11699,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  477,
  1,
  'Internationale Familienberatung, Köln (Internationale Familienberatung)',
  'Willkommen auf der Homepage   der Internationalen Familienberatung  in Köln',
  '50672',
  'Köln (Internationale Familienberatung)',
  0,
  14,
  0,
  11700,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  478,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Porz',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Köln-Porz',
  '51143',
  'Köln (Porz)',
  0,
  14,
  0,
  11701,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  479,
  1,
  'Erziehungs- und Familienberatungsstelle, Düsseldorf',
  null,
  '40210',
  'Düsseldorf Mitte',
  0,
  14,
  0,
  11702,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  480,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Leichlingen',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Leichlingen',
  '42799',
  'Leichlingen',
  0,
  14,
  0,
  11703,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  481,
  1,
  'Beratungsstelle Erftstadt',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Erftstadt-Lechenich',
  '50374',
  'Erftstadt',
  0,
  14,
  0,
  11704,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  482,
  1,
  'Erziehungs- und Familienberatungsstelle im Oberbergischen Kreis',
  'Herzlich willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Wipperfürth, mit Außenstellen in Lindlar und Radevormwald',
  '51688',
  'Wipperfürth',
  0,
  14,
  0,
  11705,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  483,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Neuss',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  in Neuss',
  '41460',
  'Neuss',
  0,
  14,
  0,
  11706,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  484,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Wuppertal',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Wuppertal',
  '42285',
  'Wuppertal',
  0,
  14,
  0,
  11707,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  485,
  1,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Leverkusen',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Leverkusen',
  '51373',
  'Leverkusen',
  0,
  14,
  0,
  11708,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  486,
  1,
  'Erziehungs- und Familienberatungsstelle Grevenbroich',
  'Willkommen auf der Homepage der  Erziehungs- und Familienberatungsstelle  in Grevenbroich',
  '41515',
  'Grevenbroich',
  0,
  14,
  0,
  11709,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  487,
  1,
  'Beratungsstelle für Eltern, Jugendliche und Kinder, Bergisch Gladbach',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder, Jugendliche und junge Erwachsene  in Bergisch Gladbach',
  '51465',
  'Bergisch Gladbach',
  0,
  14,
  0,
  11710,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  488,
  1,
  'Erziehungsberatungsstelle Bonn und Rhein-Sieg-Kreis',
  'Willkommen auf der Homepage der Beratungsstelle für Eltern, Kinder,  Jugendliche und junge Erwachsene  für Bonn und den Rhein-Sieg-Kreis',
  '53113',
  'Bonn',
  0,
  14,
  0,
  11711,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  489,
  1,
  'Erziehungs- und Familienberatungsstelle, Dormagen',
  'Willkommen auf der Homepage der   Erziehungs- und Familienberatungsstelle  in Dormagen',
  '41539',
  'Dormagen',
  0,
  14,
  0,
  11712,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  490,
  1,
  'Die Jugendberatung, SKFM Düsseldorf',
  'Info, Beratung und Therapie für Jugendliche, junge Erwachsene und Bezugsprsonen',
  '40476',
  'Düsseldorf',
  0,
  14,
  0,
  11713,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  491,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Suhl',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '98527',
  'Suhl',
  0,
  14,
  0,
  11714,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  492,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Erfurt',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '99084',
  'Erfurt / Weimar / Jena / Gotha',
  0,
  14,
  0,
  11715,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  493,
  27,
  'Eltern-, Jugendlichen- und Erziehungsberatungsstelle, Bad Neustadt an der Saale',
  null,
  '97616',
  'Bad Neustadt an der Saale',
  0,
  14,
  0,
  11716,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  494,
  27,
  'Erziehungsberatung, Bad Kissingen',
  null,
  '97688',
  'Bad Kissingen',
  0,
  14,
  0,
  11717,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  495,
  11,
  'Erziehungs- und Familienberatungsstelle, Tauberbischofsheim',
  'Wir unterstützen bei Erziehungsfragen, begleiten Familien in Krisen und beraten zum Thema sexuelle Gewalt.  ',
  '97941',
  'Tauberbischofsheim',
  0,
  14,
  0,
  11718,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  496,
  3,
  'Beratungsstelle für Kinder, Jugendliche und Familien, Kronach',
  null,
  '96317',
  'Kronach',
  0,
  14,
  0,
  11719,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  497,
  27,
  'Beratungsstelle für Familien -Kinder, Jugendliche und Eltern-(Erziehungsberatung)',
  null,
  '97437',
  'Haßfurt',
  0,
  14,
  0,
  11722,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  498,
  3,
  'Caritas-Beratungshaus, Beratungsstelle für Kinder, Jugendliche und Eltern, Bamberg',
  null,
  '96047',
  'Bamberg',
  0,
  14,
  0,
  11724,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  499,
  3,
  'Beratungsstelle für Kinder, Jugendliche und Eltern, Lichtenfels',
  null,
  '96215',
  'Lichtenfels',
  0,
  14,
  0,
  11725,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  500,
  22,
  'Erziehungs-, Jugend- und Familienberatung, Deggendorf',
  null,
  '94469',
  'Deggendorf',
  0,
  14,
  0,
  11726,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  501,
  23,
  'Erziehungs- Jugend- und Familienberatungsstelle, Cham',
  null,
  '93413',
  'Cham',
  0,
  14,
  0,
  11733,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  502,
  3,
  'Erziehungs- und Jugendberatungsstelle im Landkreis Nürnberger Land',
  'Gemeinsame Trägerschaft mit dem Diakonischen Werk   Hauptstelle in Lauf   Nebenstelle in Altdorf   Außenstelle in Hersbruck',
  '91207',
  'Lauf',
  0,
  14,
  0,
  11741,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  503,
  3,
  'Erziehungs-, Jugend- u. Familienberatungsstelle f. d. Landkreis Forchheim',
  null,
  '91301',
  'Forchheim',
  0,
  14,
  0,
  11742,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  504,
  3,
  'Erziehungs-, Jugend- und Familienberatungsstelle des Caritasverbandes ER/ERH für den Landkreis ERlan',
  null,
  '91074',
  'Herzogenaurach',
  0,
  14,
  0,
  11745,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  505,
  5,
  'KJF Erziehungs-Jugend- und Familienberatung Dillingen',
  null,
  '89407',
  'Dilllingen',
  0,
  14,
  0,
  11746,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  506,
  3,
  'Caritasverband Nürnberg e.V.   Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche',
  'Beratung und Therapie bei familiären, Erziehungs- und Beziehungsproblemen   Beratung für Mütter und Väter bei Fragen zu Partnerschaft, Trennung und Scheidung   Psychodiagnostik (Tests), auch bei Teilleistungsstörungen (z.B. Legasthenie)   Beratung bei Verhaltensauffälligkeiten, emotionalen Problemen (z.B. Angst), persönlichen Problemen , Entwicklungskrisen und psychosomatischen Problemen   Beratung bei schulischen Problemen und Essstörungen   Beratung bei Schwierigkeiten in der Ausbildung oder am Arbeitsplatz, sowie bei Schwierigkeiten mit Sekten und Problemen der Sinnfindung     Gruppenangebote:   Nürnberger Elterntraining (N.E.T.)  Bindungs- und Entwicklungsberatung (Safety - Geborgen bei mir) für Schwangere und junge Mütter/Eltern mit Säuglingen   Gruppen für Kinder im Kontext von Trennung und Scheidung   Soziale Kompetenzgruppen   Gruppen zur Förderung der Aufmerksamkeit   Gruppen für trauernde Kinder   ...    Die genannten Hilfen sind kostenfrei (Ausnahme: geringer Unkostenbeitrag beim Elterntraining und bei den Trennungs-Scheidungskinder-Gruppen), alle Mitarbeiterinnen und Mitarbeiter der Stelle unterliegen der gesetzlichen Schweigepflicht. Von Seiten der Ratsuchenden werden alle Hilfen freiwillig in Anspruch genommen     Eine Diplom-Psychologin der Stelle verfügt über perfekte Sprachkenntnisse in polnischer und russischer Sprache     Für die Klärung weiterer organisatorischer Fragen steht Ihnen unser Sekretariat (0911-2354241) zur Verfügung     Wir sind für alle Ratsuchenden, die mit minderjährigen Kindern und Jugendlichen zu tun haben offen, also für Eltern/Alleinerziehende, Erzieherinnen und Lehrkräfte und natürlich für die Kinder, Jugendlichen und jungen Erwachsenen selbst.     Bei der Online-Beratung müssen Sie natürlich nicht Ihre persönlichen Daten preisgeben, sondern können z.B. ein Pseudonym bzw. einen Nickname verwenden.  Zum Schutz der Mitarbeiterinnen und Mitarbeiter unserer Einrichtung arbeiten diese  mit den Pseudonymen Berater 1 bis Beraterin 6.  Bitte beachten Sie, dass Beraterin 5 prinzipiell nur freitags zur Verfügung steht, sowie Beraterin 2 von Montag bis einschließlich Donnerstag erreichbar ist. Beraterin 4 ist von Mittwoch bis Freitag ansprechbar.    Unsere Öffnungszeiten sind Montag bis Donnerstag von 9.00 - 12.00 und 14.00 - 16.00 Uhr sowie Freitag von 9.00 - 12.00.    Klienten aus Nürnberg können darüberhinaus bei Bedarf den Krisendienst Mittelfranken unter der zentralen Telefon-Nr. 0911 / 42 48 550 oder über das Internet www.krisendienst-mittelfranken.de erreichen.',
  '90403',
  'Nürnberg',
  0,
  14,
  0,
  11747,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  507,
  24,
  'Psychologische Familien- und Lebensberatung',
  null,
  '88400',
  'Biberach',
  0,
  14,
  0,
  11751,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  508,
  11,
  'Psychologische Beratungsstellen für Eltern, Kinder und Jugendliche, Überlingen und Friedrichshafen',
  'Die Online-Beratung im Bodenseekreis leisten die Beraterinnen und Berater der beiden Beratungsstellen Überlingen und Friedrichshafen.  Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche  Mühlbachstr. 18  88692 Überlingen  07551/308560  www.psychologischeberatungsstelle-ueberlingen.de  Psychologische Familien- und Lebensberatung  Katharinenstr.16  88045 Friedrichshafen  07541/30000  www.caritas-bodensee-oberschwaben.de',
  null,
  'Überlingen und Friedrichshafen',
  0,
  14,
  0,
  11753,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  509,
  24,
  'Psychologische Familien- und Lebensberatung im Landkreis Ravensburg',
  'Die OnlineBeratung im Landkreis Ravensburg leisten die Beraterinnen und Berater der drei Beratungsstellen in Ravensburg (zuständig für den Sozialraum Weingarten), in Leutkirch und in Bad Waldsee.    Psychologische Familen- und Lebensberatung  Erziehungs- und Familienberatung: Allmandstr. 10, 88212 Ravensburg, Tel. 0751-3590150  Beratung für Ehe-, Familien- und Lebensfragen, Allmandstr. 10, 88212 Ravensburg, Tel. 0751-32479  www.caritas-bodensee-oberschwaben.de    Psychologische Familen- und Lebensberatung  Marienplatz 11, 88299 Leutkirch  Tel. 07561-90660  www.caritas-bodensee-oberschwaben.de    Psychologische Familen- und Lebensberatung  Robert-Koch-Str. 52, 88339 Bad Waldsee  Tel. 07524-4011680  www.caritas-bodensee-oberschwaben.de',
  null,
  'Landkreis Ravensburg',
  0,
  14,
  0,
  11755,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  510,
  25,
  'Caritas Erziehungs-, Ehe und Lebensberatung, Speyer',
  null,
  '67346',
  'Speyer',
  0,
  14,
  0,
  11756,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  511,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Grafing',
  null,
  '85560',
  'Grafing',
  0,
  14,
  0,
  11765,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  512,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Freising',
  null,
  '85354',
  'Freising',
  0,
  14,
  0,
  11768,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  513,
  19,
  'Jugend- und Elternberatung, Dachau',
  null,
  '85221',
  'Dachau',
  0,
  14,
  0,
  11769,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  514,
  19,
  'Jugend- und Elternberatung, Erziehungsberatungsstelle, Pfaffenhofen',
  null,
  '85276',
  'Pfaffenhofen',
  0,
  14,
  0,
  11770,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  515,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Mühldorf',
  '- Beratung von Eltern und Familien zu Fragen der Erziehung, des familiären Zusammenlebens und der kindlichen Entwicklung  - Beratung für Jugendliche und junge Erwachsene mit Problemen in der Familie, im Freundeskreis, in der Schule, am Arbeitsplatz oder mit persönlichen Schwierigkeiten  -Psychologische Diagnostik  - verschiedene Gruppenangebote: Kinder im Blick (für Eltern in Trennung);  Kinderscheidungsgruppe, Gruppe für Kinder von psychisch belasteten oder suchtkranken Eltern, Gruppe für Eltern von pubertierenden Jugendlichen,u.a.  - Beratung bei Trennung/Scheidung  - Familienmediation  - Elternkurse  - Beratung pädagogischer Fachkräfte  - präventive Angebote an Schulen, Kindergärten  - Begleiteter Umgang mit Samstagstreff  - Legasthenietherapie  - angegliedert: Sozialpädagogische Familienhilfe; Jugendsozialarbeit an Schulen  - Projekt Elterntalk',
  '84453',
  'Mühldorf',
  0,
  14,
  0,
  11779,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  516,
  19,
  'Ökumenische Beratungsstelle für Eltern, Kinder und Jugendliche, Bad Tölz-Wolfratshausen',
  'Neben der Beratungsstelle in Bad Tölz gibt es die Aussenstelle in 85253 Geretsried, Steiner Ring 159',
  '83646',
  'Bad Tölz',
  0,
  14,
  0,
  11784,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  517,
  19,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Bad Reichenhall',
  null,
  '83435',
  'Bad Reichenhall',
  0,
  14,
  0,
  11786,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  518,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Traunstein',
  null,
  '83278',
  'Traunstein',
  0,
  14,
  0,
  11790,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  519,
  19,
  'Caritas Beratungsstelle für Eltern, Kinder, Jugendliche und Familien Garmisch-Partenkirchen',
  'Beratungsstelle für Eltern, Kinder, Jugendliche und Familien für den Landkreis Garmisch-Partenkirchen',
  '82467',
  'Garmisch-Partenkirchen',
  0,
  14,
  0,
  11794,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  520,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Landkreis Fürstenfeldbruck',
  null,
  '82256',
  'Fürstenfeldbruck',
  0,
  14,
  0,
  11797,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  521,
  5,
  'KJF Erziehungs-, Jugend- und Familienberatung Weilheim-Schongau',
  null,
  '82362',
  'Weilheim',
  0,
  14,
  0,
  11798,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  522,
  19,
  'Erziehungs-, Jugend- und Familienberatungsstelle Ramersdorf / Perlach in München',
  null,
  '81737',
  'München',
  0,
  14,
  0,
  11801,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  523,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Taufkirchen',
  'Der schnelle und sichere Weg......  ...... zur Beratung und HIlfe  ...... für Kinder, Jugendliche und Erwachsene     Hilfe auf den ersten Klick ',
  '82024',
  'Taufkirchen',
  0,
  14,
  0,
  11802,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  524,
  19,
  'Beratungsstelle für Eltern, Kinder, Jugendliche und Familien,München Königswieser Straße 12',
  'Beratung bezüglich der Entwicklung und Erziehung von Kindern und Jugendlichen  Beratung/Therapie für Eltern, Familien, Jugendliche und junge Erwachsene  Beratung zu Partnerschaft, Trennung und Scheidung für Eltern  Psychodiagnostik  Schuleignungsdiagnostik  Beratung für pädagogische Fachkräfte  Informationsveranstaltungen für Eltern und Fachkräfte',
  '81475',
  'München',
  0,
  14,
  0,
  11804,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  525,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Titisee-Neustadt',
  null,
  '79822',
  'Titisee-Neustadt',
  0,
  14,
  0,
  11805,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  526,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Freiburg',
  null,
  '79111',
  'Freiburg',
  0,
  14,
  0,
  11806,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  527,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Haslach',
  null,
  '77716',
  'Haslach',
  0,
  14,
  0,
  11809,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  528,
  25,
  'Caritas Erziehungs- Ehe- und Lebensberatung, Germersheim',
  null,
  '76726',
  'Germersheim',
  0,
  14,
  0,
  11810,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  529,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung Landau',
  'Beratung für Kinder und Jugendliche, Eltern und Familien  ',
  '76829',
  'Landau',
  0,
  14,
  0,
  11811,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  530,
  24,
  'Psychologische Familien- und Lebensberatung',
  null,
  '71332',
  'Waiblingen',
  0,
  14,
  0,
  11819,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  531,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Wiesloch',
  '  ',
  '68168',
  'Wiesloch',
  0,
  14,
  0,
  11820,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  532,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Schwetzingen',
  null,
  '68723',
  'Schwetzingen',
  0,
  14,
  0,
  11821,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  533,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Mannheim',
  null,
  '68159',
  'Mannheim',
  0,
  14,
  0,
  11823,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  534,
  25,
  'Caritas Erziehungs-, Ehe und Lebensberatung, Pirmasens',
  'Hilfe und Rat für Jugendliche, Eltern und Kinder: Familiäre Spannungen, emotionale Probleme von Jugendlichen, Schul- und Leistungsschwierigkeiten, Verhaltensauffälligkeiten von Kindern, Fragen bei Trennung und Scheidung, Erziehungsunsicherheit und Durchsetzungschwierigkeiten bei Eltern, Beratung auch von Fachkräften',
  '66953',
  'Pirmasens',
  0,
  14,
  0,
  11824,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  535,
  26,
  'Lebensberatung Betzdorf',
  null,
  '57518',
  'Betzdorf',
  0,
  14,
  0,
  11825,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  536,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung St.Ingbert',
  null,
  '66386',
  'St. Ingbert',
  0,
  14,
  0,
  11826,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  537,
  27,
  'Psychologische Beratungsstelle für Kinder, Jugendliche und Eltern, Miltenberg',
  null,
  '63897',
  'Miltenberg',
  0,
  14,
  0,
  11832,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  538,
  27,
  'Beratungsstelle für Kinder, Jugendliche und Eltern im Landkreis Aschaffenburg',
  null,
  '63739',
  'Aschaffenburg',
  0,
  14,
  0,
  11833,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  539,
  27,
  'Beratungsstelle für Kinder, Jugendliche und Eltern, Aschaffenburg',
  null,
  '63739',
  'Aschaffenburg',
  0,
  14,
  0,
  11834,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  540,
  16,
  'Eltern- und Jugendberatung Stadtmitte Frankfurt am Main',
  null,
  '60311',
  'Frankfurt am Main',
  0,
  14,
  0,
  11840,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  541,
  21,
  'Familien- und Erziehungsberatungsstelle Arnsberg ',
  null,
  '59821',
  'Arnsberg',
  0,
  14,
  0,
  11841,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  542,
  2,
  'Beratungsstelle Wesel',
  'Rechtsrheinischer Teil Kreis Wesel    Städte Dinslaken-Wesel-Hamminkeln-Voerde sowie Gemeinden Schermbeck und Hünxe ',
  '46483',
  'Wesel, Dinslaken',
  0,
  14,
  0,
  11845,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  543,
  2,
  'Beratungsstelle Warendorf',
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  '48231',
  'Warendorf',
  0,
  14,
  0,
  11847,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  544,
  10,
  'Beratungsstelle Eltern- und Jugendberatung, Altena',
  null,
  '58762',
  'Altena',
  0,
  14,
  0,
  11851,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  545,
  21,
  'Caritas-AufWind Olpe',
  ' Kath. Jugend- und Familiendienst',
  '57462',
  'Olpe',
  0,
  14,
  0,
  11853,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  546,
  21,
  'AufWind - Kath. Jugend- und Familiendienst, Attendorn',
  null,
  '57439',
  'Attendorn',
  0,
  14,
  0,
  11854,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  547,
  26,
  'Lebensberatung Trier',
  null,
  '54290',
  'Trier',
  0,
  14,
  0,
  11858,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  548,
  26,
  'Lebensberatung Wittlich',
  null,
  '54516',
  'Wittlich',
  0,
  14,
  0,
  11859,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  549,
  26,
  'Lebensberatung Bad Kreuznach',
  null,
  '55543',
  'Bad Kreuznach',
  0,
  14,
  0,
  11861,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  550,
  26,
  'Lebensberatung Hermeskeil',
  null,
  '54411',
  'Hermeskeil',
  0,
  14,
  0,
  11863,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  551,
  26,
  'Lebensberatung Simmern',
  null,
  '55469',
  'Simmern',
  0,
  14,
  0,
  11864,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  552,
  26,
  'Lebensberatung Neuwied',
  null,
  '56564',
  'Neuwied',
  0,
  14,
  0,
  11865,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  553,
  26,
  'Lebensberatung Saarburg',
  null,
  '54439',
  'Saarburg',
  0,
  14,
  0,
  11866,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  554,
  26,
  'Lebensberatung Mayen',
  null,
  '56727',
  'Mayen',
  0,
  14,
  0,
  11867,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  555,
  26,
  'Lebensberatung Gerolstein',
  null,
  '54568',
  'Gerolstein',
  0,
  14,
  0,
  11868,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  556,
  26,
  'Lebensberatung Koblenz',
  null,
  '56068',
  'Koblenz',
  0,
  14,
  0,
  11869,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  557,
  0,
  'Caritas Familienberatung Aachen',
  null,
  '52064',
  'Aachen',
  0,
  14,
  0,
  11870,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  558,
  0,
  'Kath. Beratungsstelle Alsdorf',
  null,
  '52477',
  'Alsdorf',
  0,
  14,
  0,
  11871,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  559,
  26,
  'Lebensberatung Cochem',
  null,
  '56812',
  'Cochem',
  0,
  14,
  0,
  11872,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  560,
  0,
  'Beratungsstelle für Kinder, Jugendliche und Eltern Düren',
  'Aussensstelle Nideggen, Bahnhofstr. 29, 52385 Nideggen  Tel.: 02427/6095  Fax: 02427/909940 ',
  '52353',
  'Düren, Nideggen',
  0,
  14,
  0,
  11873,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  561,
  0,
  'Beratungsstelle Krefeld',
  null,
  '47798',
  'Krefeld',
  0,
  14,
  0,
  11877,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  562,
  2,
  'Beratungsstelle Rheine, Neuenkirchen, Wettringen',
  null,
  '48429',
  'Rheine',
  0,
  14,
  0,
  11880,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  563,
  2,
  'Beratungsstelle Münster',
  'Sie erreichen uns in den fünf     Caritas vor Ort-Beratungsstellen     im Stadtgebiet von Münster:     Mitte   -   Coerde   -   Gievenbeck   -   Hiltrup   -   Kinderhaus.     Die Adressen und Telefonnummern entnehmen Sie bitte unserer Homepage (s.u.).',
  null,
  'Münster',
  0,
  14,
  0,
  11881,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  564,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Coesfeld',
  null,
  '48653',
  'Coesfeld',
  0,
  14,
  0,
  11885,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  565,
  2,
  'Beratungsstelle Marl, Haltern',
  null,
  '45768',
  'Marl',
  0,
  14,
  0,
  11886,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  566,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Dülmen',
  null,
  '48249',
  'Dülmen',
  0,
  14,
  0,
  11887,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  567,
  2,
  'Beratungsstelle Moers-Xanten',
  null,
  '47495',
  'Rheinberg',
  0,
  14,
  0,
  11888,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  568,
  2,
  'Beratungsstelle für Eltern, Jugendliche und Kinder in Ibbenbüren',
  null,
  '49477',
  'Ibbenbüren',
  0,
  14,
  0,
  11889,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  569,
  2,
  'Beratungsstelle für Kinder, Jugendliche und Familien',
  'Nordkreis Kleve  Einzugsbereiche:  Kleve, Emmerich am Rhein, Goch, Bedburg-Hau, Kalkar, Kranenburg, Rees, Uedem ',
  '47533',
  'Kleve',
  0,
  14,
  0,
  11890,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  570,
  0,
  'Beratungsstelle Geilenkirchen',
  'Geilenkirchen, Übach-Palenberg, Gangelt, Selfkant    Im Rahmen des Wunsch- und Wahlrechtes der Ratsuchenden:  Gesamtgebiet Kreis Heinsberg',
  '52511',
  'Geilenkirchen',
  0,
  14,
  0,
  11891,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  571,
  0,
  'Beratungsstelle Erkelenz',
  'Erkelenz, Hückelhoven, Wassenberg, Wegberg    Im Rahmen des Wunsch- und Wahlrechtes der Rat Suchenden  der gesamte Kreis Heinsberg',
  '41812',
  'Erkelenz',
  0,
  14,
  0,
  11892,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  572,
  2,
  'Beratungsstelle Geldern',
  null,
  '47608',
  'Geldern',
  0,
  14,
  0,
  11893,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  573,
  2,
  'Beratungsstelle Emsdetten, Greven, Saerbeck',
  'Emsdetten:    Bachstr. 15  48282 Emsdetten  Telefon: 02572/157 39  Fax.: 02572/157 49     Greven:    Kirchstr. 5  48268 Greven  Telefon: 02571/800 90  Fax.: 02571/800 922 ',
  null,
  'Emsdetten und Greven',
  0,
  14,
  0,
  11894,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  574,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche Dorsten',
  null,
  '46284',
  'Dorsten',
  0,
  14,
  0,
  11895,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  575,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Bochum',
  'Caritas-Beratungsstelle für Erziehungs- und Familienfragen',
  '44789',
  'Bochum',
  0,
  14,
  0,
  11896,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  576,
  10,
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '46242',
  'Bottrop',
  0,
  14,
  0,
  11897,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  577,
  2,
  'Beratungsstelle Borken',
  null,
  '46325',
  'Borken',
  0,
  14,
  0,
  11898,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  578,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Essen',
  null,
  '45138',
  'Essen ',
  0,
  14,
  0,
  11899,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  579,
  10,
  'Beratungsstelle Eltern- und Jugendberatung, Duisburg',
  null,
  '47051',
  'Duisburg',
  0,
  14,
  0,
  11900,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  580,
  2,
  'Beratungsstelle Bocholt, Rhede, Isselburg',
  'Die Beratungsstelle ist Ansprechpartner für Eltern bei Erziehungs- und Entwicklungsfragen sowie für Fragen von Kindern, Jugendlichen und jungen Erwachsenen.  Eltern, Bezugspersonen, (pädagogische) Fachkräfte sowie Kinder und Jugendliche selbst sind uns herzlich willkommen.    Was tun, ...  wenn mein Kind keine Freunde findet?  ... wenn ich unsicher bin, ob mein Kind altersgemäß entwickelt ist?  ... wenn mein Kind viele Ängste zeigt?  ... wenn mein Kind sich nichts mehr sagen lässt?  ... wenn man unsicher ist, ob ein Kind die Trennung der Eltern verkraftet?    Auch Kinder, Jugendliche und junge Erwachsene haben manchmal Fragen oder Probleme, die sie mit jemand außerhalb der Familie besprechen wollen. Daher könnt ihr Euch - auf Wunsch auch ohne Eure Eltern - bei uns beraten lassen.    Ebenso beraten und coachen wir pädagogische Fachkräfte aus Kitas, Familienzentren, Schulen und anderen Einrichtungen, die Kinder und Jugendliche betreuen.    Wir bieten an, gemeinsam Lösungen zu entwickeln.  Die psychologischen und pädagogischen Fachkräfte unserer Beratungsstelle unterstützen Sie/Dich gerne, um Antworten und Lösungen für solche und andere Fragen   zu finden.    Der erste Kontakt erfolgt durch eine telefonische oder persönliche Anmeldung im Sekretariat der Beratungsstelle.  Innerhalb von 14 Tagen nach der Anmeldung gibt es einen Erstberatungstermin.    Unsere Hilfen sind für Ratsuchende kostenfrei.   Alle Gesprächsinhalte sind streng vertraulich und unterliegen der Schweigepflicht.    Termine finden nach Absprache in den Räumen der Beratungsstelle oder bei Bedarf außer Haus statt.    Wir freuen uns auf Ihren/Deinen Anruf oder Besuch!    Sprechzeiten: Mo.-Fr. 08:00 - 12:30, Mo.-Do. 14:00 -17:00 Uhr, sowie nach Vereinbarung  ',
  '46399',
  'Bocholt',
  0,
  14,
  0,
  11901,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  581,
  2,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Ahlen',
  null,
  '59229',
  'Ahlen',
  0,
  14,
  0,
  11902,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  582,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Gelsenkirchen',
  null,
  '45879',
  'Gelsenkirchen',
  0,
  14,
  0,
  11903,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  583,
  10,
  'Beratungsstelle Eltern- und Jugendberatung Gladbeck',
  null,
  '45964',
  'Gladbeck',
  0,
  14,
  0,
  11904,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  584,
  10,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '45470',
  'Mülheim an der Ruhr',
  0,
  14,
  0,
  11905,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  585,
  10,
  'Erziehungsberatung / Familien- und Schulambulanz',
  'Unser Fachteam aus einer Psychologin/Psychotherapeutin sowie DiplomsozialpädagogInnen hilft Ihnen    - wenn Sie in ihrer Erziehungsaufgabe Unterstützung suchen  - wenn Sie sich Sorgen wegen einer auffälligen Entwicklung Ihres Kindes machen  - wenn Sie Schulprobleme Ihres Kindes diagnostisch klären möchten  - wenn Ihr Kind von schwierigen Familiensituationen betroffen ist und Hilfe benötigt  - wenn Sie allgemeine oder spezielle Erziehungsfragen haben    Die in unserem Haus integrierte Familien- und Schulambulanz bietet Ihren Kindern ab dem Schulalter vielfältige Förder- und Therapiemöglichkeiten.  ',
  '46049',
  'Oberhausen',
  0,
  14,
  0,
  11906,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  586,
  2,
  'Beratungsstelle Ahaus, Gronau, Heek, Legden, Schöppingen, Stadtlohn, Südlohn, Vreden',
  null,
  '48683',
  'Ahaus',
  0,
  14,
  0,
  11907,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  587,
  0,
  'Kath. Beratungsstelle Viersen',
  null,
  '41747',
  'Viersen',
  0,
  14,
  0,
  11909,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  588,
  0,
  'Kath. Beratungsstelle Kempen',
  null,
  '47906',
  'Kempen',
  0,
  14,
  0,
  11910,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  589,
  0,
  'Beratungsstelle für Eltern, Kinder und Jugendliche Monschau',
  'Monschau, Simmerath und Roetgen',
  '52156',
  'Monschau',
  0,
  14,
  0,
  11911,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  590,
  9,
  'Erziehungs-, Ehe-, Familien- und Lebensberatung Leinefelde',
  'Wir beraten Kinder, Jugendliche, Eltern, Familien, Paare und Alleinstehende.',
  '37327',
  'Leinefelde / Heiligenstadt',
  0,
  14,
  0,
  11912,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  591,
  15,
  'Erziehungsberatungsstelle Duderstadt ',
  'Angebot  der Beratung für Eltern, Kinder und Jugendliche aus den Gemeinden Duderstadt, Gieboldehausen, Bovenden, Gleichen und Radolfshausen',
  '37115',
  'Duderstadt',
  0,
  14,
  0,
  11915,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  592,
  15,
  'Jugend-, Erziehungs- und Familienberatung Hildesheim',
  null,
  '31134',
  'Hildesheim',
  0,
  14,
  0,
  11919,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  593,
  14,
  'Onlineberatung für JUGENDLICHE UND JUNGE ERWACHSENE (ohne Kinder) des Caritasverbandes für Hamburg e',
  'Herzlich Willkommen in der Online-Beratung für JUGENDLICHE UND JUNGE ERWACHSENE von 14 bis 27 Jahren. Wir bemühen uns, alle Anfragen an Wochentagen innerhalb von 48 Stunden zu beantworten. Anfragen, die am Donnerstag oder später unsere Beratungsstelle erreichen, werden somit unter Umständen erst am Montag beantwortet.    Wir freuen uns immer über Rückmeldungen, positiv wie negativ! Wenn Ihr Lust habt von Euren Erfahrungen mit der Onlineberatung zu berichten, wendet Euch bitte an:  Frau Regina Seyer (Leitung der Onlineberatung), Tel. 040 - 280 140 - 600 oder per Mail an seyer@caritas-hamburg.de   - DANKE - ',
  '20099',
  'Hamburg',
  0,
  14,
  0,
  11920,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  594,
  14,
  'Onlineberatung für ELTERN UND FAMILIEN des Caritasverbandes für Hamburg e.V.',
  'Herzlich Willkommen in unserer Online-Beratung für ELTERN UND FAMILIEN. Wir bemühen uns, alle Anfragen an Wochentagen innerhalb von 48 Stunden zu beantworten. Anfragen, die am Donnerstag oder später unsere Beratungsstelle erreichen, werden somit unter Umständen erst am Montag beantwortet.    Wir freuen uns immer über Rückmeldungen, positiv wie negativ! Wenn Sie Lust haben von Ihren Erfahrungen mit der Onlineberatung zu berichten, wendet Sie sich bitte an:  Frau Regina Seyer (Leitung der Onlineberatung), Tel. 040 - 280 140 -37 oder per Mail an seyer@caritas-hamburg.de   - DANKE - ',
  '20099',
  'Hamburg',
  0,
  14,
  0,
  11936,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  595,
  21,
  'Erziehungsberatung Werl',
  null,
  '59457',
  'Werl',
  0,
  14,
  0,
  11937,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  596,
  21,
  'Beratungsstelle für Eltern, Kinder & Jugendliche Schloss Neuhaus',
  null,
  '33104',
  'Paderborn - Schloß Neuhaus - Büren',
  0,
  14,
  0,
  11938,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  597,
  21,
  'Caritas- Aufwind Lennestadt und Kirchhundem',
  ' Kath. Jugend- und Familiendienst',
  '57368',
  'Lennestadt-Altenhundem',
  0,
  14,
  0,
  11939,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  598,
  21,
  'Beratungsstelle für Eltern, Jugendliche und Kinder',
  null,
  '44534',
  'Lünen',
  0,
  14,
  0,
  11940,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  599,
  21,
  'Erziehungsberatung Hamm',
  null,
  '59067',
  'Hamm',
  0,
  14,
  0,
  11941,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  600,
  21,
  'Erziehungsberatung Brakel',
  null,
  '33034',
  'Brakel/Höxter (Kreis)',
  0,
  14,
  0,
  11942,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  601,
  21,
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '33378',
  'Rheda Wiedenbrück, Gütersloh (Stadt u. Kreis)',
  0,
  14,
  0,
  11943,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  602,
  21,
  'Erziehungsberatung Sundern',
  null,
  '59846',
  'Sundern',
  0,
  14,
  0,
  11944,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  603,
  21,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Castrop-Rauxel, Diözese Paderborn',
  null,
  '44575',
  'Castrop-Rauxel',
  0,
  14,
  0,
  11945,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  604,
  21,
  'Erziehungsberatung Dortmund',
  null,
  '44147',
  'Dortmund',
  0,
  14,
  0,
  11946,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  605,
  25,
  'Kinderschutzdienst Pirmasens',
  'Beratung und Hilfen für Kinder und Jugendliche,  inbesondere bei Problemen wie sexueller Missbrauch, Misshandlung, Vernachlässigung ;  Beratung von Eltern und Fachkräften',
  '66953',
  'Pirmasens',
  0,
  14,
  0,
  11947,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  606,
  26,
  'Lebensberatung Bitburg',
  null,
  '54634',
  'Bitburg',
  0,
  14,
  0,
  11950,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  607,
  26,
  'Lebensberatung Bad Neuenahr-Ahrweiler',
  null,
  '53474',
  'Bad Neuenahr-Ahrweiler',
  0,
  14,
  0,
  11951,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  608,
  26,
  'Lebensberatung Merzig',
  null,
  '66663',
  'Merzig',
  0,
  14,
  0,
  11952,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  609,
  26,
  'Lebensberatung Saarbrücken',
  null,
  '66111',
  'Saarbrücken',
  0,
  14,
  0,
  11953,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  610,
  26,
  'Lebensberatung St. Wendel',
  null,
  '66606',
  'St. Wendel',
  0,
  14,
  0,
  11954,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  611,
  26,
  'Lebensberatung Neunkirchen',
  null,
  '65538',
  'Neunkirchen',
  0,
  14,
  0,
  11955,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  612,
  26,
  'Lebensberatung Saarlouis',
  null,
  '66740',
  'Saarlouis',
  0,
  14,
  0,
  11956,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  613,
  26,
  'Lebensberatung Lebach',
  null,
  '66822',
  'Lebach',
  0,
  14,
  0,
  11957,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  614,
  25,
  'Kinderschutzdienst Speyer/Rheinpfalz-Kreis',
  null,
  '67346',
  'Speyer',
  0,
  14,
  0,
  11959,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  615,
  21,
  'Erziehungsberatung Menden/Iserlohn',
  null,
  '58706',
  'Iserlohn/Menden',
  0,
  14,
  0,
  11961,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  616,
  21,
  'Beratungsstelle für Eltern, Kinder und Jugendliche, Meschede/Schmallenberg',
  'mit Außenstelle in Schmallenberg, Oststraße 42, 57392 Schmallenberg, Telefon: 02972 2288, E-Mail: eb-schmallenberg@caritas-meschede.de ',
  '59872',
  'Meschede',
  0,
  14,
  0,
  11962,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  617,
  25,
  'Caritas- Zentrum Germersheim - Kinderschutzdienst',
  null,
  '76726',
  'Germersheim',
  0,
  14,
  0,
  11964,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  618,
  19,
  'Caritas Beratungsstelle für Eltern, Kinder, Jugendliche und Familien, München Hansastrasse 136',
  'Im Rahmen der Onlineberatung werden Erstkontakte (Mo - Do bis 16 Uhr ) innerhalb von 48 Stunden beantwortet; Emails, die in der Woche nach Donnerstag 16 Uhr die Stelle erreichen (also auch Fr, Sa, So) werden bis Montag 16 Uhr beantwortet.  Die Beratungsstelle ist vorrangig zuständig für Ratsuchende aus den Münchner Stadtteilen Sendling, Sendling-Westpark, Groß- und Neuhadern.   Ein Team bestehend aus neun qualifizierten Fachkräften (Diplom-PsychologInnen, Diplom-SozialpädagogInnen und Diplom-PädagogInnen) bietet Beratung für Eltern, Kinder, Jugendliche und Familien sowie weitere Bezugspersonen von Kindern und Jugendlichen an. Auch pädagogische Fachkräfte können sich an die Beratungsstelle wenden.  Ratsuchende mit Fragen hinsichtlich der Entwicklung von Kindern und Jugendlichen, bei Schwierigkeiten in Beziehungen (in der Familie oder im Umfeld), bei Schulproblemen oder bei Fragen im Zusammenhang mit Trennung und Scheidung werden anonym, vertraulich und kostenfrei sowie unabhägig von Konfession oder Weltanschauung beraten.  Darüber hinaus bietet die Stelle Elterngruppen sowie Informationsveranstaltungen für Fachleute an.',
  '81373',
  'München',
  0,
  14,
  0,
  11965,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  619,
  2,
  'Beratungsstelle Lüdinghausen',
  null,
  '59348',
  'Lüdinghausen',
  0,
  14,
  0,
  11966,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  620,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche Offenburg',
  null,
  '77652',
  'Offenburg',
  0,
  14,
  0,
  11967,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  621,
  25,
  'Caritas Erziehungs-, Ehe- und Lebensberatung Ludwigshafen',
  null,
  '67063',
  'Ludwigshafen',
  0,
  14,
  0,
  11970,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  622,
  5,
  'Kinder- und Jugendhilfe Günzburg/ Neu-Ulm',
  'Erziehungs- Jugend- und Familienberatung  und Hilfe gegen Sexueller Gewalt',
  '89312',
  'Günzburg',
  0,
  14,
  0,
  11976,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  623,
  5,
  'Erziehungs- und Jugendhilfeverbund, Lindau',
  'Psychologische Beratung für Kinder, Jugendliche und Familien',
  '88131',
  'Lindau',
  0,
  14,
  0,
  11977,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  624,
  5,
  'Psychologische Beratungsstelle für Erziehungs-, Jugend- und Familienberatung, Aichach',
  null,
  '86551',
  'Aichach',
  0,
  14,
  0,
  11978,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  625,
  5,
  'Psychologische Beratungsstelle für Erziehungs-, Jugend- und Familienberatung, Mindelheim',
  null,
  '87719',
  'Mindelheim',
  0,
  14,
  0,
  11979,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  626,
  5,
  'KJF Erziehungs-, Jugend- und Familienberatung, Kaufbeuren',
  'Beratung für Eltern, Kinder, Jugendliche, junge Erwachsene und Familien  Gruppenangebote für Kinder und Eltern, z.B. Müttergruppe, Elternkurs, Trennungs- und Scheidungskindergruppe  Elternabende, Elternbildung  Beratung für Kindergärten und Schulen',
  '87600',
  'Kaufbeuren',
  0,
  14,
  0,
  11980,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  627,
  17,
  'Familienberatungsstelle Delitzsch - Eilenburg - Schkeuditz',
  'Wir beraten und unterstützen:    bei Erziehungsproblemen  - allgemeinen Erziehungsfragen  - in schierigen Entwicklungsphasen (z.B. Trotzalter, Einschulung, Pubertät, Ablösung vom        Elternhaus)  - bei Beziehungskonflikten zwischen Eltern und Kind und in Stief-, Adoptiv- und Pflegefamilien)    bei Trennung und Scheidung  - um für die Kinder weiter erreichbar zu sein und verantwortlich zu handeln  - um die anstehenden Veränderungen gemeinsam vorzubereiten und zu bewältigen    Kinder - und Jugendliche bei  - Schulproblemen  - Verhaltensauffälligkeiten (z.B. Lügen, Stehlen, Einnässen)  - körperlicher Misshandlung, sexuellem Missbrauch  - Ess-Störungen  - Angst, Selbstunsicherheit, Rückzug  - Agression (Selbst- und Fremdschädigung)  - Suizidgefährdung    Beim Umgang mit Lebenskrisen  - Begleitung von Betroffenen und Befähigung zur Bewältigung',
  '04509',
  'Delitzsch',
  0,
  14,
  0,
  11981,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  628,
  10,
  'Ehe-, Familien- und Lebensberatungsstelle Essen',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familiebei Trennung und Scheidungbei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)in Momenten des Alleinseins und der Ausweglosigkeitbei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssenbei sexuellen Problemenbei Sinn- und Glaubensfragen',
  '45127',
  'Essen',
  0,
  14,
  0,
  11984,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  629,
  10,
  'Ehe-, Familien- und Lebensberatung  Bochum',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '44789',
  'Bochum',
  0,
  14,
  0,
  11985,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  630,
  10,
  'Ehe- und Lebensberatungsstelle Gelsenkirchen',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '45879',
  'Gelsenkirchen',
  0,
  14,
  0,
  11986,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  631,
  10,
  'Ehe-, Familien- und Lebensberatungsstelle  Mülheim an der Ruhr, Duisburg und Oberhausen',
  'Wir beraten Sie...  >bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  >bei Trennung und Scheidung  >bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  >in Momenten des Alleinseins und der Ausweglosigkeit  >bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  >bei sexuellen Problemen  >bei Sinn- und Glaubensfragen',
  '45470',
  'Mülheim an der Ruhr',
  0,
  14,
  0,
  11987,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  632,
  10,
  'EFL Beratungsstelle Lüdenscheid',
  'Wir beraten Sie...  bei festgefahrenen Situationen in Partnerschaft, Beruf, Ehe oder Familie  bei Trennung und Scheidung  bei persönlichen Problemen (z.B. Trauer, Versagungsängsten, Überforderung, Selbstzweifel)  in Momenten des Alleinseins und der Ausweglosigkeit  bei Problemen, die Sie niemanden erzählen können, aber einmal loswerden müssen  bei sexuellen Problemen  bei Sinn- und Glaubensfragen',
  '58509',
  'Lüdenscheid',
  0,
  14,
  0,
  11988,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  633,
  19,
  'Psychologischer Dienst für Ausländer',
  'Erziehungs- und Familienberatung  Lebensberatung  Sozialpsychiatrische Angebote  Wir beraten nur in folgenden Sprachen: Italienisch, Griechisch,Kroatisch,Spanisch und Russisch',
  '80336',
  'München',
  0,
  14,
  0,
  11989,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  634,
  17,
  'Onlineberatung Caritas Familien- und Erziehungsberatung Saalekreis und Halle',
  'Diese Virtuelle Onlineberatungsstelle ist ein Zusammenschluss aus folgenden zwei Beratungsstellen:     Caritas Familien- und Erziehungsberatung Saalekreis, An der Hoffischerei 8, 06217 Merseburg  Caritas Familien- und Erziehungsberatung Halle, Mauerstr. 12, 06110 Halle  ',
  '06110',
  'Halle oder Merseburg',
  1,
  14,
  0,
  11994,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  635,
  1,
  'Familienberatung Düsseldorf Gerresheim',
  null,
  '40625',
  'Düsseldorf Gerresheim',
  0,
  14,
  0,
  11995,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  636,
  1,
  'Erziehungs- und Familienberatung Düsseldorf Rath',
  null,
  '40472',
  'Düsseldorf Rath',
  0,
  14,
  0,
  11996,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  637,
  1,
  'Erziehungs- und Familienberatung Düsseldorf Wersten',
  null,
  '40589',
  'Düsseldorf Wersten',
  0,
  14,
  0,
  11997,
  '2019-08-22 13:24:11',
  '2019-08-22 13:24:11',
  null
), (
  638,
  4,
  'Bundesweite Beratungsstelle',
  null,
  '79104',
  null,
  1,
  13,
  0,
  11687,
  '2019-08-22 13:32:57',
  '2019-08-28 08:35:24',
  null
), (
  639,
  6,
  'IN VIA für das Erzbistum Berlin e.V.',
  'IN VIA Katholischer Verband für Mädchen- und Frauensozialarbeit für das Erzbistum Berlin e.V.  Jugendmigrationsdienst  Bellermannstr. 92  13357 Berlin  ',
  '13357',
  'Berlin',
  1,
  9,
  0,
  10764,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  640,
  1,
  'IN VIA Köln ',
  'IN VIA kath. Verband für Mädchen- und Frauensozialarbeit Köln e.V.  Stolzestraße 1a  50674  Köln    ',
  '50674',
  'Köln',
  1,
  9,
  0,
  10766,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  641,
  21,
  'IN VIA Unna',
  null,
  '59423',
  'Unna',
  1,
  9,
  0,
  10999,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  642,
  21,
  'IN VIA Olpe',
  'Fachverband im Caritasverband für den Kreis Olpe e.V.',
  '57462',
  'Olpe',
  1,
  9,
  0,
  11000,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  643,
  21,
  'IN VIA Paderborn',
  null,
  '33102',
  'Paderborn',
  1,
  9,
  0,
  11002,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  644,
  21,
  'Caritasverband Hagen',
  null,
  '58089',
  'Hagen',
  1,
  9,
  0,
  11003,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  645,
  21,
  'Caritasverband Dortmund',
  null,
  '44147',
  'Dortmund',
  1,
  9,
  0,
  11004,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  646,
  21,
  'IN VIA Dortmund',
  null,
  '44137',
  'Dortmund',
  1,
  9,
  0,
  11005,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  647,
  11,
  'Förderverband Mannheim e. V.',
  'Der Förderband e.V. ist eine anerkannte Einrichtung der Jugendberufshilfe und seit über 30 Jahren in Mannheim und Umgebung aktiv.    Ziel des Förderband ist es, junge Menschen unabhängig von Nationalität, Religion und Geschlecht beim Übergang von der Schule in die Ausbildung, während einer betrieblichen Ausbildung selbst und beim Übergang in das Berufsleben qualifiziert zu unterstützen. Vor allem begleiten wir diejenigen jungen Menschen, die auf dem regulären Ausbildungs- und Arbeitsstellenmarkt wenig Chancen haben.',
  '68159',
  'Mannheim',
  0,
  9,
  0,
  11014,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  648,
  9,
  'Caritasverband für das Bistum Erfurt e.V. Jugendhaus Erfurter Brücke',
  null,
  '99084',
  'Erfurt',
  0,
  9,
  0,
  11015,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  649,
  23,
  'Berufsbildungswerk St. Franziskus Abensberg',
  null,
  '93326',
  'Abensberg',
  0,
  9,
  0,
  11016,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  650,
  2,
  'JG-Gruppe ∙ Benediktushof gGmbH',
  null,
  '48734',
  'Reken',
  0,
  9,
  0,
  11017,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  651,
  12,
  'Caritas - Verband für den Main-Kinzig-Kreis e.V.',
  null,
  '63450',
  'Hanau',
  0,
  9,
  0,
  11018,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  652,
  2,
  'Caritasverband für die Stadt Castrop-Rauxel e. V.',
  null,
  '44575',
  'Castrop-Rauxel',
  0,
  9,
  0,
  11020,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  653,
  1,
  'SKFM Velbert gGmbH',
  null,
  '42549',
  'Velbert',
  0,
  9,
  0,
  11021,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  654,
  11,
  'IN VIA in der Erzdiözese Freiburg e. V.',
  null,
  '79098',
  'Freiburg',
  0,
  9,
  0,
  11024,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  655,
  16,
  'jobaktiv - Beratungsstelle für Jugenberufshilfe im Bistum Limburg',
  null,
  '65549',
  'Limburg',
  1,
  9,
  0,
  11025,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  656,
  19,
  'Beratungsstelle für Eltern, Kinder und Jugendliche',
  null,
  '83278',
  'Traunstein',
  0,
  9,
  0,
  11166,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  657,
  15,
  'Caritasstelle Friedland',
  null,
  '37133',
  'Friedland',
  0,
  9,
  0,
  11167,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  658,
  16,
  'Caritasverband Frankfurt e.V., Jugendmigrationsdienst ',
  null,
  '60325',
  'Frankfurt am Main',
  0,
  9,
  0,
  11184,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  659,
  14,
  'Caritasverband für Hamburg e.V.',
  null,
  '20099',
  'Hamburg',
  0,
  9,
  0,
  11185,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  660,
  16,
  'Caritasverband Frankfurt e.V., Team Höchst Jugendmigrationsdienst',
  null,
  '65929',
  'Frankfurt am Main',
  0,
  9,
  0,
  11186,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  661,
  13,
  'Caritasverband der Diözese Görlitz e.V.',
  null,
  '03046',
  'Cottbus',
  0,
  9,
  0,
  11214,
  '2019-08-23 06:25:29',
  '2019-08-23 06:25:29',
  null
), (
  662,
  6,
  'Caritas-Betreuungsverein Stralsund',
  null,
  '18439',
  'Stralsund',
  0,
  10,
  0,
  11332,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  663,
  21,
  'Sozialdienst katholischer Frauen e.V. Minden',
  null,
  '32423',
  'Minden',
  0,
  10,
  0,
  11346,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  664,
  21,
  'Sozialdienst katholischer Frauen e.V. Gütersloh',
  'Betreuungsverein',
  '33330',
  'Gütersloh',
  0,
  10,
  0,
  11349,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  665,
  12,
  'Sozialdienst katholischer Frauen Fulda e.V.',
  null,
  '36037',
  'Fulda',
  1,
  10,
  0,
  11358,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  666,
  1,
  'Sozialdienst Katholischer Frauen und Männer e.V. - Düsseldorf',
  null,
  '40476',
  'Düsseldorf',
  1,
  10,
  0,
  11363,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  667,
  1,
  'Caritasverband Wuppertal/Solingen e.V. - Rechtliche Betreuung',
  null,
  '42285',
  'Wuppertal',
  0,
  10,
  0,
  11378,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  668,
  1,
  'SKFM Velbert/Heiligenhaus e.V.',
  null,
  '42551',
  'Velbert',
  1,
  10,
  0,
  11379,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  669,
  10,
  'Sozialdienst katholischer Frauen Bochum e.V.',
  null,
  '44805',
  'Bochum',
  1,
  10,
  0,
  11389,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  670,
  2,
  'Beratungsstelle des Betreuungsvereins des Sozialdienst katholischer Frauen Bocholt e.V. ',
  null,
  '46397',
  'Bocholt',
  0,
  10,
  0,
  11402,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  671,
  2,
  'Caritasverband Dinslaken und Wesel - Betreuungsverein',
  null,
  '46562',
  'Voerde',
  0,
  10,
  0,
  11404,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  672,
  2,
  'Sozialdienst katholischer Frauen Moers e.V.',
  null,
  '47441',
  'Moers',
  0,
  10,
  0,
  11406,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  673,
  2,
  'Sozialdienst Katholischer Männer Moers-Xanten e.V.',
  null,
  '47441',
  'Moers',
  0,
  10,
  0,
  11407,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  674,
  0,
  'SKM - Kath. Verein für soziale Dienste in Krefeld e.V.',
  null,
  '47798',
  'Krefeld',
  1,
  10,
  0,
  11409,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  675,
  2,
  'Betreuungsverein des SkF Ahaus-Vreden e.V.',
  null,
  '48683',
  'Ahaus',
  0,
  10,
  0,
  11419,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  676,
  2,
  'Sozialdienst katholischer Frauen e. V. Ibbenbüren',
  'Betreuungsverein',
  '49477',
  'Ibbenbüren',
  0,
  10,
  0,
  11425,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  677,
  1,
  'Betreuungsverein des Sozialdienst kath. Frauen Rhein-Erft-Kreis e.V.',
  null,
  '50126',
  'Bergheim',
  0,
  10,
  0,
  11433,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  678,
  26,
  'SKFM Neuwied in Linz',
  null,
  '53545',
  'Linz',
  0,
  10,
  0,
  11455,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  679,
  1,
  'SKM - Kath. Verein für soziale Dienste im Rhein-Sieg-Kreis e.V.',
  null,
  '53721',
  'Siegburg',
  0,
  10,
  0,
  11456,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  680,
  1,
  'Sozialdienst katholischer Frauen e.V. Bonn und Rhein-Sieg-Kreis',
  'Beratung für ehrenamtliche rechtliche Betreuer, Betreuerinnen und Bevollmächtigte /   Beratung für Familienangehörige, die eine Betreuung führen oder führen möchten /   Informationen zu Vorsorgevollmachten, Betreuungsverfügungen  und rechtlicher Betreuung  ',
  '53721',
  'Siegburg',
  1,
  10,
  0,
  11457,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  681,
  21,
  'Katholischer Sozialdienst für den Kreis Olpe, Rechtliche Betreuung',
  null,
  '57462',
  'Olpe',
  0,
  10,
  0,
  11481,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  682,
  21,
  'Katholischer Sozialdienst Hamm e.V., Stadthausstraße 2',
  null,
  '59065',
  'Hamm',
  0,
  10,
  0,
  11489,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  683,
  21,
  'Sozialdienst katholischer Frauen Unna e.V.',
  null,
  '59423',
  'Unna',
  0,
  10,
  0,
  11492,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  684,
  21,
  'Sozialdienst Katholischer Männer e.V. Lippstadt',
  null,
  '59555',
  'Lippstadt',
  1,
  10,
  0,
  11495,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  685,
  26,
  'Fördergemeinschaft katholischer Betreuungsvereine im Regionalverband Saarbrücken e.V.',
  null,
  '66333',
  'Völklingen',
  0,
  10,
  0,
  11512,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  686,
  11,
  'SKF Mannheim Betreuungsverein',
  null,
  '68159',
  'Mannheim',
  1,
  10,
  0,
  11524,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  687,
  11,
  'Sozialdienst katholischer Frauen e.V., Karlsruhe',
  null,
  '76133',
  'Karlsruhe',
  0,
  10,
  0,
  11533,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  688,
  11,
  'Sozialdienst katholischer Frauen e.V. Offenburg',
  null,
  '77654',
  'Offenburg',
  0,
  10,
  0,
  11541,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  689,
  11,
  'Sozialdienst katholischer Frauen e.V. Villingen',
  null,
  '78050',
  'Villingen-Schwenningen',
  1,
  10,
  0,
  11542,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  690,
  11,
  'Sozialdienst katholischer Frauen e.V. Singen',
  null,
  '78224',
  'Singen',
  1,
  10,
  0,
  11545,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  691,
  11,
  'SkF Konstanz ',
  null,
  '78462',
  'Konstanz',
  0,
  10,
  0,
  11548,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  692,
  11,
  'SkF Freiburg',
  null,
  '79100',
  'Freiburg',
  1,
  10,
  0,
  11550,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  693,
  5,
  'Caritasverband Starnberg e.V.',
  null,
  '82319',
  'Starnberg',
  0,
  10,
  0,
  11558,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  694,
  8,
  'Sozialdienst katholischer Frauen e.V. Ingolstadt, Rechtliche Betreuung',
  null,
  '85049',
  'Ingolstadt',
  1,
  10,
  0,
  11561,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  695,
  5,
  'Caritasverband für den Landkreis Donau-Ries e.V.',
  null,
  '86720',
  'Nördlingen',
  0,
  10,
  0,
  11570,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  696,
  10,
  'Sozialdienst kath. Frauen und Männer e.V.',
  null,
  '45468',
  'Mülheim',
  0,
  10,
  0,
  11595,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  697,
  11,
  'Online Beratungsstelle der SKM Betreuungsvereine in Baden-Württemberg',
  'folgende SKM Betreuungsvereine sind dabei: Breisgau/Hochschwarzwald, Freiburg, Heidelberg, Konstanz, Landkreis Karlsruhe, Lörrach, Ortenau, Rastatt, Schwarzwald-Baar, Sigmaringen, Zollern    und der SKM Diözesanverein Freiburg',
  null,
  null,
  0,
  10,
  0,
  11596,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  698,
  19,
  'Betreuungsverein des Kath. Jugendsozialwerkes München e.V. im westlichen München/Landkreis München',
  null,
  '81241',
  'München',
  1,
  10,
  0,
  11597,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  699,
  26,
  'Beratungsstelle Region Trier',
  null,
  null,
  null,
  0,
  10,
  0,
  11598,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  700,
  1,
  'SKM Bonn e.V. - Betreuungsverein',
  null,
  '53117',
  'Bonn',
  0,
  10,
  0,
  11599,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  701,
  28,
  'Virtuelle Beratungsstelle für den Offizialatsbezirk Oldenburg, Rechtliche Betreuung',
  null,
  null,
  null,
  1,
  10,
  0,
  11600,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  702,
  21,
  'Betreuungsverein Caritasverband Hagen',
  null,
  '58095',
  'Hagen',
  1,
  10,
  0,
  11601,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  703,
  3,
  'SkF-Betreuungsvereine Nürnberg-Fürth-Erlangen',
  null,
  null,
  null,
  1,
  10,
  0,
  11602,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  704,
  21,
  'SkF e.V. Detmold und Herford',
  null,
  '32756',
  'DETMOLD; HERFORD',
  1,
  10,
  0,
  11603,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  705,
  15,
  'Sozialdienst katholischer Frauen e.V. Hannover',
  null,
  '30449',
  'Hannover',
  1,
  10,
  0,
  11606,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  706,
  25,
  'Virtuelle Beratungsstelle der SKFM Betreuungsvereine für das Bistum Speyer',
  null,
  null,
  null,
  0,
  10,
  0,
  11608,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  707,
  20,
  'Rechtliche Betreuungen West',
  null,
  null,
  null,
  0,
  10,
  0,
  11610,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  708,
  20,
  'Rechtliche Betreuungen Ost',
  null,
  null,
  null,
  0,
  10,
  0,
  11612,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  709,
  4,
  'Virtuelle Arbeitsstelle Rechtliche Betreuung DCV, SkF, SKM',
  null,
  '40479',
  'Düsseldorf',
  0,
  10,
  0,
  11613,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  710,
  21,
  'Sozialdienst kath. Frauen e.V. Hochsauerland',
  null,
  '59821',
  'Arnsberg',
  0,
  10,
  0,
  11621,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  711,
  26,
  'SKFM Neuwied e.V., Sozialdienst kath. Frauen und Männer Neuwied e.V.',
  null,
  '56564',
  'Neuwied',
  1,
  10,
  0,
  11622,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  712,
  21,
  'Sozialdienst kath. Frauen e.V. Kreis Höxter und Hochsauerland Ost',
  null,
  null,
  null,
  0,
  10,
  0,
  11623,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  713,
  26,
  'Sozialdienst Katholischer Frauen und Männer für den Landkreis Neunkirchen e.V. - Betreuungsverein -',
  null,
  '66538',
  'Neunkirchen',
  1,
  10,
  0,
  11627,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  714,
  5,
  'Caritasverband für die Stadt und den Landkreis Augsburg',
  'Caritasverband für die Stadt und den Landkreis Augsburg  Betreuungsverein Stadt  Depotstr. 5  86199 Augsburg  e-mail: betreuungen@caritasverband-augsburg-stadt.de  Telnr: 0821/5704831    Caritasverband für den Landkreis Augsburg  Betreuungsverein Land  Depotstr. 5  86199 Augsburg  e-mail: betreuungen@caritasverband-augsburg-land.de  Telnr: 0821/5704841  ',
  null,
  null,
  0,
  10,
  0,
  11634,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  715,
  8,
  'Caritasverband für die Diözese Eichstätt e. V.',
  null,
  '85072',
  'Eichstätt',
  0,
  10,
  0,
  11635,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  716,
  27,
  'Onlineberatung rechtliche Betreuung Aschaffenburg-Schweinfurt',
  'Sozialdienst kath. Frauen e.V.  Erbsengasse 9  63739 Aschaffenburg    Sozialdienst kath. Frauen e.V.  Friederich-Stein Str. 28  97421 Schweinfurt',
  '63739',
  'Aschaffenburg',
  1,
  10,
  0,
  11639,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  717,
  1,
  'Gem. Online-Beratungsstelle: Betreuungsvereine Caritas, SkF, SKM Köln und SkF Leverkusen',
  null,
  null,
  null,
  0,
  10,
  0,
  11641,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  718,
  18,
  'Caritasverband Gießen e.V. OB',
  null,
  '35392',
  'Gießen',
  0,
  10,
  0,
  11646,
  '2019-08-23 08:41:44',
  '2019-08-23 08:41:44',
  null
), (
  719,
  1,
  'Schuldnerberatung Siegburg',
  'SKM Katholischer Verein für Soziale Dienste im Rhein-Sieg-Kreis e.V.  Montag bis Freitag von 8:00-12:30 und 13:30-16:30  Freitag von 8:00-13:00  ',
  '53721',
  'Siegburg',
  0,
  5,
  0,
  7637,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  720,
  1,
  'Schuldnerberatung Meckenheim',
  null,
  '53340',
  'Meckenheim ',
  0,
  5,
  0,
  7638,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  721,
  1,
  'Schuldnerberatung des SKM Leverkusen e.V.',
  null,
  '51379',
  'Leverkusen',
  0,
  5,
  0,
  8223,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  722,
  11,
  'Caritasverband Freiburg-Stadt e.V.',
  null,
  '79098',
  'Freiburg',
  0,
  5,
  0,
  8229,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  723,
  11,
  'Caritasverband Karlsruhe e. V., Beratungszentrum Caritashaus',
  null,
  '76133',
  'Karlsruhe',
  0,
  5,
  0,
  8230,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  724,
  11,
  'Caritasverband Konstanz e.V.',
  'Telefonische Kontaktaufnahme  ist möglich  Dienstag von 13:00 bis 16:00 , Mittwoch und Freitag jeweils von 10:00 bis 13:00 Uhr unter Telefon-Nr. 07531-1200-250.',
  '78464',
  'Konstanz',
  0,
  5,
  0,
  8232,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  725,
  8,
  'Caritas-Kreisstelle Roth Schuldnerberatungsstelle',
  'Online-Schuldnerberatungsstelle',
  '91154',
  'Roth ',
  0,
  5,
  0,
  8233,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  726,
  24,
  'Caritasverband für Stuttgart e. V.',
  null,
  '70182',
  'Stuttgart',
  0,
  5,
  0,
  8234,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  727,
  11,
  'Caritasverband im Tauberkreis e. V.',
  null,
  '97941',
  'Tauberbischofsheim',
  0,
  5,
  0,
  8235,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  728,
  16,
  'Caritasverband Wiesbaden-Rheingau-Taunus e.V.       Schuldnerberatung',
  null,
  '65185',
  'Wiesbaden',
  0,
  5,
  0,
  8236,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  729,
  6,
  'Caritasverband f. d. Erzbistum Berlin e. V. - Online-Schuldnerberatung im Bistum Berlin',
  'Die Online-Beraterinnen und -Berater arbeiten in den Caritas-Schuldner- und Insolvenzberatungsstellen in Berlin - Lichtenberg, Berlin - Pankow, Berlin - Mitte und in Strausberg.',
  '10437',
  'Berlin',
  0,
  5,
  0,
  8237,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  730,
  21,
  'Katholischer Verein f. Soziale Dienste	in Bielefeld e. V.',
  null,
  '33602',
  'Bielefeld',
  0,
  5,
  0,
  8238,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  731,
  9,
  'Caritasregion Mittelthüringen',
  null,
  '99084',
  'Erfurt',
  0,
  5,
  0,
  8240,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  732,
  0,
  'Sozialdienst Katholischer Frauen e. V.',
  null,
  '52249',
  'Eschweiler, Rheinl',
  0,
  5,
  0,
  8241,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  733,
  0,
  'SKM Katholischer Verein für soz. Dienste',
  'Termine nur nach telefonischer Vereinbarung unter 02151/8412-11. Sie erreichen uns täglich zwischen 8.30 Uhr und 12.30 Uhr',
  '47798',
  'Krefeld',
  0,
  5,
  0,
  8242,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  734,
  15,
  'Caritasverband Salzgitter e. V.',
  null,
  '38226',
  'Salzgitter',
  0,
  5,
  0,
  8243,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  735,
  15,
  'Caritasverband für die Landkreise Verden und Heidekreis',
  null,
  '27283',
  'Verden (Aller)',
  0,
  5,
  0,
  8244,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  736,
  4,
  'Sozialberatung für Schuldner - Online: Virtuelle Beratungsstelle',
  'Alle Anfragen, die auf der Grundlage der Postleitzahl keiner Online-Beratungsstelle zugeordnet werden können, werden von der virtuellen Beratungsstelle bearbeitet. Die erfahrenen Berater verteilen sich über das gesamte Bundesgebiet. Rückfragen zur Stelle richten Sie bitte an den Koordinator Cornelius Wichmann (siehe Kontaktdaten).',
  '79104',
  'Freiburg',
  0,
  5,
  0,
  8246,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  737,
  15,
  'Caritasverband für die Stadt und den Landkreis Göttingen e.V., Schuldnerbneratung',
  null,
  '37115',
  'Duderstadt',
  0,
  5,
  0,
  8247,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  738,
  15,
  'Caritasverband für die Stadt und den Landkreis Hildesheim e.V., Schuldnerberatung',
  null,
  '31134',
  'Hildesheim',
  0,
  5,
  0,
  8248,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  739,
  15,
  'Caritasverband Hannover e.V., Schuldnerberatung Burgwedel',
  null,
  '30938',
  'Burgwedel',
  0,
  5,
  0,
  8249,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  740,
  11,
  'Caritasverband Linzgau e.V., Schuldnerberatung',
  null,
  '88662',
  'Überlingen',
  0,
  5,
  0,
  8250,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  741,
  11,
  'Caritasverband Acher-Renchtal e. V.',
  null,
  '77855',
  'Achern',
  0,
  5,
  0,
  8251,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  742,
  11,
  'Caritasverband für den Landkreis Emmendingen e. V.',
  null,
  '79312',
  'Emmendingen',
  0,
  5,
  0,
  8252,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  743,
  11,
  'Caritasverband Lörrach e. V.',
  null,
  '79539',
  'Lörrach',
  1,
  5,
  0,
  8257,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  744,
  5,
  'Caritasverband für die Stadt Augsburg',
  null,
  '86152',
  'Augsburg',
  0,
  5,
  0,
  8266,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  745,
  3,
  'Caritas Schuldner- und Insolvenzberatung Bamberg-Forchheim',
  null,
  '96047',
  'Bamberg',
  0,
  5,
  0,
  8269,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  746,
  3,
  'Caritas Schuldner- und Insolvenzberatungsstelle Erlangen',
  null,
  '91052',
  'Erlangen',
  0,
  5,
  0,
  8281,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  747,
  23,
  'Diözesan-Caritasverband Regensburg - Soziale Schuldner- und Insolvenzberatung',
  null,
  '93047',
  'Regensburg',
  0,
  5,
  0,
  8311,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  748,
  27,
  'Schuldnerberatung der Christophorus GmbH',
  null,
  '97070',
  'Würzburg',
  1,
  5,
  0,
  8329,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  749,
  6,
  'Caritasverband für das Erzbistum Berlin e. V. - Schuldner- und Insolvenzberatung Bergen',
  null,
  '18528',
  'Bergen',
  0,
  5,
  0,
  8351,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  750,
  14,
  'Caritasverband für das Erzbistum Hamburg e.V., Region Neubrandenburg',
  null,
  '17033',
  'Neubrandenburg',
  0,
  5,
  0,
  8354,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  751,
  14,
  'Caritas Mecklenburg e. V. Kreisverband Rostock Soziale Schuldner- und Insolvenzberatung',
  null,
  '18055',
  'Rostock',
  0,
  5,
  0,
  8358,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  752,
  10,
  'SKFM Wattenscheid - Schuldnerberatung',
  null,
  '44866',
  'Bochum',
  0,
  5,
  0,
  8384,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  753,
  21,
  'SkF Brilon e. V. - Schuldnerberatung',
  null,
  '59929',
  'Brilon',
  0,
  5,
  0,
  8387,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  754,
  10,
  'Caritasverband Duisburg e.V.',
  null,
  '47051',
  'Duisburg',
  0,
  5,
  0,
  8394,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  755,
  1,
  'Caritasverband für die Stadt Köln e.V.',
  null,
  '51103',
  'Köln',
  0,
  5,
  0,
  8420,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  756,
  1,
  'Sozialdienst katholischer Männer e. V. Köln',
  'Schuldner- und Insolvenzberatungsstelle',
  '50676',
  'Köln',
  0,
  5,
  0,
  8421,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  757,
  1,
  'Caritasverband für den Kreis Mettmann e.V.',
  null,
  '40822',
  'Mettmann',
  0,
  5,
  0,
  8427,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  758,
  16,
  'Caritasverband Westerwald-Rhein-Lahn e.V., Caritas-Zentren in Lahnstein und  Montabaur',
  'Unsere Beratungsstelle berät Sie im Rhein-Lahn-Kreis und im Kreis Westerwald',
  '56410',
  'Montabaur',
  0,
  5,
  0,
  8474,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  759,
  7,
  'Caritasverband für Chemnitz und Umgebung e. V. Schuldnerberatung',
  null,
  '09130',
  'Chemnitz',
  0,
  5,
  0,
  8489,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  760,
  7,
  'Caritasverband Leipzig e. V.',
  null,
  '04109',
  'Leipzig',
  0,
  5,
  0,
  8496,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  761,
  7,
  'Beratungsstelle des Caritasverbandes für das Dekanat Meißen e. V.',
  null,
  '01662',
  'Meißen',
  0,
  5,
  0,
  8498,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  762,
  7,
  'Beratungsstelle des Caritasverbandes Dekanat Zwickau e. V.',
  null,
  '08056',
  'Zwickau',
  0,
  5,
  0,
  8503,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  763,
  1,
  'Schuldnerberatung RheinBerg',
  'Gemeinsame Schuldnerberatung des Diakonischen Werkes Köln und Region und der Caritas RheinBerg  Genauere Informationen über unsere Angebote und Leistungen finden Sie unter www.schuldnerberatung-rheinberg.de. ',
  '51465',
  'Bergisch Gladbach',
  0,
  5,
  0,
  8511,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  764,
  1,
  'Zentrale Schuldnerberatung Bonn',
  'Zuständigkeitsbereich:      Stadt Bonn  (Ausnahme: Stadtbezirk Bonn-Bad Godesberg)      Schuldner- und Insolvenzberatung:      Beratung von überschuldeten Personen und Haushalten     Budgetberatung    Verhandlungen mit Gläubigern    Einleitung Insolvenzverfahren    Anerkannte Stelle gem. § 305 InsO',
  '53111',
  'Bonn',
  0,
  5,
  0,
  8512,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  765,
  10,
  'Caritasverband Oberhausen e. V., Schuldner- und Insolvenzberatung',
  null,
  '46145',
  'Oberhausen',
  0,
  5,
  0,
  8515,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  766,
  20,
  'Virtuelle Beratungsstelle Osnabrück',
  null,
  '49080',
  'Osnabrück',
  0,
  5,
  0,
  8544,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  767,
  13,
  'Onlineberatungsstelle Bautzen - Görlitz - Hoyerswerda',
  null,
  null,
  'Bautzen - Görlitz - Hoyerswerda',
  0,
  5,
  0,
  10823,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  768,
  19,
  'Caritasverband der Erzdiözese München und Freising e.V.',
  null,
  '80335',
  'München',
  0,
  5,
  0,
  10951,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  769,
  15,
  'CJS - Jugendfinanzcoaching',
  'Beratung und Begleitung für junge Erwachsene bis 27          ',
  '30165',
  'Hannover',
  0,
  5,
  0,
  10993,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  770,
  8,
  'Caritas-Kreisstelle Neumarkt Beratung für ver- und überschuldete Bürger des Landkreises Neumarkt',
  null,
  '92318',
  'Neumarkt in der Oberpfalz',
  0,
  5,
  0,
  11022,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  771,
  8,
  'Caritas-Kreisstelle Eichstätt',
  null,
  '85072',
  'Eichstätt',
  0,
  5,
  0,
  11023,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  772,
  8,
  'Caritas-Kreisstelle Ingolstadt',
  null,
  '85049',
  'Ingolstadt',
  0,
  5,
  0,
  11028,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  773,
  19,
  'Caritasverband der Erzdiözese München und Freising e. V. Stadtgebiet München',
  null,
  '80336',
  'München',
  0,
  5,
  0,
  11029,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  774,
  8,
  'Caritas-Kreisstelle Weißenburg',
  null,
  '91781',
  'Weißenburg',
  0,
  5,
  0,
  11188,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  775,
  6,
  'Caritasverband für das Erzbistum Berlin e.V. Schuldner- und Verbraucherinsolvenzberatung Greifswald',
  null,
  '17489',
  'Greifswald',
  0,
  5,
  0,
  11317,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  776,
  21,
  'Sozialdienst katholischer Frauen und Männer für den Kreis Gütersloh e.V.',
  'Bei uns sind Sie richtig, wenn:    - der Dispositionskredit überzogen ist  - die Handyrechnung zu hoch ist  - die Ausgaben höher sind als die Einnahmen  - die Raten im Rückstand sind  - Mahnungen und Vollstreckungen sich häufen  - der Überblick verloren geht  - das Konto gesperrt ist  - Pfändungen drohen  - Mietrückstände aufgelaufen sind  - der Strom gesperrt wird  - der Gerichtsvollzieher vor der Tür steht  - zum Leben nicht mehr genug übrig bleibt  - ein unbearbeiteter Schuldenberg die Arbeitssuche behindert  - Schulden zur Belastung werden  - Sie sich aus dem Kreislauf nicht mehr aus eigener Kraft befreien können.  ',
  '33378',
  'Rheda-Wiedenbrück',
  0,
  5,
  0,
  11659,
  '2019-08-23 08:45:32',
  '2019-08-23 08:45:32',
  null
), (
  777,
  4,
  'Virtuelle Beratungsstelle der Schwangerschaftsberatung',
  'Es handelt sich bei dieser Beratungsstelle um die bundesweite Online-Beratungsstelle der Schwangerschaftsberatung des Deutschen Caritas Verbandes e.V.',
  null,
  'bundesweit',
  0,
  2,
  0,
  8,
  '2019-08-23 08:52:05',
  '2019-09-02 06:55:42',
  null
), (
  778,
  7,
  'Schwangerschaftsberatungsstelle Dresden',
  'Bitte beachten Sie, dass Mailanfragen, die im Zeitraum von Donnerstag, 15.00 Uhr bis Sonntag eingehen, erst am folgenden Montag beantwortet werden können',
  '01067',
  'Dresden',
  0,
  2,
  0,
  6085,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  779,
  7,
  'Schwangerschaftsberatungsstelle Zwickau, Caritasverband Dekanat Zwickau e.V.',
  null,
  '08056',
  'Zwickau',
  0,
  2,
  0,
  6086,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  780,
  14,
  'Beratungsstelle für Frauen, Familien und Schwangere Hamburg Wartenau',
  null,
  '22089',
  'Hamburg',
  0,
  2,
  0,
  6103,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  781,
  14,
  'Beratungsstelle für Frauen, Familien und Schwangere des SkF e.V. Hamburg-Altona',
  null,
  '22767',
  'Hamburg',
  0,
  2,
  0,
  6104,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  782,
  14,
  'Caritas Lübeck, Beratungsstelle für Frauen, Familien, Schwangere',
  null,
  '23552',
  'Lübeck',
  0,
  2,
  0,
  6105,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  783,
  14,
  'Beratungsstelle für Frauen, Familien und Schwangere Eutin',
  null,
  '23701',
  'Eutin',
  0,
  2,
  0,
  6106,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  784,
  14,
  'Beratungsstelle für Frauen und Familien Kiel',
  'Bitte beachten Sie, dass wir nur von Montag bis Donnerstag Onlineberatung anbieten. ',
  '24103',
  'Kiel',
  0,
  2,
  0,
  6108,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  785,
  14,
  'Beratungsstelle für Frauen, Familien und Schwangere',
  null,
  '25335',
  'Elmshorn',
  1,
  2,
  0,
  6111,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  786,
  28,
  'Schwangerschaftsberatung Oldenburg',
  null,
  '26121',
  'Oldenburg',
  0,
  2,
  0,
  6112,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  787,
  28,
  'Schwangerschaftsberatung Wilhelmshaven',
  null,
  '26384',
  'Wilhelmshaven',
  0,
  2,
  0,
  6114,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  788,
  28,
  'Caritasverband im Kreis Wesermarsch e.V. - Schwangerschaftsberatung, Nordenham',
  null,
  '26954',
  'Nordenham',
  0,
  2,
  0,
  6119,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  789,
  28,
  'Schwangerschaftsberatung Delmenhorst',
  null,
  '27749',
  'Delmenhorst',
  0,
  2,
  0,
  6123,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  790,
  15,
  'Beratungsstelle für Schwangere und Familien Hannover',
  null,
  '30449',
  'Hannover',
  0,
  2,
  0,
  6127,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  791,
  15,
  'Beratungsstelle für Schwangere und Familien Hameln',
  null,
  '31785',
  'Hameln',
  0,
  2,
  0,
  6131,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  792,
  21,
  'Katholische Schwangerschaftsberatungsstelle Minden',
  null,
  '32423',
  'Minden',
  0,
  2,
  0,
  6132,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  793,
  21,
  'Katholische Schwangerschaftsberatungsstelle Detmold',
  null,
  '32756',
  'Detmold',
  0,
  2,
  0,
  6133,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  794,
  21,
  'Katholische Schwangerschaftsberatungsstelle Brakel',
  null,
  '33034',
  'Brakel',
  0,
  2,
  0,
  6134,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  795,
  21,
  'Katholische Schwangerschaftsberatungsstelle Paderborn',
  null,
  '33098',
  'Paderborn',
  0,
  2,
  0,
  6135,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  796,
  21,
  'Katholische Schwangerschaftsberatungsstelle Gütersloh',
  null,
  '33330',
  'Gütersloh',
  0,
  2,
  0,
  6136,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  797,
  21,
  'Katholische Schwangerschaftsberatungsstelle Bielefeld',
  null,
  '33602',
  'Bielefeld',
  0,
  2,
  0,
  6137,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  798,
  12,
  'Beratungsstelle für Schwangere, Familien und Familienplanung Kassel',
  null,
  '34117',
  'Kassel',
  0,
  2,
  0,
  6138,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  799,
  12,
  'Beratungsstelle für Schwangere, Familien und Familienplanung Marburg',
  null,
  '35037',
  'Marburg',
  0,
  2,
  0,
  6139,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  800,
  12,
  'Schwangerschaftsberatung SKF Fulda',
  'Der Sozialdienst kath. Frauen berät Sie gerne zu allen Fragen im Zusammenhang mit Schwangerschaft, Pränataldiagnostik, alleinerziehend Sein, Partnerschaft, Sexualität und Familienplanung, Informationen und Hilfe durch den  Ämterdschungel  und bei Fragen zu sozialrechtlichen Fragen.',
  '36037',
  'Fulda',
  0,
  2,
  0,
  6143,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  801,
  15,
  'Beratungsstelle für Schwangere und Familien Göttingen',
  null,
  '37081',
  'Göttingen',
  0,
  2,
  0,
  6147,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  802,
  15,
  'Beratungsstelle für Schwangere und Familien Holzminden',
  null,
  '37603',
  'Holzminden',
  0,
  2,
  0,
  6150,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  803,
  15,
  'Beratungsstelle für Schwangere und Familien Salzgitter',
  null,
  '38226',
  'Salzgitter',
  0,
  2,
  0,
  6152,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  804,
  15,
  'Beratungsstelle für Schwangere und Familien Helmstedt',
  'Offnungszeiten: Dienstag 15 -17 Uhr                                Freitag      9 -12 Uhr  Beratung, Mutter-Kind-Gruppen, Elternpraktikum',
  '38350',
  'Helmstedt',
  0,
  2,
  0,
  6153,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  805,
  15,
  'Beratungsstelle für Schwangere und Familien Wolfsburg',
  null,
  '38440',
  'Wolfsburg',
  0,
  2,
  0,
  6154,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  806,
  17,
  'Schwangerschaftsberatungsstelle Magdeburg',
  null,
  '39112',
  'Magdeburg',
  0,
  2,
  0,
  6155,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  807,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der katholischen Kirche, Mönchengladbach',
  null,
  '41063',
  'Mönchengladbach',
  0,
  2,
  0,
  6157,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  808,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der Katholischen Kirche, Viersen',
  null,
  '41747',
  'Viersen',
  0,
  2,
  0,
  6158,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  809,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der katholischen Kirche, Erkelenz',
  null,
  '41812',
  'Erkelenz',
  0,
  2,
  0,
  6159,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  810,
  21,
  'Katholische Schwangerschaftsberatungsstelle Dortmund',
  'Allg. Schwangerschaftsberatung,    Schwerpunkt-Beratung:   Pränataldiagnostik,   Tot- und Fehlgeburt,   Trauer,                \\ Fit für\\ ',
  '44137',
  'Dortmund',
  0,
  2,
  0,
  6160,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  811,
  10,
  'Schwangerschaftsberatungsstelle Bochum Bergstrasse',
  null,
  '44807',
  'Bochum',
  0,
  2,
  0,
  6162,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  812,
  10,
  'Schwangerschaftsberatungsstelle SKFM Wattenscheid ',
  null,
  '44867',
  'Bochum-Wattenscheid',
  0,
  2,
  0,
  6163,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  813,
  10,
  'Schwangerschaftsberatungsstelle Essen Dammannstrasse',
  null,
  '45138',
  'Essen',
  0,
  2,
  0,
  6164,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  814,
  10,
  'Schwangerschaftsberatungsstelle Mülheim an der Ruhr',
  null,
  '45470',
  'Mülheim an der Ruhr',
  0,
  2,
  0,
  6165,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  815,
  10,
  'Schwangerschaftsberatungsstelle Hattingen',
  null,
  '45525',
  'Hattingen',
  0,
  2,
  0,
  6166,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  816,
  2,
  'Schwangerschaftsberatung des Caritasverbandes für die Stadt Recklinghausen e.V.',
  'Schwangerschaftsberatung  Haus der Caritas  Mühlenstr. 27  45659 Recklinghausen,    Tel.: 0 23 61 / 58 90 - 590  Fax: 0 23 61 / 58 90 - 991    Terminvergabe unter der Tel.: 0 23 61 / 58 90 - 590  montags, dienstags und donnerstags  von 09.00 Uhr bis 14.30 Uhr  mittwochs von 12.00 Uhr bis 14.30 Uhr  freitags von 09.00 Uhr bis 12.00 Uhr    Die kirchlich anerkannte Beratungsstelle des Caritasverbandes für die Stadt Recklinghausen e. V. ist für die Städte Dorsten, Haltern, Herten, Marl und Recklinghausen zuständig.     Folgende Aufgaben nehmen die Mitarbeiterinnen der Beratungstelle u. a. wahr:  - Allgemeine Sozialberatung bei Schwangerschaft  - Beratung, Unterstützung und Begleitung während der Schwangerschaft und nach der Geburt des    Kindes  - Beratung in sozialen Fragen und Leistungen  - Hilfe bei der Durchsetzung von Rechtsansprüchen   - Vermittlung von finanziellen Hilfen in einer Notsituation aufgrund der Schwangerschaft über z. B. Bundesstiftung   Mutter und Kind - Schutz des ungeborenen Lebens   , bischöflicher Hilfsfonds, städtische und kommunale Hilfsfonds, Spenden und Sachleistungen   - Trauerbegleitung nach Fehl- oder Totgeburt oder nach einem (späten) Schwangerschaftsabbruch  - Beratung zur Familienplanung und Verhütung  - Beratung von Jugendlichen zu Themen wie Liebe, Freundschaft, Partnerschaft, Sexualität   Präventionsarbeit mit Jugendgruppen und Schulklassen etc.   - Gruppenarbeit mit Schwangeren und jungen Müttern   - Psychosoziale Beratung und Begleitung vor, während und nach Inanspruchnahme von Pränataldiagnostik (vorgeburtlicher Diagnostik) und nach der Geburt eines Kindes mit Behinderung   ',
  '45659',
  'Recklinghausen',
  0,
  2,
  0,
  6167,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  817,
  10,
  'Schwangerschaftsberatungsstelle Gelsenkirchen',
  null,
  '45879',
  'Gelsenkirchen',
  0,
  2,
  0,
  6169,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  818,
  10,
  'Schwangerschaftsberatungsstelle Gelsenkirchen-Buer',
  null,
  '45894',
  'Gelsenkirchen-Buer',
  0,
  2,
  0,
  6170,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  819,
  10,
  'Schwangerschaftsberatungsstelle Gladbeck',
  null,
  '45964',
  'Gladbeck',
  0,
  2,
  0,
  6171,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  820,
  10,
  'Schwangerschaftsberatungsstelle Oberhausen',
  null,
  '46045',
  'Oberhausen',
  0,
  2,
  0,
  6172,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  821,
  2,
  'Sozialdienst katholischer Frauen Bocholt e.V. ',
  'Geschäftsstelle Bocholt    Außendienststelle in Borken   Außensprechstunde in Rhede  ',
  '46397',
  'Bocholt',
  0,
  2,
  0,
  6174,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  822,
  2,
  'Schwangerschaftsberatung SKF Wesel',
  'Beratungs- und Öffnungszeiten: Mo - Do 8.00 - 16.30 Uhr, Fr 8.00 - 14.00 Uhr  Außensprechstunde Dinslaken: Mi 9.00 - 13.00 Uhr  Termine nach Vereinbarung    Beratung in Fragen     - rechtliche Probleme  - finanzielle Schwierigkeiten, Vermittlung finanzieller Hilfen durch die Bundesstiftung und den    bischöflichen Hilfsfonds  - Beziehungsprobleme  - Hilfe bei der Bewältigung des Alltags  - Sexualität und Familienplanung  - Trauerbegleitung nach Verlust eines Kindes    Wir beraten Sie kostenlos, auf Wunsch anonym, unabhängig von Nationalität und Konfession. Wir unterliegen der Schweigepflicht.    Weitere Angebote unserer Beratungstelle:    - jeden 3. Donnerstag im Monat treffen sich Schwangere und frisch gebackene     Eltern. Es besteht die Möglichkeit die Babys von einer Hebamme wiegen und messen zu lassen.     Bei Kaffee und Kuchen können sich die Eltern austauschen. Bei Bedarf sind Beratungs- und     Hebammenleistungen möglich.  - jeden 1. und 3. Mittwoch im Monat treffen sich Eltern mit ihren Kindern im Alter     zwischen 1  und 3 Jahren zur Spielgruppe.  - jeden 2. und 4. Dienstag im Monat bieten wir eine Gruppe für Schwangere zur  etwas     anderen  Vorbereitung auf das Leben mit Baby.  - jeden 2. und 4. Freitag treffen sich Eltern, Alleinerziehende und Familien      mit Kindern bis zum 3. Lebensjahr zum gemeinsamen Frühstück. Die Eltern können sich mit anderen     Eltern austauschen, die Kinder können erste soziale Kontakte knüpfen.        ',
  '46483',
  'Wesel',
  0,
  2,
  0,
  6175,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  823,
  2,
  'Schwangerschaftsberatung Moers',
  null,
  '47441',
  'Moers',
  0,
  2,
  0,
  6180,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  824,
  2,
  'Schwangerschaftsberatung Kleve',
  'Wir beraten Sie kostenlos, auf Wunsch anonym, unabhängig von Nationalität und Konfession, vertraulich und unterliegen der Schweigepflicht.  Wir begleiten Sie mit Worten,um die Gedanken im Kopf zu ordnen und die Gefühle im Herzen zu verstehen,  und mit Taten, bei der Bewältigung Ihrer Alltagsprobleme, überall dort, wo Sie unsere Unterstützung brauchen.  Wir informieren und helfen, bei rechtlichen und finanziellen Problemen,  besprechen vorbehaltlos Ihre Fragen zu Sexualität und Familienplanung, vorgeburtlicher Vorsorge und Verlust Ihres Kindes und vermitteln Kontakte zu speziellen Beratungsdiensten oder Einrichtungen.',
  '47533',
  'Kleve',
  0,
  2,
  0,
  6181,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  825,
  0,
  'Rat und Hilfe - Die Schwangerschaftsberatung der Katholischen Kirche, Krefeld',
  null,
  '47798',
  'Krefeld',
  0,
  2,
  0,
  6182,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  826,
  2,
  'Schwangerschaftsberatungsstelle des SkF e.V. Münster',
  'Öffnungszeiten Mo. bis Do.. 9:00 bis 12:30 Uhr und von 13:30 bis 16:30 Uhr.  Fr. von 9:00 bis 12:30 und von 13:30 bis 15:00 Uhr  Beratung nach Terminvereinbarung.     ',
  '48155',
  'Münster',
  0,
  2,
  0,
  6183,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  827,
  2,
  'Schwangerschaftsberatung im Kreis Warendorf und Harsewinkel',
  'Öffnungszeiten der Beratungsstelle in Ahlen:  Montags, Dienstags, Donnerstags und Freitags: 08:30-12:30 Uhr   Mittwochs 14:00-18:00 Uhr,  Offene Sprechstunde Mittwochs von 16:00-18:00 Uhr,  weitere Termine nach Vereinbarung.  Wir bieten Sprechstunden in Ahlen, Warendorf, Oelde, Beckum und Harsewinkel an.  Termine für die Schwangerschaftsberatung unter 02382-88996-80 und für sexualpädagogische Projektanfragen unter 02382-88996-0.',
  '59227',
  'Ahlen',
  0,
  2,
  0,
  6184,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  828,
  2,
  'Schwangerschaftsberatung des SKF im Kreis Coesfeld',
  'In dieser Online-Beratungsstelle arbeiten die Beraterinnen des SKF aus den Orten  Coesfeld, Dülmen und Lüdinghausen.',
  null,
  'Coesfeld, Dülmen und Lüdinghausen ',
  0,
  2,
  0,
  6185,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  829,
  2,
  'Schwangerschaftsberatung Caritasverbandes Rheine e.V.',
  null,
  '48429',
  'Rheine',
  0,
  2,
  0,
  6186,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  830,
  2,
  'Schwangerschaftsberatung Ahaus',
  'Wir sind der SKF Ahaus-Vreden und haben Dienststellen in Ahaus, Schlossstraße 16, in Vreden, Kirchplatz 10 und in Gronau, Laubstiege 13a.',
  '48683',
  'Ahaus',
  0,
  2,
  0,
  6190,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  831,
  28,
  'Schwangerschaftsberatung Vechta',
  null,
  '49377',
  'Vechta',
  0,
  2,
  0,
  6195,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  832,
  28,
  'SkF Cloppenburg e.V. (Sozialdienst katholischer Frauen Cloppenburg e.V.)',
  null,
  '49661',
  'Cloppenburg',
  0,
  2,
  0,
  6197,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  833,
  0,
  'Caritas Familienberatung Aachen',
  null,
  '52064',
  'Aachen',
  0,
  2,
  0,
  6203,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  834,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der Katholischen Kirche, Stolberg',
  null,
  '52222',
  'Stolberg',
  0,
  2,
  0,
  6204,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  835,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der katholischen Kirche, Düren',
  null,
  '52351',
  'Düren',
  0,
  2,
  0,
  6205,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  836,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Bad Neuenahr-Ahrweiler',
  null,
  '53474',
  'Bad Neuenahr-Ahrweiler',
  0,
  2,
  0,
  6207,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  837,
  0,
  'Rat und Hilfe - die Schwangerschaftsberatung der Katholischen Kirche, Schleiden',
  null,
  '53937',
  'Schleiden',
  0,
  2,
  0,
  6208,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  838,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Trier',
  null,
  '54290',
  'Trier',
  0,
  2,
  0,
  6209,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  839,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Wittlich',
  null,
  '54516',
  'Wittlich',
  0,
  2,
  0,
  6211,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  840,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Bitburg',
  null,
  '54634',
  'Bitburg',
  0,
  2,
  0,
  6214,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  841,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Koblenz',
  null,
  '56068',
  'Koblenz',
  0,
  2,
  0,
  6222,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  842,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Cochem',
  null,
  '56812',
  'Cochem',
  0,
  2,
  0,
  6229,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  843,
  21,
  'Katholische Schwangerschaftsberatungsstelle Siegen',
  null,
  '57072',
  'Siegen',
  0,
  2,
  0,
  6230,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  844,
  21,
  'Katholische Schwangerschaftsberatungsstelle Olpe',
  null,
  '57462',
  'Olpe',
  0,
  2,
  0,
  6231,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  845,
  21,
  'Katholische Schwangerschaftsberatungsstelle Hagen',
  null,
  '58095',
  'Hagen',
  0,
  2,
  0,
  6233,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  846,
  10,
  'Schwangerschaftsberatungsstelle Schwelm',
  null,
  '58332',
  'Schwelm',
  0,
  2,
  0,
  6234,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  847,
  10,
  'Schwangerschaftsberatungsstelle Lüdenscheid',
  null,
  '58509',
  'Lüdenscheid',
  0,
  2,
  0,
  6235,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  848,
  10,
  'Schwangerschaftsberatungsstelle Altena',
  null,
  '58762',
  'Altena',
  0,
  2,
  0,
  6236,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  849,
  21,
  'Katholische Schwangerschaftsberatungsstellen Hamm',
  null,
  '59065',
  'Hamm',
  0,
  2,
  0,
  6237,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  850,
  2,
  'Schwangerschaftsberatung Werne',
  null,
  '59368',
  'Werne',
  0,
  2,
  0,
  6240,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  851,
  21,
  'Katholische Schwangerschaftsberatungsstelle Lippstadt',
  'Sie erreichen unsere Beratungsstelle:  Mo.  -  Do. 8.30  - 12.30,   Nachmittags von 14.00 bis 17.00  Damit wir Zeit für ein Gespräch einplanen können bitten wir Sie darum, telefonisch einen Termin zu verabreden.  ',
  '59555',
  'Lippstadt',
  0,
  2,
  0,
  6241,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  852,
  21,
  'Katholische Schwangerschaftsberatungsstelle Arnsberg',
  null,
  '59755',
  'Arnsberg',
  0,
  2,
  0,
  6242,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  853,
  21,
  'Katholische Schwangerschaftsberatungsstelle Meschede',
  null,
  '59872',
  'Meschede',
  0,
  2,
  0,
  6243,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  854,
  12,
  'Beratungsstelle für Schwangere, Familien und Familienplanung Bad Soden-Salmünsten',
  null,
  '63628',
  'Bad Soden-Salmünster',
  0,
  2,
  0,
  6248,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  855,
  12,
  'Beratungsstelle für Schwangere, Familien und Familienplanung Hanau',
  null,
  '63450',
  'Hanau',
  0,
  2,
  0,
  6251,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  856,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Saarbrücken',
  null,
  '66111',
  'Saarbrücken',
  0,
  2,
  0,
  6264,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  857,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Neunkirchen',
  null,
  '66538',
  'Neunkirchen',
  0,
  2,
  0,
  6267,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  858,
  26,
  'Katholische Beratungsstelle für Schwangerschaftsfragen St.Wendel',
  null,
  '66606',
  'St. Wendel',
  0,
  2,
  0,
  6268,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  859,
  11,
  'Schwangeren- und Familienberatung  Mannheim',
  'Beratungsstelle für Frauen und Familien zu Schwangerschaft und Eltern-Sein    Beratung  - zu psychosozialen, finanziellen und rechtlichen Fragestellungen,  - zu Pränataldiagnostik    Gruppenangebote    - Sexualpädagogik in Schulen und Jugendgruppen  - Elterngruppe  - A-Z für werdende Eltern',
  '68159',
  'Mannheim',
  0,
  2,
  0,
  6280,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  860,
  11,
  'Katholische Schwangerschaftsberatungsstelle Heidelberg ',
  null,
  '69126',
  'Heidelberg',
  0,
  2,
  0,
  6281,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  861,
  11,
  'Schwangerschaftsberatung Schwetzingen',
  null,
  '68723',
  'Schwetzingen',
  0,
  2,
  0,
  6282,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  862,
  11,
  'Katholische Schwangerschaftsberatungsstelle Hechingen',
  null,
  '72379',
  'Hechingen',
  0,
  2,
  0,
  6289,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  863,
  24,
  'Katholische Schwangerschaftsberatungsstelle Ost-Württemberg',
  null,
  '73525',
  'Schwäbisch Gmünd',
  0,
  2,
  0,
  6295,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  864,
  24,
  'Katholische Schwangerschaftsberatungsstelle der Region Heilbronn-Hohenlohe',
  null,
  '74523',
  'Schwäbisch Hall',
  0,
  2,
  0,
  6298,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  865,
  11,
  'Katholische Schwangerschaftsberatungsstelle Mosbach',
  null,
  '74821',
  'Mosbach',
  0,
  2,
  0,
  6303,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  866,
  11,
  'Katholische Schwangerschaftsberatungsstelle Karlsruhe',
  null,
  '76133',
  'Karlsruhe',
  0,
  2,
  0,
  6305,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  867,
  11,
  'Katholische Schwangerschaftsberatungsstelle Ettlingen',
  null,
  '76275',
  'Ettlingen',
  0,
  2,
  0,
  6306,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  868,
  11,
  'Katholische Schwangerschaftsberatungsstelle Baden-Baden',
  null,
  '76530',
  'Baden-Baden',
  0,
  2,
  0,
  6307,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  869,
  11,
  'Katholische Schwangerenberatungsstelle Bruchsal',
  'vor, während und nach der                            Schwangerschaft und bei allen damit      zusammenhängenden Fragen und      Problemen      bei Fragen zu Familienplanung,       Schwangerschaft, Geburt und       Elternschaft        bei finanziellen und sozialen Problemen        bei Fragen zu familienfördernden Leistungen        (Elterngeld, Kindergeld etc.), arbeitsrecht-      lichen Fragen und Wohnungsproblemen        bei Schwangerschaftskonflikten (ohne Be-      ratungsnachweis nach § 219 StGB) sowie       nach einem Schwangerschaftsabbruch        Fragen in Zusammenhang mit vorgeburtlicher        Diagnostik oder einer möglichen Behinderung       des Kindes        wenn Sie ein Kind durch Fehlgeburt, Totge-      burt oder plötzlichen Kindstod verloren haben        bei Konflikten in der Partnerschaft und/oder      in der Familie        wenn Sie sich als Eltern überfordert fühlen        wenn Sie allein erziehend sind  ',
  '76646',
  'Bruchsal',
  0,
  2,
  0,
  6308,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  870,
  11,
  'Katholische Schwangerschaftsberatungsstelle Achern',
  null,
  '77855',
  'Achern',
  0,
  2,
  0,
  6312,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  871,
  11,
  'Katholische Schwangerschaftsberatungsstelle Lahr',
  null,
  '77933',
  'Lahr',
  0,
  2,
  0,
  6313,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  872,
  11,
  'Katholische Schwangerschaftsberatungsstelle Villingen-Schwenningen',
  null,
  '78050',
  'Villingen-Schwenningen',
  0,
  2,
  0,
  6314,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  873,
  11,
  'Katholische Schwangerschaftsberatungsstelle Singen',
  null,
  '78224',
  'Singen',
  0,
  2,
  0,
  6315,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  874,
  11,
  'Katholische Schwangerenberatungsstelle am Stephansplatz',
  null,
  '78462',
  'Konstanz',
  0,
  2,
  0,
  6317,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  875,
  11,
  'Katholische Schwangerschaftsberatungsstelle Freiburg',
  null,
  '79111',
  'Freiburg',
  0,
  2,
  0,
  6321,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  876,
  11,
  'Katholische Schwangerschaftsberatungsstelle Waldkirch',
  null,
  '79183',
  'Waldkirch',
  0,
  2,
  0,
  6322,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  877,
  11,
  'Katholische Schwangerschaftsberatungsstelle Emmendingen',
  null,
  '79312',
  'Emmendingen',
  0,
  2,
  0,
  6324,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  878,
  11,
  'Katholische Schwangerschaftsberatungsstelle Lörrach',
  null,
  '79539',
  'Lörrach',
  0,
  2,
  0,
  6325,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  879,
  11,
  'Katholische Schwangerschaftsberatungsstelle Waldshut',
  null,
  '79761',
  'Waldshut',
  0,
  2,
  0,
  6327,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  880,
  11,
  'Katholische Schwangerschaftsberatungsstelle Titisee-Neustadt',
  null,
  '79822',
  'Titisee-Neustadt',
  0,
  2,
  0,
  6328,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  881,
  8,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Ingolstadt - Eichstätt',
  null,
  '85049',
  'Ingolstadt',
  0,
  2,
  0,
  6336,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  882,
  24,
  'Katholische Schwangerschaftsberatungsstelle Biberach',
  null,
  '88400',
  'Biberach',
  0,
  2,
  0,
  6344,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  883,
  11,
  'Katholische Schwangerschaftsberatungsstelle Überlingen',
  null,
  '88662',
  'Überlingen',
  0,
  2,
  0,
  6345,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  884,
  3,
  'Katholische Beratungsstelle für Schwangerschaftsfragen der Caritas, Ansbach',
  null,
  '91522',
  'Ansbach',
  0,
  2,
  0,
  6354,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  885,
  27,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Würzburg',
  'Wir sind während den Öffnungszeiten der Beratungsstellen erreichbar über Telefon und Fax . Darüber hinaus beteiligen wir uns an der bundesweiten virtuellen Beratungsstelle des Deutschen Caritasverbandes in der Chatberatung und sind über diese Internetadresse bei Angabe Ihrer Postleitzahl per Mail zu erreichen (www.beratung-caritas.de).    Ihre Beratungsstelle    Standorte in Würzburg, Kitzingen und Lohr',
  '97070',
  'Würzburg',
  0,
  2,
  0,
  6362,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  886,
  27,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Schweinfurt',
  null,
  '97421',
  'Schweinfurt',
  0,
  2,
  0,
  6364,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  887,
  11,
  'Katholische Schwangerschaftsberatungsstelle Tauberbischofsheim',
  null,
  '97941',
  'Tauberbischofsheim',
  0,
  2,
  0,
  6367,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  888,
  7,
  'Schwangerschaftsberatungsstelle Leipzig',
  null,
  '04109',
  'Leipzig',
  0,
  2,
  0,
  6376,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  889,
  11,
  'Katholische Schwangerschaftsberatungsstelle Offenburg',
  null,
  '77654',
  'Offenburg',
  0,
  2,
  0,
  6380,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  890,
  1,
  'Caritasverband Rheinberg e. V. Schwangerschaftsberatung',
  null,
  '51465',
  'Bergisch Gladbach',
  0,
  2,
  0,
  6639,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  891,
  1,
  'Caritasverband Bonn e. V.',
  null,
  '53113',
  'Bonn',
  0,
  2,
  0,
  6640,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  892,
  1,
  'Caritasverband Rhein-Kreis Neuss e. V.',
  null,
  '41539',
  'Dormagen/Grevenbroich',
  0,
  2,
  0,
  6641,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  893,
  1,
  'Sozialdienst katholischer Frauen und Männer Düsseldorf e.V.',
  'Schwangerschaftsberatung vor, während und nach einer Schwangerschaft',
  '40476',
  'Düsseldorf',
  0,
  2,
  0,
  6642,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  894,
  1,
  'Caritasverband für das Kreisdekanat Euskirchen e. V.',
  null,
  '53879',
  'Euskirchen',
  0,
  2,
  0,
  6643,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  895,
  1,
  'Sozialdienst katholischer Frauen Erftkreis e. V.',
  null,
  '50354',
  'Hürth',
  0,
  2,
  0,
  6644,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  896,
  1,
  'Caritasverband für den Oberbergischen Kreis e. V.',
  null,
  '51643',
  'Gummersbach',
  0,
  2,
  0,
  6645,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  897,
  1,
  'Sozialdienst katholischer Frauen Köln e. V.',
  null,
  '50670',
  'Köln',
  0,
  2,
  0,
  6646,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  898,
  1,
  'Sozialdienst katholischer Frauen Leverkusen e. V.',
  null,
  '51379',
  'Leverkusen',
  0,
  2,
  0,
  6647,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  899,
  1,
  'Sozialdienst Katholischer Frauen und Männer Mettmann e. V. ',
  null,
  '40822',
  'Mettmann',
  0,
  2,
  0,
  6648,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  900,
  1,
  'Sozialdienst katholischer Frauen e. V. Neuss',
  null,
  '41468',
  'Neuss',
  0,
  2,
  0,
  6649,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  901,
  1,
  'Caritasverband Remscheid e. V.',
  null,
  '42853',
  'Remscheid',
  0,
  2,
  0,
  6650,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  902,
  1,
  'Sozialdienst katholischer Frauen für den Rhein-Sieg-Kreis e. V.',
  'Testbeschreibung',
  '53721',
  'Siegburg',
  0,
  2,
  0,
  6651,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  903,
  1,
  'Caritasverband Solingen e. V.',
  null,
  '42651',
  'Solingen',
  0,
  2,
  0,
  6652,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  904,
  1,
  'Caritasverband Wuppertal e. V.',
  null,
  '42103',
  'Wuppertal',
  0,
  2,
  0,
  6653,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  905,
  20,
  'Schwangerschaftsberatung der Beratungsstellen Bremen und Twistringen',
  'Weitere Informationen zur Schwangerschaftsberatung Bremen und Twistringen finden sie über die Adresssuche bei den jeweiligen Beratungsstellen  (Onlineberatung=nein).     ',
  null,
  'Bremen und Twistringen',
  0,
  2,
  0,
  7633,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  906,
  20,
  'Schwangerschaftsberatung der Beratungsstellen Esterwegen, Papenburg und Sögel',
  'Weitere Informationen zur Schwangerschaftsberatung Esterwegen, Papenburg und Sögel finden sie über die Adresssuche bei den jeweiligen Beratungsstellen  (Onlineberatung=nein).     ',
  null,
  'Esterwegen, Papenburg und Sögel',
  0,
  2,
  0,
  7634,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  907,
  20,
  'Schwangerschaftsberatung der Beratungsstellen Lingen, Meppen und Nordhorn',
  'Weitere Informationen zur Schwangerschaftsberatung Lingen, Meppen und Nordhorn finden sie über die Adresssuche bei den jeweiligen Beratungsstellen  (Onlineberatung=nein).    ',
  null,
  'Lingen, Meppen und Nordhorn',
  0,
  2,
  0,
  7635,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  908,
  20,
  'Schwangerschaftsberatung der Beratungsstellen Bersenbrück und Osnabrück',
  'Weitere Informationen zur Schwangerschaftsberatung Bersenbrück und Osnabrück finden sie über die Adresssuche bei den jeweiligen Beratungsstellen  (Onlineberatung=nein).    ',
  null,
  'Bersenbrück und Osnabrück',
  0,
  2,
  0,
  7636,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  909,
  15,
  'Online-Beratungsstelle der Caritas und des SKF Hildesheim',
  null,
  '31134',
  'Hildesheim',
  0,
  2,
  0,
  7707,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  910,
  10,
  'Caritascentrum Nord',
  null,
  '47166',
  'Duisburg',
  0,
  2,
  0,
  7756,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  911,
  24,
  'Onlineberatungsstelle der Region Bodensee Oberschwaben',
  'Diese Virtuelle Beratungsstelle umfasst die folgenden drei Katholischen Schwangerschaftsberatungsstellen:      Friedrichshafen:  Katharinenstraße 16 88045 Friedrichshafen  -  Tel.:  07541/30 00 0    Ravensburg:  Seestraße 44 88214 Ravensburg  -  Tel.:  0751/36256-0   Leutkirch:  Marienplatz 11  88299 Leutkirch-  Tel.:  07561/1340 ',
  null,
  null,
  0,
  2,
  0,
  8572,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  912,
  24,
  'Onlineberatungsstelle der Region Fils-Neckar-Alb',
  'Diese Virtuelle Beratungsstelle umfasst die folgenden zwei Katholischen Schwangerschaftsberatungsstellen:      Göppingen:  Ziegelstr. 14, 73033 Göppingen   -  Tel.:   07161/65858-11   Reutlingen:  Kaiserstraße 27, 72764 Reutlingen  -  Tel.:   07121/1656-0 ',
  null,
  null,
  0,
  2,
  0,
  8573,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  913,
  24,
  'Onlineberatungsstelle Rottweil-Albstadt-Tuttlingen',
  'Diese Virtuelle Beratungsstelle umfasst die folgenden drei Katholischen Schwangerschaftsberatungsstellen:      Albstadt:  August-Sauter-Straße 21 72458 Albstadt-  Tel.: 07431/95732-0    Rottweil:  Königstr.47 78628 Rottweil  -  Tel.:  0741/246-135  Tuttlingen:  Bergstr.14 78532 Tuttlingen -  Tel.:  07461/969717-0 ',
  null,
  null,
  0,
  2,
  0,
  8574,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  914,
  24,
  'Onlineberatungsstelle der Region Schwarzwald-Gäu',
  'Diese Virtuelle Beratungsstelle umfasst die folgenden drei Katholischen Schwangerschaftsberatungsstellen:      Böblingen:  Hanns-Klemm-Str. 1A 71034 Böblingen   -  Tel.:   07031/649610   Calw:  Biergasse 11 75365 Calw   -  Tel.:   07051/9259-0   Tübingen:  Albrechtstraße 4 72072 Tübingen -  Tel.:   07071/7962-30 ',
  null,
  null,
  0,
  2,
  0,
  8575,
  '2019-08-23 08:52:05',
  '2019-08-23 08:52:05',
  null
), (
  915,
  9,
  'Caritas-Region Eichsfeld-Nordthüringen Caritas in Mühlhausen',
  null,
  '99974',
  'Mühlhausen',
  0,
  4,
  0,
  7083,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  916,
  9,
  'Caritas Gotha',
  null,
  '99867',
  'Gotha',
  0,
  4,
  0,
  7084,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  917,
  9,
  'Caritas-Region Südthüringen Caritas in Meiningen-Suhl',
  null,
  '98544',
  'Meiningen',
  0,
  4,
  0,
  7086,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  918,
  3,
  'Caritasverband für den Landkreis Kronach e.V.',
  null,
  '96317',
  'Kronach',
  0,
  4,
  0,
  7087,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  919,
  3,
  'Caritasverband für den Landkreis Lichtenfels e.V.',
  null,
  '96215',
  'Lichtenfels',
  0,
  4,
  0,
  7088,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  920,
  3,
  'Caritasverband für den Landkreis Bamberg e.V. --- Kur- und Erholung ---',
  'Kur- und Erholungsmaßnahmen für Kinder, Mütter, Väter und Senioren.  Vermittlung von Familienpflege.',
  '96052',
  'Bamberg',
  0,
  4,
  0,
  7089,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  921,
  3,
  'Caritasverband für die Stadt Bamberg e.V',
  null,
  '96047',
  'Bamberg',
  0,
  4,
  0,
  7090,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  922,
  23,
  'Caritasverband Tirschenreuth e. V.',
  null,
  '95643',
  'Tirschenreuth',
  0,
  4,
  0,
  7091,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  923,
  23,
  'Caritassekretariat Wunsiedel',
  null,
  '95632',
  'Wunsiedel',
  0,
  4,
  0,
  7092,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  924,
  3,
  'Caritasverband für die Stadt und den Landkreis Bayreuth e.V.',
  null,
  '95444',
  'Bayreuth',
  0,
  4,
  0,
  7093,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  925,
  3,
  'Caritasverband für den Landkreis Kulmbach e.V.',
  null,
  '95326',
  'Kulmbach',
  0,
  4,
  0,
  7094,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  926,
  3,
  'Caritasverband des Stadt- und Landkreises Hof e.V.',
  null,
  '95028',
  'Hof',
  0,
  4,
  0,
  7095,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  927,
  23,
  'Caritasverband Deggendorf',
  null,
  '94469',
  'Deggendorf',
  0,
  4,
  0,
  7096,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  928,
  22,
  'Caritasverband Isar / Vils e.V. ; Landau / Isar',
  null,
  '94405',
  'Landau',
  0,
  4,
  0,
  7097,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  929,
  23,
  'Caritasverband Straubing',
  null,
  '94315',
  'Straubing',
  0,
  4,
  0,
  7098,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  930,
  23,
  'Caritasverband Cham',
  null,
  '93413',
  'Cham',
  0,
  4,
  0,
  7100,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  931,
  23,
  'Caritasverband Kelheim',
  'Allgemeine Sozialberatung   ',
  '93309',
  'Kelheim',
  0,
  4,
  0,
  7101,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  932,
  23,
  'Kath. Arbeitsgemeinschaft für Müttergenesung Diözese Regensburg',
  null,
  '93047',
  'Regensburg',
  0,
  4,
  0,
  7102,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  933,
  23,
  'Caritasverband Schwandorf',
  null,
  '92421',
  'Schwandorf',
  0,
  4,
  0,
  7104,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  934,
  8,
  'Caritas-Kreisstelle Neumarkt',
  null,
  '92318',
  'Neumarkt',
  0,
  4,
  0,
  7105,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  935,
  23,
  'Caritasverband Amberg',
  null,
  '92224',
  'Amberg',
  0,
  4,
  0,
  7106,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  936,
  8,
  'Caritas-Kreisstelle Weißenburg',
  null,
  '91781',
  'Weißenburg',
  0,
  4,
  0,
  7107,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  937,
  3,
  'Caritasverband für den Landkreis Neustadt/Aisch-Bad Windsheim e.V.',
  null,
  '91413',
  'Neustadt/Aisch',
  0,
  4,
  0,
  7108,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  938,
  3,
  'Caritasverband im Landkreis Nürnberger Land e.V.',
  null,
  '91207',
  'Lauf',
  0,
  4,
  0,
  7109,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  939,
  8,
  'Caritas-Kreisstelle Nürnberg-Langwasser',
  null,
  '90473',
  'Nürnberg',
  0,
  4,
  0,
  7110,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  940,
  3,
  'Caritasverband Nürnberg e.V.',
  null,
  '90403',
  'Nürnberg',
  0,
  4,
  0,
  7111,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  941,
  5,
  'Kath. Arbeitsgemeinschaft für Müttergenesung',
  null,
  '86152',
  'Augsburg',
  0,
  4,
  0,
  7112,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  942,
  23,
  'Caritassekretariat Kösching',
  null,
  '85092',
  'Kösching',
  0,
  4,
  0,
  7113,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  943,
  8,
  'Caritas-Kreisstelle Eichstätt',
  null,
  '85072',
  'Eichstätt',
  0,
  4,
  0,
  7114,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  944,
  22,
  'Kreis-Caritasverband Burghausen e.V.',
  null,
  '84489',
  'Burghausen',
  0,
  4,
  0,
  7115,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  945,
  23,
  'Caritasverband Dingolfing',
  null,
  '84130',
  'Dingolfing',
  0,
  4,
  0,
  7117,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  946,
  23,
  'Caritasverband Landshut',
  null,
  '84028',
  'Landshut',
  0,
  4,
  0,
  7118,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  947,
  26,
  'Caritasverband Saar-Hochwald e. V.',
  null,
  '66740',
  'Saarlouis',
  0,
  4,
  0,
  7119,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  948,
  21,
  'Caritasverband Brilon e.V.',
  null,
  '59929',
  'Brilon',
  0,
  4,
  0,
  7121,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  949,
  21,
  'Caritasverband Meschede e.V.',
  null,
  '59872',
  'Meschede',
  0,
  4,
  0,
  7122,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  950,
  21,
  'Caritasverband Arnsberg-Sundern e.V.',
  null,
  '59821',
  'Arnsberg',
  0,
  4,
  0,
  7123,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  951,
  2,
  'Caritasverband Beckum',
  null,
  '59269',
  'Beckum',
  0,
  4,
  0,
  7125,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  952,
  2,
  'Caritasverband Ahlen',
  null,
  '59227',
  'Ahlen',
  0,
  4,
  0,
  7126,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  953,
  10,
  'Caritasverband für das Kreisdekanat Altena-Lüdenscheid e.V.',
  null,
  '58762',
  'Altena',
  0,
  4,
  0,
  7128,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  954,
  21,
  'Caritasverband für das Dekanat Witten e.V.',
  null,
  '58452',
  'Witten',
  0,
  4,
  0,
  7129,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  955,
  10,
  'Caritasverband für das Dekanat Schwelm e.V.',
  null,
  '58332',
  'Schwelm',
  0,
  4,
  0,
  7130,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  956,
  21,
  'Caritasverband Hagen e.V.',
  null,
  '58095',
  'Hagen',
  0,
  4,
  0,
  7131,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  957,
  21,
  'Caritas-AufWind Olpe',
  null,
  '57462',
  'Olpe',
  0,
  4,
  0,
  7132,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  958,
  26,
  'Caritasverband Region Rhein-Mosel-Ahr e.V.',
  null,
  '56626',
  'Andernach',
  0,
  4,
  0,
  7134,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  959,
  26,
  'Caritasverband Koblenz',
  null,
  '56068',
  'Koblenz',
  0,
  4,
  0,
  7136,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  960,
  26,
  'Geschäftsstelle Daun',
  null,
  '54550',
  'Daun',
  0,
  4,
  0,
  7137,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  961,
  26,
  'Caritasverband f. d. Region Trier e.V.',
  null,
  '54329',
  'Konz',
  0,
  4,
  0,
  7138,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  962,
  26,
  'Caritasverband f. d. Region Trier e.V.',
  null,
  '54292',
  'Trier',
  0,
  4,
  0,
  7139,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  963,
  0,
  'Caritasverband für die Region Eifel e.V.',
  null,
  '53937',
  'Schleiden',
  0,
  4,
  0,
  7140,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  964,
  0,
  'Caritasverband für die Region Heinsberg e.V.',
  null,
  '52525',
  'Heinsberg',
  0,
  4,
  0,
  7141,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  965,
  0,
  'Caritasverband für die Region Düren-Jülich e.V.',
  null,
  '52351',
  'Düren',
  0,
  4,
  0,
  7142,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  966,
  1,
  'Geschäftsstelle KAG Müttergensung',
  null,
  '50676',
  'Köln',
  0,
  4,
  0,
  7143,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  967,
  20,
  'Caritasverband für den Landkreis Emsland Beratungsstelle Lingen',
  null,
  '49808',
  'Lingen',
  0,
  4,
  0,
  7144,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  968,
  20,
  'Caritasverband für den Landkreis Emsland, Beratungsstelle Sögel',
  null,
  '49751',
  'Sögel',
  0,
  4,
  0,
  7145,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  969,
  20,
  'Caritasverband für den Landkreis Emsland',
  null,
  '49716',
  'Meppen',
  0,
  4,
  0,
  7146,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  970,
  2,
  'Caritasverband Ibbenbüren',
  null,
  '49477',
  'Ibbenbüren',
  0,
  4,
  0,
  7148,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  971,
  20,
  'Caritasverband für die Stadt und den Landkreis Osnabrück',
  'Virtuelle Beratungsstelle des Online-Beratungs-Teams der Kurberatungen Melle, Bersenbrück und Osnabrück.',
  '49074',
  'Osnabrück',
  0,
  4,
  0,
  7151,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  972,
  2,
  'Sozialdienst Kath. Frauen',
  null,
  '48691',
  'Vreden',
  0,
  4,
  0,
  7153,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  973,
  2,
  'Caritasverband Coesfeld',
  null,
  '48653',
  'Coesfeld',
  0,
  4,
  0,
  7154,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  974,
  2,
  'Caritas Kurberatung für Mütter/Väter aus Ahaus, Gronau, Heek, Schöppingen und Legden',
  'Beratung und Hilfe für Mutter-Vater-Kind-Kuren nach §24 SGB V und §41 SGB V  für Ratsuchende auch Ahaus, Gronau, Heek, Legden und Schöppingen, sowie  für die dazu gehörigen Ortschaften',
  '48599',
  'Gronau',
  0,
  4,
  0,
  7155,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  975,
  20,
  'Caritasverband für den Landkreis Grafschaft Bentheim, Kurberatung',
  null,
  '48529',
  'Nordhorn',
  0,
  4,
  0,
  7156,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  976,
  2,
  'Caritasverband Rheine',
  null,
  '48429',
  'Rheine',
  0,
  4,
  0,
  7157,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  977,
  2,
  'Caritasverband Emsdetten',
  null,
  '48282',
  'Emsdetten',
  0,
  4,
  0,
  7158,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  978,
  2,
  'Caritasverband im Kreisdekanat Warendorf e.V.',
  null,
  '48231',
  'Warendorf',
  0,
  4,
  0,
  7159,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  979,
  2,
  'Caritasverband Münster',
  null,
  '48151',
  'Münster',
  0,
  4,
  0,
  7160,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  980,
  2,
  'Caritasverband Geldern_Kevelaer e.V.',
  null,
  '47608',
  'Geldern',
  0,
  4,
  0,
  7161,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  981,
  2,
  'Caritasverband Kleve e.V.',
  null,
  '47533',
  'Kleve',
  0,
  4,
  0,
  7162,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  982,
  2,
  'Caritasverband Moers',
  null,
  '47495',
  'Rheinberg',
  0,
  4,
  0,
  7163,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  983,
  10,
  'Caritasverband für die Stadt Duisburg e.V.',
  null,
  '47051',
  'Duisburg',
  0,
  4,
  0,
  7164,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  984,
  2,
  'Caritasverband für die Dekanate Dinslaken und Wesel',
  null,
  '46483',
  'Wesel',
  0,
  4,
  0,
  7166,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  985,
  2,
  'Caritasverband Bocholt',
  null,
  '46399',
  'Bocholt',
  0,
  4,
  0,
  7167,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  986,
  2,
  'Caritasverband Borken',
  null,
  '46325',
  'Borken',
  0,
  4,
  0,
  7168,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  987,
  2,
  'Caritasverband Dorsten',
  null,
  '46282',
  'Dorsten',
  0,
  4,
  0,
  7169,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  988,
  10,
  'Caritasverband für die Stadt Bottrop e.V.',
  null,
  '46242',
  'Bottrop',
  0,
  4,
  0,
  7170,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  989,
  10,
  'Caritasverband für die Stadt Gelsenkirchen e.V.',
  null,
  '45879',
  'Gelsenkirchen',
  0,
  4,
  0,
  7172,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  990,
  2,
  'Caritasverband Marl',
  null,
  '45768',
  'Marl',
  0,
  4,
  0,
  7173,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  991,
  2,
  'Caritasverband Waltrop/Oer-Erkenschwick',
  null,
  '45731',
  'Waltrop',
  0,
  4,
  0,
  7174,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  992,
  2,
  'Caritasverband Haltern',
  null,
  '45721',
  'Haltern',
  0,
  4,
  0,
  7175,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  993,
  2,
  'Caritasverband Datteln',
  null,
  '45711',
  'Datteln',
  0,
  4,
  0,
  7176,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  994,
  2,
  'Caritasverband Herten',
  null,
  '45699',
  'Herten',
  0,
  4,
  0,
  7177,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  995,
  2,
  'Caritasverband Recklinghausen',
  null,
  '45659',
  'Recklinghausen',
  0,
  4,
  0,
  7178,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  996,
  10,
  'Caritasverband Ennepe-Ruhr',
  null,
  '45525',
  'Hattingen',
  0,
  4,
  0,
  7179,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  997,
  10,
  'Caritas-Zentrum Wattenscheid ',
  null,
  '44866',
  'Bochum/Wattenscheid',
  0,
  4,
  0,
  7181,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  998,
  0,
  'Caritasverband für die Region Kempen-Viersen e.V.',
  null,
  '41748',
  'Viersen',
  0,
  4,
  0,
  7184,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  999,
  1,
  'Kath. Arbeitsgemeinschaft für Müttergenesung - Beratungsstelle  Düsseldorf',
  'Sozialdienst katholischer Frauen und Männer Düsseldorf e. V.',
  '40476',
  'Düsseldorf',
  0,
  4,
  0,
  7185,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1000,
  17,
  'Caritasverband für das Dekanat Stendal',
  null,
  '39576',
  'Stendal',
  0,
  4,
  0,
  7186,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1001,
  17,
  'Caritas Regionalverband Magdeburg',
  null,
  '39104',
  'Magdeburg',
  0,
  4,
  0,
  7187,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1002,
  17,
  'Caritasverband für das Dekanat Halberstadt',
  null,
  '38820',
  'Halberstadt',
  0,
  4,
  0,
  7188,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1003,
  15,
  'Caritasverband Salzgitter',
  null,
  '38226',
  'Salzgitter',
  0,
  4,
  0,
  7189,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1004,
  15,
  'Caritasverband Northeim',
  null,
  '37154',
  'Northeim',
  0,
  4,
  0,
  7190,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1005,
  4,
  'Zentrale Informations- und Beratungsstelle',
  'Weitere Beratungsstellen finden Sie unter www.kag-muettergenesung.de oder 0180/1400140',
  null,
  'Paderborn',
  0,
  4,
  0,
  7191,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1006,
  21,
  'Caritasverband Paderborn e.V.',
  null,
  '33098',
  'Paderborn',
  0,
  4,
  0,
  7192,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1007,
  21,
  'Caritasverband für den Kreis Lippe und die Stadt Bad Pyrmont e.V.',
  null,
  '32756',
  'Detmold',
  0,
  4,
  0,
  7193,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1008,
  21,
  'Caritasverband für die Stadt und den Kreis Herford e.V.',
  null,
  '32052',
  'Herford',
  0,
  4,
  0,
  7194,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1009,
  15,
  'Caritasverband im Weserbergland e. V.',
  null,
  '37603',
  'Holzminden',
  0,
  4,
  0,
  7195,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1010,
  20,
  'Caritasverband für die Landkreise Diepholz und Nienburg links der Weser Beratungsstelle Stolzenau',
  null,
  '31592',
  'Stolzenau',
  0,
  4,
  0,
  7196,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1011,
  15,
  'Caritasverband Bremen-Nord e.V.',
  null,
  '28757',
  'Bremen',
  0,
  4,
  0,
  7198,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1012,
  20,
  'Sozialdienst katholischer Frauen e.V., Ortsverein Bremen',
  'Mütter- und Mutter-Vater-Kind-Kurenberatungsstelle',
  '28195',
  'Bremen',
  0,
  4,
  0,
  7199,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1013,
  20,
  'Caritasverband für die Landkreise Diepholz und Nienburg links der Weser',
  null,
  '27239',
  'Twistringen',
  0,
  4,
  0,
  7200,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1014,
  28,
  'Caritasverband im Kreis Wesermarsch e.V.',
  null,
  '26919',
  'Brake-Wesermarsch',
  0,
  4,
  0,
  7201,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1015,
  20,
  'Caritasverband für den Landkreis Emsland Beratungsstelle Papenburg',
  null,
  '26871',
  'Papenburg',
  0,
  4,
  0,
  7202,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1016,
  20,
  'Caritasverband Ostfriesland Beratungsstelle Leer',
  null,
  '26789',
  'Leer',
  0,
  4,
  0,
  7203,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1017,
  20,
  'Caritasverband Ostfriesland Beratungsstelle Emden',
  null,
  '26725',
  'Emden',
  0,
  4,
  0,
  7204,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1018,
  28,
  'Caritas-Sozialwerk St. Elisabeth Friesoythe',
  null,
  '26169',
  'Friesoythe',
  0,
  4,
  0,
  7205,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1019,
  14,
  'Caritasverband für das Erzbistum Hamburg e. V. - Regionalstelle Flensburg',
  null,
  '24937',
  'Flensburg',
  0,
  4,
  0,
  7207,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1020,
  14,
  'Caritasverband für das Erzbistum Hamburg e. V. - Regionalstelle Neumünster',
  null,
  '24534',
  'Neumünster',
  0,
  4,
  0,
  7208,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1021,
  14,
  'Caritasverband für das Erzbistum Hamburg e. V. - Landesstelle Schleswig-Holstein',
  'Kurberatung und -vermittlung',
  '24113',
  'Kiel',
  0,
  4,
  0,
  7209,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1022,
  14,
  'Caritasverband für das Erzbistum Hamburg e. V. - Regionalstelle Lübeck',
  null,
  '23552',
  'Lübeck',
  0,
  4,
  0,
  7210,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1023,
  15,
  'Caritasverband für den Landkreis Harburg e.V..',
  null,
  '21423',
  'Winsen/Luhe',
  0,
  4,
  0,
  7211,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1024,
  14,
  'Caritas Kurberatung',
  null,
  '20099',
  'Hamburg',
  0,
  4,
  0,
  7212,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1025,
  14,
  'Kreiscaritasverband Mecklenburg e. V.',
  null,
  '19053',
  'Schwerin',
  0,
  4,
  0,
  7213,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1026,
  14,
  'Caritas Mecklenburg e.V.',
  null,
  '18055',
  'Rostock',
  0,
  4,
  0,
  7214,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1027,
  6,
  'Stadtcaritas',
  null,
  '17489',
  'Greifswald',
  0,
  4,
  0,
  7215,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1028,
  13,
  'Caritas-Beratungsstelle Lübben',
  null,
  '15907',
  'Lübben',
  0,
  4,
  0,
  7216,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1029,
  13,
  'Caritas-Dienststelle Eisenhüttenstadt',
  null,
  '15890',
  'Eisenhüttenstadt',
  0,
  4,
  0,
  7217,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1030,
  6,
  'Caritas Region Brandenburg',
  'Caritasverband für das Erzbistum Berlin e. V. - Region Brandenburg -   Allgemeine Sozialberatung in Frankfurt (Oder)',
  '15232',
  'Frankfurt (Oder)',
  0,
  4,
  0,
  7218,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1031,
  17,
  'Caritasberatungsstelle Wittenberg',
  null,
  '06886',
  'Lutherstadt-Wittenberg',
  0,
  4,
  0,
  7220,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1032,
  17,
  'Caritasverband für das Dekanat Dessau',
  null,
  '06844',
  'Dessau',
  0,
  4,
  0,
  7221,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1033,
  17,
  'Caritasverband für das Bistum Magdeburg e. V.',
  null,
  '06749',
  'Bitterfeld-Wolfen OT Bitterfeld',
  0,
  4,
  0,
  7222,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1034,
  17,
  'Caritasverband für das Dekanat Naumburg - Zeitz',
  null,
  '06667',
  'Weißenfels',
  0,
  4,
  0,
  7223,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1035,
  17,
  'Caritasverband für das Dekanat Bernburg',
  null,
  '06406',
  'Bernburg',
  0,
  4,
  0,
  7224,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1036,
  17,
  'Caritasberatungsstelle Lutherstadt Eisleben',
  null,
  '06295',
  'Lutherstadt -Eisleben',
  0,
  4,
  0,
  7225,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1037,
  17,
  'Caritas Regionalverband Halle e.V.',
  null,
  '06110',
  'Halle',
  0,
  4,
  0,
  7226,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1038,
  17,
  'Caritasverband für das Dekanat Torgau',
  null,
  '04924',
  'Bad Liebenwerda',
  0,
  4,
  0,
  7227,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1039,
  17,
  'Caritasverband für das Dekanat Torgau',
  null,
  '04860',
  'Torgau',
  0,
  4,
  0,
  7228,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1040,
  13,
  'Caritas-Regionalstelle',
  null,
  '03046',
  'Cottbus',
  0,
  4,
  0,
  7229,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1041,
  13,
  'Caritas-Kreisstelle',
  null,
  '02826',
  'Görlitz',
  0,
  4,
  0,
  7230,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1042,
  8,
  'Caritas-Kreisstelle Ingolstadt',
  null,
  '85049',
  'Ingolstadt',
  0,
  4,
  0,
  7231,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1043,
  24,
  'Kath. Arbeitnehmerbewegung (KAB)',
  'Frauen und Gesundheitsberatung',
  '70597',
  'Stuttgart',
  0,
  4,
  0,
  7232,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1044,
  28,
  'Caritas-Sozialwerk St. Elisabeth Lohne',
  null,
  '49393',
  'Lohne',
  0,
  4,
  0,
  7233,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1045,
  28,
  'Landes - Caritasverband für Oldenburg e. V.',
  null,
  '49377',
  'Vechta',
  0,
  4,
  0,
  7234,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1046,
  28,
  'Caritasverband für Delmenhorst',
  null,
  '27749',
  'Delmenhorst',
  0,
  4,
  0,
  7235,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1047,
  28,
  'Caritasverband f. d. Dekanat Wilhelmshaven e. V.',
  null,
  '26384',
  'Wilhelmshaven',
  0,
  4,
  0,
  7236,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1048,
  28,
  'Caritasverband Oldenburg-Ammerland e. V.',
  null,
  '26121',
  'Oldenburg',
  0,
  4,
  0,
  7237,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1049,
  11,
  'KAG-Bundesgeschäftsstelle',
  'Bundesgeschäftsstelle der KAG Müttergenesung',
  '79104',
  'Freiburg',
  0,
  4,
  0,
  7240,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1050,
  3,
  'KAG Müttergenesung Caritasverband Ansbach',
  null,
  '91522',
  'Ansbach',
  0,
  4,
  0,
  7387,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1051,
  3,
  'KAG Müttergenesung, Caritasverband Forchheim',
  null,
  '91301',
  'Forchheim',
  0,
  4,
  0,
  7389,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1052,
  11,
  'Caritasverband für das Dekanat Zollern e.V., Hechingen, Kurberatung',
  null,
  '72379',
  'Hechingen',
  0,
  4,
  0,
  7427,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1053,
  11,
  'Caritasverband im Landkreis Sigmaringen e.V., Sigmaringen',
  null,
  '72488',
  'Sigmaringen',
  0,
  4,
  0,
  7433,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1054,
  11,
  'Caritasverband Singen e.V., Außenstelle Stockach',
  null,
  '78333',
  'Stockach',
  0,
  4,
  0,
  7434,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1055,
  11,
  'Caritasverband Singen e.V., Aussenstelle Radolfzell',
  null,
  '78315',
  'Radolfzell',
  0,
  4,
  0,
  7435,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1056,
  11,
  'Caritasverband für das Dekanat Linzgau e.V., Überlingen',
  null,
  '88662',
  'Überlingen',
  0,
  4,
  0,
  7436,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1057,
  11,
  'Caritasverband für den Schwarzwald-Baar-Kreis e.V.',
  null,
  '78050',
  'Villingen-Schwenningen',
  0,
  4,
  0,
  7444,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1058,
  11,
  'Zentrale des Caritasverband Hochrhein e.V., Waldshut-Tiengen',
  'Zuständig für die Postleitzahlen-Gebiete: 79829-79838; 79860-79862; 79678-79682  ',
  '79761',
  'Waldshut-Tiengen',
  0,
  4,
  0,
  7447,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1059,
  11,
  'Caritasverband im Tauberkreis e.V., Tauberbischofsheim',
  null,
  '97941',
  'Tauberbischofsheim',
  0,
  4,
  0,
  7453,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1060,
  21,
  'Caritasverband für den Kreis Soest e.V., Geschäftsstelle Lippstadt',
  null,
  '59555',
  'Lippstadt',
  0,
  4,
  0,
  7454,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1061,
  17,
  'Caritasverband für das Bistum Magdeburg e.V., Magdeburg',
  null,
  '39112',
  'Magdeburg',
  0,
  4,
  0,
  7460,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1062,
  27,
  'Caritasverband Aschaffenburg - Stadt und Landkreis',
  null,
  '63739',
  'Aschaffenburg',
  0,
  4,
  0,
  7465,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1063,
  21,
  'Caritasverband Herne - Wanne-Eickel',
  null,
  '44649',
  'Herne',
  0,
  4,
  0,
  7466,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1064,
  23,
  'Caritassekretariat Viechtach',
  null,
  '94234',
  'Viechtach',
  0,
  4,
  0,
  7588,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1065,
  26,
  'Caritasverband für Saarbrücken und Umgebung e.V., Beratungszentrum Völklingen',
  null,
  '66333',
  'Völklingen',
  0,
  4,
  0,
  7612,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1066,
  26,
  'Caritasverband für die Region Schaumburg-Blies e.V.',
  null,
  '66538',
  'Neunkirchen',
  0,
  4,
  0,
  7613,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1067,
  27,
  'Caritasverband für die Diözese Würzburg e. V.',
  null,
  '97070',
  'Würzburg',
  0,
  4,
  0,
  7671,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1068,
  1,
  'Caritasverband für die Stadt Bonn e.V. - Abteilung Kurberatung',
  null,
  '53113',
  'Bonn',
  0,
  4,
  0,
  7675,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1069,
  1,
  'Caritas-Beratungsstelle (CBS)  Kerpen',
  null,
  '50171',
  'Kerpen',
  0,
  4,
  0,
  7682,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1070,
  1,
  'Caritas Beratungsstelle Brühl',
  null,
  '50321',
  'Brühl',
  0,
  4,
  0,
  7684,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1071,
  1,
  'Beratungsstelle für Mutter-Kind-Kuren, Dormagen',
  null,
  '41539',
  'Dormagen',
  0,
  4,
  0,
  7687,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1072,
  1,
  'Caritasverband des Rheinisch-Bergischen Kreises e.V., Kurberatung',
  null,
  '51465',
  'Bergisch Gladbach',
  0,
  4,
  0,
  7689,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1073,
  1,
  'Caritas-Beratungsstelle (CBS) Frechen',
  null,
  '50226',
  'Frechen',
  0,
  4,
  0,
  7690,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1074,
  1,
  'Caritasberatungsstelle Wesseling',
  null,
  '50389',
  'Wesseling',
  0,
  4,
  0,
  7693,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1075,
  21,
  'Caritasverband für die Stadt Castrop-Rauxel e. V.',
  null,
  '44575',
  'Castrop-Rauxel',
  0,
  4,
  0,
  7697,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1076,
  1,
  'Caritasverband Rhein-Sieg-Kreis',
  'Beratung und Unterstützung:  beim Antragsverfahren in Zusammenarbeit mit den Krankenkassen  über die Angebote in den Häusern des Müttergenesungswerkes  bei der Auswahl der für Sie geeigneten Mütter- oder Mutter-Kind-Einrichtung  über finanzielle Unterstützung durch das Müttergenesungswerk  über Möglichkeiten und Angebote der Kurnachsorge.',
  '53721',
  'Siegburg',
  0,
  4,
  0,
  7742,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1077,
  1,
  'Caritas-Beratungsstelle Euskirchen',
  null,
  '53879',
  'Euskirchen',
  0,
  4,
  0,
  7743,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1078,
  17,
  'Caritas Regionalverband Halle e.V. ',
  'Fachbereich Beratungsstellen',
  '06217',
  'Merseburg',
  0,
  4,
  0,
  11202,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1079,
  21,
  'Kurberatungsstelle des Caritasverbandes für den Kreis Höxter e.V.',
  null,
  '33034',
  'Brakel',
  0,
  4,
  0,
  11655,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1080,
  11,
  'Caritasverband für den Landkreis Rasstatt e.V.',
  null,
  '76437',
  'Rastatt',
  0,
  4,
  0,
  11684,
  '2019-08-23 09:01:19',
  '2019-08-23 09:01:19',
  null
), (
  1081,
  6,
  'Caritas-Sozialstation',
  null,
  null,
  null,
  0,
  7,
  0,
  8548,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1082,
  6,
  'Caritas Altenhilfe ambulante Pflege Brandenburg',
  null,
  null,
  null,
  0,
  7,
  0,
  8549,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1083,
  6,
  'Caritas Sozialstationen Ambulante Pflege Berlin 1',
  null,
  null,
  null,
  0,
  7,
  0,
  8556,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1084,
  6,
  'Caritas Sozialstationen Ambulante Pflege Berlin 2',
  null,
  null,
  null,
  0,
  7,
  0,
  8672,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1085,
  6,
  'Caritas Sozialstationen Ambulante Pflege Berlin 3',
  null,
  null,
  null,
  0,
  7,
  0,
  8673,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1086,
  2,
  'Caritasverband für die Stadt Recklinghausen e.V.',
  'Beratungsstelle für ältere Menschen und ihre Angehörigen      Wir pflegen Menschlichkeit  - dieser Slogan beschreibt kurz und knapp, wer der Caritasverband für die Stadt Recklinghausen e. V. ist und was er macht.    Der Verband verfolgt ausschließlich gemeinnützige und mildtätige Zwecke. Das Wort Caritas kommt aus dem Lateinischen und bedeutet übersetzt Nächstenliebe, Wohltätigkeit und das ist es, was der CV Recklinghausen leistet.     Die Angebote und Dienste sind so vielfältig wie das Leben. Durch kompetente Hilfe und organisierte Dienste werden Menschen unabhängig ihrer Religion, Nationalität und Herkunft unterstützt, begleitet und beraten.  Ein ganz besonderes Augenmerk der Arbeit liegt in Hilfen und Angeboten für alte Menschen, Familien sowie Kinder und Jugendliche mit einer Behinderung.  Der Caritasverband für die Stadt Recklinghausen ist ein eingetragener Verein mit mehr als 600 Mitarbeitern, mehr als 30 Fachdiensten und Einrichtungen im Stadtgebiet und ist Teil des Diözesancaritasverbandes Münster.   Er bietet Familienhilfe, Hilfen für junge Menschen mit Behinderung, Seniorenhilfe und Beratungsdienste.   Der Bereich Hilfen für ältere Menschen beinhaltet die Beratungsstelle für ältere Menschen und pflegende Angehörige, die Caritas-Sozialstationen Nord und Süd, den Bereich Seniorenreisen, vier stationäre Einrichtungen - das Caritashaus Reginalda, das Caritashaus St. Michael, das Caritashaus St. Gertrudis und das Caritashaus St. Hedwig sowie Altenwohnungen.',
  '45659',
  'Recklinghausen',
  0,
  7,
  0,
  11060,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1087,
  24,
  'Caritasverband für Stuttgart e.V. - Bischof-Moser-Haus',
  'Seniorenerholung  Zentrum für ältere Menschen',
  '70182',
  'Stuttgart',
  1,
  7,
  0,
  11121,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1088,
  11,
  'Beratungsstelle für ältere Menschen und pflegende Angehörige ',
  null,
  '72488',
  'Sigmaringen',
  1,
  7,
  0,
  11123,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1089,
  11,
  'Caritasverband für das Dekanat Linzgau e.V. ',
  null,
  '88662',
  'Überlingen',
  0,
  7,
  0,
  11150,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1090,
  11,
  'Caritasverband Bruchsal e.V.',
  null,
  '76646',
  'Bruchsal',
  1,
  7,
  0,
  11163,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1091,
  2,
  'Pflege- Informations - Büro des Caritasverbandes Moers - Xanten e.V.',
  'Senioren- und Demenzberatung',
  '47441',
  'Moers',
  0,
  7,
  0,
  11164,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1092,
  3,
  'Fachstelle für pflegende Angehörige',
  'Zuständig für Menschen, die Angehörige pflegen, sich informieren wollen; Natürlich werden auch selbst Betroffene, die sich über Hilfsmöglichkeiten und deren Finanzierung kundig machen wollen, ausführlich beraten.',
  '91207',
  'Lauf a. d. Pegnitz',
  0,
  7,
  0,
  11165,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1093,
  16,
  'Caritasverband Frankfurt e. V. Abteilung Alten- und Krankenhilfe',
  null,
  '60311',
  'Frankfurt',
  1,
  7,
  0,
  11168,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1094,
  11,
  'Caritasverband für den Landkreis Emmendingen e.V.',
  null,
  '79312',
  'Emmendingen',
  0,
  7,
  0,
  11170,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1095,
  16,
  'CaritasSeniorenBeratungsstelle-Elz; St.Josefshaus Elz',
  null,
  '65604',
  'Elz/Ww',
  0,
  7,
  0,
  11171,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1096,
  11,
  'Caritasverband im Tauberkreis e.V.',
  'Caritassozialdienst',
  '97941',
  'Tauberbischofsheim',
  1,
  7,
  0,
  11172,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1097,
  11,
  'Beratungsstellen für Hilfen im Alter',
  null,
  '75175',
  'Pforzheim',
  1,
  7,
  0,
  11173,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1098,
  16,
  'Caritas Altenwohn- und Pflegegesellschaft mbH',
  null,
  '65185',
  'Wiesbaden',
  0,
  7,
  0,
  11174,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1099,
  1,
  'Caritasverband für die Stadt Bonn e.V.',
  ' Thomas Morus  - Bildung, Begegnung und Beratung für Senioren',
  '53119',
  'Bonn',
  0,
  7,
  0,
  11175,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1100,
  19,
  'Caritas-Zentrum Ebersberg',
  'Das Caritas Zentrum Ebersberg bietet regionale Angebote und Dienstleistungen zu den Themen: Leben im Alter, Kinder, Jugendliche und Familie, Psychische Gesundheit und Sucht, Ehrenamt und ambulante Pflege.',
  '85567',
  'Grafing',
  0,
  7,
  0,
  11176,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1101,
  19,
  'Caritas Zentrum Rosenheim',
  null,
  '83022',
  'Rosenheim',
  0,
  7,
  0,
  11177,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1102,
  19,
  'Alten- und Service-Zentrum Westend',
  'Das Alten- und Service-Zentrum Westend ist...  ... Ihr Wegbegleiter im Alter, unabhängig von Konfession und Nationalität  ... eine Anlaufstelle für Seniorinnen und Senioren im Münchner Stadtteil Schwabing-West, sowie für deren Angehörige und andere Bezugspersonen, wenn sie Unterstützung, Beratung und Betreuung suchen  ... eine Einrichtung der Landeshauptstadt München in Betriebsführung des Caritasverbandes der Erzdiözese München und Freising e.V.    Die sozialpädagogischen Fachkräfte des ASZ Westendberaten Sie und Ihre Angehörigen gerne, damit Sie möglichst lange selbstständig und selbstbestimmt leben können.     Nutzen Sie unsere fachliche Kompetenz bei Fragen zu  - Hilfs- und Unterstützungsmöglichkeiten zu Hause (hauswirtschaftliche Hilfen, Hausnotruf, Essen auf Rädern, Begleitdienste etc.)  - der Vermittlung von ambulanten Pflegediensten sowie Tages- und Kurzzeitpflege  - Hilfs- und Unterstützungsmöglichkeiten im Bereich der Existenzsicherung und bei der Vermittlung an die Schuldnerberatung  - verschiedenen Wohnformen im Alter und Wohnraumberatung  - dem Umgang mit Behörden oder beim Ausfüllen von Anträgen und Formularen  - speziellen Themen rund ums Älterwerden (z.B. Patientenverfügung, Vorsorgevollmacht)  - persönlichen Anliegen in belastenden Lebenssituationen  - Vermittlung sowie Einsatzmöglichkeiten von ehrenamtlichen Helferinnen und Helfern    Die Beratung ist kostenlos.  Ihr Anliegen wird selbstverständlich vertraulich behandelt.  Hausbesuche sind bei Bedarf und nach Absprache möglich.  ',
  '80339',
  'München',
  0,
  7,
  0,
  11178,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1103,
  19,
  'Alten- und Service-Zentrum Schwabing-West',
  'Das Alten- und Service-Zentrum Schwabing-West ist...  ... Ihr Wegbegleiter im Alter, unabhängig von Konfession und Nationalität  ... eine Anlaufstelle für Seniorinnen und Senioren im Münchner Stadtteil Schwabing-West, sowie für deren Angehörige und andere Bezugspersonen, wenn sie Unterstützung, Beratung und Betreuung suchen  ... eine Einrichtung der Landeshauptstadt München in Betriebsführung des Caritasverbandes der Erzdiözese München und Freising e.V.    Die sozialpädagogischen Fachkräfte des ASZ Schwabing-West beraten Sie und Ihre Angehörigen gerne, damit Sie möglichst lange selbstständig und selbstbestimmt leben können.    Nutzen Sie unsere fachliche Kompetenz bei Fragen zu  - Hilfs- und Unterstützungsmöglichkeiten zu Hause (hauswirtschaftliche Hilfen, Hausnotruf, Essen auf Rädern, Begleitdienste etc.)  - der Vermittlung von ambulanten Pflegediensten sowie Tages- und Kurzzeitpflege  - Hilfs- und Unterstützungsmöglichkeiten im Bereich der Existenzsicherung und bei der Vermittlung an die Schuldnerberatung  - verschiedenen Wohnformen im Alter und Wohnraumberatung  - dem Umgang mit Behörden oder beim Ausfüllen von Anträgen und Formularen  - speziellen Themen rund ums Älterwerden (z.B. Patientenverfügung, Vorsorgevollmacht)  - persönlichen Anliegen in belastenden Lebenssituationen  - Vermittlung sowie Einsatzmöglichkeiten von ehrenamtlichen Helferinnen und Helfern    Die Beratung ist kostenlos.  Ihr Anliegen wird selbstverständlich vertraulich behandelt.  Hausbesuche sind bei Bedarf und nach Absprache möglich.',
  '80796',
  'München',
  0,
  7,
  0,
  11179,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1104,
  1,
  'Caritasverband für die Stadt Köln e.V.  - Seniorenberatung',
  'Die Seniorenberaterinnen und Seniorenberater des Caritasverbandes helfen in vielen Bereichen und persönlichen Anliegen des täglichen Lebens.   Sie beraten in Fragen und zu Themen, die den Gesamtlebensraum älterer Menschen und deren Angehörige betreffen. Wir unterstützen Sie darin, möglichst lange ein eigenständiges und selbstbestimmtes Leben in der gewohnten Umgebung zu führen.   Für Ihre persönlichen Fragen haben wir ein offenes Ohr und beraten in Belastungs- und Konfliktsituationen.   Bei Bedarf vermitteln wir an spezialisierte Dienste und Einrichtungen.   Die Beratung ist vertraulich und kostenlos. Hausbesuche sind nach Vereinbarung möglich.',
  '51103',
  'Köln',
  1,
  7,
  0,
  11187,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1105,
  2,
  'Caritas Pflege und Hilfe zu Hause',
  null,
  '47608',
  'Geldern',
  1,
  7,
  0,
  11189,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1106,
  1,
  'Caritas-Seniorenberatung/ Wohnberatungsagentur Rhein-Kreis Neuss',
  null,
  '41460',
  'Neuss',
  1,
  7,
  0,
  11197,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1107,
  24,
  'Beratungsstelle stiftung st. franziskus heiligenbronn',
  null,
  '78628',
  'Rottweil',
  0,
  7,
  0,
  11215,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1108,
  24,
  'Beratungsstelle Sozialstation St. Martinus Donzdorf',
  null,
  '73072',
  'Donzdorf',
  1,
  7,
  0,
  11216,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1109,
  24,
  'Beratungsstelle Leben und Wohnen im Alter',
  null,
  '78727',
  'Oberndorf am Neckar',
  1,
  7,
  0,
  11217,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1110,
  24,
  'Stiftung Haus Lindenhof, Wohnen und Pflege im Alter',
  'Die Stiftung Haus Lindenhof unterstützt alte Menschen dabei, mit einem Maximum an Selbstbestimmung würdevoll zu leben. Als kirchliches Sozialunternehmen setzen wir uns dafür ein, dass Menschen ihr Leben nach ihren individuellen Bedürfnissen, Möglichkeiten und Vorstellungen gestalten können.    --  Mit unserer Erfahrung und unserem Wissen aus elf stationären Altenpflegeeinrichtungen, unserem Betreuten Wohnen sowie aus unseren drei Mobilen Diensten beraten Sie unsere Experten zu allen Fragen rund um das Thema Wohnen und Leben im Alter zu Hause, im Betreuten Wohnen oder in einer stationären Altenpflegeeinrichtung.     ',
  '73525',
  'Schwäbisch Gmünd',
  1,
  7,
  0,
  11218,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1111,
  24,
  'ABC - ambulante Pflegeberatung der Kirchlichen Sozialstationen im Ostalbkreis',
  'wir sind ein Verbund von drei kirchlichen Sozialstationen für die Online-Beratung:  - Katholische Sozialstation Vinzenz von Paul Aalen  - Sozialstation Abtsgmünd, www.sozialstation-abtsgmuend.de / Tel.07366-96330  - Sozialstation Bopfingen',
  null,
  null,
  0,
  7,
  0,
  11219,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1112,
  24,
  'Beratungsnetz Schlier',
  null,
  '88281',
  'Schlier',
  1,
  7,
  0,
  11220,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1113,
  24,
  'Beratungsnetz Altshausen - Bad Waldsee - Biberach - Ehingen',
  '  Diese Virtuelle Onlineberatungsstelle ist ein Zusammenschluss aus folgenden Einrichtungen:      Sozialstation St. Josef Altshausen gGmbH   Wohnpark St. Josef  Wohnpark St. Martinus  Sozialstation Gute Beth Bad Waldsee gGmbH  Wohnpark am Schloss  Wohnpark St. Vinzenz  Katholische Sozialstation Biberach gGmbH  Wohnpark am Jordanbad  Wohnpark St. Klara  Katholische Sozialstation Ehingen  Wohnpark St. Franziskus  ',
  '88339',
  'Bad Waldsee',
  0,
  7,
  0,
  11221,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1114,
  24,
  'Beratungsnetz Ulm',
  null,
  '89077',
  'Ulm',
  1,
  7,
  0,
  11233,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1115,
  0,
  'Kompass - Leben im Alter',
  null,
  '52428',
  'Jülich',
  0,
  7,
  0,
  11234,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1116,
  21,
  'Caritasverband Dortmund e.V. - Caritas Service Center',
  null,
  '44137',
  'Dortmund',
  1,
  7,
  0,
  11235,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1117,
  0,
  'Caritas-Beratungsbüro im Alexianer Krankenhaus Maria-Hilf',
  null,
  '47805',
  'Krefeld',
  0,
  7,
  0,
  11236,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1118,
  24,
  'Regionale Onlineberatungsstelle der Malteser, Seniorenberatung Stuttgart u. Nord-Ost-Württemberg',
  'Beteiligte Beratungsstellen:  Malteser Hilfsdienst e.V.  Seniorenberatung Stuttgart  Ulmer Str. 231  70327 Stuttgart    Malteser Hilfsdienst e.V.  Seniorenberatung Nord-Ost-Württemberg  Gerokstraße 2  73431 Aalen  ',
  null,
  null,
  0,
  7,
  0,
  11258,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1119,
  0,
  'St. Gereon Seniorendienste',
  null,
  '41836',
  'Hückelhoven - Brachelen',
  1,
  7,
  0,
  11261,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1120,
  11,
  'Koordination Caritas-Altenhilfe Heidelberg',
  null,
  '69126',
  'Heidelberg',
  1,
  7,
  0,
  11320,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1121,
  2,
  'Leben im Alter - Online Beratung, Caritas Münster',
  null,
  '48151',
  'Münster',
  1,
  7,
  0,
  11321,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1122,
  4,
  'Caritas Onlineberatungsstelle Leben im Alter',
  null,
  null,
  null,
  0,
  7,
  0,
  11647,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1123,
  21,
  'Beratungsstelle für Senioren und Menschen mit Behinderung',
  'In der Online-Beratung sind wir nur für Fragen rund um das Alter zuständig.',
  '59929',
  'Brilon',
  0,
  7,
  0,
  11669,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1124,
  19,
  'Caritas Kontaktstelle Alt und Selbständig ',
  'Fachstelle für pflegende Angehörige und Seniorenberatungsstelle  Franziskuszentrum',
  '83646',
  'Bad Tölz',
  0,
  7,
  0,
  11676,
  '2019-08-23 09:07:10',
  '2019-08-23 09:07:10',
  null
), (
  1125,
  4,
  'Kreuzbund Selbsthilfegruppe',
  null,
  '88046',
  'Friedrichshafen',
  0,
  15,
  0,
  null,
  '2019-10-30 12:00:00',
  '2019-10-30 12:00:00',
  null
), (
  1570,
  9,
  'Beratungsstelle für Schwangere und Familien Gotha',
  'Moßlerstraße 17  99867 Gotha',
  '99867',
  'Gotha',
  1,
  2,
  0,
  null,
  '2020-01-29 08:10:13',
  '2020-01-29 09:00:07',
  null
), (
  1571,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Homburg',
  'Schanzstr. 4  66424 Homburg',
  '66424',
  'Homburg',
  0,
  2,
  0,
  null,
  '2020-01-29 08:12:56',
  '2020-01-29 13:47:29',
  null
), (
  1572,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Landstuhl',
  'Kirchenstraße 53  66849 Landstuhl',
  '66849',
  'Landstuhl',
  0,
  2,
  0,
  null,
  '2020-01-29 08:13:53',
  '2020-01-29 13:47:29',
  null
), (
  1573,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Ludwigshafen am Rhein',
  'Ludwigstraße 67 - 69  67059 Ludwigshafen a. Rhein',
  '67059',
  'Ludwigshafen am Rhein',
  0,
  2,
  0,
  null,
  '2020-01-29 08:14:49',
  '2020-01-29 13:47:29',
  null
), (
  1574,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Kaiserslautern',
  'Engelsgasse 1  67657 Kaiserslautern',
  '67657',
  'Kaiserslautern',
  0,
  2,
  0,
  null,
  '2020-01-29 08:17:28',
  '2020-01-29 13:47:29',
  null
), (
  1575,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Pirmasens und Zweibrücken',
  'Katholische Beratungsstelle für Schwangerschaftsfragen Pirmasens  Schachenstraße 1  66954 Pirmasens    Katholische Beratungsstelle für Schwangerschaftsfragen Zweibrücken  Rosengartenstr. 10a  66482 Zweibrücken',
  '66954',
  'Pirmasens',
  1,
  2,
  0,
  null,
  '2020-01-29 08:18:58',
  '2020-01-29 13:47:29',
  null
), (
  1576,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Frankenthal, Speyer und Germersheim',
  'Katholische Beratungsstelle für Schwangerschaftsfragen Frankenthal  Westliche Ringstr. 31  67227 Frankenthal    Katholische Beratungsstelle für Schwangerschaftsfragen Speyer  Ludwigstraße 13a  67346 Speyer    Katholische Beratungsstelle für Schwangerschaftsfragen Germersheim  17er Straße 1  76726 Germersheim',
  '67227',
  'Frankenthal',
  1,
  2,
  0,
  null,
  '2020-01-29 08:19:43',
  '2020-03-18 13:34:52',
  null
), (
  1577,
  25,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Landau und Neustadt',
  'Katholische Beratungsstelle für Schwangerschaftsfragen Landau  Königstraße 39-41  76829 Landau    Katholische Beratungsstelle für Schwangerschaftsfragen Neustadt  Schwesternstr. 16  67433 Neustadt',
  '76829',
  'Landau',
  1,
  2,
  0,
  null,
  '2020-01-29 08:20:44',
  '2020-03-27 06:40:20',
  null
), (
  1578,
  9,
  'Caritas-Region Eichsfeld-Nordthüringen Caritas in Nordhausen',
  'Domstraße 6 99734 Nordhausen',
  '99734',
  'Nordhausen',
  0,
  4,
  0,
  null,
  '2020-02-04 09:50:43',
  '2020-02-04 09:50:43',
  null
), (
  1579,
  22,
  'Kath. Beratungsstelle für Schwangerschaftsfragen Passau',
  'Obere Donaulände 8  94032 Passau',
  '94032',
  'Passau',
  1,
  2,
  0,
  null,
  '2020-02-07 08:21:33',
  '2020-03-11 11:41:02',
  null
), (
  1580,
  22,
  'Kath. Beratungsstelle für Schwangerschaftsfragen',
  'Kreszentiaheimstr. 61  84503 Altötting  ',
  '84503',
  'Altötting',
  1,
  2,
  0,
  null,
  '2020-02-07 08:22:20',
  '2020-03-18 13:30:51',
  null
), (
  1581,
  23,
  'Caritas Schwangerschaftsberatung Regensburg',
  'Adolf-Schmetzer-Str. 2-4   93055 Regensburg   Tel. 0941/ 799920         Mo-Fr 8-12 und 13-16 Uhr, Mittwoch vormittag geschlossen, Fr bis 15:00                             Projekt  Mama oder Papa mit Behinderung ',
  '93055',
  'Regensburg',
  1,
  2,
  0,
  null,
  '2020-02-07 09:46:47',
  '2020-03-11 11:39:54',
  null
), (
  1582,
  23,
  'Caritas Schwangerschaftsberatung Weiden',
  'Nikolaistr. 6  92637 Weiden  Tel. 0961/ 38914-28  Mo-Fr 8-12 und 13-16 Uhr, Fr bis 15:00 Uhr  Außensprechtage in Amberg und Tirschenreuth    ',
  '92637',
  'Weiden',
  1,
  2,
  0,
  null,
  '2020-02-07 09:51:34',
  '2020-03-11 11:40:06',
  null
), (
  1583,
  23,
  'Caritas Schwangerschaftsberatung Straubing',
  'Obere Bach-Str. 12  94315 Straubing   Tel. 09421/ 9912-28  Mo-Fr. 8:30-11:30 Uhr',
  '94315',
  'Straubing',
  1,
  2,
  0,
  null,
  '2020-02-07 09:52:25',
  '2020-03-11 11:40:34',
  null
), (
  1584,
  23,
  'Caritas Schwangerschaftsberatung Deggendorf',
  'Detterstr. 35  94469 Deggendorf  Tel. 0991/ 29055-40  Mo-Fr 8-12 und 13-16 Uhr, Fr bis 12:00 Uhr  Außensprechtage in Dingolfing und Plattling',
  '94469',
  'Deggendorf',
  1,
  2,
  0,
  null,
  '2020-02-07 09:53:13',
  '2020-03-11 11:40:19',
  null
), (
  1585,
  23,
  'Caritas Schwangerschaftsberatung Landshut',
  'Gestütstr. 4a                   84028 Landshut     Tel. 0871/ 805-120   Mo-Fr 8-12 und 13-16 Uhr, Fr bis 15:30 Uhr',
  '84028',
  'Landshut',
  1,
  2,
  0,
  null,
  '2020-02-07 09:53:50',
  '2020-03-11 11:40:44',
  null
), (
  1586,
  2,
  'Suchtberatung des Caritasverbands Emsdetten-Greven e.V.',
  'Unsere Beratungsstelle bietet Unterstützung und Hílfe bei Fragen oder Problemen im Umgang mit Alkohol, Medikamenten und Drogen, Glücksspiel und Medien, das Beratungsangebot richtet sich an selbst Betroffenen und deren Angehörige oder Bezugspersonen, die Beratung ist kostenfrei und unterliegt der Schweigepflicht.',
  '48282',
  'Emsdetten',
  1,
  0,
  0,
  null,
  '2020-03-18 13:51:33',
  '2020-03-19 14:54:37',
  null
), (
  1587,
  25,
  'Caritaszentrum Neustadt und Außenstelle Bad Dürkheim',
  'Schuldnerberatung für das Stadtgebiet Neustadt  Schwesternstraße 16  67433 Neustadt an der Weinstraße    Außenstelle Bad Dürkheim  Schuldnerberatung für den Kreis Bad Dürkheim  Mannheimerstraße 16  67098 Bad Dürkheim',
  '67433',
  'Neustadt an der Weinstraße',
  1,
  5,
  0,
  null,
  '2020-03-19 15:01:38',
  '2020-03-19 16:08:42',
  null
), (
  1588,
  25,
  'Caritaszentrum Kaiserslautern',
  'Schuldnerberatung für das Stadtgebiet Kaiserlautern  Engelsgasse 3  67657 Kaiserslautern',
  '67657',
  'Kaiserslautern',
  1,
  5,
  0,
  null,
  '2020-03-19 15:03:02',
  '2020-03-19 16:08:57',
  null
), (
  1589,
  25,
  'Caritaszentrum Saar-Pfalz',
  'Caritaszentrum Saar-Pfalz  Kaiserstr. 63  66386 St. Ingbert',
  '66386',
  'St. Ingbert',
  1,
  5,
  0,
  null,
  '2020-03-19 15:03:34',
  '2020-03-19 16:09:06',
  null
), (
  1590,
  17,
  'Allgemeine soziale Beratung in Magdeburg',
  'Das Angebot umfasst die  •	Klärung der individuellen Situation   •	Information und Beratung zur materiellen Existenzsicherung   •	Beratung in psychosozialen, rechtlichen und wirtschaftlichen Fragen   •	Information zu sozialrechtlichen Ansprüchen   •	Unterstützung und Beratung im Umgang mit Behörden  •	Vermittlung zu weiterführenden Fachdiensten   ',
  '39104',
  'Magdeburg',
  1,
  6,
  0,
  null,
  '2020-03-23 07:50:58',
  '2020-03-23 11:43:02',
  null
), (
  1591,
  17,
  'Frauenberatung bei häuslicher Gewalt im Landkreis Börde',
  'Beratung für gewaltbetroffene Frauen und Frauen mit Trennungsabsichten.',
  '39321',
  'Wolmirstedt',
  1,
  3,
  0,
  null,
  '2020-03-23 07:52:13',
  '2020-03-23 11:43:15',
  null
), (
  1592,
  17,
  'Kurberatung Torgau',
  'Wir beraten Sie in persönlichen Problem- und Konfliktsituationen die aus ihrer Rolle als Mutter/ Vater oder pflegende Angehörige hervorgehen.   Dabei unterstützen wir Sie bei der Beantragung einer Vorsorge- oder Rehabilitationsmaßnahme (Kur) und vermitteln entsprechende Einrichtungen des Müttergenesungswerkes.',
  '04860',
  'Torgau',
  1,
  4,
  0,
  null,
  '2020-03-23 07:53:08',
  '2020-03-31 05:42:30',
  null
), (
  1593,
  17,
  'Kurberatung Wittenberg',
  'Wir beraten Mütter und ihre Kinder bei Kurbedürftigkeit und vermitteln Kurplätze nach individuellen und diagnostischen Gesichtspunkten.',
  '6886',
  'Wittenberg',
  0,
  4,
  0,
  null,
  '2020-03-23 07:53:42',
  '2020-03-23 11:43:38',
  null
), (
  1594,
  0,
  'Müttergenesung Magdeburg',
  'Wir beraten Mütter und ihre Kinder bei Kurbedürftigkeit und vermitteln Kurplätze nach individuellen und diagnostischen Gesichtspunkten.  Max-Josef-Metzger Str. 1a  39104 Magdeburg',
  '39104',
  'Magdeburg',
  0,
  4,
  0,
  null,
  '2020-03-23 07:54:06',
  '2020-03-23 11:43:53',
  null
), (
  1595,
  17,
  'Schwangerschaftsberatung Torgau',
  'Unsere Mitarbeiter*innen sind Ansprechpartner bei allen Fragen rund um das Thema Schwangerschaft/ Geburt / Elternschaft.   Wir bieten Ihnen eine individuelle Beratung, geben Informationen und vermitteln für Sie passende Hilfsangebote.  Karl-Marx-Platz 1c  04860 Torgau  Südring 2  04924 Bad Liebenwerda',
  '04860',
  'Torgau',
  1,
  2,
  0,
  null,
  '2020-03-23 07:55:32',
  '2020-03-31 05:44:12',
  null
), (
  1596,
  4,
  'Bundesweite Sozialberatung',
  null,
  null,
  null,
  1,
  6,
  0,
  null,
  '2020-03-23 07:56:38',
  '2020-03-23 11:44:19',
  null
), (
  1597,
  2,
  'Caritasverband Geldern-Kevelaer e.V. - Schuldner- und Insolvenzberatung',
  'Caritasverband Geldern-Kevelaer e.V.  Schuldner- und Insolvenzberatung  Südwall 1 - 5  47608 Geldern',
  '47608',
  'Geldern',
  1,
  5,
  0,
  null,
  '2020-03-23 11:48:38',
  '2020-03-23 13:15:31',
  null
), (
  1598,
  2,
  'Caritasverband Geldern-Kevelaer e.V. - Allgemeine Sozialberatung',
  'Caritasverband Geldern-Kevelaer e.V.   Allgemeine Sozialberatung  Südwall 1 - 5  47608 Geldern',
  '47608',
  'Geldern',
  1,
  6,
  0,
  null,
  '2020-03-23 11:48:47',
  '2020-03-23 13:15:38',
  null
), (
  1599,
  2,
  'Caritasverband Geldern-Kevelaer e.V. - Kurberatung',
  'Caritasverband Geldern-Kevelaer e.V.   Kurberatung  Südwall 1 - 5  47608 Geldern',
  '47608',
  'Geldern',
  1,
  4,
  0,
  null,
  '2020-03-23 11:48:58',
  '2020-03-23 13:15:46',
  null
), (
  1600,
  17,
  'Schwangerschaftsberatung des Caritasverbandes Magdeburg',
  'Die Schwangerschaftsberatungsstelle des Caritasverbandes für das Bistum Magdeburg e.V. berät Sie vor Ort in Magdeburg und hier auf diesen Online-Portal.  Wir beraten Frauen, Paare und Familien zu allen Fragen vor, während und nach der Schwangerschaft. Sie erhalten von uns ausführliche Informationen über gesetzliche Regelungen und finanzielle Hilfen. Sie bekommen Hilfe bei der Durchsetzung von Rechtsansprüchen. Für die Beantragung von Geldern aus der Bundesstiftung „Mutter und Kind – Schutz des ungeborenen Lebens“, „Familie in Not“ und der Stiftung „netzwerk leben“ stehen wir zur Verfügung.  Kostenlos, vertraulich und auf Wunsch auch anonym bieten wir Beratungen bei Fragen zu:  -          Schwangerschaft und Geburt  -          Schwangerschaftskonflikten  -          Sexualität, Verhütung, Partnerschaft und Familienplanung  -          Pränataldiagnostik und möglicher Behinderung des Kindes  -          Adoption  -          Vertraulicher Geburt  -          Betreuung nach Geburt, Fehl- und Totgeburt oder Schwangerschaftsabbruch  Die Beraterin verfügt über notwendige Grund- und entsprechende Zusatzqualifikationen und unterliegt der Schweigepflicht.    Schwangerschaftsberatung des Caritasverbandes Magdeburg  Karl-Schmidt-Str. 5 c  39104 Magdeburg  ',
  '39104',
  'Magdeburg',
  0,
  2,
  1,
  null,
  '2020-03-24 06:41:46',
  '2020-03-24 06:41:46',
  null
), (
  1601,
  26,
  'CBZ Völklingen',
  'Allgemeine Sozialberatung  Poststraße 11-17  66333 Völklingen',
  '66333',
  'Völklingen',
  0,
  6,
  0,
  null,
  '2020-03-24 06:42:05',
  '2020-03-24 07:33:47',
  null
), (
  1602,
  26,
  'Haus der Caritas',
  'Allg. Sozialberatung  Johannisstraße 2  66111 Saarbrücken',
  '66111',
  'Saarbrücken',
  1,
  6,
  0,
  null,
  '2020-03-24 06:42:20',
  '2020-03-24 07:33:55',
  null
), (
  1603,
  6,
  'Caritas Allgemeine Soziale Beratung Potsdam',
  'Caritas Allgemeine Soziale Beratung Potsdam  Plantagenstraße 23-24  14482 Potsdam',
  '14482',
  'Potsdam',
  1,
  6,
  0,
  null,
  '2020-03-24 06:42:30',
  '2020-03-24 07:34:01',
  null
), (
  1604,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche des Caritasverbandes Mannheim e. V',
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche des Caritasverbandes Mannheim e. V.',
  '68159',
  'Mannheim',
  0,
  3,
  0,
  null,
  '2020-03-24 06:42:39',
  '2020-03-24 07:34:09',
  null
), (
  1605,
  11,
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Mannheim',
  'Psychologische Beratungsstelle für Eltern, Kinder und Jugendliche, Mannheim',
  '68159',
  'Mannheim',
  0,
  14,
  0,
  null,
  '2020-03-24 06:42:50',
  '2020-03-24 07:34:15',
  null
), (
  1606,
  11,
  'Caritasverband für das Dekanat Sigmaringen-Meßkirch e.V.',
  'Caritasverband für das Dekanat Sigmaringen-Meßkirch e.V.  Katholische Schwangerschaftsberatung  Fidelisstraße 1  72488 Sigmaringen',
  '72488',
  'Sigmaringen',
  1,
  2,
  0,
  null,
  '2020-03-24 06:43:05',
  '2020-03-24 07:34:21',
  null
), (
  1607,
  2,
  'Schuldner- und Verbraucherinsolvenzberatung',
  'Schuldner- und Verbraucherinsolvenzberatung   Sozialdienst katholischer Frauen e. V. Ibbenbüren  Oststraße 39  49477 Ibbenbüren',
  '49477',
  'Ibbenbüren',
  0,
  5,
  0,
  null,
  '2020-03-24 06:43:23',
  '2020-03-24 07:34:27',
  null
), (
  1608,
  19,
  'Caritas Fachambulanz Miesbach',
  'In der Fachambulanz Miesbach, mit einer Außenstelle in Holzkirchen und Rottach-Egern, erhalten Sie Hilfe, wenn Konsumverhalten bei Ihnen, in ihrer Familie oder im Bekanntenkreis zum Problem wird oder Fragen zum Thema Sucht auftauchen.      Unsere Angebote für Sie in allen Standorten gleich.     Hilfen bei allen Fragen rund um Beratung und Behandlung von substanzgebundenen Süchten (Alkohol, Drogen, Medikamente) und verhaltensbezogenen Süchten (z.B. Glückspielsucht, Essstörungen, Medien) sowie Gefährdungen Beratung von Angehörigen und Bezugspersonen Suchtprävention in Unternehmen Antragstellung für Therapien und Kostenklärung, Vermittlung in Fachkliniken oder andere Einrichtungen anerkannte Behandlungsstelle für ambulante Therapie von Suchterkrankungen und Essstörungen Substitutionsbehandlung Schulungen und Kurse (z.B. Raucherentwöhnungskurse) MPU Vorbereitung, Verkehrstherapeutische Beratung Betreutes Einzelwohnen (BEW) für Suchtkranke, auch mit Doppeldiagnosen Jugendsuchtberatung, Nachsorge.',
  '83714',
  'Miesbach',
  0,
  0,
  0,
  null,
  '2020-03-24 07:12:20',
  '2020-03-27 15:29:24',
  null
), (
  1609,
  6,
  'Allgemeine Soziale Beratung - Greifswald, Pasewalk, Anklam, Heringsdorf',
  'Allgemeine Soziale Beratung   Greifswald Bahnhofstraße 16 17489 Greifswald  Pasewalk Haußmannstraße 12 17309 Pasewalk  Anklam Friedländerstraße 43 17389 Anklam  Heringsdorf Waldbühnenweg 6 17424 Heringsdorf    , Pasewalk, Anklam, Heringsdorf',
  '17489',
  'Greifswald',
  1,
  6,
  0,
  null,
  '2020-03-24 07:33:24',
  '2020-03-24 08:34:59',
  null
), (
  1610,
  6,
  'Fachberatungsstelle gegen sexualisierte Gewalt',
  'Fachberatungsstelle gegen sexualisierte Gewalt  Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  3,
  0,
  null,
  '2020-03-24 07:33:55',
  '2020-03-24 08:35:28',
  null
), (
  1611,
  6,
  'Fachberatungsstelle gegen sexualisierte Gewalt',
  'Fachberatungsstelle gegen sexualisierte Gewalt  Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  14,
  0,
  null,
  '2020-03-24 07:34:15',
  '2020-03-24 08:35:26',
  null
), (
  1612,
  6,
  'Beratung in Fragen der Partnerschaft, Trennung, Scheidung und Umgang (TSU)',
  'Beratung in Fragen der Partnerschaft, Trennung, Scheidung und Umgang (TSU)   Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  3,
  0,
  null,
  '2020-03-24 07:34:53',
  '2020-03-24 08:35:23',
  null
), (
  1613,
  6,
  'Beratung in Fragen der Partnerschaft, Trennung, Scheidung und Umgang (TSU)',
  'Beratung in Fragen der Partnerschaft, Trennung, Scheidung und Umgang (TSU)   Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  14,
  0,
  null,
  '2020-03-24 07:34:57',
  '2020-03-24 08:35:20',
  null
), (
  1614,
  6,
  'Schwangerenberatung',
  'Schwangerenberatung  Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  0,
  2,
  0,
  null,
  '2020-03-24 07:35:29',
  '2020-03-24 08:36:24',
  null
), (
  1615,
  6,
  'Kur- und Erholungsvermittlung - Greifswald, Anklam, Heringsdorf',
  'Kur- und Erholungsvermittlung  Greifswald Bahnhofstraße 16 17489 Greifswald  Anklam Friedländerweg 43 17389 Anklam  Heringsdorf Waldbühnenweg 6 17424 Heringsdorf  Greifswald Makarenstraße 12 17491 Greifswald  ',
  '17489',
  'Greifswald',
  1,
  4,
  0,
  null,
  '2020-03-24 07:36:08',
  '2020-03-24 08:35:14',
  null
), (
  1616,
  6,
  'Opferberatung',
  'Opferberatung  Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  3,
  0,
  null,
  '2020-03-24 07:36:37',
  '2020-03-24 08:35:07',
  null
), (
  1617,
  6,
  'Opferberatung',
  'Opferberatung  Bahnhofstraße 16  17489 Greifswald',
  '17489',
  'Greifswald',
  1,
  14,
  0,
  null,
  '2020-03-24 07:36:42',
  '2020-03-24 08:35:05',
  null
), (
  1618,
  17,
  'EUTB® Börde',
  'Die ergänzende unabhängige Teilhabeberatung (EUTB) berät sie in allen Fragen zur Teilhabe und Rehabilitation und richtet sich an alle Menschen, die aufgrund von Behinderung, Krankheit oder psychischen Beeinträchtigungen an einer gleichberechtigten Teilhabe gehindert werden. Auch Angehörige von Menschen mit Beeinträchtigungen könne sich gern an uns wenden. Wir beraten nach dem Grundsatz  Eine für Alle .',
  '39340',
  'Haldensleben ',
  0,
  8,
  0,
  null,
  '2020-03-26 07:42:17',
  '2020-03-26 09:29:18',
  null
), (
  1619,
  1,
  'Schuldnerberatung des SkF Ratingen',
  '',
  '40878',
  'Ratingen',
  0,
  5,
  0,
  null,
  '2020-03-26 07:43:09',
  '2020-03-26 09:29:18',
  null
), (
  1620,
  25,
  'Virtuelle weiße Flecken Beratungsstelle',
  '',
  '79104',
  'Freiburg',
  0,
  3,
  0,
  null,
  '2020-03-26 07:43:23',
  '2020-03-27 13:45:31',
  null
), (
  1621,
  25,
  'Virtuelle weiße Flecken Beratungsstelle',
  '',
  '79104',
  'Freiburg',
  0,
  14,
  0,
  null,
  '2020-03-26 07:43:35',
  '2020-03-27 13:46:10',
  null
), (
  1622,
  9,
  'Beratungsstelle für Menschen mit Behinderungen und deren Angehörige / Kontakt- und Beratungsstelle',
  'Beratung und Begleitung in persönlichen Fragen, Unterstützung bei der Beantragung von sozialrechtlichen Leistungen, Freizeit- und Bildungsangebote',
  '37327',
  'Leinefelde',
  1,
  8,
  0,
  null,
  '2020-03-26 07:55:59',
  '2020-03-26 09:29:18',
  null
), (
  1623,
  16,
  'Erziehungs-, Ehe-, Familien- und Lebensberatungsstelle des Caritasverbandes Main-Taunus',
  'Die Erziehungs-, Ehe-, Familien- und Lebensberatung der Caritas im Main-Taunus Kreis bietet schon seit über 45 Jahren Beratung für Eltern, Kinder und Jugendliche im Main-Taunus Kreis an. Sie machen sich Gedanken über die Entwicklung Ihres Kindes? Sie befinden sich in einer Familien- oder Paarsituation, in der Sie gerne etwas verändern wollen? Sie suchen Beratung zu den Themen Schule, Pubertät, Lebenskrisen..., dann finden Sie bei uns individuelle, vertrauliche, kostenfreie und kompetente Gesprächspartner.',
  '65439',
  'Flörsheim am Main',
  1,
  3,
  0,
  null,
  '2020-03-26 07:56:12',
  '2020-03-26 09:29:18',
  null
), (
  1624,
  17,
  'Erziehungs-, Familien- und Lebensberatung des Caritas Reginoalverbands Magdeburg',
  'Erziehung, Familienleben, Fragen rund um Kindergarten, Schule oder Pubertät, herausfordernde schwierige Situationen für Sie als Eltern, als Paar oder auch als Jugendlicher…. Suchen Sie Unterstützung bzw. Beratung in schweren Lebenssituationen, bei Konflikten, persönlichen Belastungen oder akuten Veränderungen, wenn Sie Beratung zu diesen Themen wünschen, können Sie sich gern hier online an uns wenden. Unsere Beratung ist vertraulich und individuell, ressourcenorientiert und soll Sie gezielt in Ihrer Handlungsfähigkeit unterstützen und stärken.   Am Charlottentor 31  39114 Magdeburg',
  '39114',
  'Magdeburg',
  0,
  3,
  0,
  null,
  '2020-03-26 13:05:39',
  '2020-03-27 15:28:53',
  null
), (
  1625,
  17,
  'Erziehungs-, Familien- und Lebensberatung des Caritas Reginoalverbands Magdeburg',
  'Erziehung, Familienleben, Fragen rund um Kindergarten, Schule oder Pubertät, herausfordernde schwierige Situationen für Sie als Eltern, als Paar oder auch als Jugendlicher…. Suchen Sie Unterstützung bzw. Beratung in schweren Lebenssituationen, bei Konflikten, persönlichen Belastungen oder akuten Veränderungen, wenn Sie Beratung zu diesen Themen wünschen, können Sie sich gern hier online an uns wenden. Unsere Beratung ist vertraulich und individuell, ressourcenorientiert und soll Sie gezielt in Ihrer Handlungsfähigkeit unterstützen und stärken.   Am Charlottentor 31  39114 Magdeburg',
  '39114',
  'Magdeburg',
  1,
  14,
  0,
  null,
  '2020-03-26 13:05:49',
  '2020-03-27 15:28:38',
  null
), (
  1626,
  21,
  'Sozialdienst katholischer Frauen e.V. Minden',
  'Wir bieten: Soziale Schuldnerberatung, Insolvenzberatung, Beratung zum Pfändungsschutzkonto und Ausstellung von Bescheinigungen; Wir beraten online, telefonisch (Zentrale unter 0571 828 99 9) oder persönlich nach Terminvereinbarung  Königstraße 13  32423 Minden',
  '32423',
  'Minden',
  1,
  5,
  0,
  null,
  '2020-03-26 13:05:56',
  '2020-03-30 10:22:42',
  null
), (
  1628,
  16,
  'Ehe-, Familien-, Lebens und Erziehungsberatungsstelle',
  'Ehe-, Familien-, Lebens und Erziehungsberatungsstelle  Philipp-Gehling Str. 4  56410 Montabaur',
  '56410',
  'Montabaur',
  1,
  3,
  0,
  null,
  '2020-03-26 13:06:12',
  '2020-03-30 10:31:20',
  null
), (
  1629,
  16,
  'Ehe-, Familien-, Lebens und Erziehungsberatungsstelle',
  'Ehe-, Familien-, Lebens und Erziehungsberatungsstelle  Philipp-Gehling Str. 4  56410 Montabaur',
  '56410',
  'Montabaur',
  1,
  14,
  0,
  null,
  '2020-03-26 13:06:20',
  '2020-03-27 15:29:10',
  null
), (
  1630,
  0,
  'Kath. Beratungsstelle für Eltern, Kinder und Jugendliche',
  'Kath. Beratungsstelle für Eltern, Kinder und Jugendliche  Kauertzacker 9  47906 Kempen',
  '47906',
  'Kempen',
  1,
  3,
  1,
  null,
  '2020-03-26 13:06:30',
  '2020-03-26 13:06:30',
  null
), (
  1631,
  0,
  'Kath. Beratungsstelle für Eltern, Kinder und Jugendliche',
  'Kath. Beratungsstelle für Eltern, Kinder und Jugendliche  Kauertacker 9  47906 Kempen',
  '47906',
  'Kempen',
  1,
  14,
  1,
  null,
  '2020-03-26 13:06:38',
  '2020-03-26 13:06:38',
  null
), (
  1632,
  2,
  'Caritas Münster - Kurberatung',
  'Caritas Münster - Kurberatung  Josefstraße 2  48151 Münster',
  '48151',
  'Münster',
  1,
  4,
  0,
  null,
  '2020-03-26 13:06:46',
  '2020-03-30 10:17:13',
  null
), (
  1633,
  11,
  'Caritasverband für das Dekanat Sigmaringen -Messkirch e.V. - Erziehungsberatung',
  'Rat und Hilfe bei:  Erziehungsfragen  Entwicklungs- und Verhaltensauffälligkeiten  Konflikten in der Familie, zwischen Eltern, Partnern, Geschwistern und den Generationen  Problemen in Kindergarten, Schule, Ausbildung und Beruf  Anstehenden Entscheidungen in der Familie  Trennung und Scheidung der Eltern und bei der Bewältigung der Folgen für die Kinder',
  '72488',
  'Sigmaringen',
  1,
  3,
  0,
  null,
  '2020-03-26 14:37:41',
  '2020-03-30 10:10:23',
  null
), (
  1634,
  11,
  'Caritasverband für das Dekanat Sigmaringen -Messkirch e.V. - Erziehungsberatung',
  'Rat und Hilfe bei:  Erziehungsfragen  Entwicklungs- und Verhaltensauffälligkeiten  Konflikten in der Familie, zwischen Eltern, Partnern, Geschwistern und den Generationen  Problemen in Kindergarten, Schule, Ausbildung und Beruf  Anstehenden Entscheidungen in der Familie  Trennung und Scheidung der Eltern und bei der Bewältigung der Folgen für die Kinder',
  '72488',
  'Sigmaringen',
  1,
  14,
  0,
  null,
  '2020-03-26 14:38:12',
  '2020-03-30 10:10:15',
  null
), (
  1635,
  21,
  'Caritasverband Iserlohn, Hemer, Menden, Balve e.V.',
  'Unser Ziel ist es, Ihnen beratend und lösungsorientiert bei der Tilgung Ihrer Schulden / Beantragung eines Insolvenzverfahrens zur Seite zu stehen. Unsere Finanzexperten stehen Menschen aus den Städten Iserlohn, Hemer, Menden und Balve, die verschuldet oder in existenzielle Not geraten sind, mit Rat und Tat zur Seite.',
  '58636',
  'Iserlohn',
  1,
  5,
  0,
  null,
  '2020-03-26 14:38:27',
  '2020-03-30 10:10:04',
  null
), (
  1636,
  5,
  'Katholische Beratungsstelle für Schwangerschaftsfragen',
  'Wir beraten in allen Fragen rund um Schwangerschaft, Geburt und die ersten drei Lebensjahre des Kindes. Wir unterstützen Sie in Konfliktsituationen, bei Problemen in der Partnerschaft und bei finanziellen Sorgen. Sie können zu uns auch mit Fragen zu Pränataldiagonstik, Kinderwunsch und vertraulicher Geburt kommen.  Am Katzenstadel 1  86152 Augsburg',
  '86152',
  'Augsburg',
  1,
  2,
  0,
  null,
  '2020-03-27 06:36:37',
  '2020-03-30 10:08:09',
  null
), (
  1637,
  3,
  'Caritasverband für die Stadt und den Landkreis Fürth e. V.',
  'Die Allgemeine Sozialberatung des Caritasverbands Fürth versteht sich als Anlaufstelle für Menschen in Krisensituationen. Wir beraten bei sozialen, rechtlichen, finanziellen, psychischen, partnerschaftlichen, familiären, ganz persönlichen Fragen oder bei Problemen mit Ämtern und Institutionen. Ein Schwerpunkt ist unter anderem die Beratung von Arbeitslosen und von Arbeitslosikeit bedrohten Menschen. Außerdem beraten wir pflegende Angehörige und realisieren Quartiersprojekte in der Fürther Südstadt, in Veitsbronn und in Cadolzburg.  Caritasverband für die Stadt und den Landkreis Fürth e. V.  Königstr. 112 - 114  90762 Fürth',
  '90762',
  'Fürth',
  1,
  6,
  0,
  null,
  '2020-03-27 14:29:54',
  '2020-03-30 10:07:57',
  null
), (
  1638,
  15,
  'CJS Caritas Jugendsozialarbeit',
  'CJS Caritas Jugendsozialarbeit  Jugendberufshilfe  Übergang Schule und Beruf  Ritterstraße 2-3  30165 Hannover',
  '30165',
  'Hannover',
  1,
  9,
  0,
  null,
  '2020-03-27 14:30:06',
  '2020-03-30 10:10:38',
  null
), (
  1639,
  5,
  'Suchtberatungs-  und Behandlungsstelle  der Caritas Landsberg',
  ' Hilfe und Beratung für alle, die Fragen zum Thema Sucht und Suchtmittel haben   Suchtberatungs-  und Behandlungsstelle  der Caritas Landsberg  Brudergasse 215  86899 Landsberg',
  '86899',
  'Landsberg',
  1,
  0,
  0,
  null,
  '2020-03-27 14:30:14',
  '2020-03-30 10:10:52',
  null
), (
  1640,
  5,
  'Katholische Beratungsstelle für Schwangerschaftsfragen Landsberg des SkF Augsburg e.V.',
  'Wir beraten in allen Fragen rund um Schwangerschaft, Geburt und die ersten drei Lebensjahre des Kindes. Wir unterstützen Sie in Konfliktsituationen, bei Problemen in der Partnerschaft und bei finanziellen Sorgen. Sie können zu uns auch mit Fragen zu Pränataldiagonstik, Kinderwunsch und vertraulicher Geburt kommen.',
  '86899',
  'Landsberg am Lech',
  1,
  2,
  0,
  null,
  '2020-03-27 15:36:06',
  '2020-03-30 10:11:01',
  null
), (
  1641,
  10,
  'Sozialdienst kath. Frauen Essen-Mitte e.V.',
  'Sozialdienst kath. Frauen Essen-Mitte e.V.   Kurberatung-Pflegende Angehörige  Dammannstr. 32-38  45138 Essen',
  '45138',
  'Essen',
  1,
  4,
  0,
  null,
  '2020-03-30 09:28:05',
  '2020-03-31 07:28:50',
  null
), (
  1642,
  16,
  'Schwangerschaftsberatung Caritasverband Wetzlar/ Lahn-Dill-Eder e.V.',
  'Wir beraten und begleiten Frauen während und nach der Schwangerschaft zu sozialrechtlichen Ansprüchen, vermitteln finanzielle Beihilfen, stehen zur Verfügung zu Fragen, und Problemen in der Schwangerschaft und Geburt. Des Weiteren beraten wir zu Familienplanung und Verhütung. Wir sind für Sie da nach einem Schwangerschaftsabbruch,  nach Verlust eines Kindes, beraten in einem Schwangerschaftskontflikt aber ohne Ausstellung eines Beratungsnachweises.  Wir führen Sozialberatung bei Pränataldiagnostik duch. Und stehen Ihnen bei Fragen zu der vertraulichen Geburt zur Seite.     Schwangerschaftsberatung Caritasverband Wetzlar/ Lahn-Dill-Eder e.V.  Goethestraße 13  35578 Wetzlar',
  '35578',
  'Wetzlar',
  1,
  2,
  1,
  null,
  '2020-03-30 10:50:45',
  '2020-03-30 10:50:45',
  null
), (
  1643,
  16,
  'Katholische Schwangerschaftsberatung',
  'Katholische Schwangerschaftsberatung   Gutenbergstr. 8   56112 Lahnstein  Philipp-Gehling-Str. 4   56410 Montabaur',
  '56112',
  'Lahnstein',
  1,
  2,
  0,
  null,
  '2020-03-30 10:50:58',
  '2020-03-31 07:28:50',
  null
), (
  1644,
  16,
  'Kurberatung',
  'Philipp-Gehling-Str. 4  56410 Montabaur',
  '56410',
  'Montabaur',
  0,
  4,
  0,
  null,
  '2020-03-30 10:51:09',
  '2020-03-31 07:28:50',
  null
), (
  1645,
  0,
  'Allgemeine Lebens- und Sozialberatung',
  'Allgemeine Lebens- und Sozialberatung  Gutenbergstr. 8  56112 Lahnstein  Philipp-Gehling-Str. 4   56410 Montabaur  ',
  '56112',
  'Lahnstein',
  1,
  6,
  0,
  null,
  '2020-03-30 10:51:18',
  '2020-03-31 07:28:50',
  null
), (
  1646,
  7,
  'Caritasverband Oberlausitz e.V. - Schwangerschaftsberatung',
  'Caritasverband Oberlausitz e.V.  Katholische Schwnagerschaftsberatung  Kirchplatz 2  02625 Bautzen',
  '02625',
  'Bautzen',
  1,
  2,
  1,
  null,
  '2020-03-31 05:55:52',
  '2020-03-31 11:36:40',
  null
), (
  1647,
  9,
  'Caritasregion Mittelthüringen Caritashaus Saalfeld',
  'Allgemeine Soziale Beratung für den Landkreis Saalfeld-Rudolstadt  Darrtorstraße 11  07318 Saalfeld',
  '7318',
  'Saalfeld',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:09',
  '2020-03-31 05:56:09',
  null
), (
  1648,
  9,
  'Caritasregion Mittelthüringen ASB Erfurt',
  'Allgemeine Soziale Beratung für Erfurt  Regierungsstraße 55  99084 Erfurt',
  '99084',
  'Erfurt',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:21',
  '2020-03-31 05:56:21',
  null
), (
  1649,
  9,
  'Caritasregion Mittelthüringen ASB Weimar',
  'Allgemeine Soziale Beratung für Weimar  Thomas-Müntzer-Straße 18  99423 Weimar',
  '99423',
  'Weimar',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:29',
  '2020-03-31 05:56:29',
  null
), (
  1650,
  9,
  'Caritasregion Nordthüringen Eichsfeld Leinefelde',
  'Caritasregion Nordthüringen Eichsfeld Leinefelde  Bonifatiusweg 2  37327 Leinefelde-Worbis OT Leinefelde',
  '37327',
  'Leinefelde',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:37',
  '2020-03-31 05:56:37',
  null
), (
  1651,
  9,
  'Caritasregion Südthüringen Eisenach',
  'Allgemeine Soziale Beratung für Eisenach und den Wartburgkreis  Alexanderstr. 45  99817 Eisenach',
  '99817',
  'Eisenach',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:47',
  '2020-03-31 05:56:47',
  null
), (
  1652,
  9,
  'Cariasregion Südthüringen Meiningen',
  'Cariasregion Südthüringen Meiningen  Anton-Ulrich-Straße 56  98617 Meinigen',
  '98617',
  'Meiningen',
  1,
  6,
  1,
  null,
  '2020-03-31 05:56:56',
  '2020-03-31 05:56:56',
  null
), (
  1653,
  14,
  'Caritas Schwangerschaftsberatung',
  '',
  '18055',
  'Rostock',
  1,
  2,
  0,
  null,
  '2020-03-31 05:57:04',
  '2020-03-31 12:44:04',
  null
), (
  1724,
  7,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '01067',
  'Dresden',
  1,
  1,
  0,
  null,
  '2020-04-21 13:36:45',
  '2020-04-22 11:50:50',
  null
), (
  1725,
  21,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '44147',
  'Dortmund',
  1,
  1,
  0,
  null,
  '2020-04-21 13:37:33',
  '2020-04-22 11:50:58',
  null
), (
  1726,
  14,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '20255',
  'Hamburg',
  1,
  1,
  0,
  null,
  '2020-04-21 13:37:57',
  '2020-04-22 11:51:06',
  null
), (
  1727,
  10,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '45879',
  'Gelsenkirchen',
  1,
  1,
  0,
  null,
  '2020-04-21 13:38:12',
  '2020-04-22 11:51:20',
  null
), (
  1728,
  21,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '33098',
  'Paderborn',
  1,
  1,
  0,
  null,
  '2020-04-21 13:38:29',
  '2020-04-22 11:51:27',
  null
), (
  1729,
  6,
  '#gemeinsamstatteinsam - Onlineberatung für junge Menschen in besonderen Zeiten',
  '',
  '10115',
  'Berlin',
  1,
  1,
  0,
  null,
  '2020-04-21 13:38:48',
  '2020-04-22 11:51:35',
  null
), (
  1730,
  7,
  'Migration Test',
  '',
  '01067',
  'Dresden',
  0,
  16,
  0,
  null,
  '2020-05-11 12:33:40',
  '2020-05-11 12:33:40',
  null
), (
  1731,
  21,
  'Bundesweite Emigration Test',
  '',
  '44147',
  'Dortmund',
  1,
  17,
  0,
  null,
  '2020-05-11 12:33:40',
  '2020-05-11 12:33:40',
  null
), (
  1732,
  14,
  'Hospice Test',
  '',
  '20255',
  'Hamburg',
  0,
  18,
  0,
  null,
  '2020-05-11 12:33:40',
  '2020-05-11 12:33:40',
  null
), (
  1733,
  10,
  'Regional Test',
  '',
  '45879',
  'Gelsenkirchen',
  0,
  19,
  0,
  null,
  '2020-05-11 12:33:40',
  '2020-05-11 12:33:40',
  null
);
insert into AGENCY_POSTCODE_RANGE (ID, AGENCY_ID, POSTCODE_FROM, POSTCODE_TO, CREATE_DATE,
  UPDATE_DATE)
values (
  0,
  0,
  '53001',
  '53229',
  '2018-12-11 11:19:37',
  '2019-04-08 11:28:50'
), (
  1,
  1,
  '50441',
  '51149',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  2,
  2,
  '51401',
  '51519',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  3,
  3,
  '53001',
  '53229',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  4,
  4,
  '40001',
  '40629',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  5,
  5,
  '40001',
  '40629',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  6,
  6,
  '50101',
  '50389',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  7,
  7,
  '53861',
  '53949',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  8,
  8,
  '51531',
  '51545',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  9,
  8,
  '51571',
  '51789',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  10,
  9,
  '40671',
  '40885',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  11,
  9,
  '42478',
  '42579',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  12,
  9,
  '42755',
  '42781',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  13,
  9,
  '51105',
  '51105',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  14,
  10,
  '40636',
  '40670',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  15,
  10,
  '41335',
  '41569',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  16,
  11,
  '53308',
  '53359',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  17,
  12,
  '51556',
  '51570',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  18,
  12,
  '53581',
  '53604',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  19,
  12,
  '53621',
  '53859',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  20,
  13,
  '42601',
  '42719',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  21,
  14,
  '42001',
  '42399',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  22,
  15,
  '88181',
  '88339',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  23,
  15,
  '88349',
  '88353',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  24,
  15,
  '88357',
  '88364',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  25,
  15,
  '88368',
  '88379',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  26,
  15,
  '88404',
  '88410',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  27,
  15,
  '88045',
  '88045',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  28,
  15,
  '88046',
  '88046',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  29,
  15,
  '88048',
  '88048',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  30,
  15,
  '88069',
  '88069',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  31,
  15,
  '88074',
  '88074',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  32,
  15,
  '88079',
  '88079',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  33,
  15,
  '88085',
  '88085',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  34,
  15,
  '88094',
  '88094',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  35,
  15,
  '88097',
  '88097',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  36,
  15,
  '88099',
  '88099',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  37,
  15,
  '88719',
  '88719',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  38,
  15,
  '88717',
  '88717',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  39,
  15,
  '88709',
  '88709',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  40,
  15,
  '88709',
  '88709',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  41,
  15,
  '88699',
  '88699',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  42,
  15,
  '88697',
  '88697',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  43,
  15,
  '88696',
  '88696',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  44,
  15,
  '88693',
  '88693',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  45,
  15,
  '88690',
  '88690',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  46,
  15,
  '88682',
  '88682',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  47,
  15,
  '88677',
  '88677',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  48,
  15,
  '88662',
  '88662',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  49,
  15,
  '88633',
  '88633',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  50,
  15,
  '88147',
  '88147',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  51,
  15,
  '88090',
  '88090',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  52,
  16,
  '88370',
  '88400',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  53,
  16,
  '88411',
  '88480',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  54,
  16,
  '88483',
  '88527',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  55,
  16,
  '88529',
  '88529',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  56,
  17,
  '86502',
  '86502',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  57,
  17,
  '86609',
  '86609',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  58,
  17,
  '86637',
  '86637',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  59,
  17,
  '86641',
  '86641',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  60,
  17,
  '86647',
  '86647',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  61,
  17,
  '86650',
  '86650',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  62,
  17,
  '86653',
  '86653',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  63,
  17,
  '86655',
  '86655',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  64,
  17,
  '86657',
  '86657',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  65,
  17,
  '86660',
  '86660',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  66,
  17,
  '86663',
  '86663',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  67,
  17,
  '86675',
  '86675',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  68,
  17,
  '86682',
  '86682',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  69,
  17,
  '86684',
  '86684',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  70,
  17,
  '86685',
  '86685',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  71,
  17,
  '86687',
  '86687',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  72,
  17,
  '86688',
  '86688',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  73,
  17,
  '86690',
  '86690',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  74,
  17,
  '86692',
  '86692',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  75,
  17,
  '86698',
  '86698',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  76,
  17,
  '86703',
  '86703',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  77,
  17,
  '86704',
  '86704',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  78,
  17,
  '86720',
  '86720',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  79,
  17,
  '86732',
  '86732',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  80,
  17,
  '86733',
  '86733',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  81,
  17,
  '86735',
  '86735',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  82,
  17,
  '86736',
  '86736',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  83,
  17,
  '86742',
  '86742',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  84,
  17,
  '86748',
  '86748',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  85,
  17,
  '86751',
  '86751',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  86,
  17,
  '86753',
  '86753',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  87,
  17,
  '89344',
  '89344',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  88,
  17,
  '89353',
  '89353',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  89,
  17,
  '89407',
  '89407',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  90,
  17,
  '89415',
  '89415',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  91,
  17,
  '89420',
  '89420',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  92,
  17,
  '89423',
  '89423',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  93,
  17,
  '89426',
  '89426',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  94,
  17,
  '89428',
  '89428',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  95,
  17,
  '89429',
  '89429',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  96,
  17,
  '89431',
  '89431',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  97,
  17,
  '89434',
  '89434',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  98,
  17,
  '89435',
  '89435',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  99,
  17,
  '89437',
  '89437',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  100,
  17,
  '89438',
  '89438',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  101,
  17,
  '89440',
  '89440',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  102,
  17,
  '89441',
  '89441',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  103,
  17,
  '89443',
  '89443',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  104,
  17,
  '89446',
  '89446',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  105,
  17,
  '86738',
  '86738',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  106,
  17,
  '86739',
  '86739',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  107,
  17,
  '86681',
  '86681',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  108,
  17,
  '86744',
  '86744',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  109,
  17,
  '86745',
  '86745',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  110,
  17,
  '86747',
  '86747',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  111,
  17,
  '86694',
  '86694',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  112,
  17,
  '86700',
  '86700',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  113,
  17,
  '86756',
  '86756',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  114,
  17,
  '86757',
  '86757',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  115,
  17,
  '86741',
  '86741',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  116,
  17,
  '86750',
  '86750',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  117,
  17,
  '86754',
  '86754',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  118,
  17,
  '86759',
  '86759',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  119,
  17,
  '89449',
  '89449',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  120,
  17,
  '89432',
  '89432',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  121,
  17,
  '89444',
  '89444',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  122,
  17,
  '89447',
  '89447',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  123,
  17,
  '91634',
  '91634',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  124,
  19,
  '86000',
  '86950',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  125,
  19,
  '89300',
  '89369',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  126,
  19,
  '89400',
  '89449',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  127,
  19,
  '87719',
  '87719',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  128,
  19,
  '87727',
  '87727',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  129,
  19,
  '87737',
  '87737',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  130,
  19,
  '87739',
  '87739',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  131,
  19,
  '87743',
  '87743',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  132,
  19,
  '87745',
  '87745',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  133,
  19,
  '87746',
  '87746',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  134,
  19,
  '87748',
  '87748',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  135,
  19,
  '87751',
  '87751',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  136,
  19,
  '87752',
  '87752',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  137,
  19,
  '87754',
  '87754',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  138,
  19,
  '87755',
  '87755',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  139,
  19,
  '87757',
  '87757',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  140,
  19,
  '87769',
  '87769',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  141,
  19,
  '87761',
  '87761',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  142,
  19,
  '87767',
  '87767',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  143,
  19,
  '87770',
  '87770',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  144,
  19,
  '87772',
  '87772',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  145,
  19,
  '87773',
  '87773',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  146,
  19,
  '87775',
  '87775',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  147,
  19,
  '87779',
  '87779',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  148,
  19,
  '87784',
  '87784',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  149,
  19,
  '87785',
  '87785',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  150,
  19,
  '89231',
  '89231',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  151,
  19,
  '89233',
  '89233',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  152,
  19,
  '89250',
  '89250',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  153,
  19,
  '89257',
  '89257',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  154,
  19,
  '89264',
  '89264',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  155,
  19,
  '89269',
  '89269',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  156,
  19,
  '89275',
  '89275',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  157,
  19,
  '89278',
  '89278',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  158,
  19,
  '89281',
  '89281',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  159,
  19,
  '89284',
  '89284',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  160,
  19,
  '89287',
  '89287',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  161,
  19,
  '89290',
  '89290',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  162,
  19,
  '89291',
  '89291',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  163,
  19,
  '89293',
  '89293',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  164,
  19,
  '89294',
  '89294',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  165,
  19,
  '89296',
  '89296',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  166,
  19,
  '89297',
  '89297',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  167,
  20,
  '83043',
  '83043',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  168,
  20,
  '83052',
  '83052',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  169,
  20,
  '83075',
  '83075',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  170,
  20,
  '83093',
  '83093',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  171,
  20,
  '83098',
  '83098',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  172,
  20,
  '83123',
  '83123',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  173,
  20,
  '83209',
  '83209',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  174,
  20,
  '83229',
  '83229',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  175,
  20,
  '83233',
  '83233',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  176,
  20,
  '83254',
  '83254',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  177,
  20,
  '83544',
  '83544',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  178,
  20,
  '83547',
  '83547',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  179,
  20,
  '84072',
  '84072',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  180,
  20,
  '84104',
  '84104',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  181,
  20,
  '85307',
  '85307',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  182,
  20,
  '85354',
  '85354',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  183,
  20,
  '85368',
  '85368',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  184,
  20,
  '85368',
  '85368',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  185,
  20,
  '85375',
  '85375',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  186,
  20,
  '85386',
  '85386',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  187,
  20,
  '85391',
  '85391',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  188,
  20,
  '85395',
  '85395',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  189,
  20,
  '85395',
  '85395',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  190,
  20,
  '85399',
  '85399',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  191,
  20,
  '85402',
  '85402',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  192,
  20,
  '85405',
  '85405',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  193,
  20,
  '85406',
  '85406',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  194,
  20,
  '85408',
  '85408',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  195,
  20,
  '85410',
  '85410',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  196,
  20,
  '85411',
  '85411',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  197,
  20,
  '85413',
  '85413',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  198,
  20,
  '85414',
  '85414',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  199,
  20,
  '85416',
  '85416',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  200,
  20,
  '85417',
  '85417',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  201,
  20,
  '85419',
  '85419',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  202,
  20,
  '85777',
  '85777',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  203,
  20,
  '82008',
  '82008',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  204,
  20,
  '82024',
  '82024',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  205,
  20,
  '82031',
  '82031',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  206,
  20,
  '82041',
  '82041',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  207,
  20,
  '82049',
  '82049',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  208,
  20,
  '82054',
  '82054',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  209,
  20,
  '82061',
  '82061',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  210,
  20,
  '82064',
  '82064',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  211,
  20,
  '82065',
  '82065',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  212,
  20,
  '82067',
  '82067',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  213,
  20,
  '82166',
  '82166',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  214,
  20,
  '83022',
  '83022',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  215,
  20,
  '83026',
  '83026',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  216,
  20,
  '83026',
  '83026',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  217,
  20,
  '83059',
  '83059',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  218,
  20,
  '83064',
  '83064',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  219,
  20,
  '83071',
  '83071',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  220,
  20,
  '83080',
  '83080',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  221,
  20,
  '83083',
  '83083',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  222,
  20,
  '83088',
  '83088',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  223,
  20,
  '83101',
  '83101',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  224,
  20,
  '83104',
  '83104',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  225,
  20,
  '83109',
  '83109',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  226,
  20,
  '83112',
  '83112',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  227,
  20,
  '83115',
  '83115',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  228,
  20,
  '83122',
  '83122',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  229,
  20,
  '83125',
  '83125',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  230,
  20,
  '83126',
  '83126',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  231,
  20,
  '83128',
  '83128',
  '2018-12-11 11:19:37',
  '2018-12-11 11:19:37'
), (
  232,
  20,
  '83129',
  '83129',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  233,
  20,
  '83131',
  '83131',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  234,
  20,
  '83134',
  '83134',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  235,
  20,
  '83135',
  '83135',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  236,
  20,
  '83137',
  '83137',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  237,
  20,
  '83139',
  '83139',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  238,
  20,
  '83209',
  '83209',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  239,
  20,
  '83253',
  '83253',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  240,
  20,
  '83257',
  '83257',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  241,
  20,
  '83512',
  '83512',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  242,
  20,
  '83527',
  '83527',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  243,
  20,
  '83527',
  '83527',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  244,
  20,
  '83533',
  '83533',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  245,
  20,
  '83536',
  '83536',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  246,
  20,
  '83539',
  '83539',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  247,
  20,
  '83543',
  '83543',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  248,
  20,
  '83549',
  '83549',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  249,
  20,
  '83550',
  '83550',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  250,
  20,
  '83553',
  '83553',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  251,
  20,
  '83556',
  '83556',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  252,
  20,
  '83558',
  '83558',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  253,
  20,
  '83561',
  '83561',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  254,
  20,
  '83562',
  '83562',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  255,
  20,
  '83564',
  '83564',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  256,
  20,
  '83567',
  '83567',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  257,
  20,
  '83569',
  '83569',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  258,
  20,
  '83620',
  '83620',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  259,
  20,
  '84030',
  '84030',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  260,
  20,
  '84032',
  '84032',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  261,
  20,
  '84036',
  '84036',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  262,
  20,
  '84051',
  '84051',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  263,
  20,
  '84056',
  '84056',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  264,
  20,
  '84061',
  '84061',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  265,
  20,
  '84076',
  '84076',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  266,
  20,
  '84079',
  '84079',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  267,
  20,
  '84088',
  '84088',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  268,
  20,
  '84092',
  '84092',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  269,
  20,
  '84095',
  '84095',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  270,
  20,
  '84098',
  '84098',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  271,
  20,
  '84100',
  '84100',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  272,
  20,
  '84101',
  '84101',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  273,
  20,
  '84103',
  '84103',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  274,
  20,
  '84107',
  '84107',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  275,
  20,
  '84109',
  '84109',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  276,
  20,
  '84137',
  '84137',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  277,
  20,
  '84144',
  '84144',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  278,
  20,
  '84149',
  '84149',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  279,
  20,
  '84155',
  '84155',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  280,
  20,
  '84166',
  '84166',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  281,
  20,
  '84168',
  '84168',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  282,
  20,
  '84169',
  '84169',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  283,
  20,
  '84171',
  '84171',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  284,
  20,
  '84172',
  '84172',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  285,
  20,
  '84174',
  '84174',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  286,
  20,
  '84175',
  '84175',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  287,
  20,
  '84175',
  '84175',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  288,
  20,
  '84178',
  '84178',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  289,
  20,
  '84181',
  '84181',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  290,
  20,
  '84184',
  '84184',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  291,
  20,
  '84186',
  '84186',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  292,
  20,
  '84187',
  '84187',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  293,
  20,
  '84405',
  '84405',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  294,
  20,
  '84416',
  '84416',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  295,
  20,
  '84416',
  '84416',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  296,
  20,
  '84419',
  '84419',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  297,
  20,
  '84419',
  '84419',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  298,
  20,
  '84424',
  '84424',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  299,
  20,
  '84427',
  '84427',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  300,
  20,
  '84428',
  '84428',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  301,
  20,
  '84431',
  '84431',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  302,
  20,
  '84431',
  '84431',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  303,
  20,
  '84432',
  '84432',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  304,
  20,
  '84434',
  '84434',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  305,
  20,
  '84435',
  '84435',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  306,
  20,
  '84437',
  '84437',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  307,
  20,
  '84439',
  '84439',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  308,
  20,
  '84453',
  '84453',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  309,
  20,
  '84478',
  '84478',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  310,
  20,
  '84489',
  '84489',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  311,
  20,
  '84494',
  '84494',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  312,
  20,
  '84494',
  '84494',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  313,
  20,
  '84494',
  '84494',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  314,
  20,
  '84494',
  '84494',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  315,
  20,
  '84503',
  '84503',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  316,
  20,
  '84508',
  '84508',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  317,
  20,
  '84513',
  '84513',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  318,
  20,
  '84513',
  '84513',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  319,
  20,
  '84518',
  '84518',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  320,
  20,
  '84524',
  '84524',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  321,
  20,
  '84533',
  '84533',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  322,
  20,
  '84533',
  '84533',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  323,
  20,
  '84533',
  '84533',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  324,
  20,
  '84539',
  '84539',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  325,
  20,
  '84539',
  '84539',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  326,
  20,
  '84543',
  '84543',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  327,
  20,
  '84544',
  '84544',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  328,
  20,
  '84546',
  '84546',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  329,
  20,
  '84547',
  '84547',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  330,
  20,
  '84550',
  '84550',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  331,
  20,
  '84553',
  '84553',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  332,
  20,
  '84555',
  '84555',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  333,
  20,
  '84556',
  '84556',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  334,
  20,
  '84558',
  '84558',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  335,
  20,
  '84558',
  '84558',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  336,
  20,
  '84559',
  '84559',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  337,
  20,
  '84561',
  '84561',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  338,
  20,
  '84562',
  '84562',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  339,
  20,
  '84564',
  '84564',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  340,
  20,
  '84565',
  '84565',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  341,
  20,
  '84567',
  '84567',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  342,
  20,
  '84567',
  '84567',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  343,
  20,
  '84568',
  '84568',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  344,
  20,
  '84570',
  '84570',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  345,
  20,
  '84571',
  '84571',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  346,
  20,
  '84573',
  '84573',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  347,
  20,
  '84574',
  '84574',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  348,
  20,
  '84576',
  '84576',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  349,
  20,
  '84577',
  '84577',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  350,
  20,
  '84579',
  '84579',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  351,
  20,
  '85435',
  '85435',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  352,
  20,
  '85445',
  '85445',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  353,
  20,
  '85447',
  '85447',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  354,
  20,
  '85452',
  '85452',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  355,
  20,
  '85456',
  '85456',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  356,
  20,
  '85457',
  '85457',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  357,
  20,
  '85459',
  '85459',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  358,
  20,
  '85461',
  '85461',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  359,
  20,
  '85462',
  '85462',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  360,
  20,
  '85464',
  '85464',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  361,
  20,
  '85465',
  '85465',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  362,
  20,
  '85467',
  '85467',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  363,
  20,
  '85469',
  '85469',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  364,
  20,
  '85521',
  '85521',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  365,
  20,
  '82152',
  '82152',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  366,
  20,
  '85521',
  '85521',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  367,
  20,
  '85540',
  '85540',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  368,
  20,
  '85551',
  '85551',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  369,
  20,
  '85560',
  '85560',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  370,
  20,
  '85567',
  '85567',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  371,
  20,
  '85567',
  '85567',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  372,
  20,
  '85570',
  '85570',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  373,
  20,
  '85570',
  '85570',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  374,
  20,
  '85579',
  '85579',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  375,
  20,
  '85586',
  '85586',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  376,
  20,
  '85591',
  '85591',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  377,
  20,
  '85604',
  '85604',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  378,
  20,
  '85609',
  '85609',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  379,
  20,
  '85614',
  '85614',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  380,
  20,
  '85617',
  '85617',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  381,
  20,
  '85622',
  '85622',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  382,
  20,
  '85625',
  '85625',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  383,
  20,
  '85625',
  '85625',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  384,
  20,
  '85630',
  '85630',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  385,
  20,
  '85635',
  '85635',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  386,
  20,
  '85640',
  '85640',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  387,
  20,
  '85643',
  '85646',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  388,
  20,
  '85649',
  '85649',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  389,
  20,
  '85652',
  '85652',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  390,
  20,
  '85653',
  '85653',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  391,
  20,
  '85656',
  '85656',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  392,
  20,
  '85658',
  '85658',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  393,
  20,
  '85659',
  '85659',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  394,
  20,
  '85661',
  '85661',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  395,
  20,
  '85664',
  '85664',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  396,
  20,
  '85665',
  '85665',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  397,
  20,
  '85667',
  '85667',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  398,
  20,
  '85669',
  '85669',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  399,
  20,
  '85716',
  '85716',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  400,
  20,
  '85737',
  '85737',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  401,
  20,
  '85748',
  '85748',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  402,
  20,
  '85764',
  '85764',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  403,
  20,
  '85774',
  '85774',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  404,
  20,
  '83565',
  '83565',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  405,
  20,
  '85356',
  '85356',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  406,
  20,
  '85598',
  '85598',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  407,
  20,
  '85599',
  '85599',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  408,
  20,
  '85643',
  '85643',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  409,
  20,
  '85646',
  '85646',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  410,
  20,
  '85662',
  '85662',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  411,
  20,
  '84549',
  '84549',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  412,
  21,
  '83000',
  '83499',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  413,
  21,
  '84529',
  '84529',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  414,
  21,
  '83530',
  '83530',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  415,
  21,
  '83546',
  '83546',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  416,
  21,
  '83555',
  '83555',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  417,
  21,
  '83559',
  '83559',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  418,
  21,
  '88549',
  '88549',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  419,
  21,
  '86971',
  '86971',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  420,
  21,
  '82383',
  '82383',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  421,
  21,
  '82389',
  '82389',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  422,
  21,
  '82401',
  '82401',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  423,
  21,
  '82409',
  '82409',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  424,
  21,
  '82069',
  '82069',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  425,
  21,
  '82335',
  '82335',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  426,
  21,
  '82057',
  '82057',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  427,
  21,
  '82433',
  '82433',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  428,
  21,
  '82435',
  '82435',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  429,
  21,
  '82439',
  '82439',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  430,
  21,
  '82441',
  '82441',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  431,
  21,
  '82442',
  '82442',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  432,
  21,
  '82444',
  '82444',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  433,
  21,
  '82475',
  '82475',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  434,
  21,
  '82476',
  '82476',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  435,
  21,
  '82481',
  '82481',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  436,
  21,
  '82487',
  '82487',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  437,
  21,
  '82488',
  '82488',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  438,
  21,
  '82490',
  '82490',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  439,
  21,
  '82491',
  '82491',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  440,
  21,
  '82493',
  '82493',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  441,
  21,
  '82494',
  '82494',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  442,
  21,
  '82496',
  '82496',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  443,
  21,
  '82497',
  '82497',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  444,
  21,
  '82499',
  '82499',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  445,
  21,
  '82515',
  '82515',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  446,
  21,
  '82538',
  '82538',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  447,
  21,
  '82541',
  '82541',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  448,
  21,
  '82544',
  '82544',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  449,
  21,
  '82547',
  '82547',
  '2018-12-11 11:19:38',
  '2018-12-11 11:19:38'
), (
  450,
  21,
  '82549',
  '82549',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  451,
  21,
  '83607',
  '83607',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  452,
  21,
  '83623',
  '83623',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  453,
  21,
  '83624',
  '83624',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  454,
  21,
  '83626',
  '83626',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  455,
  21,
  '83627',
  '83627',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  456,
  21,
  '83629',
  '83629',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  457,
  21,
  '83646',
  '83646',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  458,
  21,
  '83646',
  '83646',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  459,
  21,
  '83661',
  '83661',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  460,
  21,
  '83666',
  '83666',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  461,
  21,
  '83674',
  '83674',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  462,
  21,
  '83677',
  '83677',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  463,
  21,
  '83679',
  '83679',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  464,
  21,
  '83684',
  '83684',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  465,
  21,
  '83700',
  '83700',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  466,
  21,
  '83703',
  '83703',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  467,
  21,
  '83707',
  '83707',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  468,
  21,
  '83708',
  '83708',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  469,
  21,
  '83714',
  '83714',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  470,
  21,
  '83727',
  '83727',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  471,
  21,
  '83730',
  '83730',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  472,
  21,
  '83734',
  '83734',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  473,
  21,
  '83735',
  '83735',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  474,
  21,
  '83737',
  '83737',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  475,
  22,
  '82276',
  '82276',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  476,
  22,
  '82278',
  '82278',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  477,
  22,
  '82223',
  '82223',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  478,
  22,
  '82256',
  '82256',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  479,
  22,
  '82284',
  '82284',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  480,
  22,
  '82285',
  '82285',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  481,
  22,
  '82216',
  '82216',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  482,
  22,
  '82293',
  '82293',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  483,
  22,
  '82294',
  '82294',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  484,
  22,
  '82178',
  '82178',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  485,
  22,
  '82299',
  '82299',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  486,
  22,
  '82239',
  '82239',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  487,
  22,
  '82281',
  '82281',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  488,
  22,
  '82275',
  '82275',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  489,
  22,
  '82110',
  '82110',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  490,
  22,
  '82194',
  '82194',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  491,
  22,
  '82287',
  '82287',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  492,
  22,
  '82290',
  '82290',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  493,
  22,
  '82291',
  '82291',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  494,
  22,
  '82272',
  '82272',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  495,
  22,
  '82140',
  '82140',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  496,
  22,
  '82296',
  '82296',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  497,
  22,
  '85221',
  '85221',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  498,
  22,
  '85250',
  '85250',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  499,
  22,
  '85778',
  '85778',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  500,
  22,
  '86567',
  '86567',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  501,
  22,
  '85229',
  '85229',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  502,
  22,
  '85238',
  '85238',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  503,
  22,
  '85244',
  '85244',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  504,
  22,
  '85254',
  '85254',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  505,
  22,
  '85258',
  '85258',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  506,
  22,
  '85232',
  '85232',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  507,
  22,
  '85253',
  '85253',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  508,
  22,
  '85241',
  '85241',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  509,
  22,
  '85757',
  '85757',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  510,
  22,
  '85235',
  '85235',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  511,
  22,
  '85247',
  '85247',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  512,
  22,
  '85256',
  '85256',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  513,
  22,
  '82131',
  '82131',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  514,
  22,
  '82205',
  '82205',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  515,
  22,
  '82288',
  '82288',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  516,
  22,
  '82349',
  '82349',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  517,
  22,
  '85259',
  '85259',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  518,
  22,
  '85276',
  '85276',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  519,
  22,
  '85293',
  '85293',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  520,
  22,
  '85298',
  '85298',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  521,
  22,
  '85301',
  '85301',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  522,
  22,
  '85302',
  '85302',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  523,
  22,
  '85376',
  '85376',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  524,
  22,
  '85304',
  '85304',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  525,
  22,
  '85305',
  '85305',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  526,
  23,
  '80331',
  '84389',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  527,
  23,
  '85049',
  '85057',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  528,
  23,
  '85072',
  '85072',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  529,
  23,
  '85276',
  '85276',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  530,
  23,
  '85283',
  '85283',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  531,
  23,
  '85375',
  '85375',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  532,
  23,
  '85435',
  '85435',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  533,
  23,
  '86150',
  '86199',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  534,
  24,
  '79001',
  '79026',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  535,
  24,
  '79036',
  '79044',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  536,
  24,
  '79049',
  '79049',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  537,
  24,
  '79050',
  '79050',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  538,
  24,
  '79052',
  '79052',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  539,
  24,
  '79053',
  '79053',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  540,
  24,
  '79077',
  '79095',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  541,
  24,
  '79098',
  '79098',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  542,
  24,
  '79100',
  '79100',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  543,
  24,
  '79102',
  '79102',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  544,
  24,
  '79104',
  '79104',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  545,
  24,
  '79106',
  '79106',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  546,
  24,
  '79108',
  '79108',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  547,
  24,
  '79110',
  '79112',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  548,
  24,
  '79114',
  '79114',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  549,
  24,
  '79115',
  '79115',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  550,
  24,
  '79117',
  '79117',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  551,
  24,
  '79184',
  '79189',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  552,
  24,
  '79190',
  '79190',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  553,
  24,
  '79191',
  '79191',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  554,
  24,
  '79194',
  '79196',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  555,
  24,
  '79199',
  '79199',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  556,
  24,
  '79200',
  '79206',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  557,
  24,
  '79216',
  '79219',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  558,
  24,
  '79220',
  '79220',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  559,
  24,
  '79221',
  '79221',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  560,
  24,
  '79224',
  '79224',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  561,
  24,
  '79225',
  '79225',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  562,
  24,
  '79227',
  '79230',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  563,
  24,
  '79232',
  '79258',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  564,
  24,
  '79264',
  '79269',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  565,
  24,
  '79271',
  '79274',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  566,
  24,
  '79277',
  '79280',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  567,
  24,
  '79282',
  '79282',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  568,
  24,
  '79283',
  '79283',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  569,
  24,
  '79285',
  '79285',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  570,
  24,
  '79286',
  '79286',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  571,
  24,
  '79288',
  '79292',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  572,
  24,
  '79294',
  '79294',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  573,
  24,
  '79295',
  '79295',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  574,
  24,
  '79299',
  '79299',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  575,
  24,
  '79354',
  '79356',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  576,
  24,
  '79371',
  '79400',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  577,
  24,
  '79401',
  '79429',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  578,
  24,
  '79501',
  '79541',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  579,
  24,
  '79546',
  '79589',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  580,
  24,
  '79591',
  '79591',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  581,
  24,
  '79592',
  '79592',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  582,
  24,
  '79594',
  '79594',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  583,
  24,
  '79595',
  '79595',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  584,
  24,
  '79597',
  '79597',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  585,
  24,
  '79599',
  '79599',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  586,
  24,
  '79601',
  '79618',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  587,
  24,
  '79629',
  '79639',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  588,
  24,
  '79641',
  '79650',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  589,
  24,
  '79656',
  '79677',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  590,
  24,
  '79685',
  '79689',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  591,
  24,
  '79691',
  '79695',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  592,
  24,
  '79697',
  '79697',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  593,
  24,
  '79699',
  '79699',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  594,
  24,
  '79811',
  '79822',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  595,
  24,
  '79839',
  '79859',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  596,
  24,
  '79866',
  '79871',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  597,
  24,
  '79874',
  '79874',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  598,
  25,
  '77601',
  '77799',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  599,
  25,
  '79175',
  '79183',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  600,
  25,
  '79207',
  '79215',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  601,
  25,
  '79259',
  '79263',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  602,
  25,
  '79275',
  '79279',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  603,
  25,
  '79297',
  '79297',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  604,
  25,
  '79301',
  '79369',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  605,
  26,
  '79811',
  '79822',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  606,
  26,
  '79839',
  '79843',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  607,
  26,
  '79849',
  '79859',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  608,
  26,
  '79866',
  '79871',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  609,
  26,
  '79874',
  '79874',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  610,
  26,
  '79877',
  '79877',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  611,
  26,
  '79001',
  '79395',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  612,
  26,
  '79401',
  '79410',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  613,
  26,
  '79419',
  '79427',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  614,
  27,
  '78201',
  '78479',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  615,
  28,
  '67355',
  '67368',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  616,
  28,
  '67378',
  '67378',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  617,
  28,
  '76711',
  '76779',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  618,
  28,
  '76872',
  '76872',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  619,
  28,
  '76879',
  '76879',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  620,
  29,
  '70001',
  '72417',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  621,
  29,
  '72421',
  '72475',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  622,
  29,
  '72479',
  '72479',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  623,
  29,
  '72521',
  '74235',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  624,
  29,
  '74239',
  '74579',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  625,
  29,
  '74583',
  '74670',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  626,
  29,
  '74801',
  '74865',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  627,
  29,
  '74869',
  '76646',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  628,
  29,
  '76677',
  '76709',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  629,
  29,
  '76801',
  '76835',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  630,
  29,
  '77601',
  '79117',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  631,
  29,
  '79190',
  '79199',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  632,
  29,
  '79220',
  '79232',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  633,
  29,
  '79236',
  '79288',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  634,
  29,
  '79245',
  '79256',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  635,
  29,
  '79269',
  '79274',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  636,
  29,
  '79280',
  '79280',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  637,
  29,
  '79283',
  '79286',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  638,
  29,
  '79289',
  '79289',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  639,
  29,
  '79292',
  '79294',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  640,
  29,
  '79299',
  '79299',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  641,
  29,
  '79396',
  '79400',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  642,
  29,
  '79429',
  '79879',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  643,
  30,
  '66484',
  '66509',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  644,
  30,
  '66841',
  '66999',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  645,
  30,
  '67601',
  '67829',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  646,
  30,
  '76840',
  '76891',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  647,
  31,
  '67099',
  '67141',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  648,
  31,
  '67163',
  '67166',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  649,
  31,
  '67321',
  '67459',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  650,
  31,
  '67476',
  '67489',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  651,
  31,
  '68701',
  '68789',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  652,
  31,
  '68795',
  '68809',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  653,
  31,
  '76652',
  '76676',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  654,
  31,
  '76752',
  '76761',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  655,
  31,
  '69001',
  '69518',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  656,
  32,
  '67001',
  '67138',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  657,
  32,
  '67149',
  '67169',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  658,
  32,
  '67247',
  '67256',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  659,
  32,
  '67401',
  '67434',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  660,
  32,
  '67445',
  '67459',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  661,
  32,
  '68001',
  '69518',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  662,
  33,
  '66511',
  '66583',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  663,
  34,
  '66361',
  '66540',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  664,
  34,
  '66888',
  '66916',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  665,
  35,
  '66001',
  '66666',
  '2018-12-11 11:19:39',
  '2019-07-24 09:55:42'
), (
  666,
  36,
  '72535',
  '72535',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  667,
  36,
  '72589',
  '72589',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  668,
  36,
  '73338',
  '73340',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  669,
  36,
  '88481',
  '88481',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  670,
  36,
  '89001',
  '89198',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  671,
  36,
  '89571',
  '89599',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  672,
  36,
  '89601',
  '89619',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  673,
  37,
  '35390',
  '35398',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  674,
  37,
  '35410',
  '35418',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  675,
  37,
  '35305',
  '35305',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  676,
  37,
  '35321',
  '35321',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  677,
  37,
  '35325',
  '35325',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  678,
  37,
  '35460',
  '35469',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  679,
  37,
  '35457',
  '35457',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  680,
  37,
  '35452',
  '35452',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  681,
  37,
  '35447',
  '35447',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  682,
  37,
  '35440',
  '35440',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  683,
  37,
  '35432',
  '35432',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  684,
  37,
  '35428',
  '35428',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  685,
  37,
  '64283',
  '64283',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  686,
  37,
  '64285',
  '64285',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  687,
  37,
  '64287',
  '64287',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  688,
  37,
  '64289',
  '64289',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  689,
  37,
  '64291',
  '64291',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  690,
  37,
  '64293',
  '64293',
  '2018-12-11 11:19:39',
  '2018-12-11 11:19:39'
), (
  691,
  37,
  '64295',
  '64295',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  692,
  37,
  '64297',
  '64297',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  693,
  37,
  '64319',
  '64319',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  694,
  37,
  '64331',
  '64331',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  695,
  37,
  '64342',
  '64342',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  696,
  37,
  '64347',
  '64347',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  697,
  37,
  '64354',
  '64354',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  698,
  37,
  '64367',
  '64367',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  699,
  37,
  '64372',
  '64372',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  700,
  37,
  '64380',
  '64380',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  701,
  37,
  '64390',
  '64390',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  702,
  37,
  '64397',
  '64397',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  703,
  37,
  '64401',
  '64401',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  704,
  37,
  '64404',
  '64404',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  705,
  37,
  '64405',
  '64405',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  706,
  37,
  '64409',
  '64409',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  707,
  37,
  '64665',
  '64665',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  708,
  37,
  '64807',
  '64807',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  709,
  37,
  '64823',
  '64823',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  710,
  37,
  '64832',
  '64832',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  711,
  37,
  '64839',
  '64839',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  712,
  37,
  '64846',
  '64846',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  713,
  37,
  '64850',
  '64850',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  714,
  37,
  '64853',
  '64853',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  715,
  37,
  '64859',
  '64859',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  716,
  37,
  '64385',
  '64385',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  717,
  37,
  '64395',
  '64395',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  718,
  37,
  '64407',
  '64407',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  719,
  37,
  '64711',
  '64711',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  720,
  37,
  '64720',
  '64720',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  721,
  37,
  '64732',
  '64732',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  722,
  37,
  '64739',
  '64739',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  723,
  37,
  '64743',
  '64743',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  724,
  37,
  '64747',
  '64747',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  725,
  37,
  '64750',
  '64750',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  726,
  37,
  '64753',
  '64753',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  727,
  37,
  '64754',
  '64754',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  728,
  37,
  '64756',
  '64756',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  729,
  37,
  '64757',
  '64757',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  730,
  37,
  '64759',
  '64759',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  731,
  37,
  '64625',
  '64625',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  732,
  37,
  '64646',
  '64646',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  733,
  37,
  '64653',
  '64653',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  734,
  37,
  '64658',
  '64658',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  735,
  37,
  '64668',
  '64668',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  736,
  37,
  '64673',
  '64673',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  737,
  37,
  '64678',
  '64678',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  738,
  37,
  '64683',
  '64683',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  739,
  37,
  '64686',
  '64686',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  740,
  37,
  '64689',
  '64689',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  741,
  37,
  '68519',
  '68519',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  742,
  37,
  '68623',
  '68623',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  743,
  37,
  '68642',
  '68642',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  744,
  37,
  '68647',
  '68647',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  745,
  37,
  '68649',
  '68649',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  746,
  37,
  '69239',
  '69239',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  747,
  37,
  '69434',
  '69434',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  748,
  37,
  '69483',
  '69483',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  749,
  37,
  '69488',
  '69488',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  750,
  37,
  '69509',
  '69509',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  751,
  37,
  '69517',
  '69517',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  752,
  37,
  '69518',
  '69518',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  753,
  37,
  '64754',
  '64754',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  754,
  37,
  '64723',
  '64723',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  755,
  37,
  '64839',
  '64839',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  756,
  37,
  '63457',
  '63457',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  757,
  37,
  '63456',
  '63456',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  758,
  37,
  '63454',
  '63454',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  759,
  37,
  '63477',
  '63477',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  760,
  37,
  '63571',
  '63571',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  761,
  37,
  '63486',
  '63486',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  762,
  37,
  '61130',
  '61130',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  763,
  37,
  '36381',
  '36381',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  764,
  37,
  '63628',
  '63628',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  765,
  37,
  '63505',
  '63505',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  766,
  37,
  '63607',
  '63607',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  767,
  37,
  '36396',
  '36396',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  768,
  37,
  '63619',
  '63619',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  769,
  37,
  '63579',
  '63579',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  770,
  37,
  '63584',
  '63584',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  771,
  37,
  '63526',
  '63526',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  772,
  37,
  '61137',
  '61137',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  773,
  37,
  '63517',
  '63517',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  774,
  37,
  '63589',
  '63589',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  775,
  37,
  '36391',
  '36391',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  776,
  37,
  '63599',
  '63599',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  777,
  37,
  '63594',
  '63594',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  778,
  37,
  '63633',
  '63633',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  779,
  37,
  '63636',
  '63636',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  780,
  37,
  '63543',
  '63543',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  781,
  37,
  '63546',
  '63546',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  782,
  37,
  '63637',
  '63637',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  783,
  37,
  '61138',
  '61138',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  784,
  37,
  '63549',
  '63549',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  785,
  37,
  '63639',
  '63639',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  786,
  38,
  '97901',
  '97909',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  787,
  38,
  '63881',
  '63939',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  788,
  38,
  '63815',
  '63820',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  789,
  38,
  '63832',
  '63842',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  790,
  38,
  '63847',
  '63853',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  791,
  38,
  '63861',
  '63863',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  792,
  38,
  '63868',
  '63868',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  793,
  38,
  '63777',
  '63785',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  794,
  38,
  '63874',
  '63874',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  795,
  38,
  '63875',
  '63875',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  796,
  39,
  '63701',
  '63768',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  797,
  39,
  '63773',
  '63776',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  798,
  39,
  '63786',
  '63808',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  799,
  39,
  '63811',
  '63811',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  800,
  39,
  '63814',
  '63814',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  801,
  39,
  '63825',
  '63831',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  802,
  39,
  '63844',
  '63849',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  803,
  39,
  '63854',
  '63860',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  804,
  39,
  '63864',
  '63867',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  805,
  39,
  '63869',
  '63872',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  806,
  39,
  '63877',
  '63879',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  807,
  40,
  '60000',
  '61118',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  808,
  40,
  '61281',
  '61352',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  809,
  40,
  '61401',
  '61440',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  810,
  40,
  '63461',
  '63477',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  811,
  41,
  '34418',
  '34431',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  812,
  41,
  '57376',
  '57392',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  813,
  41,
  '59851',
  '59969',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  814,
  42,
  '48309',
  '48324',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  815,
  42,
  '59201',
  '59229',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  816,
  42,
  '59241',
  '59269',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  817,
  42,
  '59280',
  '59320',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  818,
  42,
  '59321',
  '59329',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  819,
  43,
  '59001',
  '59077',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  820,
  43,
  '59368',
  '59368',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  821,
  43,
  '59379',
  '59379',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  822,
  43,
  '59174',
  '59174',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  823,
  43,
  '59192',
  '59192',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  824,
  43,
  '59199',
  '59199',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  825,
  43,
  '59423',
  '59423',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  826,
  43,
  '59425',
  '59425',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  827,
  43,
  '59427',
  '59427',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  828,
  43,
  '59436',
  '59436',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  829,
  43,
  '59457',
  '59457',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  830,
  43,
  '59469',
  '59469',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  831,
  43,
  '59494',
  '59494',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  832,
  43,
  '59505',
  '59505',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  833,
  43,
  '59510',
  '59510',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  834,
  43,
  '59514',
  '59514',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  835,
  43,
  '59519',
  '59519',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  836,
  44,
  '58581',
  '58644',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  837,
  44,
  '58091',
  '58091',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  838,
  44,
  '58093',
  '58093',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  839,
  44,
  '58095',
  '58095',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  840,
  44,
  '58097',
  '58097',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  841,
  44,
  '58099',
  '58099',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  842,
  44,
  '58119',
  '58119',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  843,
  44,
  '58135',
  '58135',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  844,
  44,
  '58239',
  '58239',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  845,
  44,
  '58809',
  '58809',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  846,
  44,
  '58762',
  '58762',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  847,
  45,
  '58240',
  '58256',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  848,
  45,
  '58314',
  '58339',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  849,
  46,
  '57368',
  '57489',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  850,
  47,
  '53518',
  '53518',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  851,
  47,
  '53520',
  '53520',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  852,
  47,
  '53539',
  '53539',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  853,
  47,
  '54298',
  '54298',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  854,
  47,
  '54310',
  '54310',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  855,
  47,
  '54529',
  '54529',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  856,
  47,
  '54533',
  '54533',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  857,
  47,
  '54550',
  '54550',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  858,
  47,
  '54552',
  '54552',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  859,
  47,
  '54558',
  '54558',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  860,
  47,
  '54568',
  '54568',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  861,
  47,
  '54570',
  '54570',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  862,
  47,
  '54574',
  '54574',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  863,
  47,
  '54576',
  '54576',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  864,
  47,
  '54578',
  '54578',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  865,
  47,
  '54579',
  '54579',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  866,
  47,
  '54584',
  '54584',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  867,
  47,
  '54584',
  '54584',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  868,
  47,
  '54585',
  '54585',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  869,
  47,
  '54586',
  '54586',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  870,
  47,
  '54587',
  '54587',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  871,
  47,
  '54589',
  '54589',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  872,
  47,
  '54595',
  '54595',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  873,
  47,
  '54597',
  '54597',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  874,
  47,
  '54608',
  '54608',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  875,
  47,
  '54610',
  '54610',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  876,
  47,
  '54611',
  '54611',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  877,
  47,
  '54612',
  '54612',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  878,
  47,
  '54614',
  '54614',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  879,
  47,
  '54616',
  '54616',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  880,
  47,
  '54617',
  '54617',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  881,
  47,
  '54619',
  '54619',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  882,
  47,
  '54634',
  '54634',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  883,
  47,
  '54636',
  '54636',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  884,
  47,
  '54646',
  '54646',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  885,
  47,
  '54647',
  '54647',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  886,
  47,
  '54649',
  '54649',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  887,
  47,
  '54655',
  '54655',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  888,
  47,
  '54657',
  '54657',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  889,
  47,
  '54662',
  '54662',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  890,
  47,
  '54664',
  '54664',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  891,
  47,
  '54666',
  '54666',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  892,
  47,
  '54668',
  '54668',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  893,
  47,
  '54669',
  '54669',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  894,
  47,
  '54673',
  '54673',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  895,
  47,
  '54675',
  '54675',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  896,
  47,
  '54687',
  '54687',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  897,
  47,
  '54689',
  '54689',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  898,
  47,
  '56729',
  '56729',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  899,
  47,
  '56766',
  '56766',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  900,
  47,
  '56767',
  '56767',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  901,
  47,
  '56769',
  '56769',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  902,
  48,
  '54201',
  '54499',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  903,
  49,
  '26758',
  '26909',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  904,
  49,
  '48442',
  '48465',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  905,
  49,
  '48478',
  '48480',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  906,
  49,
  '48497',
  '48531',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  907,
  49,
  '49697',
  '49849',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  908,
  50,
  '48467',
  '48477',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  909,
  50,
  '48494',
  '48496',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  910,
  50,
  '49461',
  '49549',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  911,
  51,
  '49001',
  '49328',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  912,
  51,
  '49407',
  '49439',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  913,
  51,
  '49546',
  '49632',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  914,
  52,
  '48232',
  '48249',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  915,
  52,
  '48292',
  '48308',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  916,
  52,
  '48325',
  '48329',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  917,
  52,
  '48631',
  '48653',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  918,
  52,
  '48704',
  '48734',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  919,
  52,
  '59380',
  '59399',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  920,
  52,
  '59331',
  '59348',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  921,
  53,
  '48466',
  '48466',
  '2018-12-11 11:19:40',
  '2018-12-11 11:19:40'
), (
  922,
  53,
  '48467',
  '48467',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  923,
  53,
  '48469',
  '48469',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  924,
  53,
  '48472',
  '48472',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  925,
  53,
  '48477',
  '48477',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  926,
  54,
  '48401',
  '48432',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  927,
  54,
  '48481',
  '48493',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  928,
  55,
  '48001',
  '48167',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  929,
  56,
  '40636',
  '40670',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  930,
  56,
  '47701',
  '47839',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  931,
  56,
  '41061',
  '41061',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  932,
  56,
  '41063',
  '41063',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  933,
  56,
  '41065',
  '41065',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  934,
  56,
  '41066',
  '41066',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  935,
  56,
  '41069',
  '41069',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  936,
  56,
  '41169',
  '41169',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  937,
  56,
  '41179',
  '41179',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  938,
  56,
  '41189',
  '41189',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  939,
  56,
  '41199',
  '41199',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  940,
  56,
  '41236',
  '41236',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  941,
  56,
  '41238',
  '41238',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  942,
  56,
  '41239',
  '41239',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  943,
  56,
  '41334',
  '41334',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  944,
  56,
  '41747',
  '41747',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  945,
  56,
  '41748',
  '41748',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  946,
  56,
  '41751',
  '41751',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  947,
  56,
  '41812',
  '41812',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  948,
  56,
  '47877',
  '47877',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  949,
  56,
  '47877',
  '47877',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  950,
  56,
  '47929',
  '47929',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  951,
  56,
  '47918',
  '47918',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  952,
  56,
  '41749',
  '41749',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  953,
  56,
  '41068',
  '41068',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  954,
  56,
  '41363',
  '41363',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  955,
  56,
  '47906',
  '47906',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  956,
  57,
  '45951',
  '45968',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  957,
  57,
  '46201',
  '46244',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  958,
  58,
  '45601',
  '45772',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  959,
  58,
  '46251',
  '46325',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  960,
  58,
  '48232',
  '48249',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  961,
  58,
  '44541',
  '44581',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  962,
  58,
  '45951',
  '45968',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  963,
  58,
  '46510',
  '46514',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  964,
  58,
  '48728',
  '48734',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  965,
  59,
  '44541',
  '44581',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  966,
  59,
  '45601',
  '45665',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  967,
  59,
  '45669',
  '45772',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  968,
  59,
  '46251',
  '46286',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  969,
  60,
  '45501',
  '45549',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  970,
  60,
  '45601',
  '45359',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  971,
  60,
  '45239',
  '45239',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  972,
  60,
  '45133',
  '45133',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  973,
  60,
  '45257',
  '45257',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  974,
  60,
  '45259',
  '45259',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  975,
  60,
  '45149',
  '45149',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  976,
  60,
  '45131',
  '45131',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  977,
  60,
  '45134',
  '45134',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  978,
  60,
  '45277',
  '45277',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  979,
  60,
  '45289',
  '45289',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  980,
  60,
  '45279',
  '45279',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  981,
  60,
  '45276',
  '45276',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  982,
  60,
  '45136',
  '45136',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  983,
  60,
  '45130',
  '45130',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  984,
  60,
  '45147',
  '45147',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  985,
  60,
  '45145',
  '45145',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  986,
  60,
  '45144',
  '45144',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  987,
  60,
  '45128',
  '45128',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  988,
  60,
  '45138',
  '45138',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  989,
  60,
  '45276',
  '45276',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  990,
  60,
  '45279',
  '45279',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  991,
  60,
  '45307',
  '45307',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  992,
  60,
  '45139',
  '45139',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  993,
  60,
  '45127',
  '45127',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  994,
  60,
  '45143',
  '45143',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  995,
  60,
  '45359',
  '45359',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  996,
  60,
  '45357',
  '45357',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  997,
  60,
  '45355',
  '45355',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  998,
  60,
  '45356',
  '45356',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  999,
  60,
  '45141',
  '45141',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1000,
  60,
  '45309',
  '45309',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1001,
  60,
  '45326',
  '45326',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1002,
  60,
  '45329',
  '45329',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1003,
  60,
  '45327',
  '45327',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1004,
  60,
  '58456',
  '58456',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1005,
  60,
  '44892',
  '44892',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1006,
  60,
  '44894',
  '44894',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1007,
  60,
  '44805',
  '44805',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1008,
  60,
  '44791',
  '44791',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1009,
  60,
  '44803',
  '44803',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1010,
  60,
  '44801',
  '44801',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1011,
  60,
  '44799',
  '44799',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1012,
  60,
  '44797',
  '44797',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1013,
  60,
  '44789',
  '44789',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1014,
  60,
  '44787',
  '44787',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1015,
  60,
  '44807',
  '44807',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1016,
  60,
  '44809',
  '44809',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1017,
  60,
  '44793',
  '44793',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1018,
  60,
  '44795',
  '44795',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1019,
  60,
  '44879',
  '44879',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1020,
  60,
  '44867',
  '44867',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1021,
  60,
  '44869',
  '44869',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1022,
  60,
  '44866',
  '44866',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1023,
  60,
  '58285',
  '58285',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1024,
  60,
  '58553',
  '58553',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1025,
  60,
  '58566',
  '58566',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1026,
  60,
  '58540',
  '58540',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1027,
  60,
  '58840',
  '58840',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1028,
  60,
  '58791',
  '58791',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1029,
  60,
  '58849',
  '58849',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1030,
  60,
  '58769',
  '58769',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1031,
  60,
  '58579',
  '58579',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1032,
  60,
  '58515',
  '58515',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1033,
  60,
  '58509',
  '58509',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1034,
  60,
  '58507',
  '58507',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1035,
  60,
  '58511',
  '58511',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1036,
  60,
  '58513',
  '58513',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1037,
  61,
  '45401',
  '45481',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1038,
  62,
  '44001',
  '44016',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1039,
  62,
  '44026',
  '44041',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1040,
  62,
  '44061',
  '44124',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1041,
  62,
  '44139',
  '44212',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1042,
  62,
  '44234',
  '44272',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1043,
  62,
  '44294',
  '44333',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1044,
  62,
  '44371',
  '44388',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1045,
  62,
  '44135',
  '44135',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1046,
  62,
  '44137',
  '44137',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1047,
  62,
  '44225',
  '44225',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1048,
  62,
  '44227',
  '44227',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1049,
  62,
  '44229',
  '44229',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1050,
  62,
  '44287',
  '44287',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1051,
  62,
  '44289',
  '44289',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1052,
  62,
  '44357',
  '44357',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1053,
  62,
  '44359',
  '44359',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1054,
  62,
  '44369',
  '44369',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1055,
  62,
  '44532',
  '44532',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1056,
  62,
  '44536',
  '44536',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1057,
  62,
  '58239',
  '58239',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1058,
  62,
  '58452',
  '58452',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1059,
  62,
  '58453',
  '58453',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1060,
  62,
  '58454',
  '58454',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1061,
  62,
  '58455',
  '58455',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1062,
  62,
  '59423',
  '59423',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1063,
  62,
  '59425',
  '59425',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1064,
  62,
  '59427',
  '59427',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1065,
  62,
  '59436',
  '59436',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1066,
  62,
  '44339',
  '44339',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1067,
  62,
  '44339',
  '44339',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1068,
  63,
  '33155',
  '33161',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1069,
  63,
  '33339',
  '33758',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1070,
  63,
  '33776',
  '33824',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1071,
  63,
  '32001',
  '32278',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1072,
  63,
  '32501',
  '32549',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1073,
  63,
  '32585',
  '32602',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1074,
  63,
  '32631',
  '32657',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1075,
  63,
  '32684',
  '32689',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1076,
  63,
  '32701',
  '32805',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1077,
  63,
  '32826',
  '32832',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1078,
  63,
  '32469',
  '32469',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1079,
  63,
  '32369',
  '32369',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1080,
  63,
  '32351',
  '32351',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1081,
  63,
  '32312',
  '32312',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1082,
  63,
  '32361',
  '32361',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1083,
  63,
  '32609',
  '32609',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1084,
  63,
  '32584',
  '32584',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1085,
  63,
  '32457',
  '32457',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1086,
  63,
  '32339',
  '32339',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1087,
  63,
  '32479',
  '32479',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1088,
  63,
  '31600',
  '31600',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1089,
  63,
  '32427',
  '32427',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1090,
  63,
  '32289',
  '32289',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1091,
  63,
  '32425',
  '32425',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1092,
  63,
  '32423',
  '32423',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1093,
  63,
  '32429',
  '32429',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1094,
  64,
  '32833',
  '33039',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1095,
  64,
  '34432',
  '34439',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1096,
  64,
  '34401',
  '34414',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1097,
  64,
  '37651',
  '37696',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1098,
  64,
  '32825',
  '32825',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1099,
  64,
  '32816',
  '32816',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1100,
  64,
  '32676',
  '32676',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1101,
  64,
  '31812',
  '31812',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1102,
  64,
  '34474',
  '34474',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1103,
  64,
  '34454',
  '34454',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1104,
  65,
  '31001',
  '31199',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1105,
  66,
  '10777',
  '10783',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1106,
  66,
  '10789',
  '10789',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1107,
  66,
  '10823',
  '10829',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1108,
  66,
  '12099',
  '12109',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1109,
  66,
  '12157',
  '12169',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1110,
  66,
  '12203',
  '12209',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1111,
  66,
  '12247',
  '12249',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1112,
  66,
  '12277',
  '12279',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1113,
  66,
  '12305',
  '12307',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1114,
  66,
  '14109',
  '14109',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1115,
  66,
  '14129',
  '14129',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1116,
  66,
  '14163',
  '14169',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1117,
  66,
  '14193',
  '14195',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1118,
  67,
  '01001',
  '04999',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1119,
  67,
  '08001',
  '09999',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1120,
  67,
  '06925',
  '06925',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1121,
  68,
  '06002',
  '06923',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1122,
  68,
  '07301',
  '07989',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1123,
  68,
  '98501',
  '99518',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1124,
  68,
  '99801',
  '99898',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1125,
  68,
  '96501',
  '96529',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1126,
  68,
  '36456',
  '36456',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1127,
  68,
  '36433',
  '36433',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1128,
  68,
  '36448',
  '36448',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1129,
  69,
  '97223',
  '97225',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1130,
  69,
  '97267',
  '97267',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1131,
  69,
  '97280',
  '97282',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1132,
  69,
  '97448',
  '97450',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1133,
  69,
  '97731',
  '97762',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1134,
  69,
  '97775',
  '97794',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1135,
  69,
  '97801',
  '97859',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1136,
  69,
  '97888',
  '97892',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1137,
  69,
  '97909',
  '97909',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1138,
  69,
  '97773',
  '97773',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1139,
  70,
  '74671',
  '74918',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1140,
  70,
  '74236',
  '74238',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1141,
  70,
  '74580',
  '74582',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1142,
  70,
  '97861',
  '97999',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1143,
  70,
  '97277',
  '97285',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1144,
  70,
  '68159',
  '68309',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1145,
  70,
  '68520',
  '68549',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1146,
  70,
  '68701',
  '68723',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1147,
  70,
  '68754',
  '69469',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1148,
  70,
  '69489',
  '69509',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1149,
  70,
  '69511',
  '69514',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1150,
  71,
  '97517',
  '97517',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1151,
  71,
  '97661',
  '97729',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1152,
  71,
  '97754',
  '97772',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1153,
  71,
  '97779',
  '97779',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1154,
  71,
  '97789',
  '97789',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1155,
  71,
  '97792',
  '97792',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1156,
  71,
  '97795',
  '97799',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1157,
  72,
  '97601',
  '97659',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1158,
  72,
  '97724',
  '97724',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1159,
  72,
  '97528',
  '97528',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1160,
  73,
  '97421',
  '97424',
  '2018-12-11 11:19:41',
  '2018-12-11 11:19:41'
), (
  1161,
  73,
  '97493',
  '97493',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1162,
  73,
  '97497',
  '97497',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1163,
  73,
  '97456',
  '97456',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1164,
  73,
  '97499',
  '97499',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1165,
  73,
  '97502',
  '97502',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1166,
  73,
  '97447',
  '97447',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1167,
  73,
  '97505',
  '97505',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1168,
  73,
  '97447',
  '97447',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1169,
  73,
  '97469',
  '97469',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1170,
  73,
  '97506',
  '97506',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1171,
  73,
  '97508',
  '97508',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1172,
  73,
  '97509',
  '97509',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1173,
  73,
  '97511',
  '97511',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1174,
  73,
  '97513',
  '97513',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1175,
  73,
  '97464',
  '97464',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1176,
  73,
  '97516',
  '97516',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1177,
  73,
  '97490',
  '97490',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1178,
  73,
  '97520',
  '97520',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1179,
  73,
  '97453',
  '97453',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1180,
  73,
  '97523',
  '97523',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1181,
  73,
  '97525',
  '97525',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1182,
  73,
  '97526',
  '97526',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1183,
  73,
  '97488',
  '97488',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1184,
  73,
  '97529',
  '97529',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1185,
  73,
  '97532',
  '97532',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1186,
  73,
  '97525',
  '97525',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1187,
  73,
  '97526',
  '97526',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1188,
  73,
  '97488',
  '97488',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1189,
  73,
  '97529',
  '97529',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1190,
  73,
  '97532',
  '97532',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1191,
  73,
  '97534',
  '97534',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1192,
  73,
  '97535',
  '97535',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1193,
  73,
  '97440',
  '97440',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1194,
  73,
  '97537',
  '97537',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1195,
  73,
  '96106',
  '96106',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1196,
  73,
  '96126',
  '96126',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1197,
  73,
  '96151',
  '96151',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1198,
  73,
  '96166',
  '96166',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1199,
  73,
  '96176',
  '96176',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1200,
  73,
  '96181',
  '96181',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1201,
  73,
  '96184',
  '96184',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1202,
  73,
  '96188',
  '96188',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1203,
  73,
  '96190',
  '96190',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1204,
  73,
  '97428',
  '97437',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1205,
  73,
  '97457',
  '97461',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1206,
  73,
  '97470',
  '97483',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1207,
  73,
  '97486',
  '97486',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1208,
  73,
  '97491',
  '97491',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1209,
  73,
  '97494',
  '97494',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1210,
  73,
  '97496',
  '97496',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1211,
  73,
  '97500',
  '97500',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1212,
  73,
  '97503',
  '97503',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1213,
  73,
  '97519',
  '97519',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1214,
  73,
  '97522',
  '97522',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1215,
  73,
  '97531',
  '97531',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1216,
  73,
  '97539',
  '97539',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1217,
  74,
  '96160',
  '96160',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1218,
  74,
  '97301',
  '97359',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1219,
  75,
  '97001',
  '97209',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1220,
  75,
  '97216',
  '97222',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1221,
  75,
  '97226',
  '97299',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1222,
  76,
  '91000',
  '91689',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1223,
  76,
  '92000',
  '92729',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1224,
  76,
  '95000',
  '95709',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1225,
  76,
  '08000',
  '08500',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1226,
  76,
  '90500',
  '90646',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1227,
  76,
  '96000',
  '96500',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1228,
  76,
  '97000',
  '97600',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1229,
  77,
  '93401',
  '93499',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1230,
  77,
  '94201',
  '94379',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1231,
  77,
  '94441',
  '94579',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1232,
  78,
  '83302',
  '83308',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1233,
  78,
  '84301',
  '84307',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1234,
  78,
  '84327',
  '84329',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1235,
  78,
  '84333',
  '84389',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1236,
  78,
  '84479',
  '84489',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1237,
  78,
  '84495',
  '84508',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1238,
  78,
  '84514',
  '84524',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1239,
  78,
  '84530',
  '84533',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1240,
  78,
  '84540',
  '84543',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1241,
  78,
  '84547',
  '84547',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1242,
  78,
  '84550',
  '84550',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1243,
  78,
  '84553',
  '84553',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1244,
  78,
  '84556',
  '84558',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1245,
  78,
  '84561',
  '84561',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1246,
  78,
  '84567',
  '84568',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1247,
  78,
  '84571',
  '84571',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1248,
  78,
  '84576',
  '84579',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1249,
  78,
  '94032',
  '94227',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1250,
  78,
  '94253',
  '94253',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1251,
  78,
  '94258',
  '94261',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1252,
  78,
  '94264',
  '94264',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1253,
  78,
  '94269',
  '94269',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1254,
  78,
  '94401',
  '94439',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1255,
  78,
  '94469',
  '94469',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1256,
  78,
  '94474',
  '94518',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1257,
  78,
  '94527',
  '94532',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1258,
  78,
  '94535',
  '94538',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1259,
  78,
  '94541',
  '94551',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1260,
  78,
  '94556',
  '94557',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1261,
  78,
  '94562',
  '94562',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1262,
  78,
  '94565',
  '94568',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1263,
  78,
  '94571',
  '94579',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1264,
  78,
  '84552',
  '84552',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1265,
  78,
  '94554',
  '94554',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1266,
  78,
  '94533',
  '94533',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1267,
  79,
  '84097',
  '84097',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1268,
  79,
  '84106',
  '84106',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1269,
  79,
  '85095',
  '85095',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1270,
  79,
  '85110',
  '85114',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1271,
  79,
  '85116',
  '85116',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1272,
  79,
  '85117',
  '85117',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1273,
  79,
  '85125',
  '85125',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1274,
  79,
  '85131',
  '85131',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1275,
  79,
  '85132',
  '85132',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1276,
  79,
  '85135',
  '85135',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1277,
  79,
  '85137',
  '85137',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1278,
  79,
  '86703',
  '86703',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1279,
  79,
  '91710',
  '91710',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1280,
  79,
  '91717',
  '91717',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1281,
  79,
  '91719',
  '91719',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1282,
  79,
  '91720',
  '91720',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1283,
  79,
  '91722',
  '91722',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1284,
  79,
  '91723',
  '91723',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1285,
  79,
  '93077',
  '93077',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1286,
  79,
  '93309',
  '93309',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1287,
  79,
  '93326',
  '93326',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1288,
  79,
  '93333',
  '93333',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1289,
  79,
  '93339',
  '93339',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1290,
  79,
  '93342',
  '93342',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1291,
  79,
  '93343',
  '93343',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1292,
  79,
  '93345',
  '93345',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1293,
  79,
  '93346',
  '93346',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1294,
  79,
  '93348',
  '93348',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1295,
  79,
  '93351',
  '93351',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1296,
  79,
  '93352',
  '93352',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1297,
  79,
  '93354',
  '93354',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1298,
  79,
  '93356',
  '93356',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1299,
  79,
  '93358',
  '93358',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1300,
  79,
  '93359',
  '93359',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1301,
  80,
  '84001',
  '84189',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1302,
  80,
  '93301',
  '93359',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1303,
  80,
  '94519',
  '94522',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1304,
  80,
  '85098',
  '85098',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1305,
  80,
  '85134',
  '85134',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1306,
  80,
  '85092',
  '85092',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1307,
  80,
  '85129',
  '85129',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1308,
  80,
  '85104',
  '85104',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1309,
  80,
  '85088',
  '85088',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1310,
  80,
  '85098',
  '85098',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1311,
  80,
  '85119',
  '85119',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1312,
  80,
  '85290',
  '85290',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1313,
  80,
  '85283',
  '85283',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1314,
  81,
  '90600',
  '90608',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1315,
  81,
  '92301',
  '92369',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1316,
  81,
  '93001',
  '93199',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1317,
  81,
  '84155',
  '84155',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1318,
  81,
  '84332',
  '84332',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1319,
  81,
  '84307',
  '84307',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1320,
  81,
  '84326',
  '84326',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1321,
  81,
  '84323',
  '84323',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1322,
  81,
  '94419',
  '94419',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1323,
  81,
  '94436',
  '94436',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1324,
  81,
  '94405',
  '94405',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1325,
  81,
  '94437',
  '94437',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1326,
  81,
  '94431',
  '94431',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1327,
  82,
  '85001',
  '85057',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1328,
  82,
  '85065',
  '85072',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1329,
  82,
  '85096',
  '85098',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1330,
  82,
  '85078',
  '85080',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1331,
  82,
  '85089',
  '85092',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1332,
  82,
  '85099',
  '85101',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1333,
  82,
  '85139',
  '85139',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1334,
  82,
  '85073',
  '85077',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1335,
  82,
  '85104',
  '85104',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1336,
  82,
  '85126',
  '85126',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1337,
  82,
  '85119',
  '85119',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1338,
  82,
  '85290',
  '85290',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1339,
  82,
  '85107',
  '85107',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1340,
  82,
  '85084',
  '85084',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1341,
  82,
  '85296',
  '85296',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1342,
  82,
  '85309',
  '85309',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1343,
  82,
  '85123',
  '85123',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1344,
  82,
  '86706',
  '86706',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1345,
  82,
  '86668',
  '86668',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1346,
  82,
  '86673',
  '86673',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1347,
  82,
  '93349',
  '93349',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1348,
  82,
  '93336',
  '93336',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1349,
  82,
  '92339',
  '92339',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1350,
  82,
  '91171',
  '91171',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1351,
  82,
  '91795',
  '91795',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1352,
  82,
  '91809',
  '91809',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1353,
  82,
  '93358',
  '93358',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1354,
  82,
  '93333',
  '93333',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1355,
  82,
  '93339',
  '93339',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1356,
  82,
  '92345',
  '92345',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1357,
  82,
  '91177',
  '91177',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1358,
  83,
  '55000',
  '56999',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1359,
  83,
  '61000',
  '61999',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1360,
  83,
  '63000',
  '67999',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1361,
  83,
  '57583',
  '57648',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1362,
  83,
  '35075',
  '35799',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1363,
  83,
  '57629',
  '57629',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1364,
  83,
  '57583',
  '57583',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1365,
  83,
  '57629',
  '57629',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1366,
  83,
  '57627',
  '57627',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1367,
  83,
  '57614',
  '57614',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1368,
  83,
  '57644',
  '57644',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1369,
  83,
  '57629',
  '57629',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1370,
  83,
  '57627',
  '57627',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1371,
  83,
  '57642',
  '57642',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1372,
  83,
  '57647',
  '57647',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1373,
  83,
  '57648',
  '57648',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1374,
  83,
  '57645',
  '57645',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1375,
  83,
  '35647',
  '35647',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1376,
  83,
  '35641',
  '35641',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1377,
  83,
  '35625',
  '35625',
  '2018-12-11 11:19:42',
  '2018-12-11 11:19:42'
), (
  1378,
  83,
  '35580',
  '35580',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1379,
  83,
  '35579',
  '35579',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1380,
  83,
  '35578',
  '35578',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1381,
  83,
  '35576',
  '35576',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1382,
  83,
  '35586',
  '35586',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1383,
  83,
  '35585',
  '35585',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1384,
  83,
  '35584',
  '35584',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1385,
  83,
  '35583',
  '35583',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1386,
  83,
  '35581',
  '35581',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1387,
  83,
  '35582',
  '35582',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1388,
  83,
  '35633',
  '35633',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1389,
  83,
  '35619',
  '35619',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1390,
  83,
  '35606',
  '35606',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1391,
  83,
  '35638',
  '35638',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1392,
  83,
  '35614',
  '35614',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1393,
  83,
  '35630',
  '35630',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1394,
  83,
  '35753',
  '35753',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1395,
  83,
  '35764',
  '35764',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1396,
  83,
  '35435',
  '35435',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1397,
  83,
  '35444',
  '35444',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1398,
  83,
  '35644',
  '35644',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1399,
  83,
  '35756',
  '35756',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1400,
  83,
  '35745',
  '35745',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1401,
  83,
  '35649',
  '35649',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1402,
  83,
  '35080',
  '35080',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1403,
  83,
  '35768',
  '35768',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1404,
  83,
  '35075',
  '35075',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1405,
  83,
  '35687',
  '35687',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1406,
  83,
  '35686',
  '35686',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1407,
  83,
  '35688',
  '35688',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1408,
  83,
  '35689',
  '35689',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1409,
  83,
  '35685',
  '35685',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1410,
  83,
  '35684',
  '35684',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1411,
  83,
  '35690',
  '35690',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1412,
  83,
  '35713',
  '35713',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1413,
  83,
  '35719',
  '35719',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1414,
  83,
  '35239',
  '35239',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1415,
  83,
  '35232',
  '35232',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1416,
  83,
  '35236',
  '35236',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1417,
  83,
  '35216',
  '35216',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1418,
  83,
  '35117',
  '35117',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1419,
  83,
  '35116',
  '35116',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1420,
  83,
  '35088',
  '35088',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1421,
  83,
  '35108',
  '35108',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1422,
  83,
  '35716',
  '35716',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1423,
  83,
  '35708',
  '35708',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1424,
  83,
  '35767',
  '35767',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1425,
  83,
  '35745',
  '35745',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1426,
  83,
  '35759',
  '35759',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1427,
  83,
  '35753',
  '35753',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1428,
  83,
  '35794',
  '35794',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1429,
  83,
  '35799',
  '35799',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1430,
  83,
  '35792',
  '35792',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1431,
  83,
  '35781',
  '35781',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1432,
  83,
  '35796',
  '35796',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1433,
  83,
  '35789',
  '35789',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1434,
  84,
  '72419',
  '72419',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1435,
  84,
  '72477',
  '72477',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1436,
  84,
  '72481',
  '72488',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1437,
  84,
  '72497',
  '72497',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1438,
  84,
  '72498',
  '72498',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1439,
  84,
  '72501',
  '72519',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1440,
  84,
  '88340',
  '88348',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1441,
  84,
  '88354',
  '88354',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1442,
  84,
  '88356',
  '88356',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1443,
  84,
  '88365',
  '88365',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1444,
  84,
  '88367',
  '88367',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1445,
  84,
  '88508',
  '88512',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1446,
  84,
  '88516',
  '88516',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1447,
  84,
  '88518',
  '88518',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1448,
  84,
  '88601',
  '88631',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1449,
  84,
  '88634',
  '88639',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1450,
  85,
  '60000',
  '61999',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1451,
  86,
  '67355',
  '67368',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1452,
  86,
  '67378',
  '67378',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1453,
  86,
  '76711',
  '76779',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1454,
  86,
  '76872',
  '76872',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1455,
  86,
  '76879',
  '76879',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1456,
  87,
  '33748',
  '33803',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1457,
  87,
  '33813',
  '33829',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1458,
  87,
  '33241',
  '33446',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1459,
  88,
  '34331',
  '34346',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1460,
  88,
  '37104',
  '37139',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1461,
  88,
  '37434',
  '37441',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1462,
  88,
  '37442',
  '37539',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1463,
  89,
  '26670',
  '26670',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1464,
  89,
  '26446',
  '26446',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1465,
  89,
  '26639',
  '26639',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1466,
  89,
  '26632',
  '26632',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1467,
  89,
  '26725',
  '26725',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1468,
  89,
  '26723',
  '26723',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1469,
  89,
  '26736',
  '26736',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1470,
  89,
  '26721',
  '26721',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1471,
  89,
  '26624',
  '26624',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1472,
  89,
  '26529',
  '26529',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1473,
  89,
  '26506',
  '26506',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1474,
  89,
  '26524',
  '26524',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1475,
  89,
  '26532',
  '26532',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1476,
  89,
  '26553',
  '26553',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1477,
  89,
  '26556',
  '26556',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1478,
  89,
  '26487',
  '26487',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1479,
  89,
  '26489',
  '26489',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1480,
  89,
  '26427',
  '26427',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1481,
  89,
  '26607',
  '26607',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1482,
  89,
  '26605',
  '26605',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1483,
  89,
  '26603',
  '26603',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1484,
  89,
  '26605',
  '26605',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1485,
  89,
  '26629',
  '26629',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1486,
  89,
  '26474',
  '26474',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1487,
  89,
  '26465',
  '26465',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1488,
  89,
  '26579',
  '26579',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1489,
  89,
  '26548',
  '26548',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1490,
  89,
  '26571',
  '26571',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1491,
  89,
  '26757',
  '26757',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1492,
  89,
  '31604',
  '31604',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1493,
  89,
  '31606',
  '31606',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1494,
  89,
  '31603',
  '31603',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1495,
  89,
  '31592',
  '31592',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1496,
  89,
  '31595',
  '31595',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1497,
  89,
  '31618',
  '31618',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1498,
  89,
  '31621',
  '31621',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1499,
  89,
  '31619',
  '31619',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1500,
  89,
  '31608',
  '31608',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1501,
  89,
  '31613',
  '31613',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1502,
  89,
  '31609',
  '31609',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1503,
  89,
  '28857',
  '28857',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1504,
  89,
  '28844',
  '28844',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1505,
  89,
  '27339',
  '27339',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1506,
  89,
  '28719',
  '28719',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1507,
  89,
  '28717',
  '28717',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1508,
  89,
  '28759',
  '28759',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1509,
  89,
  '28757',
  '28757',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1510,
  89,
  '28755',
  '28755',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1511,
  89,
  '28779',
  '28779',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1512,
  89,
  '28777',
  '28777',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1513,
  89,
  '49341',
  '49406',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1514,
  89,
  '49440',
  '49459',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1515,
  89,
  '49633',
  '49696',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1516,
  89,
  '27201',
  '27259',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1517,
  89,
  '27300',
  '27333',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1518,
  89,
  '28001',
  '28359',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1519,
  89,
  '31586',
  '31619',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1520,
  89,
  '26506',
  '26506',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1521,
  89,
  '26524',
  '26524',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1522,
  89,
  '26529',
  '26529',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1523,
  89,
  '26409',
  '26409',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1524,
  90,
  '06502',
  '06578',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1525,
  90,
  '37300',
  '37359',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1526,
  90,
  '99601',
  '99768',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1527,
  90,
  '99941',
  '99998',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1528,
  91,
  '45801',
  '45899',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1529,
  92,
  '33041',
  '33189',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1530,
  92,
  '32699',
  '32699',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1531,
  92,
  '32694',
  '32694',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1532,
  92,
  '32683',
  '32683',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1533,
  93,
  '58681',
  '58710',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1534,
  93,
  '58651',
  '58675',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1535,
  93,
  '58795',
  '58802',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1536,
  94,
  '48203',
  '48231',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1537,
  94,
  '48283',
  '48291',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1538,
  94,
  '48330',
  '48336',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1539,
  94,
  '38522',
  '38524',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1540,
  94,
  '48357',
  '48361',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1541,
  94,
  '48342',
  '48346',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1542,
  94,
  '48347',
  '48351',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1543,
  94,
  '59303',
  '59320',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1544,
  95,
  '45741',
  '45772',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1545,
  95,
  '45601',
  '45665',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1546,
  95,
  '46251',
  '46286',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1547,
  95,
  '45712',
  '45721',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1548,
  95,
  '45669',
  '45701',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1549,
  95,
  '45951',
  '45968',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1550,
  95,
  '45701',
  '45711',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1551,
  95,
  '45732',
  '45739',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1552,
  95,
  '44541',
  '44581',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1553,
  95,
  '45801',
  '45899',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1554,
  95,
  '44601',
  '44653',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1555,
  96,
  '84503',
  '84503',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1556,
  96,
  '83022',
  '83022',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1557,
  96,
  '83024',
  '83024',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1558,
  96,
  '83026',
  '83026',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1559,
  96,
  '83043',
  '83043',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1560,
  96,
  '83052',
  '83052',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1561,
  96,
  '83059',
  '83059',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1562,
  96,
  '83064',
  '83064',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1563,
  96,
  '83071',
  '83071',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1564,
  96,
  '83075',
  '83075',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1565,
  96,
  '83080',
  '83080',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1566,
  96,
  '83083',
  '83083',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1567,
  96,
  '83088',
  '83088',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1568,
  96,
  '83093',
  '83093',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1569,
  96,
  '83098',
  '83098',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1570,
  96,
  '83101',
  '83101',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1571,
  96,
  '83104',
  '83104',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1572,
  96,
  '83109',
  '83109',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1573,
  96,
  '83112',
  '83112',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1574,
  96,
  '83115',
  '83115',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1575,
  96,
  '83119',
  '83119',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1576,
  96,
  '83022',
  '83022',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1577,
  96,
  '83024',
  '83024',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1578,
  96,
  '83026',
  '83026',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1579,
  96,
  '83043',
  '83043',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1580,
  96,
  '83052',
  '83052',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1581,
  96,
  '83059',
  '83059',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1582,
  96,
  '83064',
  '83064',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1583,
  96,
  '83071',
  '83071',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1584,
  96,
  '83075',
  '83075',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1585,
  96,
  '83080',
  '83080',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1586,
  96,
  '83083',
  '83083',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1587,
  96,
  '83088',
  '83088',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1588,
  96,
  '83093',
  '83093',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1589,
  96,
  '83098',
  '83098',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1590,
  96,
  '83101',
  '83101',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1591,
  96,
  '83253',
  '83253',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1592,
  96,
  '83254',
  '83254',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1593,
  96,
  '83256',
  '83256',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1594,
  96,
  '83257',
  '83257',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1595,
  96,
  '83259',
  '83259',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1596,
  96,
  '83278',
  '83278',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1597,
  96,
  '83301',
  '83301',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1598,
  96,
  '83308',
  '83308',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1599,
  96,
  '83313',
  '83313',
  '2018-12-11 11:19:43',
  '2018-12-11 11:19:43'
), (
  1600,
  96,
  '83317',
  '83317',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1601,
  96,
  '83324',
  '83324',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1602,
  96,
  '83329',
  '83329',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1603,
  96,
  '83334',
  '83334',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1604,
  96,
  '83339',
  '83339',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1605,
  96,
  '83342',
  '83342',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1606,
  96,
  '83346',
  '83346',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1607,
  96,
  '83349',
  '83349',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1608,
  96,
  '83352',
  '83352',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1609,
  96,
  '83355',
  '83355',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1610,
  96,
  '83358',
  '83358',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1611,
  96,
  '83361',
  '83361',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1612,
  96,
  '83362',
  '83362',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1613,
  96,
  '83364',
  '83364',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1614,
  96,
  '83365',
  '83365',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1615,
  96,
  '83367',
  '83367',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1616,
  96,
  '83368',
  '83368',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1617,
  96,
  '83370',
  '83370',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1618,
  96,
  '83371',
  '83371',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1619,
  96,
  '83373',
  '83373',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1620,
  96,
  '83374',
  '83374',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1621,
  96,
  '83376',
  '83376',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1622,
  96,
  '83377',
  '83377',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1623,
  96,
  '83379',
  '83379',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1624,
  96,
  '83395',
  '83395',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1625,
  96,
  '83404',
  '83404',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1626,
  96,
  '83410',
  '83410',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1627,
  96,
  '83413',
  '83413',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1628,
  96,
  '83416',
  '83416',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1629,
  96,
  '83417',
  '83417',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1630,
  96,
  '83512',
  '83512',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1631,
  96,
  '83527',
  '83527',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1632,
  96,
  '83530',
  '83530',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1633,
  96,
  '83533',
  '83533',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1634,
  96,
  '83536',
  '83536',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1635,
  96,
  '83539',
  '83539',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1636,
  96,
  '83543',
  '83543',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1637,
  96,
  '83544',
  '83544',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1638,
  96,
  '83546',
  '83546',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1639,
  96,
  '83547',
  '83547',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1640,
  96,
  '83549',
  '83549',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1641,
  96,
  '83550',
  '83550',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1642,
  96,
  '83553',
  '83553',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1643,
  96,
  '83555',
  '83555',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1644,
  96,
  '83556',
  '83556',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1645,
  96,
  '83558',
  '83558',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1646,
  96,
  '83559',
  '83559',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1647,
  96,
  '83561',
  '83561',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1648,
  96,
  '83562',
  '83562',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1649,
  96,
  '83564',
  '83564',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1650,
  96,
  '83565',
  '83565',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1651,
  96,
  '83567',
  '83567',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1652,
  96,
  '83569',
  '83569',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1653,
  96,
  '84028',
  '84028',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1654,
  96,
  '84030',
  '84030',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1655,
  96,
  '84032',
  '84032',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1656,
  96,
  '84034',
  '84034',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1657,
  96,
  '84036',
  '84036',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1658,
  96,
  '84169',
  '84169',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1659,
  96,
  '84171',
  '84171',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1660,
  96,
  '84172',
  '84172',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1661,
  96,
  '84175',
  '84175',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1662,
  96,
  '84177',
  '84177',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1663,
  96,
  '84178',
  '84178',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1664,
  96,
  '84180',
  '84180',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1665,
  96,
  '84181',
  '84181',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1666,
  96,
  '84183',
  '84183',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1667,
  96,
  '84184',
  '84184',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1668,
  96,
  '84186',
  '84186',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1669,
  96,
  '84187',
  '84187',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1670,
  96,
  '84189',
  '84189',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1671,
  96,
  '84307',
  '84307',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1672,
  96,
  '84323',
  '84323',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1673,
  96,
  '84326',
  '84326',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1674,
  96,
  '84329',
  '84329',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1675,
  96,
  '84332',
  '84332',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1676,
  96,
  '84333',
  '84333',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1677,
  96,
  '84335',
  '84335',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1678,
  96,
  '84337',
  '84337',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1679,
  96,
  '84339',
  '84339',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1680,
  96,
  '84347',
  '84347',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1681,
  96,
  '84359',
  '84359',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1682,
  96,
  '84364',
  '84364',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1683,
  96,
  '84367',
  '84367',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1684,
  96,
  '84371',
  '84371',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1685,
  96,
  '84375',
  '84375',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1686,
  96,
  '84378',
  '84378',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1687,
  96,
  '84381',
  '84381',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1688,
  96,
  '84384',
  '84384',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1689,
  96,
  '84385',
  '84385',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1690,
  96,
  '84387',
  '84387',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1691,
  96,
  '84389',
  '84389',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1692,
  96,
  '84405',
  '84405',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1693,
  96,
  '84416',
  '84416',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1694,
  96,
  '84419',
  '84419',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1695,
  96,
  '84424',
  '84424',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1696,
  96,
  '84427',
  '84427',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1697,
  96,
  '84428',
  '84428',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1698,
  96,
  '84431',
  '84431',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1699,
  96,
  '84432',
  '84432',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1700,
  96,
  '84434',
  '84434',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1701,
  96,
  '84435',
  '84435',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1702,
  96,
  '84437',
  '84437',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1703,
  96,
  '84439',
  '84439',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1704,
  96,
  '84453',
  '84453',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1705,
  96,
  '84478',
  '84478',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1706,
  96,
  '84489',
  '84489',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1707,
  96,
  '84494',
  '84494',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1708,
  96,
  '84503',
  '84503',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1709,
  96,
  '84508',
  '84508',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1710,
  96,
  '84513',
  '84513',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1711,
  96,
  '84518',
  '84518',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1712,
  96,
  '84524',
  '84524',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1713,
  96,
  '84529',
  '84529',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1714,
  96,
  '84533',
  '84533',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1715,
  96,
  '84539',
  '84539',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1716,
  96,
  '84543',
  '84543',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1717,
  96,
  '84544',
  '84544',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1718,
  96,
  '84546',
  '84546',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1719,
  96,
  '84547',
  '84547',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1720,
  96,
  '84549',
  '84549',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1721,
  96,
  '84550',
  '84550',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1722,
  96,
  '84552',
  '84552',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1723,
  96,
  '84553',
  '84553',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1724,
  96,
  '84555',
  '84555',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1725,
  96,
  '84556',
  '84556',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1726,
  96,
  '84558',
  '84558',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1727,
  96,
  '84559',
  '84559',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1728,
  96,
  '84561',
  '84561',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1729,
  96,
  '84562',
  '84562',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1730,
  96,
  '84564',
  '84564',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1731,
  96,
  '84567',
  '84567',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1732,
  96,
  '84568',
  '84568',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1733,
  96,
  '84570',
  '84571',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1734,
  96,
  '84573',
  '84573',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1735,
  96,
  '84574',
  '84574',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1736,
  96,
  '84576',
  '84576',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1737,
  96,
  '84577',
  '84577',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1738,
  96,
  '84579',
  '84579',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1739,
  96,
  '85435',
  '85435',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1740,
  96,
  '85445',
  '85445',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1741,
  96,
  '85447',
  '85447',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1742,
  96,
  '85452',
  '85452',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1743,
  96,
  '85456',
  '85456',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1744,
  96,
  '85457',
  '85457',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1745,
  96,
  '85459',
  '85459',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1746,
  96,
  '85461',
  '85461',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1747,
  96,
  '85462',
  '85462',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1748,
  96,
  '85464',
  '85464',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1749,
  96,
  '85465',
  '85465',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1750,
  96,
  '85467',
  '85467',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1751,
  96,
  '85469',
  '85469',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1752,
  96,
  '85521',
  '85521',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1753,
  96,
  '85540',
  '85540',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1754,
  96,
  '85551',
  '85551',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1755,
  96,
  '85560',
  '85560',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1756,
  96,
  '85567',
  '85567',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1757,
  96,
  '85570',
  '85570',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1758,
  96,
  '85579',
  '85579',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1759,
  96,
  '85586',
  '85586',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1760,
  96,
  '85591',
  '85591',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1761,
  96,
  '85598',
  '85598',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1762,
  96,
  '85599',
  '85599',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1763,
  96,
  '85604',
  '85604',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1764,
  96,
  '85609',
  '85609',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1765,
  96,
  '85614',
  '85614',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1766,
  96,
  '85617',
  '85617',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1767,
  96,
  '85622',
  '85622',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1768,
  96,
  '85625',
  '85625',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1769,
  96,
  '85630',
  '85630',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1770,
  96,
  '85635',
  '85635',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1771,
  96,
  '85640',
  '85640',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1772,
  96,
  '85643',
  '85643',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1773,
  96,
  '85646',
  '85646',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1774,
  96,
  '85649',
  '85649',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1775,
  96,
  '85652',
  '85652',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1776,
  96,
  '85653',
  '85653',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1777,
  96,
  '85656',
  '85656',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1778,
  96,
  '85658',
  '85658',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1779,
  96,
  '85659',
  '85659',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1780,
  96,
  '85661',
  '85661',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1781,
  96,
  '85662',
  '85662',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1782,
  96,
  '85664',
  '85664',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1783,
  96,
  '85665',
  '85665',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1784,
  96,
  '85667',
  '85667',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1785,
  96,
  '85669',
  '85669',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1786,
  96,
  '85716',
  '85716',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1787,
  96,
  '85737',
  '85737',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1788,
  96,
  '85748',
  '85748',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1789,
  96,
  '85757',
  '85757',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1790,
  96,
  '85764',
  '85764',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1791,
  96,
  '85774',
  '85774',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1792,
  96,
  '85777',
  '85777',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1793,
  96,
  '85778',
  '85778',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1794,
  96,
  '81735',
  '81735',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1795,
  96,
  '81825',
  '81825',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1796,
  96,
  '81827',
  '81827',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1797,
  96,
  '81829',
  '81829',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1798,
  96,
  '94032',
  '94032',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1799,
  96,
  '94034',
  '94034',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1800,
  96,
  '94036',
  '94036',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1801,
  96,
  '94051',
  '94051',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1802,
  96,
  '94060',
  '94060',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1803,
  96,
  '94065',
  '94065',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1804,
  96,
  '94072',
  '94072',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1805,
  96,
  '94078',
  '94078',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1806,
  96,
  '94081',
  '94081',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1807,
  96,
  '94086',
  '94086',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1808,
  96,
  '94089',
  '94089',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1809,
  96,
  '94094',
  '94094',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1810,
  96,
  '94099',
  '94099',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1811,
  96,
  '94104',
  '94104',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1812,
  96,
  '94107',
  '94107',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1813,
  96,
  '94110',
  '94110',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1814,
  96,
  '94113',
  '94113',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1815,
  96,
  '94116',
  '94116',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1816,
  96,
  '94118',
  '94118',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1817,
  96,
  '94121',
  '94121',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1818,
  96,
  '94124',
  '94124',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1819,
  96,
  '94127',
  '94127',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1820,
  96,
  '94130',
  '94130',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1821,
  96,
  '94133',
  '94133',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1822,
  96,
  '94136',
  '94136',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1823,
  96,
  '94137',
  '94137',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1824,
  96,
  '94139',
  '94139',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1825,
  96,
  '94140',
  '94140',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1826,
  96,
  '94142',
  '94142',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1827,
  96,
  '94143',
  '94143',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1828,
  96,
  '94145',
  '94145',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1829,
  96,
  '94146',
  '94146',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1830,
  96,
  '94148',
  '94148',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1831,
  96,
  '94149',
  '94149',
  '2018-12-11 11:19:44',
  '2018-12-11 11:19:44'
), (
  1832,
  96,
  '94151',
  '94151',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1833,
  96,
  '94152',
  '94152',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1834,
  96,
  '94154',
  '94154',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1835,
  96,
  '94157',
  '94157',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1836,
  96,
  '94158',
  '94158',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1837,
  96,
  '94160',
  '94160',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1838,
  96,
  '94161',
  '94161',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1839,
  96,
  '94163',
  '94163',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1840,
  96,
  '94164',
  '94164',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1841,
  96,
  '94166',
  '94166',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1842,
  96,
  '94167',
  '94167',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1843,
  96,
  '94169',
  '94169',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1844,
  96,
  '94354',
  '94354',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1845,
  96,
  '94356',
  '94356',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1846,
  96,
  '94357',
  '94357',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1847,
  96,
  '94359',
  '94359',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1848,
  96,
  '94360',
  '94360',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1849,
  96,
  '94362',
  '94362',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1850,
  96,
  '94363',
  '94363',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1851,
  96,
  '94365',
  '94365',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1852,
  96,
  '94366',
  '94366',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1853,
  96,
  '94368',
  '94368',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1854,
  96,
  '94369',
  '94369',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1855,
  96,
  '94371',
  '94371',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1856,
  96,
  '94372',
  '94372',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1857,
  96,
  '94374',
  '94374',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1858,
  96,
  '94375',
  '94375',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1859,
  96,
  '94377',
  '94377',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1860,
  96,
  '94379',
  '94379',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1861,
  96,
  '94405',
  '94405',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1862,
  96,
  '94419',
  '94419',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1863,
  96,
  '94424',
  '94424',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1864,
  96,
  '94428',
  '94428',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1865,
  96,
  '94431',
  '94431',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1866,
  96,
  '94436',
  '94436',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1867,
  96,
  '94437',
  '94437',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1868,
  96,
  '94439',
  '94439',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1869,
  96,
  '94447',
  '94447',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1870,
  96,
  '94469',
  '94469',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1871,
  96,
  '94474',
  '94474',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1872,
  96,
  '94481',
  '94481',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1873,
  96,
  '94486',
  '94486',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1874,
  96,
  '94491',
  '94491',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1875,
  96,
  '94496',
  '94496',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1876,
  96,
  '94501',
  '94501',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1877,
  96,
  '94505',
  '94505',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1878,
  96,
  '94508',
  '94508',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1879,
  97,
  '90001',
  '91166',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1880,
  99,
  '87435',
  '87435',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1881,
  99,
  '87437',
  '87437',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1882,
  99,
  '87439',
  '87439',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1883,
  99,
  '87448',
  '87448',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1884,
  99,
  '87452',
  '87452',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1885,
  99,
  '87463',
  '87463',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1886,
  99,
  '87466',
  '87466',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1887,
  99,
  '87471',
  '87471',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1888,
  99,
  '87474',
  '87474',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1889,
  99,
  '87477',
  '87477',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1890,
  99,
  '87480',
  '87480',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1891,
  99,
  '87484',
  '87484',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1892,
  99,
  '87487',
  '87487',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1893,
  99,
  '87488',
  '87488',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1894,
  99,
  '87490',
  '87490',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1895,
  99,
  '87493',
  '87493',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1896,
  99,
  '87494',
  '87494',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1897,
  99,
  '87496',
  '87496',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1898,
  99,
  '87497',
  '87497',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1899,
  99,
  '87499',
  '87499',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1900,
  99,
  '87509',
  '87509',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1901,
  99,
  '87520',
  '87520',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1902,
  99,
  '87527',
  '87527',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1903,
  99,
  '87534',
  '87534',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1904,
  99,
  '87538',
  '87538',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1905,
  99,
  '87541',
  '87541',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1906,
  99,
  '87544',
  '87544',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1907,
  99,
  '87545',
  '87545',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1908,
  99,
  '87547',
  '87547',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1909,
  99,
  '87549',
  '87549',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1910,
  99,
  '87561',
  '87561',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1911,
  99,
  '87567',
  '87567',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1912,
  99,
  '87568',
  '87568',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1913,
  99,
  '87569',
  '87569',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1914,
  99,
  '88107',
  '88107',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1915,
  99,
  '88131',
  '88131',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1916,
  99,
  '88138',
  '88138',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1917,
  99,
  '88142',
  '88142',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1918,
  99,
  '88145',
  '88145',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1919,
  99,
  '88148',
  '88148',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1920,
  99,
  '88149',
  '88149',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1921,
  99,
  '88161',
  '88179',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1922,
  99,
  '88318',
  '88318',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1923,
  99,
  '82211',
  '82211',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1924,
  99,
  '82229',
  '82229',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1925,
  99,
  '82234',
  '82234',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1926,
  99,
  '82237',
  '82237',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1927,
  99,
  '82266',
  '82266',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1928,
  99,
  '82269',
  '82269',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1929,
  99,
  '82279',
  '82279',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1930,
  99,
  '82297',
  '82297',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1931,
  99,
  '82319',
  '82319',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1932,
  99,
  '82327',
  '82327',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1933,
  99,
  '82340',
  '82340',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1934,
  99,
  '82343',
  '82343',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1935,
  99,
  '82346',
  '82346',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1936,
  99,
  '82347',
  '82347',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1937,
  99,
  '82362',
  '82362',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1938,
  99,
  '82377',
  '82377',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1939,
  99,
  '82380',
  '82380',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1940,
  99,
  '82387',
  '82387',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1941,
  99,
  '82390',
  '82390',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1942,
  99,
  '82392',
  '82392',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1943,
  99,
  '82393',
  '82393',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1944,
  99,
  '82395',
  '82395',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1945,
  99,
  '82396',
  '82396',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1946,
  99,
  '82398',
  '82398',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1947,
  99,
  '82399',
  '82399',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1948,
  99,
  '82402',
  '82402',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1949,
  99,
  '82404',
  '82404',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1950,
  99,
  '82405',
  '82405',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1951,
  99,
  '82407',
  '82407',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1952,
  99,
  '82418',
  '82418',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1953,
  99,
  '82431',
  '82431',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1954,
  99,
  '82432',
  '82432',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1955,
  99,
  '82436',
  '82436',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1956,
  99,
  '82438',
  '82438',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1957,
  99,
  '82445',
  '82445',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1958,
  99,
  '82447',
  '82447',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1959,
  99,
  '82449',
  '82449',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1960,
  99,
  '83670',
  '83670',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1961,
  99,
  '83671',
  '83671',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1962,
  99,
  '83673',
  '83673',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1963,
  99,
  '83676',
  '83676',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1964,
  99,
  '86956',
  '86956',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1965,
  99,
  '86974',
  '86974',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1966,
  99,
  '86978',
  '86978',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1967,
  99,
  '86981',
  '86981',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1968,
  99,
  '87640',
  '87640',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1969,
  99,
  '87665',
  '87665',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1970,
  99,
  '87674',
  '87674',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1971,
  99,
  '86972',
  '86972',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1972,
  99,
  '86975',
  '86975',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1973,
  99,
  '86977',
  '86977',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1974,
  99,
  '86980',
  '86980',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1975,
  99,
  '86983',
  '86983',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1976,
  99,
  '86984',
  '86984',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1977,
  99,
  '86986',
  '86986',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1978,
  99,
  '86987',
  '86987',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1979,
  99,
  '86989',
  '86989',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1980,
  99,
  '87459',
  '87459',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1981,
  99,
  '87600',
  '87600',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1982,
  99,
  '87616',
  '87616',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1983,
  99,
  '87629',
  '87629',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1984,
  99,
  '87634',
  '87634',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1985,
  99,
  '87637',
  '87637',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1986,
  99,
  '87642',
  '87642',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1987,
  99,
  '87645',
  '87645',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1988,
  99,
  '87647',
  '87647',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1989,
  99,
  '87648',
  '87648',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1990,
  99,
  '87650',
  '87650',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1991,
  99,
  '87651',
  '87651',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1992,
  99,
  '87653',
  '87653',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1993,
  99,
  '87654',
  '87654',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1994,
  99,
  '87656',
  '87656',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1995,
  99,
  '87657',
  '87657',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1996,
  99,
  '87659',
  '87659',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1997,
  99,
  '87660',
  '87660',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1998,
  99,
  '87662',
  '87662',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  1999,
  99,
  '87663',
  '87663',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2000,
  99,
  '87666',
  '87666',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2001,
  99,
  '87668',
  '87668',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2002,
  99,
  '87669',
  '87669',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2003,
  99,
  '87671',
  '87671',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2004,
  99,
  '87672',
  '87672',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2005,
  99,
  '87675',
  '87675',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2006,
  99,
  '87677',
  '87677',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2007,
  99,
  '87700',
  '87700',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2008,
  99,
  '87724',
  '87724',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2009,
  99,
  '87730',
  '87730',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2010,
  99,
  '87733',
  '87733',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2011,
  99,
  '87734',
  '87734',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2012,
  99,
  '87736',
  '87736',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2013,
  99,
  '87740',
  '87740',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2014,
  99,
  '87742',
  '87742',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2015,
  99,
  '87749',
  '87749',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2016,
  99,
  '87758',
  '87758',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2017,
  99,
  '87760',
  '87760',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2018,
  99,
  '87763',
  '87763',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2019,
  99,
  '87764',
  '87764',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2020,
  99,
  '87766',
  '87766',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2021,
  99,
  '87776',
  '87776',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2022,
  99,
  '87778',
  '87778',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2023,
  99,
  '87781',
  '87781',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2024,
  99,
  '87782',
  '87782',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2025,
  99,
  '87787',
  '87787',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2026,
  99,
  '87789',
  '87789',
  '2018-12-11 11:19:45',
  '2018-12-11 11:19:45'
), (
  2030,
  201,
  '51556',
  '51570',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2031,
  201,
  '53308',
  '53359',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2032,
  201,
  '53581',
  '53604',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2033,
  201,
  '53621',
  '53859',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2034,
  201,
  '53910',
  '53913',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2035,
  202,
  '40671',
  '40885',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2036,
  202,
  '42755',
  '42781',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2037,
  202,
  '42501',
  '42555',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2038,
  202,
  '42478',
  '42489',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2039,
  202,
  '45219',
  '45219',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2040,
  202,
  '45481',
  '45481',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2041,
  202,
  '40627',
  '40627',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2042,
  203,
  '53001',
  '53229',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2043,
  204,
  '50301',
  '51149',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2044,
  204,
  '51387',
  '51799',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2045,
  204,
  '53308',
  '53949',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2046,
  205,
  '41460',
  '41460',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2047,
  205,
  '41462',
  '41462',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2048,
  205,
  '41464',
  '41464',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2049,
  205,
  '41466',
  '41466',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2050,
  205,
  '41468',
  '41468',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2051,
  205,
  '41469',
  '41469',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2052,
  205,
  '41470',
  '41470',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2053,
  205,
  '41472',
  '41472',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2054,
  206,
  '51301',
  '51381',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2055,
  207,
  '42001',
  '42399',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2056,
  209,
  '67085',
  '67098',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2057,
  209,
  '67142',
  '67161',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2058,
  209,
  '67167',
  '67169',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2059,
  209,
  '67246',
  '67283',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2060,
  209,
  '67297',
  '67319',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2061,
  209,
  '67401',
  '67435',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2062,
  209,
  '67445',
  '67475',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2063,
  209,
  '67099',
  '67105',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2064,
  209,
  '67113',
  '67122',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2065,
  209,
  '67137',
  '67141',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2066,
  209,
  '67163',
  '67166',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2067,
  209,
  '67321',
  '67346',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2068,
  209,
  '67352',
  '67354',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2069,
  209,
  '67369',
  '67376',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2070,
  209,
  '67455',
  '67459',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2071,
  209,
  '67106',
  '67112',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2072,
  209,
  '67123',
  '67136',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2073,
  209,
  '67201',
  '67229',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2074,
  209,
  '67236',
  '67245',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2075,
  209,
  '67257',
  '67259',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2076,
  210,
  '67355',
  '67368',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2077,
  210,
  '67378',
  '67378',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2078,
  210,
  '76711',
  '76779',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2079,
  211,
  '67377',
  '67377',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2080,
  211,
  '67476',
  '67489',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2081,
  211,
  '76801',
  '76835',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2082,
  211,
  '76849',
  '76889',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2083,
  212,
  '67001',
  '67071',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2084,
  213,
  '66841',
  '66851',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2085,
  213,
  '66862',
  '66916',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2086,
  213,
  '67284',
  '67295',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2087,
  213,
  '67601',
  '67707',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2088,
  213,
  '67731',
  '67759',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2089,
  213,
  '67801',
  '67823',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2090,
  214,
  '66272',
  '66280',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2091,
  214,
  '66361',
  '66386',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2092,
  214,
  '66396',
  '66424',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2093,
  214,
  '66431',
  '66459',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2094,
  215,
  '66461',
  '66509',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2095,
  215,
  '66917',
  '66999',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2096,
  215,
  '67709',
  '67729',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2097,
  215,
  '76840',
  '76848',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2098,
  215,
  '76891',
  '76891',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2099,
  216,
  '96265',
  '96268',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2100,
  216,
  '96277',
  '96277',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2101,
  216,
  '96301',
  '96369',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2102,
  217,
  '91331',
  '91331',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2103,
  217,
  '96100',
  '96103',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2104,
  217,
  '96107',
  '96123',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2105,
  217,
  '96127',
  '96138',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2106,
  217,
  '96142',
  '96142',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2107,
  217,
  '96146',
  '96149',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2108,
  217,
  '96154',
  '96158',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2109,
  217,
  '96161',
  '96164',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2110,
  217,
  '96167',
  '96172',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2111,
  217,
  '96173',
  '96176',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2112,
  217,
  '96178',
  '96179',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2113,
  217,
  '96181',
  '96182',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2114,
  217,
  '96185',
  '96188',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2115,
  217,
  '96191',
  '96191',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2116,
  217,
  '96194',
  '96197',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2117,
  217,
  '96199',
  '96199',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2118,
  218,
  '90542',
  '90552',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2119,
  218,
  '90562',
  '90562',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2120,
  218,
  '90563',
  '90571',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2121,
  218,
  '90603',
  '90607',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2122,
  218,
  '91191',
  '91227',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2123,
  218,
  '91230',
  '91238',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2124,
  218,
  '91241',
  '91247',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2125,
  218,
  '91284',
  '91284',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2126,
  218,
  '91287',
  '91287',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2127,
  218,
  '91275',
  '91275',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2128,
  219,
  '90600',
  '90602',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2129,
  219,
  '91221',
  '91224',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2130,
  219,
  '92257',
  '92268',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2131,
  219,
  '92278',
  '92278',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2132,
  219,
  '92280',
  '92283',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2133,
  219,
  '92289',
  '92289',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2134,
  219,
  '92301',
  '92318',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2135,
  219,
  '92331',
  '92334',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2136,
  219,
  '92340',
  '92369',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2137,
  220,
  '90523',
  '90530',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2138,
  220,
  '90580',
  '90584',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2139,
  220,
  '90593',
  '90596',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2140,
  220,
  '91101',
  '91189',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2141,
  221,
  '90449',
  '90455',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2142,
  221,
  '90469',
  '90475',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2143,
  221,
  '90547',
  '90547',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2144,
  221,
  '90518',
  '90518',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2145,
  221,
  '90531',
  '90537',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2146,
  221,
  '90592',
  '90592',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2147,
  221,
  '90557',
  '90559',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2148,
  221,
  '90592',
  '90592',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2149,
  221,
  '90610',
  '90610',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2150,
  221,
  '91225',
  '91227',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2151,
  222,
  '85001',
  '85057',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2152,
  222,
  '85073',
  '85080',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2153,
  222,
  '85084',
  '85092',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2154,
  222,
  '85095',
  '85129',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2155,
  222,
  '85140',
  '85140',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2156,
  222,
  '85134',
  '85139',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2157,
  223,
  '99000',
  '99999',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2158,
  223,
  '37308',
  '37359',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2159,
  223,
  '06556',
  '06578',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2160,
  224,
  '98000',
  '98999',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2161,
  224,
  '36421',
  '36448',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2162,
  224,
  '36453',
  '36456',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2163,
  224,
  '36467',
  '36469',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2164,
  224,
  '96515',
  '96529',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2165,
  224,
  '07318',
  '07318',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2166,
  224,
  '07333',
  '07336',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2167,
  224,
  '07381',
  '07389',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2168,
  224,
  '07407',
  '07429',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2169,
  224,
  '07616',
  '07619',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2170,
  224,
  '07701',
  '07749',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2171,
  224,
  '07771',
  '07778',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2172,
  224,
  '07806',
  '07806',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2173,
  225,
  '28195',
  '28359',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2174,
  226,
  '76131',
  '76229',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2175,
  227,
  '76532',
  '76532',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2176,
  227,
  '76545',
  '76599',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2177,
  227,
  '76275',
  '76275',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2178,
  227,
  '76287',
  '76287',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2179,
  227,
  '76401',
  '76479',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2180,
  227,
  '77801',
  '77839',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2181,
  228,
  '78001',
  '78126',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2182,
  228,
  '78132',
  '78141',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2183,
  228,
  '78144',
  '78199',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2184,
  228,
  '78532',
  '78532',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2185,
  228,
  '78573',
  '78594',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2186,
  228,
  '78604',
  '78609',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2187,
  228,
  '78647',
  '78647',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2188,
  229,
  '88697',
  '88697',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2189,
  229,
  '88718',
  '88718',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2190,
  229,
  '88693',
  '88693',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2191,
  229,
  '88699',
  '88699',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2192,
  229,
  '88709',
  '88709',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2193,
  229,
  '88633',
  '88633',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2194,
  229,
  '88090',
  '88090',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2195,
  229,
  '88677',
  '88677',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2196,
  229,
  '88696',
  '88696',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2197,
  229,
  '88682',
  '88682',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2198,
  229,
  '78354',
  '78354',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2199,
  229,
  '88710',
  '88710',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2200,
  229,
  '88662',
  '88662',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2201,
  229,
  '88690',
  '88690',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2202,
  229,
  '88048',
  '88048',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2203,
  230,
  '59909',
  '59964',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2204,
  230,
  '59969',
  '59969',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2205,
  230,
  '34418',
  '34431',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2206,
  231,
  '33804',
  '33818',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2207,
  231,
  '33185',
  '33189',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2208,
  231,
  '32063',
  '32108',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2209,
  231,
  '32602',
  '32832',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2210,
  232,
  '44145',
  '44145',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2211,
  232,
  '44147',
  '44147',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2212,
  232,
  '44149',
  '44149',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2213,
  232,
  '44309',
  '44309',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2214,
  232,
  '44319',
  '44319',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2215,
  232,
  '44328',
  '44328',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2216,
  232,
  '44329',
  '44329',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2217,
  232,
  '44339',
  '44339',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2218,
  232,
  '44357',
  '44357',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2219,
  232,
  '44359',
  '44359',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2220,
  232,
  '44369',
  '44369',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2221,
  232,
  '44379',
  '44379',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2222,
  232,
  '44388',
  '44388',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2223,
  233,
  '44263',
  '44263',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2224,
  233,
  '44287',
  '44287',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2225,
  233,
  '44289',
  '44289',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2226,
  233,
  '44267',
  '44267',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2227,
  233,
  '44265',
  '44265',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2228,
  233,
  '44229',
  '44229',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2229,
  233,
  '44225',
  '44225',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2230,
  233,
  '44227',
  '44227',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2231,
  233,
  '44139',
  '44139',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2232,
  233,
  '44137',
  '44137',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2233,
  233,
  '44135',
  '44135',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2234,
  233,
  '44141',
  '44141',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2235,
  233,
  '44143',
  '44143',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2236,
  233,
  '44269',
  '44269',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2237,
  234,
  '59063',
  '59063',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2238,
  234,
  '59065',
  '59065',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2239,
  234,
  '59067',
  '59067',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2240,
  234,
  '59069',
  '59069',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2241,
  234,
  '59071',
  '59071',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2242,
  234,
  '59073',
  '59073',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2243,
  234,
  '59075',
  '59075',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2244,
  234,
  '59077',
  '59077',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2245,
  235,
  '32001',
  '32052',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2246,
  235,
  '32109',
  '32289',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2247,
  236,
  '32291',
  '32584',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2248,
  236,
  '32603',
  '32609',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2249,
  237,
  '90542',
  '90542',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2250,
  237,
  '90562',
  '90562',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2251,
  237,
  '91052',
  '91058',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2252,
  237,
  '91054',
  '91054',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2253,
  237,
  '91074',
  '91074',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2254,
  237,
  '91080',
  '91080',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2255,
  237,
  '91083',
  '91083',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2256,
  237,
  '91085',
  '91085',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2257,
  237,
  '91086',
  '91086',
  '2019-08-22 12:32:32',
  '2019-08-22 12:32:32'
), (
  2258,
  237,
  '91088',
  '91088',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2259,
  237,
  '91091',
  '91091',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2260,
  237,
  '91093',
  '91093',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2261,
  237,
  '91096',
  '91096',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2262,
  237,
  '91097',
  '91097',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2263,
  237,
  '91315',
  '91315',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2264,
  237,
  '91325',
  '91325',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2265,
  237,
  '91334',
  '91334',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2266,
  237,
  '91341',
  '91341',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2267,
  237,
  '91350',
  '91350',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2268,
  237,
  '91475',
  '91475',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2269,
  237,
  '91487',
  '91487',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2270,
  237,
  '96172',
  '96172',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2271,
  237,
  '96193',
  '96193',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2272,
  238,
  '96047',
  '96052',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2273,
  239,
  '91077',
  '91077',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2274,
  239,
  '91090',
  '91090',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2275,
  239,
  '91094',
  '91094',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2276,
  239,
  '91099',
  '91099',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2277,
  239,
  '91286',
  '91286',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2278,
  239,
  '91301',
  '91301',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2279,
  239,
  '91320',
  '91320',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2280,
  239,
  '91322',
  '91322',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2281,
  239,
  '91327',
  '91327',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2282,
  239,
  '91330',
  '91330',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2283,
  239,
  '91336',
  '91336',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2284,
  239,
  '91338',
  '91338',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2285,
  239,
  '91346',
  '91346',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2286,
  239,
  '91349',
  '91349',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2287,
  239,
  '91352',
  '91352',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2288,
  239,
  '91353',
  '91353',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2289,
  239,
  '91355',
  '91355',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2290,
  239,
  '91356',
  '91356',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2291,
  239,
  '91358',
  '91358',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2292,
  239,
  '91359',
  '91359',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2293,
  239,
  '91361',
  '91361',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2294,
  239,
  '91362',
  '91362',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2295,
  239,
  '91364',
  '91364',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2296,
  239,
  '91365',
  '91365',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2297,
  239,
  '91367',
  '91367',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2298,
  239,
  '91369',
  '91369',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2299,
  240,
  '26398',
  '26409',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2300,
  240,
  '26420',
  '26427',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2301,
  240,
  '26453',
  '26474',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2302,
  240,
  '26487',
  '26490',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2303,
  240,
  '26625',
  '26629',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2304,
  240,
  '26633',
  '26639',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2305,
  240,
  '26656',
  '26670',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2306,
  240,
  '26760',
  '26789',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2307,
  240,
  '26803',
  '26849',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2308,
  240,
  '26850',
  '26910',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2309,
  240,
  '48440',
  '48480',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2310,
  240,
  '48486',
  '48488',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2311,
  240,
  '48494',
  '48540',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2312,
  240,
  '49820',
  '49838',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2313,
  240,
  '49638',
  '49999',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2314,
  240,
  '49700',
  '49819',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2315,
  241,
  '27568',
  '27568',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2316,
  241,
  '21423',
  '21423',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2317,
  241,
  '21386',
  '21386',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2318,
  241,
  '21376',
  '21376',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2319,
  241,
  '21394',
  '21394',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2320,
  241,
  '21449',
  '21449',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2321,
  241,
  '21379',
  '21379',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2322,
  241,
  '21439',
  '21439',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2323,
  241,
  '21272',
  '21272',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2324,
  241,
  '21228',
  '21228',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2325,
  241,
  '21279',
  '21279',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2326,
  241,
  '21266',
  '21266',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2327,
  241,
  '21436',
  '21436',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2328,
  241,
  '21647',
  '21647',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2329,
  241,
  '21629',
  '21629',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2330,
  241,
  '21385',
  '21385',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2331,
  241,
  '21380',
  '21380',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2332,
  241,
  '21357',
  '21357',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2333,
  241,
  '21354',
  '21354',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2334,
  241,
  '21382',
  '21382',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2335,
  241,
  '21649',
  '21649',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2336,
  241,
  '21224',
  '21224',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2337,
  241,
  '21358',
  '21358',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2338,
  241,
  '21406',
  '21406',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2339,
  241,
  '21391',
  '21391',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2340,
  241,
  '21379',
  '21379',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2341,
  241,
  '27570',
  '27570',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2342,
  241,
  '27572',
  '27572',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2343,
  241,
  '27574',
  '27574',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2344,
  241,
  '27576',
  '27576',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2345,
  241,
  '27578',
  '27578',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2346,
  241,
  '27580',
  '27580',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2347,
  241,
  '27607',
  '27607',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2348,
  241,
  '27632',
  '27632',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2349,
  241,
  '27637',
  '27637',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2350,
  241,
  '27616',
  '27616',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2351,
  241,
  '21365',
  '21365',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2352,
  241,
  '21360',
  '21360',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2353,
  241,
  '21394',
  '21394',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2354,
  241,
  '21357',
  '21357',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2355,
  241,
  '21409',
  '21409',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2356,
  241,
  '27472',
  '27472',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2357,
  241,
  '27474',
  '27474',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2358,
  241,
  '27476',
  '27476',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2359,
  241,
  '27478',
  '27478',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2360,
  241,
  '27616',
  '27616',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2361,
  241,
  '27624',
  '27624',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2362,
  241,
  '27628',
  '27628',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2363,
  241,
  '21781',
  '21781',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2364,
  241,
  '21784',
  '21784',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2365,
  241,
  '21755',
  '21755',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2366,
  241,
  '21775',
  '21775',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2367,
  241,
  '21769',
  '21769',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2368,
  241,
  '21785',
  '21785',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2369,
  241,
  '21765',
  '21765',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2370,
  241,
  '27624',
  '27624',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2371,
  241,
  '27607',
  '27607',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2372,
  241,
  '27612',
  '27612',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2373,
  241,
  '21756',
  '21756',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2374,
  241,
  '27619',
  '27619',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2375,
  241,
  '21772',
  '21772',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2376,
  241,
  '27628',
  '27628',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2377,
  241,
  '21789',
  '21789',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2378,
  241,
  '27628',
  '27628',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2379,
  241,
  '21762',
  '21762',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2380,
  241,
  '21775',
  '21775',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2381,
  241,
  '21776',
  '21776',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2382,
  241,
  '27638',
  '27638',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2383,
  241,
  '21769',
  '21769',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2384,
  241,
  '21785',
  '21785',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2385,
  241,
  '21782',
  '21782',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2386,
  241,
  '27628',
  '27628',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2387,
  241,
  '21770',
  '21770',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2388,
  241,
  '21640',
  '21640',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2389,
  241,
  '27637',
  '27637',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2390,
  241,
  '21787',
  '21787',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2391,
  241,
  '21217',
  '21220',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2392,
  241,
  '21435',
  '21435',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2393,
  241,
  '21395',
  '21395',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2394,
  241,
  '21279',
  '21279',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2395,
  241,
  '21407',
  '21407',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2396,
  241,
  '21379',
  '21379',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2397,
  241,
  '21447',
  '21447',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2398,
  241,
  '21522',
  '21522',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2399,
  241,
  '21522',
  '21522',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2400,
  241,
  '21394',
  '21394',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2401,
  241,
  '21335',
  '21339',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2402,
  241,
  '21255',
  '21255',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2403,
  241,
  '21256',
  '21256',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2404,
  241,
  '21258',
  '21258',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2405,
  241,
  '21259',
  '21259',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2406,
  241,
  '21261',
  '21261',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2407,
  241,
  '21271',
  '21271',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2408,
  241,
  '21438',
  '21438',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2409,
  241,
  '21441',
  '21441',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2410,
  241,
  '21442',
  '21442',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2411,
  241,
  '21444',
  '21444',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2412,
  241,
  '21445',
  '21445',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2413,
  241,
  '21629',
  '21629',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2414,
  241,
  '21741',
  '21741',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2415,
  241,
  '21745',
  '21745',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2416,
  241,
  '21756',
  '21756',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2417,
  241,
  '21763',
  '21763',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2418,
  241,
  '21770',
  '21770',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2419,
  241,
  '21787',
  '21787',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2420,
  241,
  '21385',
  '21385',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2421,
  241,
  '19273',
  '19273',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2422,
  241,
  '21380',
  '21380',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2423,
  241,
  '21397',
  '21397',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2424,
  241,
  '21406',
  '21406',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2425,
  241,
  '21386',
  '21386',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2426,
  241,
  '21354',
  '21354',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2427,
  241,
  '21368',
  '21368',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2428,
  241,
  '21382',
  '21382',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2429,
  241,
  '21391',
  '21391',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2430,
  241,
  '21407',
  '21407',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2431,
  241,
  '21447',
  '21447',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2432,
  241,
  '21335',
  '21335',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2433,
  241,
  '21337',
  '21337',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2434,
  241,
  '21339',
  '21339',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2435,
  241,
  '21358',
  '21358',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2436,
  241,
  '21406',
  '21406',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2437,
  241,
  '21369',
  '21369',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2438,
  241,
  '21398',
  '21398',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2439,
  241,
  '21385',
  '21385',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2440,
  241,
  '21449',
  '21449',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2441,
  241,
  '21385',
  '21385',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2442,
  241,
  '21400',
  '21400',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2443,
  241,
  '21391',
  '21391',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2444,
  241,
  '21388',
  '21388',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2445,
  241,
  '21394',
  '21394',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2446,
  241,
  '21401',
  '21401',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2447,
  241,
  '21371',
  '21371',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2448,
  241,
  '21397',
  '21397',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2449,
  241,
  '21360',
  '21360',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2450,
  241,
  '21403',
  '21403',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2451,
  241,
  '21394',
  '21394',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2452,
  241,
  '21357',
  '21357',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2453,
  241,
  '21741',
  '21789',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2454,
  241,
  '27451',
  '27478',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2455,
  241,
  '21335',
  '21409',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2456,
  241,
  '21522',
  '21522',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2457,
  241,
  '27501',
  '27638',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2458,
  242,
  '30001',
  '30001',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2459,
  242,
  '30002',
  '30002',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2460,
  242,
  '30003',
  '30003',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2461,
  242,
  '30004',
  '30004',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2462,
  242,
  '30005',
  '30005',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2463,
  242,
  '30006',
  '30006',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2464,
  242,
  '30007',
  '30007',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2465,
  242,
  '30008',
  '30008',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2466,
  242,
  '30009',
  '30009',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2467,
  242,
  '30010',
  '30010',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2468,
  242,
  '30011',
  '30011',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2469,
  242,
  '30012',
  '30012',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2470,
  242,
  '30013',
  '30013',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2471,
  242,
  '30014',
  '30014',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2472,
  242,
  '30015',
  '30015',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2473,
  242,
  '30016',
  '30016',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2474,
  242,
  '30017',
  '30017',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2475,
  242,
  '30018',
  '30018',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2476,
  242,
  '30019',
  '30019',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2477,
  242,
  '30020',
  '30020',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2478,
  242,
  '30021',
  '30021',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2479,
  242,
  '30022',
  '30022',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2480,
  242,
  '30023',
  '30023',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2481,
  242,
  '30024',
  '30024',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2482,
  242,
  '30025',
  '30025',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2483,
  242,
  '30026',
  '30026',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2484,
  242,
  '30027',
  '30027',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2485,
  242,
  '30028',
  '30028',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2486,
  242,
  '30029',
  '30029',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2487,
  242,
  '30030',
  '30030',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2488,
  242,
  '30031',
  '30031',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2489,
  242,
  '30032',
  '30032',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2490,
  242,
  '30033',
  '30033',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2491,
  242,
  '30034',
  '30034',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2492,
  242,
  '30035',
  '30035',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2493,
  242,
  '30036',
  '30036',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2494,
  242,
  '30037',
  '30037',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2495,
  242,
  '30038',
  '30038',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2496,
  242,
  '30039',
  '30039',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2497,
  242,
  '30040',
  '30040',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2498,
  242,
  '30041',
  '30041',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2499,
  242,
  '30042',
  '30042',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2500,
  242,
  '30043',
  '30043',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2501,
  242,
  '30044',
  '30044',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2502,
  242,
  '30045',
  '30045',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2503,
  242,
  '30046',
  '30046',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2504,
  242,
  '30047',
  '30047',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2505,
  242,
  '30048',
  '30048',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2506,
  242,
  '30049',
  '30049',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2507,
  242,
  '30050',
  '30050',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2508,
  242,
  '30051',
  '30051',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2509,
  242,
  '30052',
  '30052',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2510,
  242,
  '30053',
  '30053',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2511,
  242,
  '30054',
  '30054',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2512,
  242,
  '30055',
  '30055',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2513,
  242,
  '30056',
  '30056',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2514,
  242,
  '30057',
  '30057',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2515,
  242,
  '30058',
  '30058',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2516,
  242,
  '30059',
  '30059',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2517,
  242,
  '30060',
  '30060',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2518,
  242,
  '30061',
  '30061',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2519,
  242,
  '30062',
  '30062',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2520,
  242,
  '30063',
  '30063',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2521,
  242,
  '30064',
  '30064',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2522,
  242,
  '30065',
  '30065',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2523,
  242,
  '30066',
  '30066',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2524,
  242,
  '30120',
  '30120',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2525,
  242,
  '30137',
  '30137',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2526,
  242,
  '30138',
  '30138',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2527,
  242,
  '30139',
  '30139',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2528,
  242,
  '30140',
  '30140',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2529,
  242,
  '30141',
  '30141',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2530,
  242,
  '30142',
  '30142',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2531,
  242,
  '30143',
  '30143',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2532,
  242,
  '30144',
  '30144',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2533,
  242,
  '30145',
  '30145',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2534,
  242,
  '30146',
  '30146',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2535,
  242,
  '30147',
  '30147',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2536,
  242,
  '30148',
  '30148',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2537,
  242,
  '30149',
  '30149',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2538,
  242,
  '30150',
  '30150',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2539,
  242,
  '30151',
  '30151',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2540,
  242,
  '30152',
  '30152',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2541,
  242,
  '30153',
  '30153',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2542,
  242,
  '30154',
  '30154',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2543,
  242,
  '30155',
  '30155',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2544,
  242,
  '30156',
  '30156',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2545,
  242,
  '30159',
  '30159',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2546,
  242,
  '30161',
  '30161',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2547,
  242,
  '30163',
  '30163',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2548,
  242,
  '30165',
  '30165',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2549,
  242,
  '30167',
  '30167',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2550,
  242,
  '30169',
  '30169',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2551,
  242,
  '30171',
  '30171',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2552,
  242,
  '30173',
  '30173',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2553,
  242,
  '30175',
  '30175',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2554,
  242,
  '30177',
  '30177',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2555,
  242,
  '30179',
  '30179',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2556,
  242,
  '30401',
  '30401',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2557,
  242,
  '30402',
  '30402',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2558,
  242,
  '30403',
  '30403',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2559,
  242,
  '30404',
  '30404',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2560,
  242,
  '30405',
  '30405',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2561,
  242,
  '30417',
  '30417',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2562,
  242,
  '30419',
  '30419',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2563,
  242,
  '30421',
  '30421',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2564,
  242,
  '30422',
  '30422',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2565,
  242,
  '30423',
  '30423',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2566,
  242,
  '30424',
  '30424',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2567,
  242,
  '30425',
  '30425',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2568,
  242,
  '30426',
  '30426',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2569,
  242,
  '30427',
  '30427',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2570,
  242,
  '30428',
  '30428',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2571,
  242,
  '30429',
  '30429',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2572,
  242,
  '30430',
  '30430',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2573,
  242,
  '30431',
  '30431',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2574,
  242,
  '30432',
  '30432',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2575,
  242,
  '30433',
  '30433',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2576,
  242,
  '30449',
  '30449',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2577,
  242,
  '30451',
  '30451',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2578,
  242,
  '30453',
  '30453',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2579,
  242,
  '30455',
  '30455',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2580,
  242,
  '30457',
  '30457',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2581,
  242,
  '30459',
  '30459',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2582,
  242,
  '30501',
  '30501',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2583,
  242,
  '30502',
  '30502',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2584,
  242,
  '30503',
  '30503',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2585,
  242,
  '30504',
  '30504',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2586,
  242,
  '30505',
  '30505',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2587,
  242,
  '30506',
  '30506',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2588,
  242,
  '30514',
  '30514',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2589,
  242,
  '30515',
  '30515',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2590,
  242,
  '30517',
  '30517',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2591,
  242,
  '30519',
  '30519',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2592,
  242,
  '30521',
  '30521',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2593,
  242,
  '30531',
  '30531',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2594,
  242,
  '30532',
  '30532',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2595,
  242,
  '30533',
  '30533',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2596,
  242,
  '30539',
  '30539',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2597,
  242,
  '30541',
  '30541',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2598,
  242,
  '30542',
  '30542',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2599,
  242,
  '30543',
  '30543',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2600,
  242,
  '30544',
  '30544',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2601,
  242,
  '30550',
  '30550',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2602,
  242,
  '30551',
  '30551',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2603,
  242,
  '30552',
  '30552',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2604,
  242,
  '30553',
  '30553',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2605,
  242,
  '30559',
  '30559',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2606,
  242,
  '30601',
  '30601',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2607,
  242,
  '30602',
  '30602',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2608,
  242,
  '30603',
  '30603',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2609,
  242,
  '30604',
  '30604',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2610,
  242,
  '30607',
  '30607',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2611,
  242,
  '30608',
  '30608',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2612,
  242,
  '30609',
  '30609',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2613,
  242,
  '30611',
  '30611',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2614,
  242,
  '30612',
  '30612',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2615,
  242,
  '30613',
  '30613',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2616,
  242,
  '30620',
  '30620',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2617,
  242,
  '30621',
  '30621',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2618,
  242,
  '30622',
  '30622',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2619,
  242,
  '30623',
  '30623',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2620,
  242,
  '30625',
  '30625',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2621,
  242,
  '30627',
  '30627',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2622,
  242,
  '30629',
  '30629',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2623,
  242,
  '30631',
  '30631',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2624,
  242,
  '30632',
  '30632',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2625,
  242,
  '30633',
  '30633',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2626,
  242,
  '30634',
  '30634',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2627,
  242,
  '30635',
  '30635',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2628,
  242,
  '30636',
  '30636',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2629,
  242,
  '30637',
  '30637',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2630,
  242,
  '30655',
  '30655',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2631,
  242,
  '30657',
  '30657',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2632,
  242,
  '30659',
  '30659',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2633,
  242,
  '30661',
  '30661',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2634,
  242,
  '30662',
  '30662',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2635,
  242,
  '30669',
  '30669',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2636,
  242,
  '30801',
  '30801',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2637,
  242,
  '30802',
  '30802',
  '2019-08-22 12:32:33',
  '2019-08-22 12:32:33'
), (
  2638,
  242,
  '30803',
  '30803',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2639,
  242,
  '30804',
  '30804',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2640,
  242,
  '30805',
  '30805',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2641,
  242,
  '30808',
  '30808',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2642,
  242,
  '30809',
  '30809',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2643,
  242,
  '30811',
  '30811',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2644,
  242,
  '30812',
  '30812',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2645,
  242,
  '30813',
  '30813',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2646,
  242,
  '30821',
  '30821',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2647,
  242,
  '30823',
  '30823',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2648,
  242,
  '30826',
  '30826',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2649,
  242,
  '30827',
  '30827',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2650,
  242,
  '30832',
  '30832',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2651,
  242,
  '30833',
  '30833',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2652,
  242,
  '30834',
  '30834',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2653,
  242,
  '30835',
  '30835',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2654,
  242,
  '30836',
  '30836',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2655,
  242,
  '30837',
  '30837',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2656,
  242,
  '30838',
  '30838',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2657,
  242,
  '30839',
  '30839',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2658,
  242,
  '30840',
  '30840',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2659,
  242,
  '30842',
  '30842',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2660,
  242,
  '30843',
  '30843',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2661,
  242,
  '30851',
  '30851',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2662,
  242,
  '30853',
  '30853',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2663,
  242,
  '30855',
  '30855',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2664,
  242,
  '30856',
  '30856',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2665,
  242,
  '30857',
  '30857',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2666,
  242,
  '30858',
  '30858',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2667,
  242,
  '30859',
  '30859',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2668,
  242,
  '30860',
  '30860',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2669,
  242,
  '30864',
  '30864',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2670,
  242,
  '30865',
  '30865',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2671,
  242,
  '30866',
  '30866',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2672,
  242,
  '30867',
  '30867',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2673,
  242,
  '30868',
  '30868',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2674,
  242,
  '30870',
  '30870',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2675,
  242,
  '30871',
  '30871',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2676,
  242,
  '30875',
  '30875',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2677,
  242,
  '30876',
  '30876',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2678,
  242,
  '30878',
  '30878',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2679,
  242,
  '30880',
  '30880',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2680,
  242,
  '30881',
  '30881',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2681,
  242,
  '30882',
  '30882',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2682,
  242,
  '30883',
  '30883',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2683,
  242,
  '30884',
  '30884',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2684,
  242,
  '30886',
  '30886',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2685,
  242,
  '30890',
  '30890',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2686,
  242,
  '30891',
  '30891',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2687,
  242,
  '30892',
  '30892',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2688,
  242,
  '30893',
  '30893',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2689,
  242,
  '30896',
  '30896',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2690,
  242,
  '30900',
  '30900',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2691,
  242,
  '30901',
  '30901',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2692,
  242,
  '30902',
  '30902',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2693,
  242,
  '30903',
  '30903',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2694,
  242,
  '30904',
  '30904',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2695,
  242,
  '30907',
  '30907',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2696,
  242,
  '30908',
  '30908',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2697,
  242,
  '30913',
  '30913',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2698,
  242,
  '30916',
  '30916',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2699,
  242,
  '30917',
  '30917',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2700,
  242,
  '30918',
  '30918',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2701,
  242,
  '30920',
  '30920',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2702,
  242,
  '30921',
  '30921',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2703,
  242,
  '30926',
  '30926',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2704,
  242,
  '30927',
  '30927',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2705,
  242,
  '30928',
  '30928',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2706,
  242,
  '30929',
  '30929',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2707,
  242,
  '30930',
  '30930',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2708,
  242,
  '30931',
  '30931',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2709,
  242,
  '30938',
  '30938',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2710,
  242,
  '30939',
  '30939',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2711,
  242,
  '30940',
  '30940',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2712,
  242,
  '30941',
  '30941',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2713,
  242,
  '30942',
  '30942',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2714,
  242,
  '30944',
  '30944',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2715,
  242,
  '30945',
  '30945',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2716,
  242,
  '30947',
  '30947',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2717,
  242,
  '30952',
  '30952',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2718,
  242,
  '30953',
  '30953',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2719,
  242,
  '30954',
  '30954',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2720,
  242,
  '30955',
  '30955',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2721,
  242,
  '30956',
  '30956',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2722,
  242,
  '30957',
  '30957',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2723,
  242,
  '30959',
  '30959',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2724,
  242,
  '30960',
  '30960',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2725,
  242,
  '30966',
  '30966',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2726,
  242,
  '30967',
  '30967',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2727,
  242,
  '30968',
  '30968',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2728,
  242,
  '30970',
  '30970',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2729,
  242,
  '30974',
  '30974',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2730,
  242,
  '30975',
  '30975',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2731,
  242,
  '30976',
  '30976',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2732,
  242,
  '30978',
  '30978',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2733,
  242,
  '30982',
  '30982',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2734,
  242,
  '30983',
  '30983',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2735,
  242,
  '30984',
  '30984',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2736,
  242,
  '30988',
  '30988',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2737,
  242,
  '30989',
  '30989',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2738,
  242,
  '31008',
  '31008',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2739,
  242,
  '31028',
  '31028',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2740,
  242,
  '31061',
  '31061',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2741,
  242,
  '31079',
  '31079',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2742,
  242,
  '31084',
  '31084',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2743,
  242,
  '31089',
  '31089',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2744,
  242,
  '31134',
  '31141',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2745,
  242,
  '31157',
  '31157',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2746,
  242,
  '31162',
  '31162',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2747,
  242,
  '31167',
  '31167',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2748,
  242,
  '31171',
  '31171',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2749,
  242,
  '31174',
  '31174',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2750,
  242,
  '31177',
  '31177',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2751,
  242,
  '31180',
  '31180',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2752,
  242,
  '31185',
  '31185',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2753,
  242,
  '31188',
  '31188',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2754,
  242,
  '31191',
  '31191',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2755,
  242,
  '31195',
  '31195',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2756,
  242,
  '31199',
  '31199',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2757,
  242,
  '37154',
  '37154',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2758,
  242,
  '37581',
  '37581',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2759,
  242,
  '37574',
  '37574',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2760,
  242,
  '37186',
  '37186',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2761,
  242,
  '37176',
  '37176',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2762,
  242,
  '37170',
  '37170',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2763,
  242,
  '37194',
  '37194',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2764,
  242,
  '37589',
  '37589',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2765,
  242,
  '37191',
  '37191',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2766,
  242,
  '37547',
  '37547',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2767,
  242,
  '30000',
  '30999',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2768,
  242,
  '31032',
  '31032',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2769,
  242,
  '31033',
  '31033',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2770,
  243,
  '44601',
  '44653',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2771,
  244,
  '38160',
  '38162',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2772,
  244,
  '38166',
  '38168',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2773,
  244,
  '38171',
  '38171',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2774,
  244,
  '38201',
  '38259',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2775,
  244,
  '38269',
  '38315',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2776,
  244,
  '38319',
  '38321',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2777,
  244,
  '38324',
  '38324',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2778,
  244,
  '38329',
  '38329',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2779,
  245,
  '44145',
  '44145',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2780,
  245,
  '44147',
  '44147',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2781,
  245,
  '44149',
  '44149',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2782,
  245,
  '44309',
  '44309',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2783,
  245,
  '44319',
  '44319',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2784,
  245,
  '44328',
  '44328',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2785,
  245,
  '44329',
  '44329',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2786,
  245,
  '44339',
  '44339',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2787,
  245,
  '44357',
  '44357',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2788,
  245,
  '44359',
  '44359',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2789,
  245,
  '44369',
  '44369',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2790,
  245,
  '44379',
  '44379',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2791,
  245,
  '44388',
  '44388',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2792,
  246,
  '44135',
  '44135',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2793,
  246,
  '44137',
  '44137',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2794,
  246,
  '44139',
  '44139',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2795,
  246,
  '44141',
  '44141',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2796,
  246,
  '44143',
  '44143',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2797,
  246,
  '44225',
  '44225',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2798,
  246,
  '44227',
  '44227',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2799,
  246,
  '44229',
  '44229',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2800,
  246,
  '44263',
  '44263',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2801,
  246,
  '44265',
  '44265',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2802,
  246,
  '44267',
  '44267',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2803,
  246,
  '44269',
  '44269',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2804,
  246,
  '44287',
  '44287',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2805,
  246,
  '44289',
  '44289',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2806,
  247,
  '57341',
  '57368',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2807,
  247,
  '57393',
  '57489',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2808,
  248,
  '59701',
  '59872',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2809,
  248,
  '59901',
  '59964',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2810,
  248,
  '57376',
  '57392',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2811,
  249,
  '34117',
  '34379',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2812,
  249,
  '34385',
  '34696',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2813,
  249,
  '35037',
  '35119',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2814,
  249,
  '35260',
  '35289',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2815,
  249,
  '36037',
  '36199',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2816,
  249,
  '36205',
  '36287',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2817,
  249,
  '36364',
  '36364',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2818,
  249,
  '36381',
  '36466',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2819,
  249,
  '37199',
  '37299',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2820,
  249,
  '61130',
  '61140',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2821,
  249,
  '63450',
  '63650',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2822,
  249,
  '36001',
  '36103',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2823,
  249,
  '36111',
  '36169',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2824,
  249,
  '36404',
  '36419',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2825,
  249,
  '36452',
  '36452',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2826,
  249,
  '36457',
  '36460',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2827,
  249,
  '36466',
  '36466',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2828,
  250,
  '47662',
  '47665',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2829,
  250,
  '47401',
  '47506',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2830,
  250,
  '46515',
  '46519',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2831,
  250,
  '46500',
  '46509',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2832,
  251,
  '86648',
  '86653',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2833,
  251,
  '86681',
  '86681',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2834,
  251,
  '86703',
  '86704',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2835,
  251,
  '86709',
  '86709',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2836,
  251,
  '86744',
  '86744',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2837,
  251,
  '86750',
  '86750',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2838,
  251,
  '90597',
  '90599',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2839,
  251,
  '90611',
  '90613',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2840,
  251,
  '91556',
  '91575',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2841,
  251,
  '91579',
  '91580',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2842,
  251,
  '91584',
  '91586',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2843,
  251,
  '91589',
  '91590',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2844,
  251,
  '91595',
  '91596',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2845,
  251,
  '91639',
  '91710',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2846,
  251,
  '91717',
  '91725',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2847,
  251,
  '91728',
  '91729',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2848,
  251,
  '91732',
  '91743',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2849,
  251,
  '91746',
  '91747',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2850,
  251,
  '91751',
  '91793',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2851,
  251,
  '91793',
  '91799',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2852,
  251,
  '91801',
  '91807',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2853,
  251,
  '91623',
  '91623',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2854,
  251,
  '91632',
  '91632',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2855,
  252,
  '85111',
  '85111',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2856,
  252,
  '91795',
  '91795',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2857,
  252,
  '85116',
  '85116',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2858,
  252,
  '85072',
  '85072',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2859,
  252,
  '91804',
  '91804',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2860,
  252,
  '85131',
  '85131',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2861,
  252,
  '85132',
  '85132',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2862,
  252,
  '91809',
  '91809',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2863,
  252,
  '93336',
  '93336',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2864,
  252,
  '85113',
  '85113',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2865,
  252,
  '85114',
  '85114',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2866,
  252,
  '85095',
  '85095',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2867,
  252,
  '85117',
  '85117',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2868,
  252,
  '85080',
  '85080',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2869,
  252,
  '85098',
  '85098',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2870,
  252,
  '85120',
  '85120',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2871,
  252,
  '85122',
  '85122',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2872,
  252,
  '85092',
  '85092',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2873,
  252,
  '85101',
  '85101',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2874,
  252,
  '93349',
  '93349',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2875,
  252,
  '85128',
  '85128',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2876,
  252,
  '85129',
  '85129',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2877,
  252,
  '85104',
  '85104',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2878,
  252,
  '85134',
  '85134',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2879,
  252,
  '85135',
  '85135',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2880,
  252,
  '85137',
  '85137',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2881,
  252,
  '85139',
  '85139',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2882,
  252,
  '92339',
  '92339',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2883,
  252,
  '85125',
  '85125',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2884,
  252,
  '85110',
  '85110',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2885,
  253,
  '06177',
  '06204',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2886,
  253,
  '06217',
  '06217',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2887,
  253,
  '06227',
  '06268',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2888,
  253,
  '06277',
  '06279',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2889,
  254,
  '27000',
  '27242',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2890,
  254,
  '27244',
  '27335',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2891,
  254,
  '31600',
  '31630',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2892,
  254,
  '31547',
  '31547',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2893,
  254,
  '31592',
  '31592',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2894,
  254,
  '31595',
  '31595',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2895,
  254,
  '49839',
  '49637',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2896,
  254,
  '49402',
  '49406',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2897,
  254,
  '49414',
  '49419',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2898,
  254,
  '49490',
  '49617',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2899,
  254,
  '49440',
  '49448',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2900,
  254,
  '49452',
  '49453',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2901,
  254,
  '49457',
  '49460',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2902,
  254,
  '49074',
  '49090',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2903,
  254,
  '49000',
  '49073',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2904,
  254,
  '49091',
  '49359',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2905,
  254,
  '49625',
  '49626',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2906,
  254,
  '49633',
  '49640',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2907,
  255,
  '33241',
  '33449',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2908,
  255,
  '33748',
  '33803',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2909,
  255,
  '33825',
  '33829',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2910,
  256,
  '10707',
  '10707',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2911,
  256,
  '10709',
  '10709',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2912,
  256,
  '10711',
  '10711',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2913,
  256,
  '10713',
  '10713',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2914,
  256,
  '10715',
  '10715',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2915,
  256,
  '10717',
  '10717',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2916,
  256,
  '10719',
  '10719',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2917,
  256,
  '10777',
  '10777',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2918,
  256,
  '10779',
  '10779',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2919,
  256,
  '14193',
  '14193',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2920,
  256,
  '14195',
  '14195',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2921,
  256,
  '14197',
  '14197',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2922,
  256,
  '14199',
  '14199',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2923,
  256,
  '10585',
  '10585',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2924,
  256,
  '10587',
  '10587',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2925,
  256,
  '10589',
  '10589',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2926,
  256,
  '10623',
  '10623',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2927,
  256,
  '10625',
  '10625',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2928,
  256,
  '10627',
  '10627',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2929,
  256,
  '10629',
  '10629',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2930,
  256,
  '10787',
  '10787',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2931,
  256,
  '10789',
  '10789',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2932,
  256,
  '13627',
  '13627',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2933,
  256,
  '14050',
  '14050',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2934,
  256,
  '14052',
  '14052',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2935,
  256,
  '14053',
  '14053',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2936,
  256,
  '14055',
  '14055',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2937,
  256,
  '14057',
  '14057',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2938,
  256,
  '14059',
  '14059',
  '2019-08-22 12:32:34',
  '2019-08-22 12:32:34'
), (
  2939,
  258,
  '48249',
  '48249',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2940,
  258,
  '48301',
  '48301',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2941,
  258,
  '48308',
  '48308',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2942,
  258,
  '48329',
  '48329',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2943,
  258,
  '48653',
  '48653',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2944,
  258,
  '48720',
  '48720',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2945,
  258,
  '48727',
  '48727',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2946,
  258,
  '59348',
  '59348',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2947,
  258,
  '59387',
  '59387',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2948,
  258,
  '59394',
  '59394',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2949,
  258,
  '59399',
  '59399',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2950,
  259,
  '57376',
  '57392',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2951,
  259,
  '59701',
  '59969',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2952,
  260,
  '40001',
  '40670',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2953,
  260,
  '40701',
  '40789',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2954,
  260,
  '41001',
  '41239',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2955,
  260,
  '41335',
  '41363',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2956,
  260,
  '41401',
  '41751',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2957,
  260,
  '47456',
  '47475',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2958,
  260,
  '47496',
  '47509',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2959,
  260,
  '50101',
  '50129',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2960,
  260,
  '50172',
  '50259',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2961,
  260,
  '52380',
  '52380',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2962,
  260,
  '52382',
  '52382',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2963,
  260,
  '52401',
  '52445',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2964,
  261,
  '85001',
  '85139',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2965,
  261,
  '85233',
  '85235',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2966,
  261,
  '85261',
  '85309',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2967,
  261,
  '86521',
  '86529',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2968,
  261,
  '86557',
  '86558',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2969,
  261,
  '86561',
  '86565',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2970,
  261,
  '86571',
  '86571',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2971,
  261,
  '86579',
  '86579',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2972,
  261,
  '86616',
  '86633',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2973,
  261,
  '86642',
  '86642',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2974,
  261,
  '86643',
  '86643',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2975,
  261,
  '86664',
  '86669',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2976,
  261,
  '86673',
  '86673',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2977,
  261,
  '86674',
  '86674',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2978,
  261,
  '86676',
  '86676',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2979,
  261,
  '86697',
  '86697',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2980,
  261,
  '86701',
  '86701',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2981,
  261,
  '86706',
  '86706',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2982,
  261,
  '91795',
  '91795',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2983,
  261,
  '91804',
  '91804',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2984,
  261,
  '91807',
  '91809',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2985,
  261,
  '92332',
  '92339',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2986,
  261,
  '93334',
  '93339',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2987,
  261,
  '93349',
  '93349',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2988,
  262,
  '50441',
  '51149',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2989,
  263,
  '66000',
  '66839',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2990,
  264,
  '45601',
  '45665',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2991,
  264,
  '45951',
  '45968',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2992,
  264,
  '46201',
  '46244',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2993,
  264,
  '46251',
  '46286',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2994,
  265,
  '46301',
  '46414',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2995,
  265,
  '48232',
  '48249',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2996,
  265,
  '48292',
  '48308',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2997,
  265,
  '48325',
  '48329',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2998,
  265,
  '48572',
  '48739',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  2999,
  265,
  '58206',
  '58239',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3000,
  265,
  '58717',
  '58739',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3001,
  265,
  '59001',
  '59077',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3002,
  265,
  '59154',
  '59199',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3003,
  265,
  '59331',
  '59609',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3004,
  265,
  '47001',
  '47279',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3005,
  265,
  '46521',
  '46539',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3006,
  265,
  '46001',
  '46149',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3007,
  265,
  '45741',
  '45899',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3008,
  265,
  '45669',
  '45701',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3009,
  265,
  '45001',
  '45529',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3010,
  266,
  '84001',
  '84140',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3011,
  266,
  '84150',
  '84168',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3012,
  266,
  '84175',
  '84183',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3013,
  266,
  '84187',
  '84187',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3014,
  266,
  '84301',
  '84389',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3015,
  266,
  '85081',
  '85088',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3016,
  266,
  '85096',
  '85096',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3017,
  266,
  '85098',
  '85098',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3018,
  266,
  '85279',
  '85290',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3019,
  266,
  '85294',
  '85294',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3020,
  266,
  '85296',
  '85296',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3021,
  266,
  '91279',
  '91279',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3022,
  266,
  '91281',
  '91281',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3023,
  266,
  '92201',
  '92289',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3024,
  266,
  '92327',
  '92331',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3025,
  266,
  '92342',
  '92345',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3026,
  266,
  '92354',
  '93499',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3027,
  266,
  '94201',
  '94469',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3028,
  266,
  '94503',
  '94503',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3029,
  266,
  '94505',
  '94505',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3030,
  266,
  '94519',
  '94529',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3031,
  266,
  '95085',
  '95100',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3032,
  266,
  '95153',
  '95173',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3033,
  266,
  '95186',
  '95186',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3034,
  266,
  '95195',
  '95195',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3035,
  266,
  '95199',
  '95199',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3036,
  266,
  '95234',
  '95234',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3037,
  266,
  '95234',
  '95234',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3038,
  266,
  '95237',
  '95237',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3039,
  266,
  '95239',
  '95239',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3040,
  266,
  '95466',
  '95469',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3041,
  266,
  '95474',
  '95478',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3042,
  266,
  '95483',
  '95483',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3043,
  266,
  '95485',
  '95485',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3044,
  266,
  '95493',
  '95497',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3045,
  266,
  '95514',
  '95514',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3046,
  266,
  '95519',
  '95709',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3047,
  267,
  '26850',
  '26910',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3048,
  267,
  '49700',
  '49850',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3049,
  268,
  '63700',
  '63899',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3050,
  268,
  '82057',
  '82057',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3051,
  268,
  '82100',
  '82599',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3052,
  268,
  '83600',
  '83699',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3053,
  268,
  '86100',
  '86199',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3054,
  268,
  '86300',
  '86999',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3055,
  268,
  '87400',
  '87799',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3056,
  268,
  '89073',
  '89399',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3057,
  268,
  '97000',
  '97099',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3058,
  268,
  '97500',
  '97799',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3059,
  268,
  '97840',
  '97840',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3060,
  269,
  '90514',
  '90518',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3061,
  269,
  '90538',
  '90542',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3062,
  269,
  '91191',
  '91289',
  '2019-08-22 13:04:16',
  '2019-08-22 13:04:16'
), (
  3063,
  269,
  '91316',
  '91332',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3064,
  269,
  '91337',
  '91338',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3065,
  269,
  '91342',
  '91349',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3066,
  269,
  '91355',
  '91355',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3067,
  269,
  '91367',
  '91367',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3068,
  269,
  '92201',
  '92289',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3069,
  269,
  '92534',
  '92711',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3070,
  269,
  '95401',
  '95615',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3071,
  269,
  '95633',
  '95643',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3072,
  270,
  '46461',
  '46487',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3073,
  270,
  '46500',
  '46519',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3074,
  270,
  '47001',
  '47509',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3075,
  270,
  '47591',
  '47638',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3076,
  270,
  '47653',
  '47839',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3077,
  271,
  '66461',
  '66509',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3078,
  271,
  '66841',
  '66999',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3079,
  271,
  '67601',
  '67678',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3080,
  271,
  '67681',
  '67681',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3081,
  271,
  '67683',
  '67718',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3082,
  271,
  '67731',
  '67757',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3083,
  271,
  '76840',
  '76848',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3084,
  271,
  '76891',
  '76891',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3085,
  272,
  '72001',
  '72589',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3086,
  272,
  '72701',
  '72589',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3087,
  272,
  '75312',
  '75399',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3088,
  272,
  '78001',
  '79879',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3089,
  272,
  '88001',
  '88099',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3090,
  272,
  '88181',
  '89198',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3091,
  272,
  '89571',
  '89619',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3092,
  273,
  '33759',
  '33775',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3093,
  273,
  '48001',
  '48231',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3094,
  273,
  '48250',
  '48369',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3095,
  273,
  '48721',
  '48727',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3096,
  273,
  '49109',
  '49134',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3097,
  273,
  '49164',
  '49176',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3098,
  273,
  '49192',
  '49328',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3099,
  273,
  '49461',
  '49479',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3100,
  273,
  '49511',
  '49549',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3101,
  273,
  '59201',
  '59320',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3102,
  273,
  '59380',
  '59394',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3103,
  274,
  '48143',
  '48167',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3104,
  274,
  '59063',
  '59077',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3105,
  274,
  '48231',
  '48231',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3106,
  274,
  '48291',
  '48291',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3107,
  274,
  '48317',
  '48317',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3108,
  274,
  '48324',
  '48324',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3109,
  274,
  '48346',
  '48346',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3110,
  274,
  '48351',
  '48351',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3111,
  274,
  '48336',
  '48336',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3112,
  274,
  '48361',
  '48361',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3113,
  274,
  '59329',
  '59329',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3114,
  274,
  '59269',
  '59269',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3115,
  274,
  '59302',
  '59302',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3116,
  274,
  '59320',
  '59320',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3117,
  274,
  '59229',
  '59229',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3118,
  274,
  '59227',
  '59227',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3119,
  275,
  '88300',
  '89999',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3120,
  276,
  '68001',
  '76779',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3121,
  276,
  '77601',
  '79879',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3122,
  276,
  '86700',
  '86759',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3123,
  276,
  '88001',
  '89619',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3124,
  276,
  '91489',
  '91799',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3125,
  276,
  '97861',
  '97877',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3126,
  276,
  '97893',
  '97999',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3127,
  277,
  '74212',
  '74214',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3128,
  277,
  '74236',
  '74238',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3129,
  277,
  '74601',
  '74679',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3130,
  278,
  '04001',
  '04938',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3131,
  278,
  '06001',
  '06928',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3132,
  278,
  '14715',
  '14715',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3133,
  278,
  '29410',
  '29416',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3134,
  278,
  '38801',
  '38838',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3135,
  278,
  '38855',
  '38871',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3136,
  278,
  '38876',
  '39649',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3137,
  278,
  '99001',
  '99998',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3138,
  279,
  '10001',
  '14979',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3139,
  279,
  '15306',
  '15306',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3140,
  279,
  '15331',
  '15517',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3141,
  279,
  '15537',
  '15758',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3142,
  279,
  '15824',
  '15834',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3143,
  279,
  '16201',
  '16949',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3144,
  280,
  '59701',
  '59969',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3145,
  280,
  '58741',
  '58849',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3146,
  280,
  '58461',
  '58710',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3147,
  280,
  '57001',
  '57489',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3148,
  280,
  '51601',
  '51789',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3149,
  280,
  '51571',
  '51597',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3150,
  280,
  '51531',
  '51545',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3151,
  280,
  '42490',
  '42499',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3152,
  280,
  '42460',
  '42477',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3153,
  280,
  '34418',
  '34431',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3154,
  280,
  '44601',
  '44653',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3155,
  281,
  '85125',
  '85125',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3156,
  281,
  '91167',
  '91167',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3157,
  281,
  '91168',
  '91168',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3158,
  281,
  '91171',
  '91171',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3159,
  281,
  '92327',
  '92327',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3160,
  281,
  '92328',
  '92328',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3161,
  281,
  '92331',
  '92331',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3162,
  281,
  '92331',
  '92331',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3163,
  281,
  '92332',
  '92332',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3164,
  281,
  '92334',
  '92334',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3165,
  281,
  '92335',
  '92335',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3166,
  281,
  '92336',
  '92336',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3167,
  281,
  '92339',
  '92339',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3168,
  281,
  '92340',
  '92340',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3169,
  281,
  '92342',
  '92342',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3170,
  281,
  '92342',
  '92342',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3171,
  281,
  '92343',
  '92343',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3172,
  281,
  '92345',
  '92345',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3173,
  281,
  '92345',
  '92345',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3174,
  281,
  '92345',
  '92345',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3175,
  281,
  '92354',
  '92354',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3176,
  281,
  '92355',
  '92355',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3177,
  281,
  '92356',
  '92356',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3178,
  281,
  '92358',
  '92358',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3179,
  281,
  '92359',
  '92359',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3180,
  281,
  '92360',
  '92360',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3181,
  281,
  '92363',
  '92363',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3182,
  281,
  '92364',
  '92364',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3183,
  281,
  '92366',
  '92366',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3184,
  281,
  '93153',
  '93153',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3185,
  281,
  '93155',
  '93155',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3186,
  281,
  '93174',
  '93174',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3187,
  281,
  '93176',
  '93176',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3188,
  282,
  '32833',
  '33184',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3189,
  282,
  '34401',
  '34414',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3190,
  282,
  '34432',
  '34439',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3191,
  282,
  '37651',
  '37688',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3192,
  282,
  '37692',
  '37696',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3193,
  283,
  '44001',
  '44894',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3194,
  284,
  '44001',
  '44581',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3195,
  284,
  '45702',
  '45772',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3196,
  284,
  '48001',
  '48432',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3197,
  284,
  '48541',
  '48739',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3198,
  284,
  '59001',
  '59427',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3199,
  285,
  '60001',
  '60599',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3200,
  285,
  '65901',
  '65936',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3201,
  286,
  '55218',
  '55459',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3202,
  286,
  '65183',
  '65529',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3203,
  287,
  '48600',
  '48612',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3204,
  287,
  '48541',
  '48565',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3205,
  287,
  '48489',
  '48496',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3206,
  287,
  '48481',
  '48485',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3207,
  287,
  '48466',
  '48477',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3208,
  287,
  '48330',
  '48432',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3209,
  287,
  '48309',
  '48324',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3210,
  287,
  '48250',
  '48291',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3211,
  287,
  '48001',
  '48231',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3212,
  287,
  '49461',
  '49549',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3213,
  287,
  '59201',
  '59320',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3214,
  288,
  '48250',
  '48282',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3215,
  288,
  '48337',
  '48341',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3216,
  288,
  '48352',
  '48356',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3217,
  288,
  '48362',
  '48432',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3218,
  288,
  '48456',
  '48499',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3219,
  288,
  '48541',
  '48565',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3220,
  288,
  '48600',
  '48612',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3221,
  288,
  '48625',
  '48629',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3222,
  288,
  '49461',
  '49549',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3223,
  288,
  '49836',
  '49838',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3224,
  289,
  '54201',
  '54689',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3225,
  290,
  '91236',
  '91236',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3226,
  290,
  '90518',
  '90518',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3227,
  290,
  '90559',
  '90559',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3228,
  290,
  '91238',
  '91238',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3229,
  290,
  '90537',
  '90537',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3230,
  290,
  '91230',
  '91230',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3231,
  290,
  '91235',
  '91235',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3232,
  290,
  '91239',
  '91239',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3233,
  290,
  '91217',
  '91217',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3234,
  290,
  '91241',
  '91241',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3235,
  290,
  '91207',
  '91207',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3236,
  290,
  '91227',
  '91227',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3237,
  290,
  '91284',
  '91284',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3238,
  290,
  '91233',
  '91233',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3239,
  290,
  '91238',
  '91238',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3240,
  290,
  '91242',
  '91242',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3241,
  290,
  '91224',
  '91224',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3242,
  290,
  '91244',
  '91244',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3243,
  290,
  '90552',
  '90552',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3244,
  290,
  '90607',
  '90607',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3245,
  290,
  '91220',
  '91220',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3246,
  290,
  '90571',
  '90571',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3247,
  290,
  '90592',
  '90592',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3248,
  290,
  '91245',
  '91245',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3249,
  290,
  '91235',
  '91235',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3250,
  290,
  '91247',
  '91247',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3251,
  290,
  '90610',
  '90610',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3252,
  291,
  '78073',
  '78073',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3253,
  291,
  '78176',
  '78176',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3254,
  291,
  '78199',
  '78199',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3255,
  291,
  '78086',
  '78086',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3256,
  291,
  '78083',
  '78083',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3257,
  291,
  '78166',
  '78166',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3258,
  291,
  '78120',
  '78120',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3259,
  291,
  '78148',
  '78148',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3260,
  291,
  '78183',
  '78183',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3261,
  291,
  '78126',
  '78126',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3262,
  291,
  '78087',
  '78087',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3263,
  291,
  '78078',
  '78078',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3264,
  291,
  '78136',
  '78136',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3265,
  291,
  '78141',
  '78141',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3266,
  291,
  '78112',
  '78112',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3267,
  291,
  '78098',
  '78098',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3268,
  291,
  '78609',
  '78609',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3269,
  291,
  '78089',
  '78089',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3270,
  291,
  '78048',
  '78048',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3271,
  291,
  '78050',
  '78050',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3272,
  291,
  '78052',
  '78052',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3273,
  291,
  '78054',
  '78054',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3274,
  291,
  '78056',
  '78056',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3275,
  291,
  '78147',
  '78147',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3276,
  292,
  '76601',
  '76709',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3277,
  292,
  '68743',
  '68753',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3278,
  292,
  '68790',
  '68794',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3279,
  293,
  '75101',
  '75305',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3280,
  293,
  '75329',
  '75334',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3281,
  293,
  '75401',
  '75449',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3282,
  294,
  '79396',
  '79400',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3283,
  294,
  '79411',
  '79418',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3284,
  294,
  '79429',
  '79650',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3285,
  294,
  '79665',
  '79677',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3286,
  294,
  '79683',
  '79699',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3287,
  294,
  '79739',
  '79739',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3288,
  295,
  '79001',
  '79395',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3289,
  295,
  '79401',
  '79410',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3290,
  295,
  '79419',
  '79427',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3291,
  295,
  '79811',
  '79822',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3292,
  295,
  '79839',
  '79843',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3293,
  295,
  '79849',
  '79859',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3294,
  295,
  '79866',
  '79871',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3295,
  295,
  '79874',
  '79874',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3296,
  295,
  '79877',
  '79877',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3297,
  296,
  '50600',
  '50999',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3298,
  297,
  '42601',
  '42719',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3299,
  298,
  '53308',
  '53359',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3300,
  298,
  '53910',
  '53913',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3301,
  299,
  '50375',
  '51149',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3302,
  300,
  '01001',
  '03253',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3303,
  300,
  '15201',
  '15938',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3304,
  301,
  '51105',
  '51105',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3305,
  301,
  '51143',
  '51143',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3306,
  301,
  '51145',
  '51145',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3307,
  301,
  '51147',
  '51147',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3308,
  301,
  '51149',
  '51149',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3309,
  302,
  '82131',
  '82131',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3310,
  302,
  '82152',
  '82152',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3311,
  302,
  '82211',
  '82211',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3312,
  302,
  '82229',
  '82229',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3313,
  302,
  '82234',
  '82234',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3314,
  302,
  '82237',
  '82237',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3315,
  302,
  '82266',
  '82266',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3316,
  302,
  '82269',
  '82269',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3317,
  302,
  '82272',
  '82272',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3318,
  302,
  '82278',
  '82278',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3319,
  302,
  '82279',
  '82279',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3320,
  302,
  '82284',
  '82284',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3321,
  302,
  '82285',
  '82285',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3322,
  302,
  '82293',
  '82293',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3323,
  302,
  '82297',
  '82297',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3324,
  302,
  '82299',
  '82299',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3325,
  302,
  '82319',
  '82319',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3326,
  302,
  '82327',
  '82327',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3327,
  302,
  '82340',
  '82340',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3328,
  302,
  '82343',
  '82343',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3329,
  302,
  '82346',
  '82346',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3330,
  302,
  '82347',
  '82347',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3331,
  302,
  '82362',
  '82362',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3332,
  302,
  '82377',
  '82377',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3333,
  302,
  '82380',
  '82380',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3334,
  302,
  '82386',
  '82386',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3335,
  302,
  '82387',
  '82387',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3336,
  302,
  '82389',
  '82389',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3337,
  302,
  '82390',
  '82390',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3338,
  302,
  '82392',
  '82392',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3339,
  302,
  '82393',
  '82393',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3340,
  302,
  '82395',
  '82395',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3341,
  302,
  '82396',
  '82396',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3342,
  302,
  '82398',
  '82398',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3343,
  302,
  '82399',
  '82399',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3344,
  302,
  '82402',
  '82402',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3345,
  302,
  '82404',
  '82404',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3346,
  302,
  '82405',
  '82405',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3347,
  302,
  '82407',
  '82407',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3348,
  302,
  '82418',
  '82418',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3349,
  302,
  '82431',
  '82431',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3350,
  302,
  '82436',
  '82436',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3351,
  302,
  '82438',
  '82438',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3352,
  302,
  '82441',
  '82441',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3353,
  302,
  '82445',
  '82445',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3354,
  302,
  '82447',
  '82447',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3355,
  302,
  '82449',
  '82449',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3356,
  302,
  '82499',
  '82499',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3357,
  302,
  '82541',
  '82541',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3358,
  302,
  '83670',
  '83670',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3359,
  302,
  '83671',
  '83671',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3360,
  302,
  '83673',
  '83673',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3361,
  302,
  '85051',
  '85051',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3362,
  302,
  '85077',
  '85077',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3363,
  302,
  '85084',
  '85084',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3364,
  302,
  '85107',
  '85107',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3365,
  302,
  '85123',
  '85123',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3366,
  302,
  '85229',
  '85229',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3367,
  302,
  '85250',
  '85250',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3368,
  302,
  '85276',
  '85276',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3369,
  302,
  '85296',
  '85296',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3370,
  302,
  '85298',
  '85298',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3371,
  302,
  '85302',
  '85302',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3372,
  302,
  '85305',
  '85305',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3373,
  302,
  '85309',
  '85309',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3374,
  302,
  '86150',
  '86150',
  '2019-08-22 13:04:17',
  '2019-08-22 13:04:17'
), (
  3375,
  302,
  '86152',
  '86152',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3376,
  302,
  '86153',
  '86153',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3377,
  302,
  '86154',
  '86154',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3378,
  302,
  '86156',
  '86156',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3379,
  302,
  '86157',
  '86157',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3380,
  302,
  '86159',
  '86159',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3381,
  302,
  '86161',
  '86161',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3382,
  302,
  '86163',
  '86163',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3383,
  302,
  '86165',
  '86165',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3384,
  302,
  '86167',
  '86167',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3385,
  302,
  '86169',
  '86169',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3386,
  302,
  '86179',
  '86179',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3387,
  302,
  '86196',
  '86196',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3388,
  302,
  '86199',
  '86199',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3389,
  302,
  '86316',
  '86316',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3390,
  302,
  '86343',
  '86343',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3391,
  302,
  '86356',
  '86356',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3392,
  302,
  '86368',
  '86368',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3393,
  302,
  '86381',
  '86381',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3394,
  302,
  '86391',
  '86391',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3395,
  302,
  '86399',
  '86399',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3396,
  302,
  '86405',
  '86405',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3397,
  302,
  '86415',
  '86415',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3398,
  302,
  '86420',
  '86420',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3399,
  302,
  '86424',
  '86424',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3400,
  302,
  '86438',
  '86438',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3401,
  302,
  '86441',
  '86441',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3402,
  302,
  '86444',
  '86444',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3403,
  302,
  '86447',
  '86447',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3404,
  302,
  '86450',
  '86450',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3405,
  302,
  '86453',
  '86453',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3406,
  302,
  '86456',
  '86456',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3407,
  302,
  '86459',
  '86459',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3408,
  302,
  '86462',
  '86462',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3409,
  302,
  '86465',
  '86465',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3410,
  302,
  '86470',
  '86470',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3411,
  302,
  '86473',
  '86473',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3412,
  302,
  '86476',
  '86476',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3413,
  302,
  '86477',
  '86477',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3414,
  302,
  '86479',
  '86479',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3415,
  302,
  '86480',
  '86480',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3416,
  302,
  '86482',
  '86482',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3417,
  302,
  '86483',
  '86483',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3418,
  302,
  '86485',
  '86485',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3419,
  302,
  '86486',
  '86486',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3420,
  302,
  '86488',
  '86488',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3421,
  302,
  '86489',
  '86489',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3422,
  302,
  '86491',
  '86491',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3423,
  302,
  '86492',
  '86492',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3424,
  302,
  '86494',
  '86494',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3425,
  302,
  '86495',
  '86495',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3426,
  302,
  '86497',
  '86497',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3427,
  302,
  '86498',
  '86498',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3428,
  302,
  '86500',
  '86500',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3429,
  302,
  '86502',
  '86502',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3430,
  302,
  '86504',
  '86504',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3431,
  302,
  '86505',
  '86505',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3432,
  302,
  '86507',
  '86507',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3433,
  302,
  '86508',
  '86508',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3434,
  302,
  '86510',
  '86510',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3435,
  302,
  '86511',
  '86511',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3436,
  302,
  '86513',
  '86513',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3437,
  302,
  '86514',
  '86514',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3438,
  302,
  '86517',
  '86517',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3439,
  302,
  '86519',
  '86519',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3440,
  302,
  '86529',
  '86529',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3441,
  302,
  '86551',
  '86551',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3442,
  302,
  '86554',
  '86554',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3443,
  302,
  '86556',
  '86556',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3444,
  302,
  '86558',
  '86558',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3445,
  302,
  '86559',
  '86559',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3446,
  302,
  '86561',
  '86561',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3447,
  302,
  '86562',
  '86562',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3448,
  302,
  '86564',
  '86564',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3449,
  302,
  '86565',
  '86565',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3450,
  302,
  '86567',
  '86567',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3451,
  302,
  '86568',
  '86568',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3452,
  302,
  '86570',
  '86570',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3453,
  302,
  '86571',
  '86571',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3454,
  302,
  '86573',
  '86573',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3455,
  302,
  '86574',
  '86574',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3456,
  302,
  '86576',
  '86576',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3457,
  302,
  '86577',
  '86577',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3458,
  302,
  '86579',
  '86579',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3459,
  302,
  '86609',
  '86609',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3460,
  302,
  '86633',
  '86633',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3461,
  302,
  '86637',
  '86637',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3462,
  302,
  '86641',
  '86641',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3463,
  302,
  '86643',
  '86643',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3464,
  302,
  '86647',
  '86647',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3465,
  302,
  '86653',
  '86653',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3466,
  302,
  '86655',
  '86655',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3467,
  302,
  '86657',
  '86657',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3468,
  302,
  '86660',
  '86660',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3469,
  302,
  '86663',
  '86663',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3470,
  302,
  '86666',
  '86666',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3471,
  302,
  '86668',
  '86668',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3472,
  302,
  '86669',
  '86669',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3473,
  302,
  '86672',
  '86672',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3474,
  302,
  '86673',
  '86673',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3475,
  302,
  '86676',
  '86676',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3476,
  302,
  '86678',
  '86678',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3477,
  302,
  '86679',
  '86679',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3478,
  302,
  '86682',
  '86682',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3479,
  302,
  '86684',
  '86684',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3480,
  302,
  '86687',
  '86687',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3481,
  302,
  '86688',
  '86688',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3482,
  302,
  '86690',
  '86690',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3483,
  302,
  '86692',
  '86692',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3484,
  302,
  '86694',
  '86694',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3485,
  302,
  '86695',
  '86695',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3486,
  302,
  '86697',
  '86697',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3487,
  302,
  '86698',
  '86698',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3488,
  302,
  '86701',
  '86701',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3489,
  302,
  '86704',
  '86704',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3490,
  302,
  '86706',
  '86706',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3491,
  302,
  '86707',
  '86707',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3492,
  302,
  '86720',
  '86720',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3493,
  302,
  '86732',
  '86732',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3494,
  302,
  '86733',
  '86733',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3495,
  302,
  '86735',
  '86735',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3496,
  302,
  '86736',
  '86736',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3497,
  302,
  '86738',
  '86738',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3498,
  302,
  '86739',
  '86739',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3499,
  302,
  '86741',
  '86741',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3500,
  302,
  '86742',
  '86742',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3501,
  302,
  '86744',
  '86744',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3502,
  302,
  '86745',
  '86745',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3503,
  302,
  '86747',
  '86747',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3504,
  302,
  '86748',
  '86748',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3505,
  302,
  '86751',
  '86751',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3506,
  302,
  '86753',
  '86753',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3507,
  302,
  '86754',
  '86754',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3508,
  302,
  '86756',
  '86756',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3509,
  302,
  '86757',
  '86757',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3510,
  302,
  '86759',
  '86759',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3511,
  302,
  '86807',
  '86807',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3512,
  302,
  '86825',
  '86825',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3513,
  302,
  '86830',
  '86830',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3514,
  302,
  '86833',
  '86833',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3515,
  302,
  '86836',
  '86836',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3516,
  302,
  '86842',
  '86842',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3517,
  302,
  '86845',
  '86845',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3518,
  302,
  '86850',
  '86850',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3519,
  302,
  '86853',
  '86853',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3520,
  302,
  '86854',
  '86854',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3521,
  302,
  '86856',
  '86856',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3522,
  302,
  '86857',
  '86857',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3523,
  302,
  '86859',
  '86859',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3524,
  302,
  '86860',
  '86860',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3525,
  302,
  '86862',
  '86862',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3526,
  302,
  '86863',
  '86863',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3527,
  302,
  '86865',
  '86865',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3528,
  302,
  '86866',
  '86866',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3529,
  302,
  '86868',
  '86868',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3530,
  302,
  '86869',
  '86869',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3531,
  302,
  '86871',
  '86871',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3532,
  302,
  '86872',
  '86872',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3533,
  302,
  '86874',
  '86874',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3534,
  302,
  '86875',
  '86875',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3535,
  302,
  '86877',
  '86877',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3536,
  302,
  '86879',
  '86879',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3537,
  302,
  '86899',
  '86899',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3538,
  302,
  '86911',
  '86911',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3539,
  302,
  '86916',
  '86916',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3540,
  302,
  '86919',
  '86919',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3541,
  302,
  '86920',
  '86920',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3542,
  302,
  '86922',
  '86922',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3543,
  302,
  '86923',
  '86923',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3544,
  302,
  '86925',
  '86925',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3545,
  302,
  '86926',
  '86926',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3546,
  302,
  '86928',
  '86928',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3547,
  302,
  '86929',
  '86929',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3548,
  302,
  '86931',
  '86931',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3549,
  302,
  '86932',
  '86932',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3550,
  302,
  '86934',
  '86934',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3551,
  302,
  '86935',
  '86935',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3552,
  302,
  '86937',
  '86937',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3553,
  302,
  '86938',
  '86938',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3554,
  302,
  '86940',
  '86940',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3555,
  302,
  '86943',
  '86943',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3556,
  302,
  '86944',
  '86944',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3557,
  302,
  '86946',
  '86946',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3558,
  302,
  '86947',
  '86947',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3559,
  302,
  '86949',
  '86949',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3560,
  302,
  '86956',
  '86956',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3561,
  302,
  '86971',
  '86971',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3562,
  302,
  '86972',
  '86972',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3563,
  302,
  '86974',
  '86974',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3564,
  302,
  '86975',
  '86975',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3565,
  302,
  '86977',
  '86977',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3566,
  302,
  '86978',
  '86978',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3567,
  302,
  '86980',
  '86980',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3568,
  302,
  '86981',
  '86981',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3569,
  302,
  '86983',
  '86983',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3570,
  302,
  '86984',
  '86984',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3571,
  302,
  '86986',
  '86986',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3572,
  302,
  '86987',
  '86987',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3573,
  302,
  '86989',
  '86989',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3574,
  302,
  '87347',
  '87347',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3575,
  302,
  '87435',
  '87435',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3576,
  302,
  '87439',
  '87439',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3577,
  302,
  '87448',
  '87448',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3578,
  302,
  '87452',
  '87452',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3579,
  302,
  '87459',
  '87459',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3580,
  302,
  '87463',
  '87463',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3581,
  302,
  '87466',
  '87466',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3582,
  302,
  '87471',
  '87471',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3583,
  302,
  '87474',
  '87474',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3584,
  302,
  '87477',
  '87477',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3585,
  302,
  '87480',
  '87480',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3586,
  302,
  '87484',
  '87484',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3587,
  302,
  '87487',
  '87487',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3588,
  302,
  '87488',
  '87488',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3589,
  302,
  '87490',
  '87490',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3590,
  302,
  '87493',
  '87493',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3591,
  302,
  '87494',
  '87494',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3592,
  302,
  '87496',
  '87496',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3593,
  302,
  '87497',
  '87497',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3594,
  302,
  '87499',
  '87499',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3595,
  302,
  '87509',
  '87509',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3596,
  302,
  '87527',
  '87527',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3597,
  302,
  '87534',
  '87534',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3598,
  302,
  '87538',
  '87538',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3599,
  302,
  '87541',
  '87541',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3600,
  302,
  '87544',
  '87544',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3601,
  302,
  '87545',
  '87545',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3602,
  302,
  '87547',
  '87547',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3603,
  302,
  '87549',
  '87549',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3604,
  302,
  '87561',
  '87561',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3605,
  302,
  '87600',
  '87600',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3606,
  302,
  '87616',
  '87616',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3607,
  302,
  '87629',
  '87629',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3608,
  302,
  '87634',
  '87634',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3609,
  302,
  '87637',
  '87637',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3610,
  302,
  '87640',
  '87640',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3611,
  302,
  '87642',
  '87642',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3612,
  302,
  '87645',
  '87645',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3613,
  302,
  '87647',
  '87647',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3614,
  302,
  '87648',
  '87648',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3615,
  302,
  '87650',
  '87650',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3616,
  302,
  '87651',
  '87651',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3617,
  302,
  '87653',
  '87653',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3618,
  302,
  '87654',
  '87654',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3619,
  302,
  '87656',
  '87656',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3620,
  302,
  '87657',
  '87657',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3621,
  302,
  '87659',
  '87659',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3622,
  302,
  '87660',
  '87660',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3623,
  302,
  '87662',
  '87662',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3624,
  302,
  '87663',
  '87663',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3625,
  302,
  '87665',
  '87665',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3626,
  302,
  '87666',
  '87666',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3627,
  302,
  '87668',
  '87668',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3628,
  302,
  '87669',
  '87669',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3629,
  302,
  '87671',
  '87671',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3630,
  302,
  '87672',
  '87672',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3631,
  302,
  '87674',
  '87674',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3632,
  302,
  '87675',
  '87675',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3633,
  302,
  '87677',
  '87677',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3634,
  302,
  '87679',
  '87679',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3635,
  302,
  '87700',
  '87700',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3636,
  302,
  '87719',
  '87719',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3637,
  302,
  '87724',
  '87724',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3638,
  302,
  '87727',
  '87727',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3639,
  302,
  '87730',
  '87730',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3640,
  302,
  '87733',
  '87733',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3641,
  302,
  '87734',
  '87734',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3642,
  302,
  '87736',
  '87736',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3643,
  302,
  '87737',
  '87737',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3644,
  302,
  '87739',
  '87739',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3645,
  302,
  '87740',
  '87740',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3646,
  302,
  '87742',
  '87742',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3647,
  302,
  '87743',
  '87743',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3648,
  302,
  '87745',
  '87745',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3649,
  302,
  '87746',
  '87746',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3650,
  302,
  '87748',
  '87748',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3651,
  302,
  '87749',
  '87749',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3652,
  302,
  '87751',
  '87751',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3653,
  302,
  '87752',
  '87752',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3654,
  302,
  '87754',
  '87754',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3655,
  302,
  '87755',
  '87755',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3656,
  302,
  '87757',
  '87757',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3657,
  302,
  '87758',
  '87758',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3658,
  302,
  '87760',
  '87760',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3659,
  302,
  '87761',
  '87761',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3660,
  302,
  '87763',
  '87763',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3661,
  302,
  '87764',
  '87764',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3662,
  302,
  '87766',
  '87766',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3663,
  302,
  '87767',
  '87767',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3664,
  302,
  '87769',
  '87769',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3665,
  302,
  '87770',
  '87770',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3666,
  302,
  '87772',
  '87772',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3667,
  302,
  '87773',
  '87773',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3668,
  302,
  '87775',
  '87775',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3669,
  302,
  '87776',
  '87776',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3670,
  302,
  '87778',
  '87778',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3671,
  302,
  '87779',
  '87779',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3672,
  302,
  '87781',
  '87781',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3673,
  302,
  '87782',
  '87782',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3674,
  302,
  '87784',
  '87784',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3675,
  302,
  '87785',
  '87785',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3676,
  302,
  '87787',
  '87787',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3677,
  302,
  '87789',
  '87789',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3678,
  302,
  '88131',
  '88131',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3679,
  302,
  '88138',
  '88138',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3680,
  302,
  '88142',
  '88142',
  '2019-08-22 13:04:18',
  '2019-08-22 13:04:18'
), (
  3681,
  302,
  '88145',
  '88145',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3682,
  302,
  '88149',
  '88149',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3683,
  302,
  '88161',
  '88161',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3684,
  302,
  '88167',
  '88167',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3685,
  302,
  '88171',
  '88171',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3686,
  302,
  '88175',
  '88175',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3687,
  302,
  '88178',
  '88178',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3688,
  302,
  '88179',
  '88179',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3689,
  302,
  '89231',
  '89231',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3690,
  302,
  '89233',
  '89233',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3691,
  302,
  '89250',
  '89250',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3692,
  302,
  '89257',
  '89257',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3693,
  302,
  '89264',
  '89264',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3694,
  302,
  '89269',
  '89269',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3695,
  302,
  '89275',
  '89275',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3696,
  302,
  '89278',
  '89278',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3697,
  302,
  '89281',
  '89281',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3698,
  302,
  '89284',
  '89284',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3699,
  302,
  '89287',
  '89287',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3700,
  302,
  '89290',
  '89290',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3701,
  302,
  '89291',
  '89291',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3702,
  302,
  '89293',
  '89293',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3703,
  302,
  '89294',
  '89294',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3704,
  302,
  '89296',
  '89296',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3705,
  302,
  '89297',
  '89297',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3706,
  302,
  '89299',
  '89299',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3707,
  302,
  '89312',
  '89312',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3708,
  302,
  '89331',
  '89331',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3709,
  302,
  '89335',
  '89335',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3710,
  302,
  '89340',
  '89340',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3711,
  302,
  '89343',
  '89343',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3712,
  302,
  '89344',
  '89344',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3713,
  302,
  '89346',
  '89346',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3714,
  302,
  '89347',
  '89347',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3715,
  302,
  '89349',
  '89349',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3716,
  302,
  '89350',
  '89350',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3717,
  302,
  '89352',
  '89352',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3718,
  302,
  '89353',
  '89353',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3719,
  302,
  '89355',
  '89355',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3720,
  302,
  '89356',
  '89356',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3721,
  302,
  '89358',
  '89358',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3722,
  302,
  '89359',
  '89359',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3723,
  302,
  '89361',
  '89361',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3724,
  302,
  '89362',
  '89362',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3725,
  302,
  '89364',
  '89364',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3726,
  302,
  '89365',
  '89365',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3727,
  302,
  '89367',
  '89367',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3728,
  302,
  '89368',
  '89368',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3729,
  302,
  '89407',
  '89407',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3730,
  302,
  '89415',
  '89415',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3731,
  302,
  '89420',
  '89420',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3732,
  302,
  '89423',
  '89423',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3733,
  302,
  '89426',
  '89426',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3734,
  302,
  '89428',
  '89428',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3735,
  302,
  '89429',
  '89429',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3736,
  302,
  '89431',
  '89431',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3737,
  302,
  '89432',
  '89432',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3738,
  302,
  '89434',
  '89434',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3739,
  302,
  '89435',
  '89435',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3740,
  302,
  '89437',
  '89437',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3741,
  302,
  '89438',
  '89438',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3742,
  302,
  '89440',
  '89440',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3743,
  302,
  '89441',
  '89441',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3744,
  302,
  '89443',
  '89443',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3745,
  302,
  '89444',
  '89444',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3746,
  302,
  '89446',
  '89446',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3747,
  302,
  '89447',
  '89447',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3748,
  302,
  '89449',
  '89449',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3749,
  302,
  '91550',
  '91550',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3750,
  302,
  '91555',
  '91555',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3751,
  302,
  '91599',
  '91599',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3752,
  302,
  '91602',
  '91602',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3753,
  302,
  '91614',
  '91614',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3754,
  302,
  '91625',
  '91625',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3755,
  302,
  '91626',
  '91626',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3756,
  302,
  '91634',
  '91634',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3757,
  302,
  '91717',
  '91717',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3758,
  302,
  '91726',
  '91726',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3759,
  302,
  '91731',
  '91731',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3760,
  302,
  '91744',
  '91744',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3761,
  302,
  '91749',
  '91749',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3762,
  302,
  '91809',
  '91809',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3763,
  302,
  '95186',
  '95186',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3764,
  302,
  '97773',
  '97773',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3765,
  303,
  '45601',
  '45772',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3766,
  303,
  '45951',
  '45968',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3767,
  303,
  '46251',
  '46286',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3768,
  303,
  '44541',
  '44581',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3769,
  304,
  '82297',
  '82297',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3770,
  304,
  '86316',
  '86316',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3771,
  304,
  '86415',
  '86415',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3772,
  304,
  '86438',
  '86438',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3773,
  304,
  '86444',
  '86444',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3774,
  304,
  '86447',
  '86447',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3775,
  304,
  '86453',
  '86453',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3776,
  304,
  '86495',
  '86495',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3777,
  304,
  '86504',
  '86504',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3778,
  304,
  '86508',
  '86508',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3779,
  304,
  '86510',
  '86510',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3780,
  304,
  '86511',
  '86511',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3781,
  304,
  '86551',
  '86551',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3782,
  304,
  '86554',
  '86554',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3783,
  304,
  '86556',
  '86556',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3784,
  304,
  '86559',
  '86559',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3785,
  304,
  '86568',
  '86568',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3786,
  304,
  '86570',
  '86570',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3787,
  304,
  '86573',
  '86573',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3788,
  304,
  '86574',
  '86574',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3789,
  304,
  '86576',
  '86576',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3790,
  304,
  '86577',
  '86577',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3791,
  304,
  '86672',
  '86672',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3792,
  304,
  '86674',
  '86674',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3793,
  304,
  '86673',
  '86673',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3794,
  304,
  '86150',
  '86199',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3795,
  304,
  '86381',
  '86381',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3796,
  304,
  '86470',
  '86470',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3797,
  304,
  '86476',
  '86476',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3798,
  304,
  '86479',
  '86479',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3799,
  304,
  '86480',
  '86480',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3800,
  304,
  '86483',
  '86483',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3801,
  304,
  '86488',
  '86488',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3802,
  304,
  '86489',
  '86489',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3803,
  304,
  '86491',
  '86491',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3804,
  304,
  '86505',
  '86505',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3805,
  304,
  '86513',
  '86513',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3806,
  304,
  '86519',
  '86519',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3807,
  304,
  '89312',
  '89312',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3808,
  304,
  '89331',
  '89331',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3809,
  304,
  '89335',
  '89335',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3810,
  304,
  '89340',
  '89340',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3811,
  304,
  '89343',
  '89343',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3812,
  304,
  '89346',
  '89346',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3813,
  304,
  '89347',
  '89347',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3814,
  304,
  '89349',
  '89349',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3815,
  304,
  '89350',
  '89350',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3816,
  304,
  '89352',
  '89352',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3817,
  304,
  '89355',
  '89355',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3818,
  304,
  '89356',
  '89356',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3819,
  304,
  '89358',
  '89358',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3820,
  304,
  '89359',
  '89359',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3821,
  304,
  '89361',
  '89361',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3822,
  304,
  '89362',
  '89362',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3823,
  304,
  '89364',
  '89364',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3824,
  304,
  '89365',
  '89365',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3825,
  304,
  '89367',
  '89367',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3826,
  304,
  '89368',
  '89368',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3827,
  304,
  '86477',
  '86477',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3828,
  304,
  '86695',
  '86695',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3829,
  304,
  '86450',
  '86450',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3830,
  304,
  '86482',
  '86482',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3831,
  304,
  '86485',
  '86485',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3832,
  304,
  '86399',
  '86399',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3833,
  304,
  '86486',
  '86486',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3834,
  304,
  '86420',
  '86420',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3835,
  304,
  '86424',
  '86424',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3836,
  304,
  '86678',
  '86678',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3837,
  304,
  '86679',
  '86679',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3838,
  304,
  '86494',
  '86494',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3839,
  304,
  '86850',
  '86850',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3840,
  304,
  '86456',
  '86456',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3841,
  304,
  '86368',
  '86368',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3842,
  304,
  '86459',
  '86459',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3843,
  304,
  '86836',
  '86836',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3844,
  304,
  '86845',
  '86845',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3845,
  304,
  '86465',
  '86465',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3846,
  304,
  '86856',
  '86856',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3847,
  304,
  '86497',
  '86497',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3848,
  304,
  '86507',
  '86507',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3849,
  304,
  '86836',
  '86836',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3850,
  304,
  '86343',
  '86343',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3851,
  304,
  '86707',
  '86707',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3852,
  304,
  '86500',
  '86500',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3853,
  304,
  '86863',
  '86863',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3854,
  304,
  '86853',
  '86853',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3855,
  304,
  '86462',
  '86462',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3856,
  304,
  '86405',
  '86405',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3857,
  304,
  '86866',
  '86866',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3858,
  304,
  '86868',
  '86868',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3859,
  304,
  '86356',
  '86356',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3860,
  304,
  '86695',
  '86695',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3861,
  304,
  '86507',
  '86507',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3862,
  304,
  '86872',
  '86872',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3863,
  304,
  '86830',
  '86830',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3864,
  304,
  '86391',
  '86391',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3865,
  304,
  '86672',
  '86672',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3866,
  304,
  '86836',
  '86836',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3867,
  304,
  '86514',
  '86514',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3868,
  304,
  '86877',
  '86877',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3869,
  304,
  '86517',
  '86517',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3870,
  304,
  '86465',
  '86465',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3871,
  304,
  '86707',
  '86707',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3872,
  304,
  '86441',
  '86441',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3873,
  304,
  '89231',
  '89231',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3874,
  304,
  '89232',
  '89232',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3875,
  304,
  '89233',
  '89233',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3876,
  304,
  '89250',
  '89250',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3877,
  304,
  '89257',
  '89257',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3878,
  304,
  '89264',
  '89264',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3879,
  304,
  '89269',
  '89269',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3880,
  304,
  '89275',
  '89275',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3881,
  304,
  '89278',
  '89278',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3882,
  304,
  '89281',
  '89281',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3883,
  304,
  '89284',
  '89284',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3884,
  304,
  '89287',
  '89287',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3885,
  304,
  '89290',
  '89290',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3886,
  304,
  '89291',
  '89291',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3887,
  304,
  '89293',
  '89293',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3888,
  304,
  '89294',
  '89294',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3889,
  304,
  '89296',
  '89296',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3890,
  304,
  '89297',
  '89297',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3891,
  304,
  '89299',
  '89299',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3892,
  304,
  '86502',
  '86502',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3893,
  304,
  '86637',
  '86637',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3894,
  304,
  '86637',
  '86637',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3895,
  304,
  '86637',
  '86637',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3896,
  304,
  '86637',
  '86637',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3897,
  304,
  '86647',
  '86647',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3898,
  304,
  '86657',
  '86657',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3899,
  304,
  '89344',
  '89344',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3900,
  304,
  '89353',
  '89353',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3901,
  304,
  '89407',
  '89407',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3902,
  304,
  '89415',
  '89415',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3903,
  304,
  '89420',
  '89420',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3904,
  304,
  '89423',
  '89423',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3905,
  304,
  '89426',
  '89426',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3906,
  304,
  '89426',
  '89426',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3907,
  304,
  '89428',
  '89428',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3908,
  304,
  '89429',
  '89429',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3909,
  304,
  '89431',
  '89431',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3910,
  304,
  '89432',
  '89432',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3911,
  304,
  '89434',
  '89434',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3912,
  304,
  '89435',
  '89435',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3913,
  304,
  '89437',
  '89437',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3914,
  304,
  '89438',
  '89438',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3915,
  304,
  '89440',
  '89440',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3916,
  304,
  '89441',
  '89441',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3917,
  304,
  '89443',
  '89443',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3918,
  304,
  '89444',
  '89444',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3919,
  304,
  '89446',
  '89446',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3920,
  304,
  '89447',
  '89447',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3921,
  304,
  '89449',
  '89449',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3922,
  305,
  '51556',
  '51570',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3923,
  305,
  '53001',
  '53229',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3924,
  305,
  '53581',
  '53604',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3925,
  305,
  '53621',
  '53859',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3926,
  306,
  '60001',
  '63303',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3927,
  307,
  '39580',
  '39587',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3928,
  307,
  '39594',
  '39600',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3929,
  307,
  '39611',
  '39611',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3930,
  307,
  '39615',
  '39615',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3931,
  307,
  '39616',
  '39616',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3932,
  307,
  '39618',
  '39618',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3933,
  307,
  '39620',
  '39620',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3934,
  307,
  '39628',
  '39628',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3935,
  307,
  '39635',
  '39635',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3936,
  307,
  '39636',
  '39636',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3937,
  307,
  '39640',
  '39640',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3938,
  307,
  '39641',
  '39641',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3939,
  307,
  '39644',
  '39644',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3940,
  307,
  '39652',
  '39656',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3941,
  307,
  '39660',
  '39660',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3942,
  307,
  '39662',
  '39662',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3943,
  307,
  '39663',
  '39663',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3944,
  307,
  '39666',
  '39668',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3945,
  307,
  '39672',
  '39672',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3946,
  307,
  '39674',
  '39674',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3947,
  307,
  '39675',
  '39675',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3948,
  307,
  '39678',
  '39678',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3949,
  308,
  '86521',
  '86521',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3950,
  308,
  '86522',
  '86522',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3951,
  308,
  '86523',
  '86523',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3952,
  308,
  '86524',
  '86524',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3953,
  308,
  '86529',
  '86529',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3954,
  308,
  '86542',
  '86542',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3955,
  308,
  '86543',
  '86543',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3956,
  308,
  '86544',
  '86544',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3957,
  308,
  '86545',
  '86545',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3958,
  308,
  '86551',
  '86551',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3959,
  308,
  '86552',
  '86552',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3960,
  308,
  '86554',
  '86554',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3961,
  308,
  '86555',
  '86555',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3962,
  308,
  '86556',
  '86556',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3963,
  308,
  '86557',
  '86557',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3964,
  308,
  '86558',
  '86558',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3965,
  308,
  '86559',
  '86559',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3966,
  308,
  '86561',
  '86561',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3967,
  308,
  '86562',
  '86562',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3968,
  308,
  '86564',
  '86564',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3969,
  308,
  '86565',
  '86565',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3970,
  308,
  '86567',
  '86567',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3971,
  308,
  '86568',
  '86568',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3972,
  308,
  '86570',
  '86570',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3973,
  308,
  '86571',
  '86571',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3974,
  308,
  '86573',
  '86573',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3975,
  308,
  '86574',
  '86574',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3976,
  308,
  '86576',
  '86576',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3977,
  308,
  '86577',
  '86577',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3978,
  308,
  '86579',
  '86579',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3979,
  308,
  '86601',
  '86601',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3980,
  308,
  '86602',
  '86602',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3981,
  308,
  '86603',
  '86603',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3982,
  308,
  '86604',
  '86604',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3983,
  308,
  '86607',
  '86607',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3984,
  308,
  '86609',
  '86609',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3985,
  308,
  '86616',
  '86616',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3986,
  308,
  '86617',
  '86617',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3987,
  308,
  '86618',
  '86618',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3988,
  308,
  '86619',
  '86619',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3989,
  308,
  '86620',
  '86620',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3990,
  308,
  '86621',
  '86621',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3991,
  308,
  '86622',
  '86622',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3992,
  308,
  '86623',
  '86623',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3993,
  308,
  '86633',
  '86633',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3994,
  308,
  '86634',
  '86634',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3995,
  308,
  '86635',
  '86635',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3996,
  308,
  '86637',
  '86637',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3997,
  308,
  '86638',
  '86638',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3998,
  308,
  '86639',
  '86639',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  3999,
  308,
  '86640',
  '86640',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4000,
  308,
  '86641',
  '86641',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4001,
  308,
  '86642',
  '86642',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4002,
  308,
  '86643',
  '86643',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4003,
  308,
  '86644',
  '86644',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4004,
  308,
  '86646',
  '86646',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4005,
  308,
  '86647',
  '86647',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4006,
  308,
  '86648',
  '86648',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4007,
  308,
  '86650',
  '86650',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4008,
  308,
  '86651',
  '86651',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4009,
  308,
  '86653',
  '86653',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4010,
  308,
  '86653',
  '86653',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4011,
  308,
  '86654',
  '86654',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4012,
  308,
  '86655',
  '86655',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4013,
  308,
  '86656',
  '86656',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4014,
  308,
  '86657',
  '86657',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4015,
  308,
  '86658',
  '86658',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4016,
  308,
  '86660',
  '86660',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4017,
  308,
  '86661',
  '86661',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4018,
  308,
  '86663',
  '86663',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4019,
  308,
  '86664',
  '86664',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4020,
  308,
  '86666',
  '86666',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4021,
  308,
  '86667',
  '86667',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4022,
  308,
  '86668',
  '86668',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4023,
  308,
  '86669',
  '86669',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4024,
  308,
  '86670',
  '86670',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4025,
  308,
  '86672',
  '86672',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4026,
  308,
  '86673',
  '86673',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4027,
  308,
  '86674',
  '86674',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4028,
  308,
  '86675',
  '86675',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4029,
  308,
  '86676',
  '86676',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4030,
  308,
  '86678',
  '86678',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4031,
  308,
  '86679',
  '86679',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4032,
  308,
  '86681',
  '86681',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4033,
  308,
  '86682',
  '86682',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4034,
  308,
  '86684',
  '86684',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4035,
  308,
  '86685',
  '86685',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4036,
  308,
  '86687',
  '86687',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4037,
  308,
  '86688',
  '86688',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4038,
  308,
  '86690',
  '86690',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4039,
  308,
  '86692',
  '86692',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4040,
  308,
  '86694',
  '86694',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4041,
  308,
  '86695',
  '86695',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4042,
  308,
  '86695',
  '86695',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4043,
  308,
  '86697',
  '86697',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4044,
  308,
  '86698',
  '86698',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4045,
  308,
  '86700',
  '86700',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4046,
  308,
  '86701',
  '86701',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4047,
  308,
  '86703',
  '86703',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4048,
  308,
  '86704',
  '86704',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4049,
  308,
  '86706',
  '86706',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4050,
  309,
  '90514',
  '90518',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4051,
  309,
  '90531',
  '90537',
  '2019-08-22 13:04:19',
  '2019-08-22 13:04:19'
), (
  4052,
  309,
  '90548',
  '90552',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4053,
  309,
  '90557',
  '90557',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4054,
  309,
  '90559',
  '90559',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4055,
  309,
  '90563',
  '90571',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4056,
  309,
  '90588',
  '90592',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4057,
  309,
  '90603',
  '90607',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4058,
  309,
  '91207',
  '91247',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4059,
  309,
  '91282',
  '91282',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4060,
  309,
  '91284',
  '91284',
  '2019-08-22 13:04:20',
  '2019-08-22 13:04:20'
), (
  4061,
  310,
  '80804',
  '80804',
  '2019-08-22 13:14:07',
  '2019-08-22 13:14:07'
), (
  4062,
  310,
  '80805',
  '80805',
  '2019-08-22 13:14:07',
  '2019-08-22 13:14:07'
), (
  4063,
  310,
  '80807',
  '80807',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4064,
  310,
  '80809',
  '80809',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4065,
  310,
  '80933',
  '80933',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4066,
  310,
  '80935',
  '80935',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4067,
  310,
  '80939',
  '80939',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4068,
  310,
  '80993',
  '80993',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4069,
  310,
  '80995',
  '80995',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4070,
  310,
  '81379',
  '81379',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4071,
  310,
  '81475',
  '81475',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4072,
  310,
  '81476',
  '81476',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4073,
  310,
  '81477',
  '81477',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4074,
  310,
  '81479',
  '81479',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4075,
  311,
  '79272',
  '79274',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4076,
  311,
  '79811',
  '79822',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4077,
  311,
  '79839',
  '79843',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4078,
  311,
  '79849',
  '79859',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4079,
  311,
  '79866',
  '79871',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4080,
  311,
  '79874',
  '79874',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4081,
  311,
  '79877',
  '79877',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4082,
  312,
  '79190',
  '79206',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4083,
  312,
  '79220',
  '79241',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4084,
  312,
  '79245',
  '79256',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4085,
  312,
  '79264',
  '79271',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4086,
  312,
  '79280',
  '79280',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4087,
  312,
  '79283',
  '79288',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4088,
  312,
  '79291',
  '79294',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4089,
  312,
  '79299',
  '79299',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4090,
  312,
  '79354',
  '79356',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4091,
  313,
  '67355',
  '67368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4092,
  313,
  '67378',
  '67378',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4093,
  313,
  '76711',
  '76779',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4094,
  313,
  '76866',
  '76872',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4095,
  313,
  '76879',
  '76879',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4096,
  314,
  '76873',
  '76889',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4097,
  314,
  '76801',
  '76835',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4098,
  314,
  '76849',
  '76865',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4099,
  314,
  '67401',
  '67435',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4100,
  314,
  '67476',
  '67489',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4101,
  315,
  '77705',
  '77716',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4102,
  315,
  '77732',
  '77736',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4103,
  315,
  '77750',
  '77756',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4104,
  315,
  '77778',
  '77790',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4105,
  315,
  '77793',
  '77793',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4106,
  315,
  '77796',
  '77796',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4107,
  315,
  '78127',
  '78132',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4108,
  316,
  '68701',
  '68740',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4109,
  316,
  '68767',
  '68782',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4110,
  317,
  '71301',
  '71554',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4111,
  317,
  '71560',
  '71560',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4112,
  317,
  '71564',
  '71559',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4113,
  317,
  '71711',
  '71711',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4114,
  317,
  '71736',
  '71737',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4115,
  317,
  '73551',
  '73553',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4116,
  317,
  '73601',
  '73635',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4117,
  317,
  '73642',
  '73650',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4118,
  317,
  '73655',
  '73663',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4119,
  317,
  '73667',
  '73667',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4120,
  318,
  '68783',
  '68789',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4121,
  318,
  '69152',
  '69181',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4122,
  318,
  '69199',
  '69207',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4123,
  318,
  '69222',
  '69234',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4124,
  318,
  '69240',
  '69242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4125,
  318,
  '69254',
  '69254',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4126,
  319,
  '68001',
  '68309',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4127,
  320,
  '63777',
  '63785',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4128,
  320,
  '63815',
  '63820',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4129,
  320,
  '63832',
  '63843',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4130,
  320,
  '63847',
  '63853',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4131,
  320,
  '63861',
  '63863',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4132,
  320,
  '63868',
  '63868',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4133,
  320,
  '63881',
  '63939',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4134,
  320,
  '97901',
  '97906',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4135,
  320,
  '97909',
  '97909',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4136,
  321,
  '66386',
  '66459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4137,
  322,
  '66484',
  '66509',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4138,
  322,
  '66851',
  '66851',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4139,
  322,
  '66894',
  '66894',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4140,
  322,
  '66917',
  '66999',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4141,
  322,
  '67709',
  '67718',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4142,
  322,
  '76840',
  '76848',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4143,
  322,
  '76891',
  '76891',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4144,
  323,
  '63747',
  '63776',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4145,
  323,
  '63786',
  '63814',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4146,
  323,
  '63821',
  '63831',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4147,
  323,
  '63844',
  '63846',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4148,
  323,
  '63854',
  '63879',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4149,
  324,
  '63701',
  '63743',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4150,
  325,
  '57441',
  '57462',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4151,
  325,
  '57473',
  '57482',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4152,
  325,
  '57483',
  '57489',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4153,
  326,
  '35424',
  '35424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4154,
  326,
  '35425',
  '35425',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4155,
  326,
  '35428',
  '35428',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4156,
  326,
  '35441',
  '35441',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4157,
  326,
  '35442',
  '35442',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4158,
  326,
  '35444',
  '35444',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4159,
  326,
  '35521',
  '35521',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4160,
  326,
  '35522',
  '35522',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4161,
  326,
  '35523',
  '35523',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4162,
  326,
  '35524',
  '35524',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4163,
  326,
  '35525',
  '35525',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4164,
  326,
  '35526',
  '35526',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4165,
  326,
  '35527',
  '35527',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4166,
  326,
  '35528',
  '35528',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4167,
  326,
  '35529',
  '35529',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4168,
  326,
  '35530',
  '35530',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4169,
  326,
  '35531',
  '35531',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4170,
  326,
  '35532',
  '35532',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4171,
  326,
  '35533',
  '35533',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4172,
  326,
  '35534',
  '35534',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4173,
  326,
  '35535',
  '35535',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4174,
  326,
  '35536',
  '35536',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4175,
  326,
  '35537',
  '35537',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4176,
  326,
  '35538',
  '35538',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4177,
  326,
  '35539',
  '35539',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4178,
  326,
  '35549',
  '35549',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4179,
  326,
  '35550',
  '35550',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4180,
  326,
  '35551',
  '35551',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4181,
  326,
  '35553',
  '35553',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4182,
  326,
  '35554',
  '35554',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4183,
  326,
  '35555',
  '35555',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4184,
  326,
  '35573',
  '35573',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4185,
  326,
  '35576',
  '35576',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4186,
  326,
  '35578',
  '35578',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4187,
  326,
  '35579',
  '35579',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4188,
  326,
  '35580',
  '35580',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4189,
  326,
  '35581',
  '35581',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4190,
  326,
  '35582',
  '35582',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4191,
  326,
  '35583',
  '35583',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4192,
  326,
  '35584',
  '35584',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4193,
  326,
  '35585',
  '35585',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4194,
  326,
  '35586',
  '35586',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4195,
  326,
  '35599',
  '35599',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4196,
  326,
  '35600',
  '35600',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4197,
  326,
  '35602',
  '35602',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4198,
  326,
  '35606',
  '35606',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4199,
  326,
  '35607',
  '35607',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4200,
  326,
  '35608',
  '35608',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4201,
  326,
  '35610',
  '35610',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4202,
  326,
  '35614',
  '35614',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4203,
  326,
  '35615',
  '35615',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4204,
  326,
  '35616',
  '35616',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4205,
  326,
  '35619',
  '35619',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4206,
  326,
  '35620',
  '35620',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4207,
  326,
  '35621',
  '35621',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4208,
  326,
  '35622',
  '35622',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4209,
  326,
  '35625',
  '35625',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4210,
  326,
  '35626',
  '35626',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4211,
  326,
  '35627',
  '35627',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4212,
  326,
  '35630',
  '35630',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4213,
  326,
  '35631',
  '35631',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4214,
  326,
  '35633',
  '35633',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4215,
  326,
  '35634',
  '35634',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4216,
  326,
  '35635',
  '35635',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4217,
  326,
  '35638',
  '35638',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4218,
  326,
  '35639',
  '35639',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4219,
  326,
  '35641',
  '35641',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4220,
  326,
  '35642',
  '35642',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4221,
  326,
  '35644',
  '35644',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4222,
  326,
  '35645',
  '35645',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4223,
  326,
  '35647',
  '35647',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4224,
  326,
  '35648',
  '35648',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4225,
  326,
  '35649',
  '35649',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4226,
  326,
  '35661',
  '35661',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4227,
  326,
  '35662',
  '35662',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4228,
  326,
  '35663',
  '35663',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4229,
  326,
  '35664',
  '35664',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4230,
  326,
  '35665',
  '35665',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4231,
  326,
  '35666',
  '35666',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4232,
  326,
  '35667',
  '35667',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4233,
  326,
  '35668',
  '35668',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4234,
  326,
  '35673',
  '35673',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4235,
  326,
  '35675',
  '35675',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4236,
  326,
  '35677',
  '35677',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4237,
  326,
  '35683',
  '35683',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4238,
  326,
  '35684',
  '35684',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4239,
  326,
  '35685',
  '35685',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4240,
  326,
  '35686',
  '35686',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4241,
  326,
  '35687',
  '35687',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4242,
  326,
  '35688',
  '35688',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4243,
  326,
  '35689',
  '35689',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4244,
  326,
  '35690',
  '35690',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4245,
  326,
  '35701',
  '35701',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4246,
  326,
  '35702',
  '35702',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4247,
  326,
  '35703',
  '35703',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4248,
  326,
  '35708',
  '35708',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4249,
  326,
  '35709',
  '35709',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4250,
  326,
  '35710',
  '35710',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4251,
  326,
  '35713',
  '35713',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4252,
  326,
  '35714',
  '35714',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4253,
  326,
  '35716',
  '35716',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4254,
  326,
  '35717',
  '35717',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4255,
  326,
  '35719',
  '35719',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4256,
  326,
  '35721',
  '35721',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4257,
  326,
  '35722',
  '35722',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4258,
  326,
  '35723',
  '35723',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4259,
  326,
  '35724',
  '35724',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4260,
  326,
  '35725',
  '35725',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4261,
  326,
  '35726',
  '35726',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4262,
  326,
  '35727',
  '35727',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4263,
  326,
  '35728',
  '35728',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4264,
  326,
  '35729',
  '35729',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4265,
  326,
  '35735',
  '35735',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4266,
  326,
  '35737',
  '35737',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4267,
  326,
  '35745',
  '35745',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4268,
  326,
  '35751',
  '35751',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4269,
  326,
  '35753',
  '35753',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4270,
  326,
  '35754',
  '35754',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4271,
  326,
  '35756',
  '35756',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4272,
  326,
  '35757',
  '35757',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4273,
  326,
  '35759',
  '35759',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4274,
  326,
  '35760',
  '35760',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4275,
  326,
  '35761',
  '35761',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4276,
  326,
  '35764',
  '35764',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4277,
  326,
  '35765',
  '35765',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4278,
  326,
  '35767',
  '35767',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4279,
  326,
  '35768',
  '35768',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4280,
  326,
  '35771',
  '35771',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4281,
  326,
  '35772',
  '35772',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4282,
  326,
  '35773',
  '35773',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4283,
  326,
  '35774',
  '35774',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4284,
  326,
  '35779',
  '35779',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4285,
  326,
  '35781',
  '35781',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4286,
  326,
  '35785',
  '35785',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4287,
  326,
  '35786',
  '35786',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4288,
  326,
  '35789',
  '35789',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4289,
  326,
  '35790',
  '35790',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4290,
  326,
  '35792',
  '35792',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4291,
  326,
  '35793',
  '35793',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4292,
  326,
  '35794',
  '35794',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4293,
  326,
  '35795',
  '35795',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4294,
  326,
  '35796',
  '35796',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4295,
  326,
  '35797',
  '35797',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4296,
  326,
  '35799',
  '35799',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4297,
  326,
  '56221',
  '56221',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4298,
  326,
  '56222',
  '56222',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4299,
  326,
  '56223',
  '56223',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4300,
  326,
  '56224',
  '56224',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4301,
  326,
  '56225',
  '56225',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4302,
  326,
  '56226',
  '56226',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4303,
  326,
  '56230',
  '56230',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4304,
  326,
  '56235',
  '56235',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4305,
  326,
  '56235',
  '56235',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4306,
  326,
  '56238',
  '56238',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4307,
  326,
  '56239',
  '56239',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4308,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4309,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4310,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4311,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4312,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4313,
  326,
  '56242',
  '56242',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4314,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4315,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4316,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4317,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4318,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4319,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4320,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4321,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4322,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4323,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4324,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4325,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4326,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4327,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4328,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4329,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4330,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4331,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4332,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4333,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4334,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4335,
  326,
  '56244',
  '56244',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4336,
  326,
  '56245',
  '56245',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4337,
  326,
  '56246',
  '56246',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4338,
  326,
  '56249',
  '56249',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4339,
  326,
  '56366',
  '56366',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4340,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4341,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4342,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4343,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4344,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4345,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4346,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4347,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4348,
  326,
  '56368',
  '56368',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4349,
  326,
  '56401',
  '56401',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4350,
  326,
  '56402',
  '56402',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4351,
  326,
  '56403',
  '56403',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4352,
  326,
  '56404',
  '56404',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4353,
  326,
  '56409',
  '56409',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4354,
  326,
  '56410',
  '56410',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4355,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4356,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4357,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4358,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4359,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4360,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4361,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4362,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4363,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4364,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4365,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4366,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4367,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4368,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4369,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4370,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4371,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4372,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4373,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4374,
  326,
  '56412',
  '56412',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4375,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4376,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4377,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4378,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4379,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4380,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4381,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4382,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4383,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4384,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4385,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4386,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4387,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4388,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4389,
  326,
  '56414',
  '56414',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4390,
  326,
  '56418',
  '56418',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4391,
  326,
  '56419',
  '56419',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4392,
  326,
  '56422',
  '56422',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4393,
  326,
  '56424',
  '56424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4394,
  326,
  '56424',
  '56424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4395,
  326,
  '56424',
  '56424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4396,
  326,
  '56424',
  '56424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4397,
  326,
  '56424',
  '56424',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4398,
  326,
  '56425',
  '56425',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4399,
  326,
  '56427',
  '56427',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4400,
  326,
  '56428',
  '56428',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4401,
  326,
  '56450',
  '56450',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4402,
  326,
  '56451',
  '56451',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4403,
  326,
  '56452',
  '56452',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4404,
  326,
  '56456',
  '56456',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4405,
  326,
  '56457',
  '56457',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4406,
  326,
  '56457',
  '56457',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4407,
  326,
  '56457',
  '56457',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4408,
  326,
  '56457',
  '56457',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4409,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4410,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4411,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4412,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4413,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4414,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4415,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4416,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4417,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4418,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4419,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4420,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4421,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4422,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4423,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4424,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4425,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:08',
  '2019-08-22 13:14:08'
), (
  4426,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4427,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4428,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4429,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4430,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4431,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4432,
  326,
  '56459',
  '56459',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4433,
  326,
  '56460',
  '56460',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4434,
  326,
  '56462',
  '56462',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4435,
  326,
  '56462',
  '56462',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4436,
  326,
  '56463',
  '56463',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4437,
  326,
  '56464',
  '56464',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4438,
  326,
  '56465',
  '56465',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4439,
  326,
  '56469',
  '56469',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4440,
  326,
  '56470',
  '56470',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4441,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4442,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4443,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4444,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4445,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4446,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4447,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4448,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4449,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4450,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4451,
  326,
  '56472',
  '56472',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4452,
  326,
  '56473',
  '56473',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4453,
  326,
  '56474',
  '56474',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4454,
  326,
  '56475',
  '56475',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4455,
  326,
  '56477',
  '56477',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4456,
  326,
  '56477',
  '56477',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4457,
  326,
  '56477',
  '56477',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4458,
  326,
  '56477',
  '56477',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4459,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4460,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4461,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4462,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4463,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4464,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4465,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4466,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4467,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4468,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4469,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4470,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4471,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4472,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4473,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4474,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4475,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4476,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4477,
  326,
  '56479',
  '56479',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4478,
  326,
  '57501',
  '57501',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4479,
  326,
  '57502',
  '57502',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4480,
  326,
  '57503',
  '57503',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4481,
  326,
  '57504',
  '57504',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4482,
  326,
  '57505',
  '57505',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4483,
  326,
  '57506',
  '57506',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4484,
  326,
  '57507',
  '57507',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4485,
  326,
  '57508',
  '57508',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4486,
  326,
  '57517',
  '57517',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4487,
  326,
  '57518',
  '57518',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4488,
  326,
  '57518',
  '57518',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4489,
  326,
  '57518',
  '57518',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4490,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4491,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4492,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4493,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4494,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4495,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4496,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4497,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4498,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4499,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4500,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4501,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4502,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4503,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4504,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4505,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4506,
  326,
  '57520',
  '57520',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4507,
  326,
  '57529',
  '57529',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4508,
  326,
  '57530',
  '57530',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4509,
  326,
  '57531',
  '57531',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4510,
  326,
  '57532',
  '57532',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4511,
  326,
  '57537',
  '57537',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4512,
  326,
  '57539',
  '57539',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4513,
  326,
  '57540',
  '57540',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4514,
  326,
  '57541',
  '57541',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4515,
  326,
  '57543',
  '57543',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4516,
  326,
  '57544',
  '57544',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4517,
  326,
  '57548',
  '57548',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4518,
  326,
  '57548',
  '57548',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4519,
  326,
  '57556',
  '57556',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4520,
  326,
  '57557',
  '57557',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4521,
  326,
  '57558',
  '57558',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4522,
  326,
  '57562',
  '57562',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4523,
  326,
  '57563',
  '57563',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4524,
  326,
  '57564',
  '57564',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4525,
  326,
  '57567',
  '57567',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4526,
  326,
  '57573',
  '57573',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4527,
  326,
  '57574',
  '57574',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4528,
  326,
  '57577',
  '57577',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4529,
  326,
  '57577',
  '57577',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4530,
  326,
  '57577',
  '57577',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4531,
  326,
  '57577',
  '57577',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4532,
  326,
  '57577',
  '57577',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4533,
  326,
  '57578',
  '57578',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4534,
  326,
  '57580',
  '57580',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4535,
  326,
  '57580',
  '57580',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4536,
  326,
  '57580',
  '57580',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4537,
  326,
  '57581',
  '57581',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4538,
  326,
  '57583',
  '57583',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4539,
  326,
  '57583',
  '57583',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4540,
  326,
  '57584',
  '57584',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4541,
  326,
  '57584',
  '57584',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4542,
  326,
  '57586',
  '57586',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4543,
  326,
  '57587',
  '57587',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4544,
  326,
  '57587',
  '57587',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4545,
  326,
  '57589',
  '57589',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4546,
  326,
  '57589',
  '57589',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4547,
  326,
  '57589',
  '57589',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4548,
  326,
  '57589',
  '57589',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4549,
  326,
  '57601',
  '57601',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4550,
  326,
  '57602',
  '57602',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4551,
  326,
  '57603',
  '57603',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4552,
  326,
  '57604',
  '57604',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4553,
  326,
  '57609',
  '57609',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4554,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4555,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4556,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4557,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4558,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4559,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4560,
  326,
  '57610',
  '57610',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4561,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4562,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4563,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4564,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4565,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4566,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4567,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4568,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4569,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4570,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4571,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4572,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4573,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4574,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4575,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4576,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4577,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4578,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4579,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4580,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4581,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4582,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4583,
  326,
  '57612',
  '57612',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4584,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4585,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4586,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4587,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4588,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4589,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4590,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4591,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4592,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4593,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4594,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4595,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4596,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4597,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4598,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4599,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4600,
  326,
  '57614',
  '57614',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4601,
  326,
  '57620',
  '57620',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4602,
  326,
  '57621',
  '57621',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4603,
  326,
  '57622',
  '57622',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4604,
  326,
  '57626',
  '57626',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4605,
  326,
  '57627',
  '57627',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4606,
  326,
  '57627',
  '57627',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4607,
  326,
  '57627',
  '57627',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4608,
  326,
  '57627',
  '57627',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4609,
  326,
  '57627',
  '57627',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4610,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4611,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4612,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4613,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4614,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4615,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4616,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4617,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4618,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4619,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4620,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4621,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4622,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4623,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4624,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4625,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4626,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4627,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4628,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4629,
  326,
  '57629',
  '57629',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4630,
  326,
  '57630',
  '57630',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4631,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4632,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4633,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4634,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4635,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4636,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4637,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4638,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4639,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4640,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4641,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4642,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4643,
  326,
  '57632',
  '57632',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4644,
  326,
  '57633',
  '57633',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4645,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4646,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4647,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4648,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4649,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4650,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4651,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4652,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4653,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4654,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4655,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4656,
  326,
  '57635',
  '57635',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4657,
  326,
  '57636',
  '57636',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4658,
  326,
  '57636',
  '57636',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4659,
  326,
  '57638',
  '57638',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4660,
  326,
  '57638',
  '57638',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4661,
  326,
  '57638',
  '57638',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4662,
  326,
  '57639',
  '57639',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4663,
  326,
  '57639',
  '57639',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4664,
  326,
  '57641',
  '57641',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4665,
  326,
  '57642',
  '57642',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4666,
  326,
  '57644',
  '57644',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4667,
  326,
  '57644',
  '57644',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4668,
  326,
  '57644',
  '57644',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4669,
  326,
  '57644',
  '57644',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4670,
  326,
  '57644',
  '57644',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4671,
  326,
  '57645',
  '57645',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4672,
  326,
  '57645',
  '57645',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4673,
  326,
  '57647',
  '57647',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4674,
  326,
  '57647',
  '57647',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4675,
  326,
  '57647',
  '57647',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4676,
  326,
  '57647',
  '57647',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4677,
  326,
  '57647',
  '57647',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4678,
  326,
  '57648',
  '57648',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4679,
  326,
  '57648',
  '57648',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4680,
  326,
  '60001',
  '60001',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4681,
  326,
  '60002',
  '60002',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4682,
  326,
  '60003',
  '60003',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4683,
  326,
  '60004',
  '60004',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4684,
  326,
  '60005',
  '60005',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4685,
  326,
  '60006',
  '60006',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4686,
  326,
  '60007',
  '60007',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4687,
  326,
  '60008',
  '60008',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4688,
  326,
  '60009',
  '60009',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4689,
  326,
  '60010',
  '60010',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4690,
  326,
  '60011',
  '60011',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4691,
  326,
  '60012',
  '60012',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4692,
  326,
  '60013',
  '60013',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4693,
  326,
  '60014',
  '60014',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4694,
  326,
  '60015',
  '60015',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4695,
  326,
  '60016',
  '60016',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4696,
  326,
  '60017',
  '60017',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4697,
  326,
  '60018',
  '60018',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4698,
  326,
  '60019',
  '60019',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4699,
  326,
  '60020',
  '60020',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4700,
  326,
  '60021',
  '60021',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4701,
  326,
  '60022',
  '60022',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4702,
  326,
  '60023',
  '60023',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4703,
  326,
  '60024',
  '60024',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4704,
  326,
  '60036',
  '60036',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4705,
  326,
  '60037',
  '60037',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4706,
  326,
  '60038',
  '60038',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4707,
  326,
  '60039',
  '60039',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4708,
  326,
  '60040',
  '60040',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4709,
  326,
  '60041',
  '60041',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4710,
  326,
  '60042',
  '60042',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4711,
  326,
  '60043',
  '60043',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4712,
  326,
  '60044',
  '60044',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4713,
  326,
  '60045',
  '60045',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4714,
  326,
  '60046',
  '60046',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4715,
  326,
  '60047',
  '60047',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4716,
  326,
  '60048',
  '60048',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4717,
  326,
  '60049',
  '60049',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4718,
  326,
  '60050',
  '60050',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4719,
  326,
  '60051',
  '60051',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4720,
  326,
  '60052',
  '60052',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4721,
  326,
  '60053',
  '60053',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4722,
  326,
  '60054',
  '60054',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4723,
  326,
  '60055',
  '60055',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4724,
  326,
  '60061',
  '60061',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4725,
  326,
  '60062',
  '60062',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4726,
  326,
  '60063',
  '60063',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4727,
  326,
  '60064',
  '60064',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4728,
  326,
  '60065',
  '60065',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4729,
  326,
  '60066',
  '60066',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4730,
  326,
  '60067',
  '60067',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4731,
  326,
  '60068',
  '60068',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4732,
  326,
  '60069',
  '60069',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4733,
  326,
  '60070',
  '60070',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4734,
  326,
  '60071',
  '60071',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4735,
  326,
  '60075',
  '60075',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4736,
  326,
  '60076',
  '60076',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4737,
  326,
  '60077',
  '60077',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4738,
  326,
  '60078',
  '60078',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4739,
  326,
  '60079',
  '60079',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4740,
  326,
  '60082',
  '60082',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4741,
  326,
  '60083',
  '60083',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4742,
  326,
  '60084',
  '60084',
  '2019-08-22 13:14:09',
  '2019-08-22 13:14:09'
), (
  4743,
  326,
  '60085',
  '60085',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4744,
  326,
  '60088',
  '60088',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4745,
  326,
  '60089',
  '60089',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4746,
  326,
  '60090',
  '60090',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4747,
  326,
  '60091',
  '60091',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4748,
  326,
  '60222',
  '60222',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4749,
  326,
  '60252',
  '60252',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4750,
  326,
  '60253',
  '60253',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4751,
  326,
  '60254',
  '60254',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4752,
  326,
  '60255',
  '60255',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4753,
  326,
  '60256',
  '60256',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4754,
  326,
  '60257',
  '60257',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4755,
  326,
  '60258',
  '60258',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4756,
  326,
  '60259',
  '60259',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4757,
  326,
  '60260',
  '60260',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4758,
  326,
  '60261',
  '60261',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4759,
  326,
  '60262',
  '60262',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4760,
  326,
  '60263',
  '60263',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4761,
  326,
  '60264',
  '60264',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4762,
  326,
  '60265',
  '60265',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4763,
  326,
  '60266',
  '60266',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4764,
  326,
  '60267',
  '60267',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4765,
  326,
  '60268',
  '60268',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4766,
  326,
  '60269',
  '60269',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4767,
  326,
  '60270',
  '60270',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4768,
  326,
  '60271',
  '60271',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4769,
  326,
  '60273',
  '60273',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4770,
  326,
  '60274',
  '60274',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4771,
  326,
  '60275',
  '60275',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4772,
  326,
  '60276',
  '60276',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4773,
  326,
  '60277',
  '60277',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4774,
  326,
  '60278',
  '60278',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4775,
  326,
  '60279',
  '60279',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4776,
  326,
  '60280',
  '60280',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4777,
  326,
  '60281',
  '60281',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4778,
  326,
  '60282',
  '60282',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4779,
  326,
  '60283',
  '60283',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4780,
  326,
  '60284',
  '60284',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4781,
  326,
  '60285',
  '60285',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4782,
  326,
  '60286',
  '60286',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4783,
  326,
  '60287',
  '60287',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4784,
  326,
  '60288',
  '60288',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4785,
  326,
  '60295',
  '60295',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4786,
  326,
  '60296',
  '60296',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4787,
  326,
  '60297',
  '60297',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4788,
  326,
  '60298',
  '60298',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4789,
  326,
  '60299',
  '60299',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4790,
  326,
  '60300',
  '60300',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4791,
  326,
  '60301',
  '60301',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4792,
  326,
  '60302',
  '60302',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4793,
  326,
  '60303',
  '60303',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4794,
  326,
  '60304',
  '60304',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4795,
  326,
  '60305',
  '60305',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4796,
  326,
  '60306',
  '60306',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4797,
  326,
  '60307',
  '60307',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4798,
  326,
  '60308',
  '60308',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4799,
  326,
  '60311',
  '60311',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4800,
  326,
  '60313',
  '60313',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4801,
  326,
  '60314',
  '60314',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4802,
  326,
  '60316',
  '60316',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4803,
  326,
  '60318',
  '60318',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4804,
  326,
  '60320',
  '60320',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4805,
  326,
  '60322',
  '60322',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4806,
  326,
  '60323',
  '60323',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4807,
  326,
  '60325',
  '60325',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4808,
  326,
  '60326',
  '60326',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4809,
  326,
  '60327',
  '60327',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4810,
  326,
  '60329',
  '60329',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4811,
  326,
  '60331',
  '60331',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4812,
  326,
  '60332',
  '60332',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4813,
  326,
  '60333',
  '60333',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4814,
  326,
  '60334',
  '60334',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4815,
  326,
  '60335',
  '60335',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4816,
  326,
  '60336',
  '60336',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4817,
  326,
  '60337',
  '60337',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4818,
  326,
  '60338',
  '60338',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4819,
  326,
  '60343',
  '60343',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4820,
  326,
  '60344',
  '60344',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4821,
  326,
  '60345',
  '60345',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4822,
  326,
  '60346',
  '60346',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4823,
  326,
  '60347',
  '60347',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4824,
  326,
  '60348',
  '60348',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4825,
  326,
  '60350',
  '60350',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4826,
  326,
  '60351',
  '60351',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4827,
  326,
  '60352',
  '60352',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4828,
  326,
  '60353',
  '60353',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4829,
  326,
  '60355',
  '60355',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4830,
  326,
  '60356',
  '60356',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4831,
  326,
  '60357',
  '60357',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4832,
  326,
  '60358',
  '60358',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4833,
  326,
  '60380',
  '60380',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4834,
  326,
  '60381',
  '60381',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4835,
  326,
  '60382',
  '60382',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4836,
  326,
  '60383',
  '60383',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4837,
  326,
  '60385',
  '60385',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4838,
  326,
  '60386',
  '60386',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4839,
  326,
  '60388',
  '60388',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4840,
  326,
  '60389',
  '60389',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4841,
  326,
  '60391',
  '60391',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4842,
  326,
  '60392',
  '60392',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4843,
  326,
  '60393',
  '60393',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4844,
  326,
  '60394',
  '60394',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4845,
  326,
  '60395',
  '60395',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4846,
  326,
  '60396',
  '60396',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4847,
  326,
  '60400',
  '60400',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4848,
  326,
  '60401',
  '60401',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4849,
  326,
  '60402',
  '60402',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4850,
  326,
  '60403',
  '60403',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4851,
  326,
  '60406',
  '60406',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4852,
  326,
  '60407',
  '60407',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4853,
  326,
  '60423',
  '60423',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4854,
  326,
  '60424',
  '60424',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4855,
  326,
  '60426',
  '60426',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4856,
  326,
  '60427',
  '60427',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4857,
  326,
  '60428',
  '60428',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4858,
  326,
  '60431',
  '60431',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4859,
  326,
  '60433',
  '60433',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4860,
  326,
  '60435',
  '60435',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4861,
  326,
  '60437',
  '60437',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4862,
  326,
  '60439',
  '60439',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4863,
  326,
  '60441',
  '60441',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4864,
  326,
  '60442',
  '60442',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4865,
  326,
  '60443',
  '60443',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4866,
  326,
  '60444',
  '60444',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4867,
  326,
  '60445',
  '60445',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4868,
  326,
  '60446',
  '60446',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4869,
  326,
  '60447',
  '60447',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4870,
  326,
  '60448',
  '60448',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4871,
  326,
  '60449',
  '60449',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4872,
  326,
  '60450',
  '60450',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4873,
  326,
  '60456',
  '60456',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4874,
  326,
  '60457',
  '60457',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4875,
  326,
  '60459',
  '60459',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4876,
  326,
  '60460',
  '60460',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4877,
  326,
  '60461',
  '60461',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4878,
  326,
  '60480',
  '60480',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4879,
  326,
  '60482',
  '60482',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4880,
  326,
  '60483',
  '60483',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4881,
  326,
  '60484',
  '60484',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4882,
  326,
  '60486',
  '60486',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4883,
  326,
  '60487',
  '60487',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4884,
  326,
  '60488',
  '60488',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4885,
  326,
  '60489',
  '60489',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4886,
  326,
  '60491',
  '60491',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4887,
  326,
  '60492',
  '60492',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4888,
  326,
  '60493',
  '60493',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4889,
  326,
  '60494',
  '60494',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4890,
  326,
  '60495',
  '60495',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4891,
  326,
  '60496',
  '60496',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4892,
  326,
  '60497',
  '60497',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4893,
  326,
  '60498',
  '60498',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4894,
  326,
  '60503',
  '60503',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4895,
  326,
  '60504',
  '60504',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4896,
  326,
  '60505',
  '60505',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4897,
  326,
  '60507',
  '60507',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4898,
  326,
  '60508',
  '60508',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4899,
  326,
  '60519',
  '60519',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4900,
  326,
  '60523',
  '60523',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4901,
  326,
  '60524',
  '60524',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4902,
  326,
  '60525',
  '60525',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4903,
  326,
  '60528',
  '60528',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4904,
  326,
  '60529',
  '60529',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4905,
  326,
  '60551',
  '60551',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4906,
  326,
  '60552',
  '60552',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4907,
  326,
  '60553',
  '60553',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4908,
  326,
  '60554',
  '60554',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4909,
  326,
  '60555',
  '60555',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4910,
  326,
  '60556',
  '60556',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4911,
  326,
  '60557',
  '60557',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4912,
  326,
  '60558',
  '60558',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4913,
  326,
  '60559',
  '60559',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4914,
  326,
  '60560',
  '60560',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4915,
  326,
  '60561',
  '60561',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4916,
  326,
  '60562',
  '60562',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4917,
  326,
  '60570',
  '60570',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4918,
  326,
  '60589',
  '60589',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4919,
  326,
  '60590',
  '60590',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4920,
  326,
  '60591',
  '60591',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4921,
  326,
  '60594',
  '60594',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4922,
  326,
  '60596',
  '60596',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4923,
  326,
  '60598',
  '60598',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4924,
  326,
  '60599',
  '60599',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4925,
  326,
  '61101',
  '61101',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4926,
  326,
  '61102',
  '61102',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4927,
  326,
  '61103',
  '61103',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4928,
  326,
  '61104',
  '61104',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4929,
  326,
  '61105',
  '61105',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4930,
  326,
  '61106',
  '61106',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4931,
  326,
  '61116',
  '61116',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4932,
  326,
  '61118',
  '61118',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4933,
  326,
  '61185',
  '61185',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4934,
  326,
  '61186',
  '61186',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4935,
  326,
  '61188',
  '61188',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4936,
  326,
  '61191',
  '61191',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4937,
  326,
  '61241',
  '61241',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4938,
  326,
  '61242',
  '61242',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4939,
  326,
  '61243',
  '61243',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4940,
  326,
  '61250',
  '61250',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4941,
  326,
  '61250',
  '61250',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4942,
  326,
  '61259',
  '61259',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4943,
  326,
  '61260',
  '61260',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4944,
  326,
  '61261',
  '61261',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4945,
  326,
  '61267',
  '61267',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4946,
  326,
  '61268',
  '61268',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4947,
  326,
  '61269',
  '61269',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4948,
  326,
  '61270',
  '61270',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4949,
  326,
  '61273',
  '61273',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4950,
  326,
  '61273',
  '61273',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4951,
  326,
  '61274',
  '61274',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4952,
  326,
  '61276',
  '61276',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4953,
  326,
  '61277',
  '61277',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4954,
  326,
  '61279',
  '61279',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4955,
  326,
  '61281',
  '61281',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4956,
  326,
  '61282',
  '61282',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4957,
  326,
  '61283',
  '61283',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4958,
  326,
  '61284',
  '61284',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4959,
  326,
  '61285',
  '61285',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4960,
  326,
  '61286',
  '61286',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4961,
  326,
  '61287',
  '61287',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4962,
  326,
  '61288',
  '61288',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4963,
  326,
  '61289',
  '61289',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4964,
  326,
  '61290',
  '61290',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4965,
  326,
  '61291',
  '61291',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4966,
  326,
  '61292',
  '61292',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4967,
  326,
  '61293',
  '61293',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4968,
  326,
  '61294',
  '61294',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4969,
  326,
  '61295',
  '61295',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4970,
  326,
  '61342',
  '61342',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4971,
  326,
  '61343',
  '61343',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4972,
  326,
  '61344',
  '61344',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4973,
  326,
  '61345',
  '61345',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4974,
  326,
  '61348',
  '61348',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4975,
  326,
  '61350',
  '61350',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4976,
  326,
  '61352',
  '61352',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4977,
  326,
  '61362',
  '61362',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4978,
  326,
  '61363',
  '61363',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4979,
  326,
  '61364',
  '61364',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4980,
  326,
  '61365',
  '61365',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4981,
  326,
  '61366',
  '61366',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4982,
  326,
  '61367',
  '61367',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4983,
  326,
  '61368',
  '61368',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4984,
  326,
  '61371',
  '61371',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4985,
  326,
  '61373',
  '61373',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4986,
  326,
  '61379',
  '61379',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4987,
  326,
  '61381',
  '61381',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4988,
  326,
  '61382',
  '61382',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4989,
  326,
  '61383',
  '61383',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4990,
  326,
  '61385',
  '61385',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4991,
  326,
  '61387',
  '61387',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4992,
  326,
  '61389',
  '61389',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4993,
  326,
  '61401',
  '61401',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4994,
  326,
  '61402',
  '61402',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4995,
  326,
  '61403',
  '61403',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4996,
  326,
  '61404',
  '61404',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4997,
  326,
  '61405',
  '61405',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4998,
  326,
  '61406',
  '61406',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  4999,
  326,
  '61407',
  '61407',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5000,
  326,
  '61408',
  '61408',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5001,
  326,
  '61409',
  '61409',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5002,
  326,
  '61410',
  '61410',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5003,
  326,
  '61411',
  '61411',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5004,
  326,
  '61412',
  '61412',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5005,
  326,
  '61413',
  '61413',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5006,
  326,
  '61420',
  '61420',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5007,
  326,
  '61422',
  '61422',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5008,
  326,
  '61424',
  '61424',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5009,
  326,
  '61435',
  '61435',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5010,
  326,
  '61436',
  '61436',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5011,
  326,
  '61437',
  '61437',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5012,
  326,
  '61440',
  '61440',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5013,
  326,
  '61444',
  '61444',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5014,
  326,
  '61445',
  '61445',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5015,
  326,
  '61449',
  '61449',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5016,
  326,
  '61451',
  '61451',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5017,
  326,
  '61452',
  '61452',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5018,
  326,
  '61453',
  '61453',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5019,
  326,
  '61454',
  '61454',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5020,
  326,
  '61455',
  '61455',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5021,
  326,
  '61456',
  '61456',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5022,
  326,
  '61462',
  '61462',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5023,
  326,
  '61466',
  '61466',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5024,
  326,
  '61467',
  '61467',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5025,
  326,
  '61468',
  '61468',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5026,
  326,
  '61470',
  '61470',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5027,
  326,
  '61471',
  '61471',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5028,
  326,
  '61474',
  '61474',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5029,
  326,
  '61476',
  '61476',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5030,
  326,
  '61477',
  '61477',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5031,
  326,
  '61478',
  '61478',
  '2019-08-22 13:14:10',
  '2019-08-22 13:14:10'
), (
  5032,
  326,
  '61479',
  '61479',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5033,
  326,
  '63461',
  '63461',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5034,
  326,
  '63462',
  '63462',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5035,
  326,
  '63463',
  '63463',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5036,
  326,
  '63464',
  '63464',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5037,
  326,
  '63465',
  '63465',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5038,
  326,
  '63468',
  '63468',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5039,
  326,
  '63469',
  '63469',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5040,
  326,
  '63475',
  '63475',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5041,
  326,
  '63477',
  '63477',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5042,
  326,
  '65185',
  '65185',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5043,
  326,
  '65187',
  '65187',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5044,
  326,
  '65189',
  '65189',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5045,
  326,
  '65191',
  '65191',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5046,
  326,
  '65193',
  '65193',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5047,
  326,
  '65195',
  '65195',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5048,
  326,
  '65197',
  '65197',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5049,
  326,
  '65199',
  '65199',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5050,
  326,
  '65201',
  '65201',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5051,
  326,
  '65203',
  '65203',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5052,
  326,
  '65205',
  '65205',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5053,
  326,
  '65207',
  '65207',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5054,
  326,
  '65219',
  '65219',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5055,
  326,
  '65220',
  '65220',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5056,
  326,
  '65221',
  '65221',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5057,
  326,
  '65222',
  '65222',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5058,
  326,
  '65223',
  '65223',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5059,
  326,
  '65224',
  '65224',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5060,
  326,
  '65232',
  '65232',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5061,
  326,
  '65233',
  '65233',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5062,
  326,
  '65234',
  '65234',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5063,
  326,
  '65235',
  '65235',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5064,
  326,
  '65239',
  '65239',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5065,
  326,
  '65301',
  '65301',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5066,
  326,
  '65302',
  '65302',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5067,
  326,
  '65303',
  '65303',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5068,
  326,
  '65307',
  '65307',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5069,
  326,
  '65319',
  '65319',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5070,
  326,
  '65321',
  '65321',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5071,
  326,
  '65322',
  '65322',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5072,
  326,
  '65324',
  '65324',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5073,
  326,
  '65326',
  '65326',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5074,
  326,
  '65326',
  '65326',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5075,
  326,
  '65327',
  '65327',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5076,
  326,
  '65329',
  '65329',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5077,
  326,
  '65331',
  '65331',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5078,
  326,
  '65332',
  '65332',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5079,
  326,
  '65333',
  '65333',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5080,
  326,
  '65334',
  '65334',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5081,
  326,
  '65335',
  '65335',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5082,
  326,
  '65337',
  '65337',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5083,
  326,
  '65343',
  '65343',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5084,
  326,
  '65344',
  '65344',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5085,
  326,
  '65345',
  '65345',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5086,
  326,
  '65346',
  '65346',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5087,
  326,
  '65347',
  '65347',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5088,
  326,
  '65358',
  '65358',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5089,
  326,
  '65359',
  '65359',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5090,
  326,
  '65360',
  '65360',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5091,
  326,
  '65362',
  '65362',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5092,
  326,
  '65366',
  '65366',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5093,
  326,
  '65367',
  '65367',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5094,
  326,
  '65368',
  '65368',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5095,
  326,
  '65370',
  '65370',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5096,
  326,
  '65371',
  '65371',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5097,
  326,
  '65375',
  '65375',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5098,
  326,
  '65376',
  '65376',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5099,
  326,
  '65377',
  '65377',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5100,
  326,
  '65378',
  '65378',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5101,
  326,
  '65379',
  '65379',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5102,
  326,
  '65382',
  '65382',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5103,
  326,
  '65385',
  '65385',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5104,
  326,
  '65385',
  '65385',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5105,
  326,
  '65386',
  '65386',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5106,
  326,
  '65388',
  '65388',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5107,
  326,
  '65389',
  '65389',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5108,
  326,
  '65391',
  '65391',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5109,
  326,
  '65391',
  '65391',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5110,
  326,
  '65392',
  '65392',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5111,
  326,
  '65393',
  '65393',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5112,
  326,
  '65396',
  '65396',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5113,
  326,
  '65397',
  '65397',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5114,
  326,
  '65399',
  '65399',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5115,
  326,
  '65432',
  '65432',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5116,
  326,
  '65433',
  '65433',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5117,
  326,
  '65434',
  '65434',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5118,
  326,
  '65438',
  '65438',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5119,
  326,
  '65439',
  '65439',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5120,
  326,
  '65440',
  '65440',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5121,
  326,
  '65441',
  '65441',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5122,
  326,
  '65442',
  '65442',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5123,
  326,
  '65443',
  '65443',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5124,
  326,
  '65444',
  '65444',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5125,
  326,
  '65450',
  '65450',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5126,
  326,
  '65451',
  '65451',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5127,
  326,
  '65501',
  '65501',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5128,
  326,
  '65502',
  '65502',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5129,
  326,
  '65503',
  '65503',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5130,
  326,
  '65505',
  '65505',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5131,
  326,
  '65510',
  '65510',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5132,
  326,
  '65510',
  '65510',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5133,
  326,
  '65510',
  '65510',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5134,
  326,
  '65510',
  '65510',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5135,
  326,
  '65516',
  '65516',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5136,
  326,
  '65517',
  '65517',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5137,
  326,
  '65520',
  '65520',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5138,
  326,
  '65521',
  '65521',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5139,
  326,
  '65522',
  '65522',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5140,
  326,
  '65523',
  '65523',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5141,
  326,
  '65524',
  '65524',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5142,
  326,
  '65527',
  '65527',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5143,
  326,
  '65528',
  '65528',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5144,
  326,
  '65529',
  '65529',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5145,
  326,
  '65529',
  '65529',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5146,
  326,
  '65531',
  '65531',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5147,
  326,
  '65532',
  '65532',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5148,
  326,
  '65533',
  '65533',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5149,
  326,
  '65534',
  '65534',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5150,
  326,
  '65535',
  '65535',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5151,
  326,
  '65536',
  '65536',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5152,
  326,
  '65540',
  '65540',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5153,
  326,
  '65541',
  '65541',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5154,
  326,
  '65547',
  '65547',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5155,
  326,
  '65549',
  '65549',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5156,
  326,
  '65550',
  '65550',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5157,
  326,
  '65551',
  '65551',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5158,
  326,
  '65552',
  '65552',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5159,
  326,
  '65553',
  '65553',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5160,
  326,
  '65554',
  '65554',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5161,
  326,
  '65555',
  '65555',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5162,
  326,
  '65556',
  '65556',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5163,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5164,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5165,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5166,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5167,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5168,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5169,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5170,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5171,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5172,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5173,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5174,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5175,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5176,
  326,
  '65558',
  '65558',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5177,
  326,
  '65570',
  '65570',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5178,
  326,
  '65571',
  '65571',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5179,
  326,
  '65572',
  '65572',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5180,
  326,
  '65573',
  '65573',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5181,
  326,
  '65574',
  '65574',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5182,
  326,
  '65580',
  '65580',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5183,
  326,
  '65582',
  '65582',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5184,
  326,
  '65582',
  '65582',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5185,
  326,
  '65582',
  '65582',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5186,
  326,
  '65583',
  '65583',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5187,
  326,
  '65584',
  '65584',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5188,
  326,
  '65585',
  '65585',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5189,
  326,
  '65589',
  '65589',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5190,
  326,
  '65590',
  '65590',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5191,
  326,
  '65591',
  '65591',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5192,
  326,
  '65594',
  '65594',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5193,
  326,
  '65595',
  '65595',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5194,
  326,
  '65596',
  '65596',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5195,
  326,
  '65597',
  '65597',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5196,
  326,
  '65598',
  '65598',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5197,
  326,
  '65599',
  '65599',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5198,
  326,
  '65600',
  '65600',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5199,
  326,
  '65601',
  '65601',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5200,
  326,
  '65604',
  '65604',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5201,
  326,
  '65605',
  '65605',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5202,
  326,
  '65606',
  '65606',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5203,
  326,
  '65607',
  '65607',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5204,
  326,
  '65608',
  '65608',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5205,
  326,
  '65611',
  '65611',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5206,
  326,
  '65612',
  '65612',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5207,
  326,
  '65614',
  '65614',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5208,
  326,
  '65615',
  '65615',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5209,
  326,
  '65618',
  '65618',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5210,
  326,
  '65619',
  '65619',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5211,
  326,
  '65620',
  '65620',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5212,
  326,
  '65621',
  '65621',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5213,
  326,
  '65623',
  '65623',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5214,
  326,
  '65623',
  '65623',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5215,
  326,
  '65623',
  '65623',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5216,
  326,
  '65623',
  '65623',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5217,
  326,
  '65624',
  '65624',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5218,
  326,
  '65626',
  '65626',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5219,
  326,
  '65626',
  '65626',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5220,
  326,
  '65627',
  '65627',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5221,
  326,
  '65629',
  '65629',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5222,
  326,
  '65701',
  '65701',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5223,
  326,
  '65702',
  '65702',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5224,
  326,
  '65703',
  '65703',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5225,
  326,
  '65704',
  '65704',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5226,
  326,
  '65705',
  '65705',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5227,
  326,
  '65708',
  '65708',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5228,
  326,
  '65709',
  '65709',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5229,
  326,
  '65711',
  '65711',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5230,
  326,
  '65717',
  '65717',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5231,
  326,
  '65719',
  '65719',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5232,
  326,
  '65726',
  '65726',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5233,
  326,
  '65727',
  '65727',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5234,
  326,
  '65728',
  '65728',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5235,
  326,
  '65729',
  '65729',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5236,
  326,
  '65730',
  '65730',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5237,
  326,
  '65731',
  '65731',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5238,
  326,
  '65732',
  '65732',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5239,
  326,
  '65733',
  '65733',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5240,
  326,
  '65734',
  '65734',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5241,
  326,
  '65735',
  '65735',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5242,
  326,
  '65741',
  '65741',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5243,
  326,
  '65742',
  '65742',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5244,
  326,
  '65743',
  '65743',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5245,
  326,
  '65745',
  '65745',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5246,
  326,
  '65746',
  '65746',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5247,
  326,
  '65755',
  '65755',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5248,
  326,
  '65756',
  '65756',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5249,
  326,
  '65757',
  '65757',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5250,
  326,
  '65760',
  '65760',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5251,
  326,
  '65761',
  '65761',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5252,
  326,
  '65762',
  '65762',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5253,
  326,
  '65763',
  '65763',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5254,
  326,
  '65764',
  '65764',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5255,
  326,
  '65765',
  '65765',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5256,
  326,
  '65766',
  '65766',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5257,
  326,
  '65767',
  '65767',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5258,
  326,
  '65770',
  '65770',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5259,
  326,
  '65771',
  '65771',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5260,
  326,
  '65779',
  '65779',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5261,
  326,
  '65780',
  '65780',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5262,
  326,
  '65781',
  '65781',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5263,
  326,
  '65782',
  '65782',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5264,
  326,
  '65783',
  '65783',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5265,
  326,
  '65786',
  '65786',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5266,
  326,
  '65787',
  '65787',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5267,
  326,
  '65789',
  '65789',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5268,
  326,
  '65795',
  '65795',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5269,
  326,
  '65796',
  '65796',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5270,
  326,
  '65797',
  '65797',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5271,
  326,
  '65798',
  '65798',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5272,
  326,
  '65799',
  '65799',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5273,
  326,
  '65800',
  '65800',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5274,
  326,
  '65801',
  '65801',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5275,
  326,
  '65803',
  '65803',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5276,
  326,
  '65804',
  '65804',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5277,
  326,
  '65810',
  '65810',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5278,
  326,
  '65812',
  '65812',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5279,
  326,
  '65813',
  '65813',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5280,
  326,
  '65814',
  '65814',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5281,
  326,
  '65817',
  '65817',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5282,
  326,
  '65818',
  '65818',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5283,
  326,
  '65819',
  '65819',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5284,
  326,
  '65820',
  '65820',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5285,
  326,
  '65824',
  '65824',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5286,
  326,
  '65825',
  '65825',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5287,
  326,
  '65826',
  '65826',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5288,
  326,
  '65827',
  '65827',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5289,
  326,
  '65829',
  '65829',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5290,
  326,
  '65830',
  '65830',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5291,
  326,
  '65831',
  '65831',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5292,
  326,
  '65832',
  '65832',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5293,
  326,
  '65835',
  '65835',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5294,
  326,
  '65836',
  '65836',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5295,
  326,
  '65837',
  '65837',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5296,
  326,
  '65838',
  '65838',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5297,
  326,
  '65839',
  '65839',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5298,
  326,
  '65842',
  '65842',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5299,
  326,
  '65843',
  '65843',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5300,
  326,
  '65901',
  '65901',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5301,
  326,
  '65902',
  '65902',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5302,
  326,
  '65903',
  '65903',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5303,
  326,
  '65904',
  '65904',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5304,
  326,
  '65905',
  '65905',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5305,
  326,
  '65906',
  '65906',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5306,
  326,
  '65907',
  '65907',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5307,
  326,
  '65908',
  '65908',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5308,
  326,
  '65913',
  '65913',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5309,
  326,
  '65914',
  '65914',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5310,
  326,
  '65915',
  '65915',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5311,
  326,
  '65916',
  '65916',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5312,
  326,
  '65917',
  '65917',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5313,
  326,
  '65925',
  '65925',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5314,
  326,
  '65926',
  '65926',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5315,
  326,
  '65929',
  '65929',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5316,
  326,
  '65931',
  '65931',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5317,
  326,
  '65933',
  '65933',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5318,
  326,
  '65934',
  '65934',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5319,
  326,
  '65936',
  '65936',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5320,
  327,
  '48631',
  '48653',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5321,
  327,
  '48713',
  '48727',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5322,
  327,
  '48292',
  '48301',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5323,
  327,
  '48325',
  '48329',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5324,
  328,
  '57401',
  '57413',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5325,
  328,
  '57425',
  '57439',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5326,
  329,
  '31001',
  '31008',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5327,
  329,
  '31021',
  '31061',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5328,
  329,
  '31077',
  '31199',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5329,
  330,
  '37104',
  '37120',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5330,
  330,
  '37128',
  '37130',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5331,
  330,
  '37134',
  '37136',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5332,
  330,
  '37434',
  '37434',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5333,
  331,
  '06551',
  '06578',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5334,
  331,
  '37301',
  '37359',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5335,
  331,
  '99701',
  '99768',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5336,
  331,
  '99941',
  '99998',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5337,
  332,
  '48232',
  '48249',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5338,
  333,
  '20001',
  '21037',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5339,
  333,
  '21039',
  '21149',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5340,
  333,
  '22001',
  '22143',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5341,
  333,
  '22147',
  '22769',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5342,
  333,
  '19273',
  '19273',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5343,
  333,
  '21217',
  '21220',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5344,
  333,
  '21224',
  '21224',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5345,
  333,
  '21227',
  '21227',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5346,
  333,
  '21244',
  '21244',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5347,
  333,
  '21255',
  '21255',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5348,
  333,
  '21256',
  '21256',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5349,
  333,
  '21258',
  '21258',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5350,
  333,
  '21259',
  '21259',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5351,
  333,
  '21261',
  '21261',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5352,
  333,
  '21266',
  '21266',
  '2019-08-22 13:14:11',
  '2019-08-22 13:14:11'
), (
  5353,
  333,
  '21271',
  '21271',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5354,
  333,
  '21272',
  '21272',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5355,
  333,
  '21279',
  '21279',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5356,
  333,
  '21335',
  '21335',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5357,
  333,
  '21369',
  '21369',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5358,
  333,
  '21371',
  '21371',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5359,
  333,
  '21379',
  '21379',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5360,
  333,
  '21385',
  '21385',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5361,
  333,
  '21386',
  '21386',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5362,
  333,
  '21388',
  '21388',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5363,
  333,
  '21395',
  '21395',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5364,
  333,
  '21398',
  '21398',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5365,
  333,
  '21400',
  '21400',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5366,
  333,
  '21401',
  '21401',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5367,
  333,
  '21403',
  '21403',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5368,
  333,
  '21407',
  '21407',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5369,
  333,
  '21423',
  '21423',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5370,
  333,
  '21435',
  '21435',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5371,
  333,
  '21436',
  '21436',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5372,
  333,
  '21438',
  '21438',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5373,
  333,
  '21439',
  '21439',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5374,
  333,
  '21441',
  '21441',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5375,
  333,
  '21442',
  '21442',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5376,
  333,
  '21444',
  '21444',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5377,
  333,
  '21445',
  '21445',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5378,
  333,
  '21447',
  '21447',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5379,
  333,
  '21449',
  '21449',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5380,
  333,
  '21451',
  '21522',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5381,
  333,
  '21524',
  '21529',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5382,
  333,
  '21629',
  '21629',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5383,
  333,
  '21646',
  '21646',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5384,
  333,
  '21726',
  '21726',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5385,
  333,
  '21727',
  '21727',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5386,
  333,
  '21729',
  '21729',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5387,
  333,
  '21730',
  '21730',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5388,
  333,
  '21732',
  '21732',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5389,
  333,
  '22113',
  '22113',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5390,
  333,
  '22145',
  '22145',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5391,
  333,
  '22801',
  '23919',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5392,
  333,
  '24001',
  '25999',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5393,
  333,
  '27356',
  '27356',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5394,
  333,
  '27367',
  '27367',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5395,
  333,
  '27374',
  '27374',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5396,
  333,
  '27383',
  '27383',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5397,
  333,
  '27386',
  '27386',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5398,
  333,
  '27389',
  '27389',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5399,
  333,
  '27404',
  '27404',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5400,
  333,
  '27412',
  '27412',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5401,
  333,
  '27419',
  '27419',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5402,
  333,
  '27432',
  '27432',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5403,
  333,
  '27442',
  '27442',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5404,
  333,
  '27446',
  '27446',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5405,
  333,
  '27449',
  '27449',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5406,
  333,
  '27483',
  '27498',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5407,
  333,
  '21614',
  '21614',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5408,
  333,
  '21635',
  '21635',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5409,
  333,
  '21644',
  '21644',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5410,
  333,
  '21680',
  '21680',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5411,
  333,
  '21684',
  '21684',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5412,
  333,
  '21698',
  '21698',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5413,
  333,
  '21702',
  '21702',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5414,
  333,
  '21706',
  '21706',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5415,
  333,
  '21709',
  '21709',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5416,
  333,
  '21710',
  '21710',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5417,
  333,
  '21712',
  '21712',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5418,
  333,
  '21714',
  '21714',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5419,
  333,
  '21717',
  '21717',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5420,
  333,
  '21720',
  '21720',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5421,
  333,
  '21723',
  '21723',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5422,
  333,
  '21734',
  '21734',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5423,
  333,
  '21737',
  '21737',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5424,
  333,
  '21739',
  '21739',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5425,
  334,
  '50101',
  '50259',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5426,
  335,
  '50667',
  '50679',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5427,
  335,
  '50733',
  '50739',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5428,
  335,
  '50765',
  '50765',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5429,
  335,
  '50767',
  '50767',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5430,
  335,
  '50769',
  '50769',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5431,
  335,
  '50823',
  '50829',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5432,
  335,
  '50858',
  '50858',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5433,
  335,
  '50859',
  '50859',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5434,
  335,
  '50931',
  '50939',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5435,
  335,
  '50968',
  '50968',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5436,
  335,
  '50969',
  '50969',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5437,
  335,
  '50996',
  '50996',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5438,
  335,
  '50997',
  '50997',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5439,
  335,
  '50999',
  '50999',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5440,
  336,
  '50441',
  '51149',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5441,
  337,
  '51103',
  '51109',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5442,
  337,
  '51143',
  '51149',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5443,
  338,
  '50672',
  '50672',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5444,
  338,
  '50667',
  '50667',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5445,
  338,
  '50674',
  '50674',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5446,
  338,
  '50676',
  '50676',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5447,
  338,
  '50679',
  '50679',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5448,
  338,
  '50678',
  '50678',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5449,
  338,
  '50677',
  '50677',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5450,
  338,
  '51063',
  '51063',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5451,
  338,
  '51149',
  '51149',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5452,
  338,
  '51145',
  '51145',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5453,
  338,
  '51147',
  '51147',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5454,
  338,
  '51143',
  '51143',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5455,
  338,
  '50769',
  '50769',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5456,
  338,
  '50737',
  '50737',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5457,
  338,
  '50765',
  '50765',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5458,
  338,
  '50767',
  '50767',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5459,
  338,
  '50829',
  '50829',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5460,
  338,
  '50827',
  '50827',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5461,
  338,
  '50825',
  '50825',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5462,
  338,
  '50933',
  '50933',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5463,
  338,
  '50931',
  '50931',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5464,
  338,
  '50935',
  '50935',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5465,
  338,
  '50859',
  '50859',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5466,
  338,
  '50858',
  '50858',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5467,
  338,
  '50937',
  '50937',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5468,
  338,
  '50939',
  '50939',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5469,
  338,
  '50968',
  '50968',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5470,
  338,
  '50997',
  '50997',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5471,
  338,
  '50996',
  '50996',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5472,
  338,
  '50999',
  '50999',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5473,
  338,
  '50668',
  '50668',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5474,
  338,
  '50670',
  '50670',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5475,
  338,
  '50733',
  '50733',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5476,
  338,
  '50735',
  '50735',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5477,
  338,
  '50739',
  '50739',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5478,
  338,
  '50823',
  '50823',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5479,
  338,
  '50969',
  '50969',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5480,
  338,
  '51061',
  '51061',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5481,
  338,
  '51069',
  '51069',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5482,
  338,
  '51067',
  '51067',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5483,
  338,
  '51065',
  '51065',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5484,
  338,
  '51103',
  '51103',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5485,
  338,
  '51105',
  '51105',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5486,
  338,
  '51107',
  '51107',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5487,
  338,
  '51109',
  '51109',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5488,
  339,
  '42001',
  '42399',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5489,
  339,
  '42601',
  '42719',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5490,
  339,
  '42801',
  '42899',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5491,
  339,
  '40801',
  '40822',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5492,
  339,
  '42755',
  '42781',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5493,
  340,
  '42460',
  '42499',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5494,
  340,
  '51531',
  '51545',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5495,
  340,
  '51571',
  '51789',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5496,
  341,
  '40736',
  '40789',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5497,
  341,
  '42657',
  '42697',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5498,
  341,
  '42782',
  '42799',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5499,
  341,
  '42904',
  '42929',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5500,
  341,
  '51387',
  '51399',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5501,
  342,
  '50301',
  '50389',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5502,
  342,
  '53914',
  '53919',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5503,
  343,
  '40001',
  '40629',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5504,
  343,
  '40671',
  '41724',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5505,
  343,
  '40831',
  '40885',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5506,
  343,
  '42501',
  '42579',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5507,
  344,
  '41485',
  '41517',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5508,
  344,
  '41353',
  '41363',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5509,
  345,
  '51301',
  '51381',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5510,
  346,
  '41335',
  '41352',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5511,
  346,
  '41401',
  '41472',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5512,
  346,
  '41543',
  '41564',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5513,
  346,
  '40636',
  '40670',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5514,
  347,
  '51401',
  '51519',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5515,
  348,
  '51556',
  '51570',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5516,
  348,
  '53001',
  '53359',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5517,
  348,
  '53581',
  '53604',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5518,
  348,
  '53621',
  '53859',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5519,
  348,
  '53910',
  '53913',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5520,
  349,
  '41565',
  '41569',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5521,
  349,
  '41485',
  '41517',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5522,
  350,
  '40001',
  '40629',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5523,
  350,
  '40671',
  '41724',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5524,
  350,
  '40831',
  '40885',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5525,
  350,
  '42501',
  '42579',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5526,
  351,
  '81539',
  '81539',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5527,
  351,
  '81541',
  '81541',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5528,
  351,
  '81543',
  '81543',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5529,
  351,
  '81545',
  '81545',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5530,
  351,
  '81547',
  '81547',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5531,
  351,
  '81549',
  '81549',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5532,
  351,
  '81667',
  '81667',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5533,
  351,
  '81669',
  '81669',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5534,
  351,
  '81671',
  '81671',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5535,
  351,
  '81673',
  '81673',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5536,
  351,
  '81675',
  '81675',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5537,
  351,
  '81677',
  '81677',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5538,
  351,
  '81679',
  '81679',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5539,
  351,
  '81735',
  '81735',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5540,
  351,
  '81737',
  '81737',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5541,
  351,
  '81739',
  '81739',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5542,
  351,
  '81825',
  '81825',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5543,
  351,
  '81827',
  '81827',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5544,
  351,
  '81829',
  '81829',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5545,
  351,
  '81925',
  '81925',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5546,
  351,
  '81927',
  '81927',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5547,
  351,
  '81929',
  '81929',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5548,
  352,
  '85609',
  '85609',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5549,
  352,
  '85653',
  '85653',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5550,
  352,
  '82065',
  '82065',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5551,
  352,
  '85649',
  '85649',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5552,
  352,
  '85622',
  '85622',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5553,
  352,
  '85748',
  '85748',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5554,
  352,
  '82166',
  '82166',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5555,
  352,
  '85630',
  '85630',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5556,
  352,
  '82031',
  '82031',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5557,
  352,
  '85540',
  '85540',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5558,
  352,
  '85635',
  '85635',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5559,
  352,
  '85662',
  '85662',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5560,
  352,
  '85737',
  '85737',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5561,
  352,
  '85551',
  '85551',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5562,
  352,
  '85579',
  '85579',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5563,
  352,
  '82061',
  '82061',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5564,
  352,
  '82041',
  '82041',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5565,
  352,
  '85764',
  '85764',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5566,
  352,
  '85521',
  '85521',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5567,
  352,
  '82152',
  '82152',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5568,
  352,
  '82049',
  '82049',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5569,
  352,
  '85640',
  '85640',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5570,
  352,
  '82054',
  '82054',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5571,
  352,
  '82069',
  '82069',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5572,
  352,
  '82064',
  '82064',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5573,
  352,
  '82024',
  '82024',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5574,
  352,
  '85774',
  '85774',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5575,
  352,
  '82008',
  '82008',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5576,
  352,
  '85716',
  '85716',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5577,
  353,
  '82110',
  '82110',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5578,
  353,
  '82140',
  '82140',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5579,
  353,
  '82178',
  '82178',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5580,
  353,
  '82194',
  '82194',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5581,
  353,
  '82216',
  '82216',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5582,
  353,
  '82223',
  '82223',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5583,
  353,
  '82239',
  '82239',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5584,
  353,
  '82256',
  '82256',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5585,
  353,
  '82273',
  '82278',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5586,
  353,
  '82231',
  '82231',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5587,
  353,
  '82284',
  '82296',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5588,
  353,
  '82299',
  '82299',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5589,
  354,
  '82362',
  '82409',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5590,
  354,
  '82436',
  '82436',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5591,
  354,
  '86951',
  '86971',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5592,
  354,
  '86975',
  '86989',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5593,
  355,
  '82411',
  '82499',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5594,
  356,
  '83119',
  '83119',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5595,
  356,
  '83132',
  '83132',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5596,
  356,
  '83219',
  '83224',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5597,
  356,
  '83234',
  '83246',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5598,
  356,
  '83250',
  '83250',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5599,
  356,
  '83259',
  '83308',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5600,
  356,
  '83313',
  '83313',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5601,
  356,
  '83317',
  '83324',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5602,
  356,
  '83329',
  '83346',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5603,
  356,
  '83347',
  '83362',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5604,
  356,
  '83365',
  '83379',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5605,
  356,
  '83411',
  '83413',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5606,
  356,
  '83417',
  '83417',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5607,
  356,
  '84549',
  '84549',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5608,
  356,
  '84525',
  '84529',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5609,
  357,
  '83314',
  '83317',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5610,
  357,
  '83325',
  '83329',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5611,
  357,
  '83367',
  '83367',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5612,
  357,
  '83381',
  '83488',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5613,
  357,
  '83395',
  '83395',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5614,
  357,
  '83402',
  '83402',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5615,
  357,
  '83404',
  '83407',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5616,
  357,
  '83410',
  '83410',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5617,
  357,
  '83411',
  '83411',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5618,
  357,
  '83413',
  '83413',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5619,
  357,
  '83414',
  '83414',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5620,
  357,
  '83416',
  '83416',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5621,
  357,
  '83417',
  '83417',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5622,
  357,
  '83421',
  '83421',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5623,
  357,
  '83423',
  '83426',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5624,
  357,
  '83429',
  '83429',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5625,
  357,
  '83431',
  '83431',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5626,
  357,
  '83435',
  '83435',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5627,
  357,
  '83448',
  '83448',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5628,
  357,
  '83449',
  '83449',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5629,
  357,
  '83451',
  '83451',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5630,
  357,
  '83452',
  '83452',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5631,
  357,
  '83454',
  '83454',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5632,
  357,
  '83455',
  '83455',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5633,
  357,
  '83457',
  '83457',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5634,
  357,
  '83458',
  '83458',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5635,
  357,
  '83461',
  '83464',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5636,
  357,
  '83466',
  '83466',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5637,
  357,
  '83471',
  '83471',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5638,
  357,
  '83481',
  '83481',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5639,
  357,
  '83483',
  '83483',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5640,
  357,
  '83484',
  '83484',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5641,
  357,
  '83486',
  '83486',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5642,
  357,
  '83487',
  '83487',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5643,
  357,
  '83489',
  '83489',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5644,
  358,
  '82050',
  '82057',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5645,
  358,
  '82062',
  '82064',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5646,
  358,
  '82069',
  '82069',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5647,
  358,
  '82319',
  '82319',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5648,
  358,
  '82393',
  '82393',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5649,
  358,
  '82427',
  '82432',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5650,
  358,
  '82439',
  '82439',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5651,
  358,
  '82444',
  '82444',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5652,
  358,
  '82501',
  '82549',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5653,
  358,
  '83621',
  '83623',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5654,
  358,
  '83631',
  '83661',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5655,
  358,
  '83667',
  '83679',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5656,
  359,
  '83349',
  '83349',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5657,
  359,
  '83367',
  '83367',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5658,
  359,
  '83527',
  '83527',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5659,
  359,
  '83536',
  '83536',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5660,
  359,
  '83546',
  '83546',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5661,
  359,
  '83555',
  '83559',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5662,
  359,
  '83562',
  '83562',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5663,
  359,
  '83567',
  '83567',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5664,
  359,
  '84140',
  '84140',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5665,
  359,
  '84155',
  '84155',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5666,
  359,
  '84419',
  '84419',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5667,
  359,
  '84428',
  '84428',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5668,
  359,
  '84431',
  '84431',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5669,
  359,
  '84437',
  '84437',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5670,
  359,
  '84453',
  '84453',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5671,
  359,
  '84478',
  '84478',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5672,
  359,
  '84494',
  '84494',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5673,
  359,
  '84513',
  '84513',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5674,
  359,
  '84539',
  '84539',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5675,
  359,
  '84544',
  '84544',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5676,
  359,
  '84546',
  '84546',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5677,
  359,
  '84550',
  '84550',
  '2019-08-22 13:14:12',
  '2019-08-22 13:14:12'
), (
  5678,
  359,
  '84555',
  '84555',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5679,
  359,
  '84559',
  '84559',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5680,
  359,
  '84562',
  '84562',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5681,
  359,
  '84564',
  '84564',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5682,
  359,
  '84565',
  '84565',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5683,
  359,
  '84570',
  '84570',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5684,
  359,
  '84573',
  '84573',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5685,
  359,
  '84574',
  '84574',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5686,
  359,
  '84579',
  '84579',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5687,
  360,
  '85201',
  '85259',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5688,
  360,
  '85778',
  '85778',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5689,
  360,
  '85749',
  '85757',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5690,
  360,
  '86567',
  '86567',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5691,
  361,
  '84141',
  '84144',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5692,
  361,
  '86557',
  '86558',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5693,
  361,
  '85073',
  '85077',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5694,
  361,
  '85081',
  '85088',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5695,
  361,
  '85105',
  '85107',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5696,
  361,
  '85119',
  '85119',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5697,
  361,
  '85126',
  '85126',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5698,
  361,
  '85261',
  '85309',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5699,
  362,
  '84072',
  '84072',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5700,
  362,
  '84104',
  '84104',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5701,
  362,
  '85307',
  '85307',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5702,
  362,
  '85354',
  '85354',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5703,
  362,
  '85356',
  '85356',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5704,
  362,
  '85368',
  '85368',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5705,
  362,
  '85368',
  '85368',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5706,
  362,
  '85375',
  '85375',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5707,
  362,
  '85376',
  '85376',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5708,
  362,
  '85386',
  '85386',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5709,
  362,
  '85391',
  '85391',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5710,
  362,
  '85395',
  '85395',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5711,
  362,
  '85395',
  '85395',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5712,
  362,
  '85395',
  '85395',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5713,
  362,
  '85399',
  '85399',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5714,
  362,
  '85402',
  '85402',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5715,
  362,
  '85406',
  '85406',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5716,
  362,
  '85408',
  '85408',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5717,
  362,
  '85410',
  '85410',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5718,
  362,
  '85411',
  '85411',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5719,
  362,
  '85413',
  '85413',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5720,
  362,
  '85414',
  '85414',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5721,
  362,
  '85416',
  '85416',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5722,
  362,
  '85417',
  '85417',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5723,
  362,
  '85419',
  '85419',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5724,
  362,
  '85777',
  '85777',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5725,
  363,
  '83553',
  '83553',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5726,
  363,
  '83565',
  '83565',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5727,
  363,
  '83550',
  '83550',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5728,
  363,
  '85552',
  '85560',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5729,
  363,
  '85567',
  '85567',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5730,
  363,
  '85570',
  '85591',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5731,
  363,
  '85598',
  '85604',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5732,
  363,
  '85610',
  '85617',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5733,
  363,
  '85622',
  '85625',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5734,
  363,
  '85641',
  '85646',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5735,
  363,
  '85650',
  '85652',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5736,
  363,
  '85661',
  '85661',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5737,
  363,
  '85664',
  '85664',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5738,
  363,
  '85665',
  '85665',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5739,
  363,
  '85667',
  '85667',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5740,
  364,
  '88250',
  '88250',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5741,
  364,
  '88255',
  '88255',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5742,
  364,
  '88263',
  '88263',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5743,
  364,
  '88271',
  '88271',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5744,
  364,
  '88273',
  '88273',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5745,
  364,
  '88276',
  '88276',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5746,
  364,
  '88281',
  '88281',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5747,
  364,
  '88284',
  '88284',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5748,
  364,
  '88326',
  '88326',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5749,
  364,
  '88339',
  '88339',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5750,
  364,
  '88361',
  '88361',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5751,
  364,
  '88364',
  '88364',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5752,
  364,
  '88368',
  '88368',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5753,
  364,
  '88370',
  '88370',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5754,
  364,
  '88371',
  '88371',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5755,
  364,
  '88373',
  '88373',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5756,
  364,
  '88374',
  '88374',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5757,
  364,
  '88376',
  '88376',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5758,
  364,
  '88377',
  '88377',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5759,
  364,
  '88379',
  '88379',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5760,
  364,
  '88299',
  '88299',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5761,
  364,
  '88410',
  '88410',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5762,
  364,
  '88353',
  '88353',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5763,
  364,
  '88317',
  '88317',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5764,
  364,
  '88310',
  '88310',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5765,
  365,
  '88381',
  '88400',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5766,
  365,
  '88416',
  '88416',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5767,
  365,
  '88422',
  '88427',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5768,
  365,
  '88430',
  '88437',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5769,
  365,
  '88441',
  '88489',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5770,
  365,
  '88499',
  '88499',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5771,
  365,
  '88513',
  '88515',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5772,
  365,
  '88519',
  '88527',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5773,
  365,
  '89165',
  '89165',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5774,
  365,
  '89293',
  '89293',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5775,
  366,
  '86634',
  '86637',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5776,
  366,
  '86644',
  '86647',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5777,
  366,
  '86656',
  '86657',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5778,
  366,
  '89344',
  '89353',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5779,
  366,
  '89401',
  '89449',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5780,
  367,
  '90001',
  '90491',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5781,
  368,
  '90505',
  '90518',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5782,
  368,
  '90531',
  '90537',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5783,
  368,
  '90548',
  '90552',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5784,
  368,
  '90557',
  '90559',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5785,
  368,
  '90563',
  '90571',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5786,
  368,
  '90588',
  '90592',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5787,
  368,
  '90603',
  '90610',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5788,
  368,
  '91191',
  '91217',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5789,
  368,
  '91220',
  '91247',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5790,
  368,
  '91284',
  '91284',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5791,
  369,
  '91077',
  '91077',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5792,
  369,
  '91090',
  '91090',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5793,
  369,
  '91094',
  '91094',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5794,
  369,
  '91099',
  '91099',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5795,
  369,
  '91286',
  '91286',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5796,
  369,
  '91301',
  '91301',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5797,
  369,
  '91320',
  '91320',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5798,
  369,
  '91322',
  '91322',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5799,
  369,
  '91327',
  '91327',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5800,
  369,
  '91330',
  '91330',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5801,
  369,
  '91336',
  '91336',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5802,
  369,
  '91338',
  '91338',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5803,
  369,
  '91346',
  '91346',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5804,
  369,
  '91349',
  '91349',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5805,
  369,
  '91352',
  '91352',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5806,
  369,
  '91353',
  '91353',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5807,
  369,
  '91355',
  '91355',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5808,
  369,
  '91356',
  '91356',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5809,
  369,
  '91358',
  '91358',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5810,
  369,
  '91359',
  '91359',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5811,
  369,
  '91361',
  '91361',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5812,
  369,
  '91362',
  '91362',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5813,
  369,
  '91364',
  '91364',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5814,
  369,
  '91365',
  '91365',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5815,
  369,
  '91367',
  '91367',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5816,
  369,
  '91369',
  '91369',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5817,
  370,
  '93185',
  '93185',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5818,
  370,
  '93189',
  '93194',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5819,
  370,
  '93199',
  '93199',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5820,
  370,
  '93401',
  '93499',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5821,
  371,
  '94441',
  '94469',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5822,
  371,
  '94482',
  '94491',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5823,
  371,
  '94503',
  '94508',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5824,
  371,
  '94523',
  '94527',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5825,
  371,
  '94530',
  '94533',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5826,
  371,
  '94539',
  '94541',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5827,
  371,
  '94547',
  '94547',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5828,
  371,
  '94550',
  '94551',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5829,
  371,
  '94554',
  '94554',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5830,
  371,
  '94557',
  '94557',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5831,
  371,
  '94560',
  '94563',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5832,
  371,
  '94569',
  '94571',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5833,
  371,
  '94574',
  '94574',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5834,
  371,
  '94577',
  '94577',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5835,
  372,
  '91331',
  '91332',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5836,
  372,
  '96001',
  '96103',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5837,
  372,
  '96107',
  '96123',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5838,
  372,
  '96127',
  '96138',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5839,
  372,
  '96146',
  '96149',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5840,
  372,
  '96154',
  '96158',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5841,
  372,
  '96161',
  '96164',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5842,
  372,
  '96167',
  '96170',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5843,
  372,
  '96173',
  '96175',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5844,
  372,
  '96178',
  '96179',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5845,
  372,
  '96182',
  '96182',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5846,
  372,
  '96185',
  '96187',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5847,
  372,
  '96191',
  '96191',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5848,
  372,
  '96194',
  '96196',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5849,
  372,
  '96199',
  '96199',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5850,
  373,
  '96201',
  '96231',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5851,
  373,
  '96243',
  '96250',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5852,
  373,
  '96257',
  '96264',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5853,
  373,
  '96272',
  '96272',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5854,
  373,
  '96275',
  '96275',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5855,
  374,
  '96301',
  '96369',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5856,
  374,
  '96265',
  '96268',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5857,
  374,
  '96277',
  '96277',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5858,
  375,
  '97491',
  '97491',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5859,
  375,
  '96151',
  '96151',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5860,
  375,
  '97494',
  '97494',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5861,
  375,
  '97496',
  '97496',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5862,
  375,
  '97500',
  '97503',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5863,
  375,
  '96104',
  '96106',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5864,
  375,
  '97479',
  '97486',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5865,
  375,
  '97503',
  '97503',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5866,
  375,
  '97428',
  '97437',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5867,
  375,
  '97458',
  '97461',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5868,
  375,
  '96166',
  '96166',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5869,
  375,
  '97476',
  '97478',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5870,
  375,
  '97486',
  '97486',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5871,
  375,
  '96124',
  '96126',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5872,
  375,
  '97514',
  '97514',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5873,
  375,
  '96176',
  '96176',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5874,
  375,
  '96181',
  '96181',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5875,
  375,
  '96184',
  '96184',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5876,
  375,
  '97519',
  '97519',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5877,
  375,
  '97522',
  '97522',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5878,
  375,
  '96188',
  '96190',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5879,
  375,
  '97531',
  '97531',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5880,
  375,
  '96190',
  '96190',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5881,
  375,
  '97539',
  '97539',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5882,
  375,
  '97470',
  '97475',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5883,
  375,
  '96148',
  '96148',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5884,
  375,
  '96179',
  '96179',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5885,
  376,
  '97528',
  '97528',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5886,
  376,
  '97601',
  '97659',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5887,
  376,
  '97724',
  '97724',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5888,
  377,
  '97661',
  '97688',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5889,
  377,
  '97697',
  '97702',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5890,
  377,
  '97703',
  '97729',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5891,
  377,
  '97754',
  '97799',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5892,
  377,
  '97517',
  '97517',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5893,
  378,
  '97861',
  '97877',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5894,
  378,
  '97893',
  '97894',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5895,
  378,
  '97896',
  '97900',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5896,
  378,
  '97911',
  '97987',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5897,
  378,
  '97991',
  '97999',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5898,
  378,
  '74744',
  '74744',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5899,
  378,
  '74747',
  '74747',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5900,
  378,
  '74212',
  '74214',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5901,
  378,
  '74236',
  '74238',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5902,
  379,
  '96501',
  '96529',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5903,
  379,
  '98501',
  '98749',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5904,
  379,
  '99801',
  '99898',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5905,
  380,
  '07201',
  '07429',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5906,
  380,
  '07570',
  '07579',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5907,
  380,
  '07601',
  '07819',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5908,
  380,
  '99001',
  '99638',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5909,
  381,
  '59831',
  '59846',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5910,
  382,
  '44541',
  '44581',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5911,
  383,
  '44001',
  '44388',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5912,
  383,
  '58452',
  '58455',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5913,
  384,
  '33241',
  '33415',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5914,
  384,
  '33433',
  '33449',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5915,
  385,
  '59001',
  '59077',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5916,
  386,
  '37651',
  '37688',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5917,
  386,
  '37692',
  '37696',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5918,
  386,
  '33001',
  '33039',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5919,
  386,
  '34401',
  '34414',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5920,
  386,
  '34434',
  '34439',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5921,
  387,
  '58581',
  '58701',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5922,
  387,
  '58706',
  '58706',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5923,
  387,
  '58708',
  '58708',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5924,
  387,
  '58795',
  '58802',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5925,
  388,
  '44501',
  '44536',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5926,
  388,
  '59354',
  '59379',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5927,
  389,
  '59851',
  '59969',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5928,
  389,
  '57376',
  '57392',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5929,
  389,
  '34418',
  '34431',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5930,
  390,
  '57393',
  '57399',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5931,
  390,
  '57341',
  '57368',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5932,
  391,
  '33041',
  '33189',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5933,
  392,
  '58731',
  '58739',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5934,
  392,
  '59441',
  '59494',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5935,
  392,
  '59506',
  '59609',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5936,
  393,
  '59755',
  '59755',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5937,
  393,
  '59757',
  '59757',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5938,
  393,
  '59759',
  '59759',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5939,
  393,
  '59821',
  '59821',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5940,
  393,
  '59823',
  '59823',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5941,
  394,
  '48599',
  '48599',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5942,
  394,
  '48613',
  '48624',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5943,
  394,
  '48661',
  '48703',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5944,
  394,
  '48735',
  '48739',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5945,
  394,
  '46349',
  '46354',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5946,
  395,
  '48317',
  '48317',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5947,
  395,
  '48324',
  '48324',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5948,
  395,
  '59227',
  '59227',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5949,
  395,
  '59229',
  '59229',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5950,
  395,
  '59269',
  '59269',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5951,
  395,
  '59302',
  '59302',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5952,
  395,
  '59329',
  '59329',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5953,
  396,
  '46395',
  '46399',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5954,
  396,
  '46414',
  '46414',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5955,
  396,
  '46419',
  '46419',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5956,
  397,
  '46301',
  '46359',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5957,
  397,
  '48704',
  '48712',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5958,
  397,
  '48728',
  '48734',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5959,
  398,
  '46251',
  '46286',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5960,
  399,
  '48369',
  '48369',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5961,
  399,
  '48367',
  '48367',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5962,
  399,
  '48250',
  '48282',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5963,
  400,
  '47507',
  '47509',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5964,
  400,
  '47591',
  '47661',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5965,
  400,
  '47666',
  '47669',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5966,
  401,
  '48466',
  '48477',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5967,
  401,
  '48494',
  '48496',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5968,
  401,
  '49461',
  '49479',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5969,
  401,
  '49493',
  '49497',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5970,
  401,
  '49505',
  '49509',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5971,
  402,
  '47533',
  '47533',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5972,
  402,
  '47546',
  '47546',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5973,
  402,
  '46446',
  '46446',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5974,
  402,
  '46459',
  '46459',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5975,
  402,
  '47559',
  '47559',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5976,
  402,
  '47574',
  '47574',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5977,
  402,
  '47551',
  '47551',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5978,
  402,
  '47589',
  '47589',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5979,
  403,
  '45712',
  '45721',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5980,
  403,
  '45741',
  '45772',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5981,
  404,
  '46500',
  '46509',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5982,
  404,
  '46515',
  '46519',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5983,
  404,
  '47401',
  '47506',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5984,
  404,
  '47662',
  '47665',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5985,
  405,
  '48001',
  '48167',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5986,
  406,
  '48401',
  '48432',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5987,
  406,
  '48481',
  '48485',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5988,
  406,
  '48489',
  '48493',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5989,
  407,
  '48203',
  '48231',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5990,
  407,
  '48283',
  '48291',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5991,
  407,
  '48330',
  '48336',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5992,
  407,
  '48342',
  '48351',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5993,
  407,
  '48357',
  '48361',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5994,
  407,
  '33428',
  '33430',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5995,
  407,
  '59303',
  '59320',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5996,
  408,
  '46510',
  '46514',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5997,
  408,
  '46521',
  '46569',
  '2019-08-22 13:14:13',
  '2019-08-22 13:14:13'
), (
  5998,
  408,
  '46461',
  '46499',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  5999,
  409,
  '52001',
  '52080',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6000,
  410,
  '52477',
  '52477',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6001,
  410,
  '52499',
  '52499',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6002,
  410,
  '52134',
  '52134',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6003,
  410,
  '52146',
  '52146',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6004,
  410,
  '52249',
  '52249',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6005,
  410,
  '52222',
  '52224',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6006,
  411,
  '52301',
  '52459',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6007,
  412,
  '41801',
  '41849',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6008,
  413,
  '52501',
  '52539',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6009,
  414,
  '47878',
  '47929',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6010,
  415,
  '52147',
  '52159',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6011,
  416,
  '41301',
  '41334',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6012,
  416,
  '41364',
  '41379',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6013,
  416,
  '41701',
  '41751',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6014,
  417,
  '47701',
  '47839',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6015,
  418,
  '58762',
  '58762',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6016,
  418,
  '58769',
  '58769',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6017,
  418,
  '58791',
  '58791',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6018,
  418,
  '58840',
  '58840',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6019,
  418,
  '58849',
  '58849',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6020,
  418,
  '58809',
  '58809',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6021,
  418,
  '58507',
  '58515',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6022,
  418,
  '58566',
  '58566',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6023,
  418,
  '58540',
  '58540',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6024,
  418,
  '58553',
  '58553',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6025,
  418,
  '58579',
  '58579',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6026,
  418,
  '58339',
  '58339',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6027,
  419,
  '44787',
  '44809',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6028,
  419,
  '44866',
  '44892',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6029,
  419,
  '45525',
  '45525',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6030,
  419,
  '45527',
  '45527',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6031,
  419,
  '58456',
  '58456',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6032,
  419,
  '58300',
  '58300',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6033,
  420,
  '46201',
  '46244',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6034,
  421,
  '47001',
  '47279',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6035,
  422,
  '45127',
  '45127',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6036,
  422,
  '45128',
  '45128',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6037,
  422,
  '45134',
  '45134',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6038,
  422,
  '45136',
  '45136',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6039,
  422,
  '45138',
  '45138',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6040,
  422,
  '45139',
  '45139',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6041,
  422,
  '45239',
  '45239',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6042,
  422,
  '45257',
  '45257',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6043,
  422,
  '45259',
  '45259',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6044,
  422,
  '45276',
  '45276',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6045,
  422,
  '45277',
  '45277',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6046,
  422,
  '45279',
  '45279',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6047,
  422,
  '45289',
  '45289',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6048,
  422,
  '45307',
  '45307',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6049,
  422,
  '45309',
  '45309',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6050,
  422,
  '45327',
  '45327',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6051,
  422,
  '45329',
  '45329',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6052,
  422,
  '45501',
  '45529',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6053,
  422,
  '45130',
  '45133',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6054,
  422,
  '45141',
  '45147',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6055,
  422,
  '45149',
  '45149',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6056,
  422,
  '45219',
  '45219',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6057,
  422,
  '45326',
  '45326',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6058,
  422,
  '45355',
  '45359',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6059,
  423,
  '45801',
  '45899',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6060,
  424,
  '45951',
  '45968',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6061,
  425,
  '45401',
  '45481',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6062,
  425,
  '45149',
  '45149',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6063,
  425,
  '45219',
  '45219',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6064,
  426,
  '46001',
  '46149',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6065,
  427,
  '66482',
  '66509',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6066,
  427,
  '66851',
  '66851',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6067,
  427,
  '66894',
  '66894',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6068,
  427,
  '66917',
  '66999',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6069,
  427,
  '67709',
  '67718',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6070,
  427,
  '76840',
  '76848',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6071,
  427,
  '76891',
  '76891',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6072,
  428,
  '20001',
  '21037',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6073,
  428,
  '21039',
  '21149',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6074,
  428,
  '22001',
  '22143',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6075,
  428,
  '22147',
  '22769',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6076,
  428,
  '19273',
  '19273',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6077,
  428,
  '21217',
  '21220',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6078,
  428,
  '21224',
  '21224',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6079,
  428,
  '21227',
  '21227',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6080,
  428,
  '21244',
  '21244',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6081,
  428,
  '21255',
  '21255',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6082,
  428,
  '21256',
  '21256',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6083,
  428,
  '21258',
  '21258',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6084,
  428,
  '21259',
  '21259',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6085,
  428,
  '21261',
  '21261',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6086,
  428,
  '21266',
  '21266',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6087,
  428,
  '21271',
  '21271',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6088,
  428,
  '21272',
  '21272',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6089,
  428,
  '21279',
  '21279',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6090,
  428,
  '21335',
  '21335',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6091,
  428,
  '21369',
  '21369',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6092,
  428,
  '21371',
  '21371',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6093,
  428,
  '21379',
  '21379',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6094,
  428,
  '21385',
  '21385',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6095,
  428,
  '21386',
  '21386',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6096,
  428,
  '21388',
  '21388',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6097,
  428,
  '21395',
  '21395',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6098,
  428,
  '21398',
  '21398',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6099,
  428,
  '21400',
  '21400',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6100,
  428,
  '21401',
  '21401',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6101,
  428,
  '21403',
  '21403',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6102,
  428,
  '21407',
  '21407',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6103,
  428,
  '21423',
  '21423',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6104,
  428,
  '21435',
  '21435',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6105,
  428,
  '21436',
  '21436',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6106,
  428,
  '21438',
  '21438',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6107,
  428,
  '21439',
  '21439',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6108,
  428,
  '21441',
  '21441',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6109,
  428,
  '21442',
  '21442',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6110,
  428,
  '21444',
  '21444',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6111,
  428,
  '21445',
  '21445',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6112,
  428,
  '21447',
  '21447',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6113,
  428,
  '21449',
  '21449',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6114,
  428,
  '21451',
  '21522',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6115,
  428,
  '21524',
  '21529',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6116,
  428,
  '21629',
  '21629',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6117,
  428,
  '21646',
  '21646',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6118,
  428,
  '21726',
  '21726',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6119,
  428,
  '21727',
  '21727',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6120,
  428,
  '21729',
  '21729',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6121,
  428,
  '21730',
  '21730',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6122,
  428,
  '21732',
  '21732',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6123,
  428,
  '22113',
  '22113',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6124,
  428,
  '22145',
  '22145',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6125,
  428,
  '22801',
  '23919',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6126,
  428,
  '24001',
  '25999',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6127,
  428,
  '27356',
  '27356',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6128,
  428,
  '27367',
  '27367',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6129,
  428,
  '27374',
  '27374',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6130,
  428,
  '27383',
  '27383',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6131,
  428,
  '27386',
  '27386',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6132,
  428,
  '27389',
  '27389',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6133,
  428,
  '27404',
  '27404',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6134,
  428,
  '27412',
  '27412',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6135,
  428,
  '27419',
  '27419',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6136,
  428,
  '27432',
  '27432',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6137,
  428,
  '27442',
  '27442',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6138,
  428,
  '27446',
  '27446',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6139,
  428,
  '27449',
  '27449',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6140,
  428,
  '27483',
  '27498',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6141,
  428,
  '21614',
  '21614',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6142,
  428,
  '21635',
  '21635',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6143,
  428,
  '21644',
  '21644',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6144,
  428,
  '21680',
  '21680',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6145,
  428,
  '21684',
  '21684',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6146,
  428,
  '21698',
  '21698',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6147,
  428,
  '21702',
  '21702',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6148,
  428,
  '21706',
  '21706',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6149,
  428,
  '21709',
  '21709',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6150,
  428,
  '21710',
  '21710',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6151,
  428,
  '21712',
  '21712',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6152,
  428,
  '21714',
  '21714',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6153,
  428,
  '21717',
  '21717',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6154,
  428,
  '21720',
  '21720',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6155,
  428,
  '21723',
  '21723',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6156,
  428,
  '21734',
  '21734',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6157,
  428,
  '21737',
  '21737',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6158,
  428,
  '21739',
  '21739',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6159,
  429,
  '66663',
  '66663',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6160,
  429,
  '66679',
  '66679',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6161,
  429,
  '66687',
  '66687',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6162,
  429,
  '66693',
  '66693',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6163,
  429,
  '66701',
  '66701',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6164,
  429,
  '66706',
  '66706',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6165,
  429,
  '66709',
  '66709',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6166,
  430,
  '66111',
  '66352',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6167,
  431,
  '66606',
  '66649',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6168,
  432,
  '66538',
  '66538',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6169,
  432,
  '66539',
  '66539',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6170,
  432,
  '66540',
  '66540',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6171,
  432,
  '66557',
  '66557',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6172,
  432,
  '66564',
  '66564',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6173,
  432,
  '66571',
  '66571',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6174,
  432,
  '66578',
  '66578',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6175,
  432,
  '66583',
  '66583',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6176,
  432,
  '66589',
  '66589',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6177,
  433,
  '66353',
  '66359',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6178,
  433,
  '66711',
  '66806',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6179,
  434,
  '66807',
  '66839',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6180,
  435,
  '56472',
  '56472',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6181,
  435,
  '56593',
  '56593',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6182,
  435,
  '56594',
  '56594',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6183,
  435,
  '57518',
  '57518',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6184,
  435,
  '57520',
  '57520',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6185,
  435,
  '57548',
  '57548',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6186,
  435,
  '57555',
  '57555',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6187,
  435,
  '57562',
  '57562',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6188,
  435,
  '57567',
  '57567',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6189,
  435,
  '57572',
  '57572',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6190,
  435,
  '57578',
  '57578',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6191,
  435,
  '57580',
  '57580',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6192,
  435,
  '57583',
  '57583',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6193,
  435,
  '57584',
  '57584',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6194,
  435,
  '57586',
  '57586',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6195,
  435,
  '57629',
  '57629',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6196,
  435,
  '57632',
  '57632',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6197,
  436,
  '55442',
  '55442',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6198,
  436,
  '55444',
  '55444',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6199,
  436,
  '55450',
  '55450',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6200,
  436,
  '55452',
  '55452',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6201,
  436,
  '55543',
  '55543',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6202,
  436,
  '55545',
  '55545',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6203,
  436,
  '55546',
  '55546',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6204,
  436,
  '55559',
  '55559',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6205,
  436,
  '55566',
  '55566',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6206,
  436,
  '55568',
  '55568',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6207,
  436,
  '55569',
  '55569',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6208,
  436,
  '55571',
  '55571',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6209,
  436,
  '55576',
  '55576',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6210,
  436,
  '55583',
  '55583',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6211,
  436,
  '55585',
  '55585',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6212,
  436,
  '55590',
  '55590',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6213,
  436,
  '55592',
  '55592',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6214,
  436,
  '55593',
  '55593',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6215,
  436,
  '55595',
  '55595',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6216,
  436,
  '55596',
  '55596',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6217,
  436,
  '55606',
  '55606',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6218,
  436,
  '55608',
  '55608',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6219,
  436,
  '55618',
  '55618',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6220,
  436,
  '55619',
  '55619',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6221,
  436,
  '55621',
  '55621',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6222,
  436,
  '55627',
  '55627',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6223,
  436,
  '55629',
  '55629',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6224,
  436,
  '55758',
  '55758',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6225,
  436,
  '67744',
  '67744',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6226,
  436,
  '67823',
  '67823',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6227,
  436,
  '67824',
  '67824',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6228,
  436,
  '67826',
  '67826',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6229,
  436,
  '67827',
  '67827',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6230,
  436,
  '67829',
  '67829',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6231,
  437,
  '53424',
  '53424',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6232,
  437,
  '53426',
  '53426',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6233,
  437,
  '53474',
  '53474',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6234,
  437,
  '53489',
  '53489',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6235,
  437,
  '53498',
  '53498',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6236,
  437,
  '53501',
  '53501',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6237,
  437,
  '53505',
  '53505',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6238,
  437,
  '53506',
  '53506',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6239,
  437,
  '53507',
  '53507',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6240,
  437,
  '53508',
  '53508',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6241,
  437,
  '53518',
  '53518',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6242,
  437,
  '53520',
  '53520',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6243,
  437,
  '53533',
  '53533',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6244,
  437,
  '53534',
  '53534',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6245,
  437,
  '53560',
  '53560',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6246,
  437,
  '56651',
  '56651',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6247,
  437,
  '56653',
  '56653',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6248,
  437,
  '56656',
  '56656',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6249,
  437,
  '56659',
  '56659',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6250,
  437,
  '56746',
  '56746',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6251,
  438,
  '54529',
  '54529',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6252,
  438,
  '54595',
  '54595',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6253,
  438,
  '54597',
  '54597',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6254,
  438,
  '54608',
  '54608',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6255,
  438,
  '54610',
  '54610',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6256,
  438,
  '54612',
  '54612',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6257,
  438,
  '54614',
  '54614',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6258,
  438,
  '54616',
  '54616',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6259,
  438,
  '54617',
  '54617',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6260,
  438,
  '54619',
  '54619',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6261,
  438,
  '54634',
  '54634',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6262,
  438,
  '54636',
  '54636',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6263,
  438,
  '54646',
  '54646',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6264,
  438,
  '54647',
  '54647',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6265,
  438,
  '54649',
  '54649',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6266,
  438,
  '54655',
  '54655',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6267,
  438,
  '54657',
  '54657',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6268,
  438,
  '54662',
  '54662',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6269,
  438,
  '54664',
  '54664',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6270,
  438,
  '54666',
  '54666',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6271,
  438,
  '54668',
  '54668',
  '2019-08-22 13:14:14',
  '2019-08-22 13:14:14'
), (
  6272,
  438,
  '54669',
  '54669',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6273,
  438,
  '54673',
  '54673',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6274,
  438,
  '54675',
  '54675',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6275,
  438,
  '54687',
  '54687',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6276,
  438,
  '54689',
  '54689',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6277,
  438,
  '65330',
  '65330',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6278,
  439,
  '56253',
  '56253',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6279,
  439,
  '56254',
  '56254',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6280,
  439,
  '56754',
  '56754',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6281,
  439,
  '56759',
  '56759',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6282,
  439,
  '56761',
  '56761',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6283,
  439,
  '56812',
  '56812',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6284,
  439,
  '56814',
  '56814',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6285,
  439,
  '56818',
  '56818',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6286,
  439,
  '56820',
  '56820',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6287,
  439,
  '56821',
  '56821',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6288,
  439,
  '56823',
  '56823',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6289,
  439,
  '56825',
  '56825',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6290,
  439,
  '56826',
  '56826',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6291,
  439,
  '56828',
  '56828',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6292,
  439,
  '56829',
  '56829',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6293,
  439,
  '56856',
  '56856',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6294,
  439,
  '56857',
  '56857',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6295,
  439,
  '56858',
  '56858',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6296,
  439,
  '56859',
  '56859',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6297,
  439,
  '56862',
  '56862',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6298,
  439,
  '56864',
  '56864',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6299,
  439,
  '56865',
  '56865',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6300,
  440,
  '53518',
  '53518',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6301,
  440,
  '53520',
  '53520',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6302,
  440,
  '53539',
  '53539',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6303,
  440,
  '54550',
  '54550',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6304,
  440,
  '54552',
  '54552',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6305,
  440,
  '54558',
  '54558',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6306,
  440,
  '54568',
  '54568',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6307,
  440,
  '54570',
  '54570',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6308,
  440,
  '54574',
  '54574',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6309,
  440,
  '54576',
  '54576',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6310,
  440,
  '54578',
  '54578',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6311,
  440,
  '54579',
  '54579',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6312,
  440,
  '54584',
  '54587',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6313,
  440,
  '54589',
  '54589',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6314,
  440,
  '54611',
  '54611',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6315,
  440,
  '56766',
  '56766',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6316,
  440,
  '56767',
  '56767',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6317,
  440,
  '56769',
  '56769',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6318,
  441,
  '56182',
  '56182',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6319,
  441,
  '56001',
  '56077',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6320,
  441,
  '56156',
  '56170',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6321,
  441,
  '56171',
  '56179',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6322,
  441,
  '56207',
  '56220',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6323,
  441,
  '56319',
  '56323',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6324,
  441,
  '56330',
  '56331',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6325,
  441,
  '56571',
  '56575',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6326,
  442,
  '56182',
  '56182',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6327,
  442,
  '56191',
  '56191',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6328,
  442,
  '56220',
  '56220',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6329,
  442,
  '56294',
  '56294',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6330,
  442,
  '56295',
  '56295',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6331,
  442,
  '56299',
  '56299',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6332,
  442,
  '56330',
  '56330',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6333,
  442,
  '56332',
  '56332',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6334,
  442,
  '56626',
  '56626',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6335,
  442,
  '56630',
  '56630',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6336,
  442,
  '56637',
  '56637',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6337,
  442,
  '56642',
  '56642',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6338,
  442,
  '56645',
  '56645',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6339,
  442,
  '56648',
  '56648',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6340,
  442,
  '56727',
  '56727',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6341,
  442,
  '56729',
  '56729',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6342,
  442,
  '56736',
  '56736',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6343,
  442,
  '56743',
  '56743',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6344,
  442,
  '56745',
  '56745',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6345,
  442,
  '56751',
  '56751',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6346,
  442,
  '56753',
  '56753',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6347,
  443,
  '53545',
  '53545',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6348,
  443,
  '53547',
  '53547',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6349,
  443,
  '53557',
  '53557',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6350,
  443,
  '53560',
  '53560',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6351,
  443,
  '53562',
  '53562',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6352,
  443,
  '53572',
  '53572',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6353,
  443,
  '53579',
  '53579',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6354,
  443,
  '53567',
  '53567',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6355,
  443,
  '53577',
  '53577',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6356,
  443,
  '53619',
  '53619',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6357,
  443,
  '56269',
  '56269',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6358,
  443,
  '56271',
  '56271',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6359,
  443,
  '56276',
  '56276',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6360,
  443,
  '56305',
  '56305',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6361,
  443,
  '56307',
  '56307',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6362,
  443,
  '56316',
  '56316',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6363,
  443,
  '56317',
  '56317',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6364,
  443,
  '56564',
  '56564',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6365,
  443,
  '56566',
  '56566',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6366,
  443,
  '56599',
  '56599',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6367,
  443,
  '56567',
  '56567',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6368,
  443,
  '56579',
  '56579',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6369,
  443,
  '56581',
  '56581',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6370,
  443,
  '56584',
  '56584',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6371,
  443,
  '56587',
  '56587',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6372,
  443,
  '56588',
  '56588',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6373,
  443,
  '56589',
  '56589',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6374,
  443,
  '56598',
  '56598',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6375,
  443,
  '56599',
  '56599',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6376,
  443,
  '57614',
  '57614',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6377,
  443,
  '57639',
  '57639',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6378,
  444,
  '54329',
  '54329',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6379,
  444,
  '54331',
  '54331',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6380,
  444,
  '54332',
  '54332',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6381,
  444,
  '54439',
  '54439',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6382,
  444,
  '54441',
  '54441',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6383,
  444,
  '54450',
  '54450',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6384,
  444,
  '54451',
  '54451',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6385,
  444,
  '54453',
  '54453',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6386,
  444,
  '54455',
  '54455',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6387,
  444,
  '54456',
  '54456',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6388,
  444,
  '54457',
  '54457',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6389,
  444,
  '54459',
  '54459',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6390,
  445,
  '55430',
  '55430',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6391,
  445,
  '55432',
  '55432',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6392,
  445,
  '55469',
  '55469',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6393,
  445,
  '55471',
  '55471',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6394,
  445,
  '55481',
  '55481',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6395,
  445,
  '55483',
  '55483',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6396,
  445,
  '55487',
  '55487',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6397,
  445,
  '55490',
  '55490',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6398,
  445,
  '55491',
  '55491',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6399,
  445,
  '55494',
  '55494',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6400,
  445,
  '55496',
  '55496',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6401,
  445,
  '55497',
  '55497',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6402,
  445,
  '55499',
  '55499',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6403,
  445,
  '56154',
  '56154',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6404,
  445,
  '56281',
  '56281',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6405,
  445,
  '56283',
  '56283',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6406,
  445,
  '56288',
  '56288',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6407,
  445,
  '56290',
  '56290',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6408,
  445,
  '56291',
  '56291',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6409,
  445,
  '56850',
  '56850',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6410,
  445,
  '56869',
  '56869',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6411,
  446,
  '54290',
  '54290',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6412,
  446,
  '54292',
  '54296',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6413,
  446,
  '54298',
  '54298',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6414,
  446,
  '54306',
  '54306',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6415,
  446,
  '54308',
  '54308',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6416,
  446,
  '54309',
  '54309',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6417,
  446,
  '54311',
  '54311',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6418,
  446,
  '54313',
  '54313',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6419,
  446,
  '54338',
  '54338',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6420,
  446,
  '54340',
  '54340',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6421,
  446,
  '54343',
  '54343',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6422,
  446,
  '54344',
  '54344',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6423,
  446,
  '54346',
  '54346',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6424,
  446,
  '54349',
  '54349',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6425,
  447,
  '54424',
  '54424',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6426,
  447,
  '54426',
  '54426',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6427,
  447,
  '54470',
  '54470',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6428,
  447,
  '54472',
  '54472',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6429,
  447,
  '54483',
  '54483',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6430,
  447,
  '54487',
  '54487',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6431,
  447,
  '54492',
  '54492',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6432,
  447,
  '54497',
  '54497',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6433,
  447,
  '54498',
  '54498',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6434,
  447,
  '54516',
  '54516',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6435,
  447,
  '54518',
  '54518',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6436,
  447,
  '54523',
  '54523',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6437,
  447,
  '54524',
  '54524',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6438,
  447,
  '54526',
  '54526',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6439,
  447,
  '54528',
  '54528',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6440,
  447,
  '54531',
  '54531',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6441,
  447,
  '54533',
  '54533',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6442,
  447,
  '54534',
  '54534',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6443,
  447,
  '54536',
  '54536',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6444,
  447,
  '54538',
  '54538',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6445,
  447,
  '54539',
  '54539',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6446,
  447,
  '56841',
  '56841',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6447,
  447,
  '56843',
  '56843',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6448,
  447,
  '56861',
  '56861',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6449,
  448,
  '54314',
  '54317',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6450,
  448,
  '54318',
  '54320',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6451,
  448,
  '54411',
  '54411',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6452,
  448,
  '54413',
  '54413',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6453,
  448,
  '54421',
  '54421',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6454,
  448,
  '54422',
  '54422',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6455,
  448,
  '54427',
  '54427',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6456,
  448,
  '54429',
  '54429',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6457,
  449,
  '67099',
  '67141',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6458,
  449,
  '67163',
  '67166',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6459,
  449,
  '67201',
  '67245',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6460,
  449,
  '67257',
  '67259',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6461,
  449,
  '67321',
  '67354',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6462,
  449,
  '67369',
  '67376',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6463,
  449,
  '67455',
  '67459',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6464,
  450,
  '67355',
  '67368',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6465,
  450,
  '67378',
  '67378',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6466,
  450,
  '76711',
  '76779',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6467,
  450,
  '76866',
  '76872',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6468,
  450,
  '76878',
  '76879',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6469,
  451,
  '80997',
  '80997',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6470,
  451,
  '80999',
  '80999',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6471,
  451,
  '80992',
  '80992',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6472,
  451,
  '80637',
  '80637',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6473,
  451,
  '80634',
  '80634',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6474,
  451,
  '80639',
  '80639',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6475,
  451,
  '80689',
  '80689',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6476,
  451,
  '80686',
  '80686',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6477,
  451,
  '81373',
  '81373',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6478,
  451,
  '81375',
  '81375',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6479,
  451,
  '81377',
  '81377',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6480,
  451,
  '81369',
  '81369',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6481,
  451,
  '81371',
  '81371',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6482,
  451,
  '81241',
  '81241',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6483,
  451,
  '81243',
  '81243',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6484,
  451,
  '81249',
  '81249',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6485,
  451,
  '81245',
  '81245',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6486,
  451,
  '81247',
  '81247',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6487,
  451,
  '81543',
  '81543',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6488,
  451,
  '81545',
  '81545',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6489,
  451,
  '81547',
  '81547',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6490,
  451,
  '81549',
  '81549',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6491,
  451,
  '81667',
  '81667',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6492,
  451,
  '81669',
  '81669',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6493,
  451,
  '81671',
  '81671',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6494,
  451,
  '81673',
  '81673',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6495,
  451,
  '81675',
  '81675',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6496,
  451,
  '81677',
  '81677',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6497,
  451,
  '81679',
  '81679',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6498,
  451,
  '81735',
  '81735',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6499,
  451,
  '81737',
  '81737',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6500,
  451,
  '81739',
  '81739',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6501,
  451,
  '81825',
  '81825',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6502,
  451,
  '81827',
  '81827',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6503,
  451,
  '81829',
  '81829',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6504,
  451,
  '81925',
  '81925',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6505,
  451,
  '81927',
  '81927',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6506,
  451,
  '81929',
  '81929',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6507,
  452,
  '48302',
  '48308',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6508,
  452,
  '59331',
  '59348',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6509,
  452,
  '59380',
  '59399',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6510,
  453,
  '77799',
  '77799',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6511,
  453,
  '77797',
  '77797',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6512,
  453,
  '77794',
  '77794',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6513,
  453,
  '77791',
  '77791',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6514,
  453,
  '77770',
  '77770',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6515,
  453,
  '77768',
  '77768',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6516,
  453,
  '77767',
  '77767',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6517,
  453,
  '77765',
  '77765',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6518,
  453,
  '77763',
  '77763',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6519,
  453,
  '77762',
  '77762',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6520,
  453,
  '77749',
  '77749',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6521,
  453,
  '77747',
  '77747',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6522,
  453,
  '77746',
  '77746',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6523,
  453,
  '77740',
  '77744',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6524,
  453,
  '77738',
  '77738',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6525,
  453,
  '77737',
  '77737',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6526,
  453,
  '77728',
  '77728',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6527,
  453,
  '77723',
  '77725',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6528,
  453,
  '77717',
  '77719',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6529,
  453,
  '77704',
  '77704',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6530,
  453,
  '77695',
  '77698',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6531,
  453,
  '77652',
  '77652',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6532,
  453,
  '77654',
  '77654',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6533,
  453,
  '77656',
  '77656',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6534,
  453,
  '77649',
  '77649',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6535,
  453,
  '77640',
  '77647',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6536,
  453,
  '77601',
  '77616',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6537,
  454,
  '78352',
  '78354',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6538,
  454,
  '88633',
  '88633',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6539,
  454,
  '88641',
  '88699',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6540,
  454,
  '88709',
  '88709',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6541,
  454,
  '88718',
  '88719',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6542,
  454,
  '88001',
  '88099',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6543,
  455,
  '67001',
  '67071',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6544,
  455,
  '67098',
  '67141',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6545,
  455,
  '67257',
  '67259',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6546,
  455,
  '67352',
  '67360',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6547,
  455,
  '67134',
  '67134',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6548,
  455,
  '67236',
  '67245',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6549,
  455,
  '67455',
  '67459',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6550,
  455,
  '67369',
  '67373',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6551,
  455,
  '67374',
  '67374',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6552,
  455,
  '67136',
  '67136',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6553,
  455,
  '67376',
  '67376',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6554,
  455,
  '67680',
  '67680',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6555,
  455,
  '67283',
  '67283',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6556,
  455,
  '67163',
  '67166',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6557,
  456,
  '86369',
  '86381',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6558,
  456,
  '86466',
  '86476',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6559,
  456,
  '86479',
  '86480',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6560,
  456,
  '86483',
  '86483',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6561,
  456,
  '86488',
  '86491',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6562,
  456,
  '86505',
  '86505',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6563,
  456,
  '86513',
  '86513',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6564,
  456,
  '86519',
  '86519',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6565,
  456,
  '89201',
  '89257',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6566,
  456,
  '89301',
  '89368',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6567,
  457,
  '88113',
  '88179',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6568,
  458,
  '82297',
  '82297',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6569,
  458,
  '86301',
  '86316',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6570,
  458,
  '86406',
  '86415',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6571,
  458,
  '86425',
  '86438',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6572,
  458,
  '86442',
  '86453',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6573,
  458,
  '86495',
  '86495',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6574,
  458,
  '86504',
  '86511',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6575,
  458,
  '86542',
  '86559',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6576,
  458,
  '86568',
  '86577',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6577,
  458,
  '86674',
  '86674',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6578,
  459,
  '87681',
  '87700',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6579,
  459,
  '87711',
  '87764',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6580,
  460,
  '87571',
  '87679',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6581,
  460,
  '86801',
  '86807',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6582,
  460,
  '87453',
  '87459',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6583,
  460,
  '87481',
  '87484',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6584,
  460,
  '87494',
  '87496',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6585,
  460,
  '86860',
  '86862',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6586,
  460,
  '86869',
  '86869',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6587,
  460,
  '86875',
  '86875',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6588,
  460,
  '86879',
  '86879',
  '2019-08-22 13:14:15',
  '2019-08-22 13:14:15'
), (
  6589,
  461,
  '04831',
  '04860',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6590,
  461,
  '04421',
  '04425',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6591,
  461,
  '04501',
  '04519',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6592,
  461,
  '04758',
  '04758',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6593,
  461,
  '04884',
  '04886',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6594,
  461,
  '04431',
  '04435',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6595,
  461,
  '06731',
  '06749',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6596,
  462,
  '45001',
  '45359',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6597,
  463,
  '44701',
  '44894',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6598,
  463,
  '45501',
  '45529',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6599,
  463,
  '45536',
  '45549',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6600,
  463,
  '58314',
  '58339',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6601,
  464,
  '45801',
  '45899',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6602,
  464,
  '45951',
  '45968',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6603,
  464,
  '46201',
  '46244',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6604,
  465,
  '45401',
  '45481',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6605,
  465,
  '45149',
  '45149',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6606,
  465,
  '45219',
  '45219',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6607,
  466,
  '58240',
  '58285',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6608,
  466,
  '58461',
  '58515',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6609,
  466,
  '58527',
  '58579',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6610,
  466,
  '58741',
  '58791',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6611,
  466,
  '58803',
  '58849',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6612,
  467,
  '80331',
  '80331',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6613,
  467,
  '80333',
  '80333',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6614,
  467,
  '80335',
  '80335',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6615,
  467,
  '80336',
  '80336',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6616,
  467,
  '80337',
  '80337',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6617,
  467,
  '80538',
  '80538',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6618,
  467,
  '80539',
  '80539',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6619,
  467,
  '80636',
  '80636',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6620,
  467,
  '80796',
  '80796',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6621,
  467,
  '80797',
  '80797',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6622,
  467,
  '80798',
  '80798',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6623,
  467,
  '80799',
  '80799',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6624,
  467,
  '80804',
  '80804',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6625,
  467,
  '80805',
  '80805',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6626,
  467,
  '80807',
  '80807',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6627,
  467,
  '80809',
  '80809',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6628,
  467,
  '80933',
  '80933',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6629,
  467,
  '80935',
  '80935',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6630,
  467,
  '80939',
  '80939',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6631,
  467,
  '80993',
  '80993',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6632,
  467,
  '80995',
  '80995',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6633,
  467,
  '81379',
  '81379',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6634,
  467,
  '81475',
  '81475',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6635,
  467,
  '81476',
  '81476',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6636,
  467,
  '81477',
  '81477',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6637,
  467,
  '81479',
  '81479',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6638,
  467,
  '80997',
  '80997',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6639,
  467,
  '80999',
  '80999',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6640,
  467,
  '80992',
  '80992',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6641,
  467,
  '80637',
  '80637',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6642,
  467,
  '80634',
  '80634',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6643,
  467,
  '80639',
  '80639',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6644,
  467,
  '80689',
  '80689',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6645,
  467,
  '80686',
  '80686',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6646,
  467,
  '81373',
  '81373',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6647,
  467,
  '81375',
  '81375',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6648,
  467,
  '81377',
  '81377',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6649,
  467,
  '81369',
  '81369',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6650,
  467,
  '81371',
  '81371',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6651,
  467,
  '81241',
  '81241',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6652,
  467,
  '81243',
  '81243',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6653,
  467,
  '81249',
  '81249',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6654,
  467,
  '81245',
  '81245',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6655,
  467,
  '81247',
  '81247',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6656,
  467,
  '81543',
  '81543',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6657,
  467,
  '81545',
  '81545',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6658,
  467,
  '81547',
  '81547',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6659,
  467,
  '81549',
  '81549',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6660,
  467,
  '81667',
  '81667',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6661,
  467,
  '81669',
  '81669',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6662,
  467,
  '81671',
  '81671',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6663,
  467,
  '81673',
  '81673',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6664,
  467,
  '81675',
  '81675',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6665,
  467,
  '81677',
  '81677',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6666,
  467,
  '81679',
  '81679',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6667,
  467,
  '81735',
  '81735',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6668,
  467,
  '81737',
  '81737',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6669,
  467,
  '81739',
  '81739',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6670,
  467,
  '81825',
  '81825',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6671,
  467,
  '81827',
  '81827',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6672,
  467,
  '81829',
  '81829',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6673,
  467,
  '81925',
  '81925',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6674,
  467,
  '81927',
  '81927',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6675,
  467,
  '81929',
  '81929',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6676,
  467,
  '81539',
  '81539',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6677,
  467,
  '81541',
  '81541',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6678,
  467,
  '81543',
  '81543',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6679,
  467,
  '81545',
  '81545',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6680,
  467,
  '81547',
  '81547',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6681,
  467,
  '81549',
  '81549',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6682,
  467,
  '81667',
  '81667',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6683,
  467,
  '81669',
  '81669',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6684,
  467,
  '81671',
  '81671',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6685,
  467,
  '81673',
  '81673',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6686,
  467,
  '81675',
  '81675',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6687,
  467,
  '81677',
  '81677',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6688,
  467,
  '81679',
  '81679',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6689,
  467,
  '81735',
  '81735',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6690,
  467,
  '81737',
  '81737',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6691,
  467,
  '81739',
  '81739',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6692,
  467,
  '81825',
  '81825',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6693,
  467,
  '81827',
  '81827',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6694,
  467,
  '81829',
  '81829',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6695,
  467,
  '81925',
  '81925',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6696,
  467,
  '81927',
  '81927',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6697,
  467,
  '81929',
  '81929',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6698,
  468,
  '90542',
  '90542',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6699,
  468,
  '90562',
  '90562',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6700,
  468,
  '90562',
  '90562',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6701,
  468,
  '91054',
  '91054',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6702,
  468,
  '91074',
  '91074',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6703,
  468,
  '91080',
  '91080',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6704,
  468,
  '91080',
  '91080',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6705,
  468,
  '91080',
  '91080',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6706,
  468,
  '91083',
  '91083',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6707,
  468,
  '91085',
  '91085',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6708,
  468,
  '91086',
  '91086',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6709,
  468,
  '91088',
  '91088',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6710,
  468,
  '91091',
  '91091',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6711,
  468,
  '91093',
  '91093',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6712,
  468,
  '91096',
  '91096',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6713,
  468,
  '91097',
  '91097',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6714,
  468,
  '91315',
  '91315',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6715,
  468,
  '91325',
  '91325',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6716,
  468,
  '91334',
  '91334',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6717,
  468,
  '91341',
  '91341',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6718,
  468,
  '91350',
  '91350',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6719,
  468,
  '91475',
  '91475',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6720,
  468,
  '91487',
  '91487',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6721,
  468,
  '96172',
  '96172',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6722,
  468,
  '96193',
  '96193',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6723,
  469,
  '06001',
  '06548',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6724,
  469,
  '06601',
  '06928',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6725,
  469,
  '29401',
  '29416',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6726,
  469,
  '38801',
  '39649',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6727,
  470,
  '67099',
  '67141',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6728,
  470,
  '67163',
  '67167',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6729,
  470,
  '67321',
  '67354',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6730,
  470,
  '67369',
  '67376',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6731,
  470,
  '67455',
  '67459',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6732,
  471,
  '40001',
  '40629',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6733,
  471,
  '40671',
  '41724',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6734,
  471,
  '40831',
  '40885',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6735,
  471,
  '42501',
  '42579',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6736,
  472,
  '40001',
  '40629',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6737,
  472,
  '40671',
  '41724',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6738,
  472,
  '40831',
  '40885',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6739,
  472,
  '42501',
  '42579',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6740,
  473,
  '40001',
  '40629',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6741,
  473,
  '40671',
  '41724',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6742,
  473,
  '40831',
  '40885',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6743,
  473,
  '42501',
  '42579',
  '2019-08-22 13:14:16',
  '2019-08-22 13:14:16'
), (
  6744,
  474,
  '50667',
  '50679',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6745,
  474,
  '50733',
  '50739',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6746,
  474,
  '50765',
  '50765',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6747,
  474,
  '50767',
  '50767',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6748,
  474,
  '50769',
  '50769',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6749,
  474,
  '50823',
  '50829',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6750,
  474,
  '50858',
  '50858',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6751,
  474,
  '50859',
  '50859',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6752,
  474,
  '50931',
  '50939',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6753,
  474,
  '50968',
  '50968',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6754,
  474,
  '50969',
  '50969',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6755,
  474,
  '50996',
  '50996',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6756,
  474,
  '50997',
  '50997',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6757,
  474,
  '50999',
  '50999',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6758,
  475,
  '50101',
  '50259',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6759,
  476,
  '50672',
  '50672',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6760,
  476,
  '50667',
  '50667',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6761,
  476,
  '50674',
  '50674',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6762,
  476,
  '50676',
  '50676',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6763,
  476,
  '50679',
  '50679',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6764,
  476,
  '50678',
  '50678',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6765,
  476,
  '50677',
  '50677',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6766,
  476,
  '51063',
  '51063',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6767,
  476,
  '51149',
  '51149',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6768,
  476,
  '51145',
  '51145',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6769,
  476,
  '51147',
  '51147',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6770,
  476,
  '51143',
  '51143',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6771,
  476,
  '50769',
  '50769',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6772,
  476,
  '50737',
  '50737',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6773,
  476,
  '50765',
  '50765',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6774,
  476,
  '50767',
  '50767',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6775,
  476,
  '50829',
  '50829',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6776,
  476,
  '50827',
  '50827',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6777,
  476,
  '50825',
  '50825',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6778,
  476,
  '50933',
  '50933',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6779,
  476,
  '50931',
  '50931',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6780,
  476,
  '50935',
  '50935',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6781,
  476,
  '50859',
  '50859',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6782,
  476,
  '50858',
  '50858',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6783,
  476,
  '50937',
  '50937',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6784,
  476,
  '50939',
  '50939',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6785,
  476,
  '50968',
  '50968',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6786,
  476,
  '50997',
  '50997',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6787,
  476,
  '50996',
  '50996',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6788,
  476,
  '50999',
  '50999',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6789,
  476,
  '50668',
  '50668',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6790,
  476,
  '50670',
  '50670',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6791,
  476,
  '50733',
  '50733',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6792,
  476,
  '50735',
  '50735',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6793,
  476,
  '50739',
  '50739',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6794,
  476,
  '50823',
  '50823',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6795,
  476,
  '50969',
  '50969',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6796,
  476,
  '51061',
  '51061',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6797,
  476,
  '51069',
  '51069',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6798,
  476,
  '51067',
  '51067',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6799,
  476,
  '51065',
  '51065',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6800,
  476,
  '51103',
  '51103',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6801,
  476,
  '51105',
  '51105',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6802,
  476,
  '51107',
  '51107',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6803,
  476,
  '51109',
  '51109',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6804,
  477,
  '50441',
  '51149',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6805,
  478,
  '51103',
  '51109',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6806,
  478,
  '51143',
  '51149',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6807,
  479,
  '40001',
  '40629',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6808,
  479,
  '40671',
  '41724',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6809,
  479,
  '40831',
  '40885',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6810,
  479,
  '42501',
  '42579',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6811,
  480,
  '40736',
  '40789',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6812,
  480,
  '42657',
  '42697',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6813,
  480,
  '42782',
  '42799',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6814,
  480,
  '42904',
  '42929',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6815,
  480,
  '51387',
  '51399',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6816,
  481,
  '50301',
  '50389',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6817,
  481,
  '53914',
  '53919',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6818,
  482,
  '42460',
  '42499',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6819,
  482,
  '51531',
  '51545',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6820,
  482,
  '51571',
  '51789',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6821,
  483,
  '41335',
  '41352',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6822,
  483,
  '41401',
  '41472',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6823,
  483,
  '41543',
  '41564',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6824,
  483,
  '40636',
  '40670',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6825,
  484,
  '42001',
  '42399',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6826,
  484,
  '42601',
  '42719',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6827,
  484,
  '42801',
  '42899',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6828,
  484,
  '40801',
  '40822',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6829,
  484,
  '42755',
  '42781',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6830,
  485,
  '51301',
  '51381',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6831,
  486,
  '41485',
  '41517',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6832,
  486,
  '41353',
  '41363',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6833,
  487,
  '51401',
  '51519',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6834,
  488,
  '51556',
  '51570',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6835,
  488,
  '53001',
  '53359',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6836,
  488,
  '53581',
  '53604',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6837,
  488,
  '53621',
  '53859',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6838,
  488,
  '53910',
  '53913',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6839,
  489,
  '41565',
  '41569',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6840,
  489,
  '41485',
  '41517',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6841,
  490,
  '40001',
  '40629',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6842,
  490,
  '40671',
  '41724',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6843,
  490,
  '40831',
  '40885',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6844,
  490,
  '42501',
  '42579',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6845,
  491,
  '96501',
  '96529',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6846,
  491,
  '98501',
  '98749',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6847,
  491,
  '99801',
  '99898',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6848,
  492,
  '07201',
  '07429',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6849,
  492,
  '07570',
  '07579',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6850,
  492,
  '07601',
  '07819',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6851,
  492,
  '99001',
  '99638',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6852,
  493,
  '97528',
  '97528',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6853,
  493,
  '97601',
  '97659',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6854,
  493,
  '97724',
  '97724',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6855,
  494,
  '97661',
  '97688',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6856,
  494,
  '97697',
  '97702',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6857,
  494,
  '97703',
  '97729',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6858,
  494,
  '97754',
  '97799',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6859,
  494,
  '97517',
  '97517',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6860,
  495,
  '97861',
  '97877',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6861,
  495,
  '97893',
  '97894',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6862,
  495,
  '97896',
  '97900',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6863,
  495,
  '97911',
  '97987',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6864,
  495,
  '97991',
  '97999',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6865,
  495,
  '74744',
  '74744',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6866,
  495,
  '74747',
  '74747',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6867,
  495,
  '74212',
  '74214',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6868,
  495,
  '74236',
  '74238',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6869,
  496,
  '96301',
  '96369',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6870,
  496,
  '96265',
  '96268',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6871,
  496,
  '96277',
  '96277',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6872,
  497,
  '97491',
  '97491',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6873,
  497,
  '96151',
  '96151',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6874,
  497,
  '97494',
  '97494',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6875,
  497,
  '97496',
  '97496',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6876,
  497,
  '97500',
  '97503',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6877,
  497,
  '96104',
  '96106',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6878,
  497,
  '97479',
  '97486',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6879,
  497,
  '97503',
  '97503',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6880,
  497,
  '97428',
  '97437',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6881,
  497,
  '97458',
  '97461',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6882,
  497,
  '96166',
  '96166',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6883,
  497,
  '97476',
  '97478',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6884,
  497,
  '97486',
  '97486',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6885,
  497,
  '96124',
  '96126',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6886,
  497,
  '97514',
  '97514',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6887,
  497,
  '96176',
  '96176',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6888,
  497,
  '96181',
  '96181',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6889,
  497,
  '96184',
  '96184',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6890,
  497,
  '97519',
  '97519',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6891,
  497,
  '97522',
  '97522',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6892,
  497,
  '96188',
  '96190',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6893,
  497,
  '97531',
  '97531',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6894,
  497,
  '96190',
  '96190',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6895,
  497,
  '97539',
  '97539',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6896,
  497,
  '97470',
  '97475',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6897,
  497,
  '96148',
  '96148',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6898,
  497,
  '96179',
  '96179',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6899,
  498,
  '91331',
  '91332',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6900,
  498,
  '96001',
  '96103',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6901,
  498,
  '96107',
  '96123',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6902,
  498,
  '96127',
  '96138',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6903,
  498,
  '96146',
  '96149',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6904,
  498,
  '96154',
  '96158',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6905,
  498,
  '96161',
  '96164',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6906,
  498,
  '96167',
  '96170',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6907,
  498,
  '96173',
  '96175',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6908,
  498,
  '96178',
  '96179',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6909,
  498,
  '96182',
  '96182',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6910,
  498,
  '96185',
  '96187',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6911,
  498,
  '96191',
  '96191',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6912,
  498,
  '96194',
  '96196',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6913,
  498,
  '96199',
  '96199',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6914,
  499,
  '96201',
  '96231',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6915,
  499,
  '96243',
  '96250',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6916,
  499,
  '96257',
  '96264',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6917,
  499,
  '96272',
  '96272',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6918,
  499,
  '96275',
  '96275',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6919,
  500,
  '94441',
  '94469',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6920,
  500,
  '94482',
  '94491',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6921,
  500,
  '94503',
  '94508',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6922,
  500,
  '94523',
  '94527',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6923,
  500,
  '94530',
  '94533',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6924,
  500,
  '94539',
  '94541',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6925,
  500,
  '94547',
  '94547',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6926,
  500,
  '94550',
  '94551',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6927,
  500,
  '94554',
  '94554',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6928,
  500,
  '94557',
  '94557',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6929,
  500,
  '94560',
  '94563',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6930,
  500,
  '94569',
  '94571',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6931,
  500,
  '94574',
  '94574',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6932,
  500,
  '94577',
  '94577',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6933,
  501,
  '93185',
  '93185',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6934,
  501,
  '93189',
  '93194',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6935,
  501,
  '93199',
  '93199',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6936,
  501,
  '93401',
  '93499',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6937,
  502,
  '90505',
  '90518',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6938,
  502,
  '90531',
  '90537',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6939,
  502,
  '90548',
  '90552',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6940,
  502,
  '90557',
  '90559',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6941,
  502,
  '90563',
  '90571',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6942,
  502,
  '90588',
  '90592',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6943,
  502,
  '90603',
  '90610',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6944,
  502,
  '91191',
  '91217',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6945,
  502,
  '91220',
  '91247',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6946,
  502,
  '91284',
  '91284',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6947,
  503,
  '91077',
  '91077',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6948,
  503,
  '91090',
  '91090',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6949,
  503,
  '91094',
  '91094',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6950,
  503,
  '91099',
  '91099',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6951,
  503,
  '91286',
  '91286',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6952,
  503,
  '91301',
  '91301',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6953,
  503,
  '91320',
  '91320',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6954,
  503,
  '91322',
  '91322',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6955,
  503,
  '91327',
  '91327',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6956,
  503,
  '91330',
  '91330',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6957,
  503,
  '91336',
  '91336',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6958,
  503,
  '91338',
  '91338',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6959,
  503,
  '91346',
  '91346',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6960,
  503,
  '91349',
  '91349',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6961,
  503,
  '91352',
  '91352',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6962,
  503,
  '91353',
  '91353',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6963,
  503,
  '91355',
  '91355',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6964,
  503,
  '91356',
  '91356',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6965,
  503,
  '91358',
  '91358',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6966,
  503,
  '91359',
  '91359',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6967,
  503,
  '91361',
  '91361',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6968,
  503,
  '91362',
  '91362',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6969,
  503,
  '91364',
  '91364',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6970,
  503,
  '91365',
  '91365',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6971,
  503,
  '91367',
  '91367',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6972,
  503,
  '91369',
  '91369',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6973,
  504,
  '90542',
  '90542',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6974,
  504,
  '90562',
  '90562',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6975,
  504,
  '90562',
  '90562',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6976,
  504,
  '91054',
  '91054',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6977,
  504,
  '91074',
  '91074',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6978,
  504,
  '91080',
  '91080',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6979,
  504,
  '91080',
  '91080',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6980,
  504,
  '91080',
  '91080',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6981,
  504,
  '91083',
  '91083',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6982,
  504,
  '91085',
  '91085',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6983,
  504,
  '91086',
  '91086',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6984,
  504,
  '91088',
  '91088',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6985,
  504,
  '91091',
  '91091',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6986,
  504,
  '91093',
  '91093',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6987,
  504,
  '91096',
  '91096',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6988,
  504,
  '91097',
  '91097',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6989,
  504,
  '91315',
  '91315',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6990,
  504,
  '91325',
  '91325',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6991,
  504,
  '91334',
  '91334',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6992,
  504,
  '91341',
  '91341',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6993,
  504,
  '91350',
  '91350',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6994,
  504,
  '91475',
  '91475',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6995,
  504,
  '91487',
  '91487',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6996,
  504,
  '96172',
  '96172',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6997,
  504,
  '96193',
  '96193',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6998,
  505,
  '86634',
  '86637',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  6999,
  505,
  '86644',
  '86647',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7000,
  505,
  '86656',
  '86657',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7001,
  505,
  '89344',
  '89353',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7002,
  505,
  '89401',
  '89449',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7003,
  506,
  '90001',
  '90491',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7004,
  507,
  '88381',
  '88400',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7005,
  507,
  '88416',
  '88416',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7006,
  507,
  '88422',
  '88427',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7007,
  507,
  '88430',
  '88437',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7008,
  507,
  '88441',
  '88489',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7009,
  507,
  '88499',
  '88499',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7010,
  507,
  '88513',
  '88515',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7011,
  507,
  '88519',
  '88527',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7012,
  507,
  '89165',
  '89165',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7013,
  507,
  '89293',
  '89293',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7014,
  508,
  '78352',
  '78354',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7015,
  508,
  '88633',
  '88633',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7016,
  508,
  '88641',
  '88699',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7017,
  508,
  '88709',
  '88709',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7018,
  508,
  '88718',
  '88719',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7019,
  508,
  '88001',
  '88099',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7020,
  509,
  '88250',
  '88250',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7021,
  509,
  '88255',
  '88255',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7022,
  509,
  '88263',
  '88263',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7023,
  509,
  '88271',
  '88271',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7024,
  509,
  '88273',
  '88273',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7025,
  509,
  '88276',
  '88276',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7026,
  509,
  '88281',
  '88281',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7027,
  509,
  '88284',
  '88284',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7028,
  509,
  '88326',
  '88326',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7029,
  509,
  '88339',
  '88339',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7030,
  509,
  '88361',
  '88361',
  '2019-08-22 13:26:43',
  '2019-08-22 13:26:43'
), (
  7031,
  509,
  '88364',
  '88364',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7032,
  509,
  '88368',
  '88368',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7033,
  509,
  '88370',
  '88370',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7034,
  509,
  '88371',
  '88371',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7035,
  509,
  '88373',
  '88373',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7036,
  509,
  '88374',
  '88374',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7037,
  509,
  '88376',
  '88376',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7038,
  509,
  '88377',
  '88377',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7039,
  509,
  '88379',
  '88379',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7040,
  509,
  '88299',
  '88299',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7041,
  509,
  '88410',
  '88410',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7042,
  509,
  '88353',
  '88353',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7043,
  509,
  '88317',
  '88317',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7044,
  509,
  '88310',
  '88310',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7045,
  510,
  '67099',
  '67141',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7046,
  510,
  '67163',
  '67167',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7047,
  510,
  '67321',
  '67354',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7048,
  510,
  '67369',
  '67376',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7049,
  510,
  '67455',
  '67459',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7050,
  511,
  '83553',
  '83553',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7051,
  511,
  '83565',
  '83565',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7052,
  511,
  '83550',
  '83550',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7053,
  511,
  '85552',
  '85560',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7054,
  511,
  '85567',
  '85567',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7055,
  511,
  '85570',
  '85591',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7056,
  511,
  '85598',
  '85604',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7057,
  511,
  '85610',
  '85617',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7058,
  511,
  '85622',
  '85625',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7059,
  511,
  '85641',
  '85646',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7060,
  511,
  '85650',
  '85652',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7061,
  511,
  '85661',
  '85661',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7062,
  511,
  '85664',
  '85664',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7063,
  511,
  '85665',
  '85665',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7064,
  511,
  '85667',
  '85667',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7065,
  512,
  '84072',
  '84072',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7066,
  512,
  '84104',
  '84104',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7067,
  512,
  '85307',
  '85307',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7068,
  512,
  '85354',
  '85354',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7069,
  512,
  '85356',
  '85356',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7070,
  512,
  '85368',
  '85368',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7071,
  512,
  '85368',
  '85368',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7072,
  512,
  '85375',
  '85375',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7073,
  512,
  '85376',
  '85376',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7074,
  512,
  '85386',
  '85386',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7075,
  512,
  '85391',
  '85391',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7076,
  512,
  '85395',
  '85395',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7077,
  512,
  '85395',
  '85395',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7078,
  512,
  '85395',
  '85395',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7079,
  512,
  '85399',
  '85399',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7080,
  512,
  '85402',
  '85402',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7081,
  512,
  '85406',
  '85406',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7082,
  512,
  '85408',
  '85408',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7083,
  512,
  '85410',
  '85410',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7084,
  512,
  '85411',
  '85411',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7085,
  512,
  '85413',
  '85413',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7086,
  512,
  '85414',
  '85414',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7087,
  512,
  '85416',
  '85416',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7088,
  512,
  '85417',
  '85417',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7089,
  512,
  '85419',
  '85419',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7090,
  512,
  '85777',
  '85777',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7091,
  513,
  '85201',
  '85259',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7092,
  513,
  '85778',
  '85778',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7093,
  513,
  '85749',
  '85757',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7094,
  513,
  '86567',
  '86567',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7095,
  514,
  '84141',
  '84144',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7096,
  514,
  '86557',
  '86558',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7097,
  514,
  '85073',
  '85077',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7098,
  514,
  '85081',
  '85088',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7099,
  514,
  '85105',
  '85107',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7100,
  514,
  '85119',
  '85119',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7101,
  514,
  '85126',
  '85126',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7102,
  514,
  '85261',
  '85309',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7103,
  515,
  '83349',
  '83349',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7104,
  515,
  '83367',
  '83367',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7105,
  515,
  '83527',
  '83527',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7106,
  515,
  '83536',
  '83536',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7107,
  515,
  '83546',
  '83546',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7108,
  515,
  '83555',
  '83559',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7109,
  515,
  '83562',
  '83562',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7110,
  515,
  '83567',
  '83567',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7111,
  515,
  '84140',
  '84140',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7112,
  515,
  '84155',
  '84155',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7113,
  515,
  '84419',
  '84419',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7114,
  515,
  '84428',
  '84428',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7115,
  515,
  '84431',
  '84431',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7116,
  515,
  '84437',
  '84437',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7117,
  515,
  '84453',
  '84453',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7118,
  515,
  '84478',
  '84478',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7119,
  515,
  '84494',
  '84494',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7120,
  515,
  '84513',
  '84513',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7121,
  515,
  '84539',
  '84539',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7122,
  515,
  '84544',
  '84544',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7123,
  515,
  '84546',
  '84546',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7124,
  515,
  '84550',
  '84550',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7125,
  515,
  '84555',
  '84555',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7126,
  515,
  '84559',
  '84559',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7127,
  515,
  '84562',
  '84562',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7128,
  515,
  '84564',
  '84564',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7129,
  515,
  '84565',
  '84565',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7130,
  515,
  '84570',
  '84570',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7131,
  515,
  '84573',
  '84573',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7132,
  515,
  '84574',
  '84574',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7133,
  515,
  '84579',
  '84579',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7134,
  516,
  '82050',
  '82057',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7135,
  516,
  '82062',
  '82064',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7136,
  516,
  '82069',
  '82069',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7137,
  516,
  '82319',
  '82319',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7138,
  516,
  '82393',
  '82393',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7139,
  516,
  '82427',
  '82432',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7140,
  516,
  '82439',
  '82439',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7141,
  516,
  '82444',
  '82444',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7142,
  516,
  '82501',
  '82549',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7143,
  516,
  '83621',
  '83623',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7144,
  516,
  '83631',
  '83661',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7145,
  516,
  '83667',
  '83679',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7146,
  517,
  '83314',
  '83317',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7147,
  517,
  '83325',
  '83329',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7148,
  517,
  '83367',
  '83367',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7149,
  517,
  '83381',
  '83488',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7150,
  517,
  '83395',
  '83395',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7151,
  517,
  '83402',
  '83402',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7152,
  517,
  '83404',
  '83407',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7153,
  517,
  '83410',
  '83410',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7154,
  517,
  '83411',
  '83411',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7155,
  517,
  '83413',
  '83413',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7156,
  517,
  '83414',
  '83414',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7157,
  517,
  '83416',
  '83416',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7158,
  517,
  '83417',
  '83417',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7159,
  517,
  '83421',
  '83421',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7160,
  517,
  '83423',
  '83426',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7161,
  517,
  '83429',
  '83429',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7162,
  517,
  '83431',
  '83431',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7163,
  517,
  '83435',
  '83435',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7164,
  517,
  '83448',
  '83448',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7165,
  517,
  '83449',
  '83449',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7166,
  517,
  '83451',
  '83451',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7167,
  517,
  '83452',
  '83452',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7168,
  517,
  '83454',
  '83454',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7169,
  517,
  '83455',
  '83455',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7170,
  517,
  '83457',
  '83457',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7171,
  517,
  '83458',
  '83458',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7172,
  517,
  '83461',
  '83464',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7173,
  517,
  '83466',
  '83466',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7174,
  517,
  '83471',
  '83471',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7175,
  517,
  '83481',
  '83481',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7176,
  517,
  '83483',
  '83483',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7177,
  517,
  '83484',
  '83484',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7178,
  517,
  '83486',
  '83486',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7179,
  517,
  '83487',
  '83487',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7180,
  517,
  '83489',
  '83489',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7181,
  518,
  '83119',
  '83119',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7182,
  518,
  '83132',
  '83132',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7183,
  518,
  '83219',
  '83224',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7184,
  518,
  '83234',
  '83246',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7185,
  518,
  '83250',
  '83250',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7186,
  518,
  '83259',
  '83308',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7187,
  518,
  '83313',
  '83313',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7188,
  518,
  '83317',
  '83324',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7189,
  518,
  '83329',
  '83346',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7190,
  518,
  '83347',
  '83362',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7191,
  518,
  '83365',
  '83379',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7192,
  518,
  '83411',
  '83413',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7193,
  518,
  '83417',
  '83417',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7194,
  518,
  '84549',
  '84549',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7195,
  518,
  '84525',
  '84529',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7196,
  519,
  '82411',
  '82499',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7197,
  520,
  '82110',
  '82110',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7198,
  520,
  '82140',
  '82140',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7199,
  520,
  '82178',
  '82178',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7200,
  520,
  '82194',
  '82194',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7201,
  520,
  '82216',
  '82216',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7202,
  520,
  '82223',
  '82223',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7203,
  520,
  '82239',
  '82239',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7204,
  520,
  '82256',
  '82256',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7205,
  520,
  '82273',
  '82278',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7206,
  520,
  '82231',
  '82231',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7207,
  520,
  '82284',
  '82296',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7208,
  520,
  '82299',
  '82299',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7209,
  521,
  '82362',
  '82409',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7210,
  521,
  '82436',
  '82436',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7211,
  521,
  '86951',
  '86971',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7212,
  521,
  '86975',
  '86989',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7213,
  522,
  '81539',
  '81539',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7214,
  522,
  '81541',
  '81541',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7215,
  522,
  '81543',
  '81543',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7216,
  522,
  '81545',
  '81545',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7217,
  522,
  '81547',
  '81547',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7218,
  522,
  '81549',
  '81549',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7219,
  522,
  '81667',
  '81667',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7220,
  522,
  '81669',
  '81669',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7221,
  522,
  '81671',
  '81671',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7222,
  522,
  '81673',
  '81673',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7223,
  522,
  '81675',
  '81675',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7224,
  522,
  '81677',
  '81677',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7225,
  522,
  '81679',
  '81679',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7226,
  522,
  '81735',
  '81735',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7227,
  522,
  '81737',
  '81737',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7228,
  522,
  '81739',
  '81739',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7229,
  522,
  '81825',
  '81825',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7230,
  522,
  '81827',
  '81827',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7231,
  522,
  '81829',
  '81829',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7232,
  522,
  '81925',
  '81925',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7233,
  522,
  '81927',
  '81927',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7234,
  522,
  '81929',
  '81929',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7235,
  523,
  '85609',
  '85609',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7236,
  523,
  '85653',
  '85653',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7237,
  523,
  '82065',
  '82065',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7238,
  523,
  '85649',
  '85649',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7239,
  523,
  '85622',
  '85622',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7240,
  523,
  '85748',
  '85748',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7241,
  523,
  '82166',
  '82166',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7242,
  523,
  '85630',
  '85630',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7243,
  523,
  '82031',
  '82031',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7244,
  523,
  '85540',
  '85540',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7245,
  523,
  '85635',
  '85635',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7246,
  523,
  '85662',
  '85662',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7247,
  523,
  '85737',
  '85737',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7248,
  523,
  '85551',
  '85551',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7249,
  523,
  '85579',
  '85579',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7250,
  523,
  '82061',
  '82061',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7251,
  523,
  '82041',
  '82041',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7252,
  523,
  '85764',
  '85764',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7253,
  523,
  '85521',
  '85521',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7254,
  523,
  '82152',
  '82152',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7255,
  523,
  '82049',
  '82049',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7256,
  523,
  '85640',
  '85640',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7257,
  523,
  '82054',
  '82054',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7258,
  523,
  '82069',
  '82069',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7259,
  523,
  '82064',
  '82064',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7260,
  523,
  '82024',
  '82024',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7261,
  523,
  '85774',
  '85774',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7262,
  523,
  '82008',
  '82008',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7263,
  523,
  '85716',
  '85716',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7264,
  524,
  '80804',
  '80804',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7265,
  524,
  '80805',
  '80805',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7266,
  524,
  '80807',
  '80807',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7267,
  524,
  '80809',
  '80809',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7268,
  524,
  '80933',
  '80933',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7269,
  524,
  '80935',
  '80935',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7270,
  524,
  '80939',
  '80939',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7271,
  524,
  '80993',
  '80993',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7272,
  524,
  '80995',
  '80995',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7273,
  524,
  '81379',
  '81379',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7274,
  524,
  '81475',
  '81475',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7275,
  524,
  '81476',
  '81476',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7276,
  524,
  '81477',
  '81477',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7277,
  524,
  '81479',
  '81479',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7278,
  525,
  '79272',
  '79274',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7279,
  525,
  '79811',
  '79822',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7280,
  525,
  '79839',
  '79843',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7281,
  525,
  '79849',
  '79859',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7282,
  525,
  '79866',
  '79871',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7283,
  525,
  '79874',
  '79874',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7284,
  525,
  '79877',
  '79877',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7285,
  526,
  '79190',
  '79206',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7286,
  526,
  '79220',
  '79241',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7287,
  526,
  '79245',
  '79256',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7288,
  526,
  '79264',
  '79271',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7289,
  526,
  '79280',
  '79280',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7290,
  526,
  '79283',
  '79288',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7291,
  526,
  '79291',
  '79294',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7292,
  526,
  '79299',
  '79299',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7293,
  526,
  '79354',
  '79356',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7294,
  527,
  '77705',
  '77716',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7295,
  527,
  '77732',
  '77736',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7296,
  527,
  '77750',
  '77756',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7297,
  527,
  '77778',
  '77790',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7298,
  527,
  '77793',
  '77793',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7299,
  527,
  '77796',
  '77796',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7300,
  527,
  '78127',
  '78132',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7301,
  528,
  '67355',
  '67368',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7302,
  528,
  '67378',
  '67378',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7303,
  528,
  '76711',
  '76779',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7304,
  528,
  '76866',
  '76872',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7305,
  528,
  '76879',
  '76879',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7306,
  529,
  '76873',
  '76889',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7307,
  529,
  '76801',
  '76835',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7308,
  529,
  '76849',
  '76865',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7309,
  529,
  '67401',
  '67435',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7310,
  529,
  '67476',
  '67489',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7311,
  530,
  '71301',
  '71554',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7312,
  530,
  '71560',
  '71560',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7313,
  530,
  '71564',
  '71559',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7314,
  530,
  '71711',
  '71711',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7315,
  530,
  '71736',
  '71737',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7316,
  530,
  '73551',
  '73553',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7317,
  530,
  '73601',
  '73635',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7318,
  530,
  '73642',
  '73650',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7319,
  530,
  '73655',
  '73663',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7320,
  530,
  '73667',
  '73667',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7321,
  531,
  '68783',
  '68789',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7322,
  531,
  '69152',
  '69181',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7323,
  531,
  '69199',
  '69207',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7324,
  531,
  '69222',
  '69234',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7325,
  531,
  '69240',
  '69242',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'
), (
  7326,
  531,
  '69254',
  '69254',
  '2019-08-22 13:26:44',
  '2019-08-22 13:26:44'