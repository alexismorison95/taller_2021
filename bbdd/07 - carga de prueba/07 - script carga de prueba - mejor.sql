-- CARGAR POR PARTES!!!!

-- TIPO USUARIO

-- INSERT INTO TipoUsuario(TipoUsuario) VALUES ('administrador');
-- INSERT INTO TipoUsuario(TipoUsuario) VALUES ('administrativo');
-- INSERT INTO TipoUsuario(TipoUsuario) VALUES ('examinador');


-- USUARIO

-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Admin', 'admin', 'demo', 1);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Ax Strike', 'astrike0', '1EXxUA', 2);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Luca Dudmarsh', 'ldudmarsh1', 'j8KxJuxV', 2);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Tiffy Eddison', 'teddison2', '7udXIQ', 2);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Hobie Bourcq', 'hbourcq3', 'gIhrtgicfP', 2);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Marc Heinig', 'mheinig4', 'cbkqRmhdI', 3);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Jodee Jacquemet', 'jjacquemet5', 'YVw4oqROTbLC', 3);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Em Duddell', 'eduddell6', '7nTN3ZOukQ', 3);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Corinna Lewcock', 'clewcock7', 'k236Gj', 3);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Fairlie Prinnett', 'fprinnett8', 'rz29F65vzY', 3);
-- insert into usuario (nombrereal, nombreusuario, contrasenia, idtipousuario) values ('Hale Fehner', 'hfehner9', 'E7Kgak', 3);

insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Admin', 'admin', 'demo', 'administrador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Ax Strike', 'astrike0', '1EXxUA', 'administrativo');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Luca Dudmarsh', 'ldudmarsh1', 'j8KxJuxV', 'administrativo');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Tiffy Eddison', 'teddison2', '7udXIQ', 'administrativo');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Hobie Bourcq', 'hbourcq3', 'gIhrtgicfP', 'administrativo');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Marc Heinig', 'mheinig4', 'cbkqRmhdI', 'examinador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Jodee Jacquemet', 'jjacquemet5', 'YVw4oqROTbLC', 'examinador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Em Duddell', 'eduddell6', '7nTN3ZOukQ', 'examinador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Corinna Lewcock', 'clewcock7', 'k236Gj', 'examinador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Fairlie Prinnett', 'fprinnett8', 'rz29F65vzY', 'examinador');
insert into usuario (nombrereal, nombreusuario, contrasenia, tipousuario) values ('Hale Fehner', 'hfehner9', 'E7Kgak', 'examinador');

-- CONDUCTOR

insert into conductor (DNI, nombre, apellido) values ('130513342', 'Enoch', 'Huett');
insert into conductor (DNI, nombre, apellido) values ('294702954', 'Arturo', 'Eytel');
insert into conductor (DNI, nombre, apellido) values ('691169869', 'Imogen', 'Skae');
insert into conductor (DNI, nombre, apellido) values ('708609076', 'Zed', 'Lukasik');
insert into conductor (DNI, nombre, apellido) values ('760765346', 'Gretchen', 'Dyett');
insert into conductor (DNI, nombre, apellido) values ('596030150', 'Ashlan', 'Cowterd');
insert into conductor (DNI, nombre, apellido) values ('072720027', 'Rudie', 'Mottershead');
insert into conductor (DNI, nombre, apellido) values ('904028181', 'Sella', 'Rogier');
insert into conductor (DNI, nombre, apellido) values ('660772569', 'Pierce', 'Rosbotham');
insert into conductor (DNI, nombre, apellido) values ('877330738', 'Carolyne', 'Leighton');
insert into conductor (DNI, nombre, apellido) values ('007237133', 'Tracy', 'Egentan');
insert into conductor (DNI, nombre, apellido) values ('642623990', 'Alwin', 'Gresley');
insert into conductor (DNI, nombre, apellido) values ('083517604', 'Kalle', 'Ledward');
insert into conductor (DNI, nombre, apellido) values ('628021431', 'Zerk', 'Hallyburton');
insert into conductor (DNI, nombre, apellido) values ('867902100', 'Ruby', 'Jurasek');
insert into conductor (DNI, nombre, apellido) values ('256675273', 'Emera', 'Orvis');
insert into conductor (DNI, nombre, apellido) values ('174323737', 'Shellie', 'Matuska');
insert into conductor (DNI, nombre, apellido) values ('746571460', 'Claudette', 'Musla');
insert into conductor (DNI, nombre, apellido) values ('751071056', 'Janos', 'Dutnell');
insert into conductor (DNI, nombre, apellido) values ('561575384', 'Galen', 'Baniard');
insert into conductor (DNI, nombre, apellido) values ('246338662', 'Moselle', 'Cherry Holme');
insert into conductor (DNI, nombre, apellido) values ('496424910', 'Raddy', 'Sheriff');
insert into conductor (DNI, nombre, apellido) values ('177471025', 'Barbra', 'Samsworth');
insert into conductor (DNI, nombre, apellido) values ('742990096', 'Lidia', 'Halford');
insert into conductor (DNI, nombre, apellido) values ('593401612', 'Beale', 'de Broke');
insert into conductor (DNI, nombre, apellido) values ('824181785', 'Thaxter', 'Rois');
insert into conductor (DNI, nombre, apellido) values ('533359548', 'Marylynne', 'Ineson');
insert into conductor (DNI, nombre, apellido) values ('121840385', 'Whittaker', 'Gooder');
insert into conductor (DNI, nombre, apellido) values ('186255585', 'Audrie', 'Boltwood');
insert into conductor (DNI, nombre, apellido) values ('354505811', 'Sheena', 'Swinburne');
insert into conductor (DNI, nombre, apellido) values ('884042793', 'Viola', 'Yashanov');
insert into conductor (DNI, nombre, apellido) values ('215002486', 'Traci', 'Bladder');
insert into conductor (DNI, nombre, apellido) values ('394687949', 'Mariquilla', 'Mussetti');
insert into conductor (DNI, nombre, apellido) values ('136981363', 'Hephzibah', 'Fuidge');
insert into conductor (DNI, nombre, apellido) values ('958427658', 'Carlie', 'Petett');
insert into conductor (DNI, nombre, apellido) values ('112979442', 'Kevina', 'Bullingham');
insert into conductor (DNI, nombre, apellido) values ('745051370', 'Anson', 'Clemett');
insert into conductor (DNI, nombre, apellido) values ('024933524', 'Yehudit', 'Hunnywell');
insert into conductor (DNI, nombre, apellido) values ('597940065', 'Suzanne', 'Strafford');
insert into conductor (DNI, nombre, apellido) values ('423865141', 'Simona', 'Le Merchant');
insert into conductor (DNI, nombre, apellido) values ('262387098', 'York', 'Brocks');
insert into conductor (DNI, nombre, apellido) values ('276316814', 'Rutherford', 'Iceton');
insert into conductor (DNI, nombre, apellido) values ('984280744', 'Den', 'Ilyin');
insert into conductor (DNI, nombre, apellido) values ('453222645', 'Phillie', 'Rittelmeyer');
insert into conductor (DNI, nombre, apellido) values ('032381398', 'Jessalin', 'Hardstaff');
insert into conductor (DNI, nombre, apellido) values ('195561049', 'Hermina', 'Albrighton');
insert into conductor (DNI, nombre, apellido) values ('578194868', 'Nehemiah', 'Hart');
insert into conductor (DNI, nombre, apellido) values ('846448201', 'Hashim', 'Spenceley');
insert into conductor (DNI, nombre, apellido) values ('108123897', 'Elane', 'Bastard');
insert into conductor (DNI, nombre, apellido) values ('945375052', 'Claudio', 'Ingrem');
insert into conductor (DNI, nombre, apellido) values ('174150174', 'Kip', 'Dwelly');
insert into conductor (DNI, nombre, apellido) values ('930030252', 'Vernon', 'Biasioni');
insert into conductor (DNI, nombre, apellido) values ('016531300', 'Thatcher', 'Preskett');
insert into conductor (DNI, nombre, apellido) values ('046441785', 'Mick', 'Eltone');
insert into conductor (DNI, nombre, apellido) values ('755158499', 'Dita', 'Roxburch');
insert into conductor (DNI, nombre, apellido) values ('313289573', 'Bondon', 'MacLure');
insert into conductor (DNI, nombre, apellido) values ('688256412', 'Devora', 'Stiffell');
insert into conductor (DNI, nombre, apellido) values ('735971164', 'Harwilll', 'Barabisch');
insert into conductor (DNI, nombre, apellido) values ('989759509', 'Atalanta', 'Riseam');
insert into conductor (DNI, nombre, apellido) values ('443041933', 'Ezmeralda', 'Jahnel');
insert into conductor (DNI, nombre, apellido) values ('479891425', 'Killie', 'Fenty');
insert into conductor (DNI, nombre, apellido) values ('661270320', 'Jessey', 'Pattemore');
insert into conductor (DNI, nombre, apellido) values ('476103709', 'Quillan', 'Lamps');
insert into conductor (DNI, nombre, apellido) values ('528907472', 'Glenine', 'Ternault');
insert into conductor (DNI, nombre, apellido) values ('035529797', 'Brewster', 'Doll');
insert into conductor (DNI, nombre, apellido) values ('366187526', 'Sheila', 'Ramelet');
insert into conductor (DNI, nombre, apellido) values ('977671941', 'Cami', 'Fishpool');
insert into conductor (DNI, nombre, apellido) values ('740595658', 'Cobby', 'Silbermann');
insert into conductor (DNI, nombre, apellido) values ('121268711', 'Hetty', 'Parfett');
insert into conductor (DNI, nombre, apellido) values ('288023595', 'Freeland', 'Ruppele');
insert into conductor (DNI, nombre, apellido) values ('199034021', 'Maggee', 'Hurlestone');
insert into conductor (DNI, nombre, apellido) values ('958790985', 'Gardy', 'Holtham');
insert into conductor (DNI, nombre, apellido) values ('352723212', 'Dacey', 'Coupar');
insert into conductor (DNI, nombre, apellido) values ('627161182', 'Shamus', 'Gold');
insert into conductor (DNI, nombre, apellido) values ('647660242', 'Paulina', 'Pestridge');
insert into conductor (DNI, nombre, apellido) values ('451340390', 'Marchelle', 'Gilleon');
insert into conductor (DNI, nombre, apellido) values ('712873956', 'Shandra', 'Flanders');
insert into conductor (DNI, nombre, apellido) values ('190653161', 'Garnet', 'Salliere');
insert into conductor (DNI, nombre, apellido) values ('545732772', 'Barth', 'Wylam');
insert into conductor (DNI, nombre, apellido) values ('351035659', 'Moritz', 'Lakin');
insert into conductor (DNI, nombre, apellido) values ('422139499', 'Toiboid', 'Fuzzard');
insert into conductor (DNI, nombre, apellido) values ('002475635', 'Aeriela', 'Lay');
insert into conductor (DNI, nombre, apellido) values ('338803092', 'Cate', 'Tooze');
insert into conductor (DNI, nombre, apellido) values ('259693358', 'Koenraad', 'Kibbey');
insert into conductor (DNI, nombre, apellido) values ('225414197', 'Ham', 'Cossins');
insert into conductor (DNI, nombre, apellido) values ('902440510', 'Timmie', 'Goodwins');
insert into conductor (DNI, nombre, apellido) values ('327038113', 'Esme', 'Bingall');
insert into conductor (DNI, nombre, apellido) values ('315410267', 'Bruis', 'Gilsthorpe');
insert into conductor (DNI, nombre, apellido) values ('186533510', 'Loren', 'Rosenthaler');
insert into conductor (DNI, nombre, apellido) values ('384128261', 'Dorothea', 'Siveter');
insert into conductor (DNI, nombre, apellido) values ('602813242', 'Batsheva', 'Cridlan');
insert into conductor (DNI, nombre, apellido) values ('961944488', 'Eileen', 'Itzkovwitch');
insert into conductor (DNI, nombre, apellido) values ('701175825', 'Iago', 'Cristoforo');
insert into conductor (DNI, nombre, apellido) values ('287317003', 'Flory', 'Guppy');
insert into conductor (DNI, nombre, apellido) values ('263944794', 'Clarence', 'Braniff');
insert into conductor (DNI, nombre, apellido) values ('150783637', 'Rooney', 'Sayward');
insert into conductor (DNI, nombre, apellido) values ('688037535', 'Cecil', 'Phifer');
insert into conductor (DNI, nombre, apellido) values ('518962190', 'Rolland', 'Robottom');
insert into conductor (DNI, nombre, apellido) values ('643241738', 'Kat', 'Boles');
insert into conductor (DNI, nombre, apellido) values ('122176850', 'Dionne', 'Preshous');


-- DOMINIO

insert into dominio (patente, descripcion) values ('WBAKG1C58DJ362995', 'Mercedes-Benz GLK-Class 2010 Mauv');
insert into dominio (patente, descripcion) values ('WAUUL78E87A597689', 'Jeep Compass 2010 Aquamarine');
insert into dominio (patente, descripcion) values ('3GYFNDE3XCS841790', 'Honda Rpatentegeline 2010 Crimson');
insert into dominio (patente, descripcion) values ('1GD12YEG7FF255314', 'Plymouth Neon 1998 Teal');
insert into dominio (patente, descripcion) values ('5YMGY0C55BL776924', 'Aston Martin Rappatentee 2012 Yellow');
insert into dominio (patente, descripcion) values ('JN8AF5MR4FT811577', 'Pontiac Vibe 2003 Aquamarine');
insert into dominio (patente, descripcion) values ('WAUFFAFC8DN761865', 'Honda Element 2003 Purple');
insert into dominio (patente, descripcion) values ('1N6AD0CU9FN913856', 'Ford E250 2006 Fuscia');
insert into dominio (patente, descripcion) values ('1G4GA5GR1DF365623', 'Suzuki Aerio 2006 Green');
insert into dominio (patente, descripcion) values ('4JGCB2FE9AA432602', 'Chevrolet Traverse 2009 Khaki');
insert into dominio (patente, descripcion) values ('5TDBW5G11FS056022', 'Mercedes-Benz 500SEL 1993 Mauv');
insert into dominio (patente, descripcion) values ('1HGCP2F31BA033061', 'Mazda MX-6 1992 Indigo');
insert into dominio (patente, descripcion) values ('1G6DP57V990778194', 'Dodge Caravan 2010 Mauv');
insert into dominio (patente, descripcion) values ('JTDKTUD3XED331552', 'Honda CR-V 2011 Red');
insert into dominio (patente, descripcion) values ('1NXBU4EE0AZ728996', 'Honda Insight 2012 Violet');
insert into dominio (patente, descripcion) values ('WBALM7C50EJ481786', 'Honda Pilot 2004 Goldenrod');
insert into dominio (patente, descripcion) values ('WAUSF78E86A955810', 'Nissan 350Z 2006 Blue');
insert into dominio (patente, descripcion) values ('WA1WKAFP7BA756222', 'Mitsubishi Challenger 2000 Goldenrod');
insert into dominio (patente, descripcion) values ('JH4CU4F43BC700470', 'Jaguar S-Type 2004 Blue');
insert into dominio (patente, descripcion) values ('WVGAK7A98AD752684', 'Ford E250 2003 Fuscia');
insert into dominio (patente, descripcion) values ('5UXFG83569L636220', 'Ford Festiva 1988 Violet');
insert into dominio (patente, descripcion) values ('JTHBE1D25E5380442', 'Ford Mustang 1991 Orange');
insert into dominio (patente, descripcion) values ('5GTMNGEE2A8807003', 'Chevrolet Monte Carlo 2005 Violet');
insert into dominio (patente, descripcion) values ('WA1DMAFP4EA694431', 'Mercury Cougar 1996 Teal');
insert into dominio (patente, descripcion) values ('2FMGK5BC6BB921520', 'Lexus LS 1994 Turquoise');
insert into dominio (patente, descripcion) values ('WAUSF98E08A618367', 'Mazda Mazda6 2007 Khaki');
insert into dominio (patente, descripcion) values ('5FRYD4H95GB896243', 'Scion tC 2007 Green');
insert into dominio (patente, descripcion) values ('WAUKFAFL2DN755509', 'Toyota Highlander 2007 Green');
insert into dominio (patente, descripcion) values ('JH4CU2F62BC972398', 'Mazda MPV 1993 Crimson');
insert into dominio (patente, descripcion) values ('1FTMF1E82AF941658', 'Mitsubishi Galant 1993 Pink');
insert into dominio (patente, descripcion) values ('3VW1K7AJ2DM396091', 'Ford Probe 1991 Green');
insert into dominio (patente, descripcion) values ('JTDJTUD37ED994296', 'Infiniti J 1995 Puce');
insert into dominio (patente, descripcion) values ('WP0AA2A91AS695721', 'Honda Prelude 1999 Mauv');
insert into dominio (patente, descripcion) values ('1FADP5AU9FL039128', 'Buick Century 2002 Yellow');
insert into dominio (patente, descripcion) values ('JHMZF1C69CS136579', 'Maybach 62 2004 Puce');
insert into dominio (patente, descripcion) values ('YV4852CT4B1073730', 'Buick LeSabre 2003 Aquamarine');
insert into dominio (patente, descripcion) values ('WAUSGCFC2CN565877', 'Mercedes-Benz E-Class 2004 Purple');
insert into dominio (patente, descripcion) values ('KNAFX6A83F5565302', 'Subaru Brat 1985 Orange');
insert into dominio (patente, descripcion) values ('JN8AS5MT6BW380644', 'Maserati 430 1990 Crimson');
insert into dominio (patente, descripcion) values ('1N6AA0CA7CN577568', 'Ferrari 458 Italia 2012 Orange');
insert into dominio (patente, descripcion) values ('1G6DH5E52D0497945', 'Mazda MPV 1998 Violet');
insert into dominio (patente, descripcion) values ('3VW4A7AT3DM018914', 'Ford F250 1984 Red');
insert into dominio (patente, descripcion) values ('WBAHN03518D429161', 'Toyota Echo 2001 Crimson');
insert into dominio (patente, descripcion) values ('3C6LD4BT2CG162607', 'Lamborghini Gallardo 2005 Green');
insert into dominio (patente, descripcion) values ('5FRYD3H82FB671133', 'Land Rover Discovery 2012 Turquoise');
insert into dominio (patente, descripcion) values ('3C3CFFCR4FT846818', 'Mercedes-Benz SL-Class 2008 Mauv');
insert into dominio (patente, descripcion) values ('JTJYWRBZ1F2641833', 'Jaguar XJ Series 1993 Blue');
insert into dominio (patente, descripcion) values ('WDDEJ7HBXAA398658', 'Chevrolet Astro 2005 Violet');
insert into dominio (patente, descripcion) values ('WBAYF8C53FD405713', 'Chevrolet Tahoe 2009 Orange');
insert into dominio (patente, descripcion) values ('SALAB2D42DA779739', 'BMW 745 2004 Violet');
insert into dominio (patente, descripcion) values ('WAUHE78P38A894190', 'GMC Savana 1500 1996 Purple');
insert into dominio (patente, descripcion) values ('1G6AB5RA0D0060523', 'Ford Galaxie 1966 Orange');
insert into dominio (patente, descripcion) values ('1C4SDJCT4CC694865', 'Bentley Arnage 2008 Aquamarine');
insert into dominio (patente, descripcion) values ('WA1VMAFE6CD167411', 'Subaru Outback 2004 Fuscia');
insert into dominio (patente, descripcion) values ('KMHTC6AD6FU540586', 'Kia Sephia 1997 Teal');
insert into dominio (patente, descripcion) values ('WBAKG1C55DJ024356', 'Subaru Loyale 1993 Red');
insert into dominio (patente, descripcion) values ('JTHSE5BC2F5877128', 'Ram 3500 2012 Aquamarine');
insert into dominio (patente, descripcion) values ('WDDHF2EBXCA944836', 'Ford Explorer 2000 Yellow');
insert into dominio (patente, descripcion) values ('1FTEW1CM8EK301665', 'Chevrolet Express 3500 2006 Orange');
insert into dominio (patente, descripcion) values ('5N1AZ2MH3FN575173', 'Lexus GX 2010 Violet');
insert into dominio (patente, descripcion) values ('WAUAFAFL0DN825343', 'Honda CR-V 1997 Blue');
insert into dominio (patente, descripcion) values ('WA1LGAFE7ED753391', 'Mazda Mazda2 2011 Orange');
insert into dominio (patente, descripcion) values ('3D7TT2CT4AG274990', 'Toyota Supra 1995 Teal');
insert into dominio (patente, descripcion) values ('3C6TD4KT5CG808612', 'Infiniti M 1992 Turquoise');
insert into dominio (patente, descripcion) values ('WP0AA2A91DS328905', 'Lamborghini Gallardo 2006 Purple');
insert into dominio (patente, descripcion) values ('3VWML7AJ1EM773263', 'GMC Savana 2500 2009 Orange');
insert into dominio (patente, descripcion) values ('WAULD64B03N699201', 'Mitsubishi Montero Sport 1999 Mauv');
insert into dominio (patente, descripcion) values ('WAUBGAFB9BN248351', 'Mercedes-Benz CL-Class 2001 Orange');
insert into dominio (patente, descripcion) values ('WBAEN33455E913237', 'Mitsubishi Mighty Max 1995 Purple');
insert into dominio (patente, descripcion) values ('WBA6A0C58DD673578', 'Cadillac Escalade EXT 2007 Goldenrod');
insert into dominio (patente, descripcion) values ('1GYS4EEJ4DR958579', 'Ford Bronco 1986 Green');
insert into dominio (patente, descripcion) values ('JHMZE2H37DS653551', 'Buick LeSabre 2000 Indigo');
insert into dominio (patente, descripcion) values ('JN8AZ1MU8EW845880', 'Oldsmobile Bravada 1994 Turquoise');
insert into dominio (patente, descripcion) values ('WAUDF98E48A231023', 'Ford Aerostar 1994 Mauv');
insert into dominio (patente, descripcion) values ('SCFFDABEXAG683428', 'BMW Z3 2002 Aquamarine');
insert into dominio (patente, descripcion) values ('2HNYD18235H232804', 'Volkswagen Fox 1992 Red');
insert into dominio (patente, descripcion) values ('SCBDR3ZA5AC329090', 'Mitsubishi Eclipse 1995 Pink');
insert into dominio (patente, descripcion) values ('2FMDK3AC8AB940688', 'Toyota Camry 2011 Turquoise');
insert into dominio (patente, descripcion) values ('1GD02ZCG7DF799264', 'Ford Explorer 2011 Goldenrod');
insert into dominio (patente, descripcion) values ('JTDZN3EU9FJ131940', 'Cadillac Escalade 2006 Khaki');
insert into dominio (patente, descripcion) values ('1FMHK7B8XBG954704', 'Mitsubishi Mirage 1990 Purple');
insert into dominio (patente, descripcion) values ('YV4952CZ8E1622486', 'Mercedes-Benz CLK-Class 2005 Khaki');
insert into dominio (patente, descripcion) values ('WAULT58E75A014686', 'Lexus RX 2003 Orange');
insert into dominio (patente, descripcion) values ('WAUFEAFM5BA724286', 'Volvo S40 2000 Violet');
insert into dominio (patente, descripcion) values ('1D7RV1GT1BS197465', 'Mitsubishi Montero 2004 Turquoise');
insert into dominio (patente, descripcion) values ('JM3TB2CA0E0525503', 'Chevrolet Cobalt 2009 Mauv');
insert into dominio (patente, descripcion) values ('WBADN63403G220462', 'Dodge Ram 2500 Club 1998 Goldenrod');
insert into dominio (patente, descripcion) values ('19UUA66294A059866', 'Dodge Caravan 1998 Orange');
insert into dominio (patente, descripcion) values ('1G6DJ5EY0B0791694', 'Mercedes-Benz GL-Class 2011 Violet');
insert into dominio (patente, descripcion) values ('1FMJK1J5XAE261373', 'Cadillac DeVille 1999 Violet');
insert into dominio (patente, descripcion) values ('WAULT68E42A051017', 'Cadillac STS 2005 Mauv');
insert into dominio (patente, descripcion) values ('1GKS2GEJ2BR910880', 'Ford F150 1984 Khaki');
insert into dominio (patente, descripcion) values ('5XXGM4A77DG062232', 'Lincoln Town Car 1988 Aquamarine');
insert into dominio (patente, descripcion) values ('2HNYD28537H570464', 'Ford Econoline E350 1997 Orange');
insert into dominio (patente, descripcion) values ('2G4GR5GX9F9169965', 'Honda Rpatentegeline 2011 Maroon');
insert into dominio (patente, descripcion) values ('1FTWX3B58AE631239', 'Saturn VUE 2007 Mauv');
insert into dominio (patente, descripcion) values ('5UXFA93574L165341', 'Lincoln Navigator 2004 Indigo');
insert into dominio (patente, descripcion) values ('JTHBK1GG9D1535838', 'Honda Prelude 1997 Green');
insert into dominio (patente, descripcion) values ('WAUDG78E25A107488', 'Ford F250 1999 Indigo');
insert into dominio (patente, descripcion) values ('KL4CJASB5EB594685', 'Mazda Miata MX-5 2012 Mauv');



-- EXAMINADOR
 
-- insert into examinador (nombrereal, activo, idusuario) values ('Marc Heinig', true, 6);
-- insert into examinador (nombrereal, activo, idusuario) values ('Jodee Jacquemet', true, 7);
-- insert into examinador (nombrereal, activo, idusuario) values ('Em Duddell', true, 8);
-- insert into examinador (nombrereal, activo, idusuario) values ('Corinna Lewcock', true, 9);
-- insert into examinador (nombrereal, activo, idusuario) values ('Fairlie Prinnett', true, 10);
-- insert into examinador (nombrereal, activo, idusuario) values ('Hale Fehner', true, 11);


-- EQUIPO

INSERT INTO Equipo(Nombre) VALUES ('ymc055');
INSERT INTO Equipo(Nombre) VALUES ('zvc344');
INSERT INTO Equipo(Nombre) VALUES ('ymc056');


-- PERIODOUTILIZABLE

INSERT INTO PeriodoUtilizable(Activo, FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) VALUES (true, '01/11/2021', '01/11/2022', 2040, 1);
INSERT INTO PeriodoUtilizable(Activo, FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) VALUES (true, '01/11/2021', '01/11/2022', 1234, 2);
INSERT INTO PeriodoUtilizable(Activo, FechaInicio, FechaVencimiento, NroIngreso, IdEquipo) VALUES (true, '01/11/2021', '01/11/2022', 4555, 3);


-- PRESTAMO

INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) VALUES ('01/12/2021', '08:00', 2040, 1, 1);
INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) VALUES ('01/12/2021', '08:00', 1234, 2, 2);
INSERT INTO Prestamo(FechaPrestamo, HoraPrestamo, NroInicial, IdExaminador, IdEquipo) VALUES ('01/12/2021', '08:00', 4555, 3, 3);


-- PRUEBA

insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('1/12/2021', '23:42', 2040, 0.0, null, null, '130513342', 'WBAKG1C58DJ362995', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('2/12/2021', '17:48', 2041, 0.0, null, null, '294702954', 'WAUUL78E87A597689', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '15:38', 2042, 0.0, null, null, '691169869', '3GYFNDE3XCS841790', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '22:01', 2043, 1.4, 9479, 8350, '708609076', '1GD12YEG7FF255314', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '23:10', 2044, 0.0, null, null, '760765346', '5YMGY0C55BL776924', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '23:16', 2045, 1.1, 9207, 2933, '596030150', 'JN8AF5MR4FT811577', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '23:24', 2046, 0.0, null, null, '072720027', 'WAUFFAFC8DN761865', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('4/12/2021', '22:42', 2047, 1.0, 3972, 5453, '904028181', '1N6AD0CU9FN913856', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('5/12/2021', '18:24', 2048, 1.3, 5533, 7388, '660772569', '1G4GA5GR1DF365623', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('5/12/2021', '20:06', 2049, 0.6, 3252, 1569, '877330738', '4JGCB2FE9AA432602', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '14:44', 2050, 0.0, null, null, '007237133', '5TDBW5G11FS056022', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '21:57', 2051, 1.7, 3150, 2891, '642623990', '1HGCP2F31BA033061', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '23:07', 2052, 0.0, null, null, '083517604', '1G6DP57V990778194', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '18:57', 2053, 0.0, null, null, '628021431', 'JTDKTUD3XED331552', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '21:07', 2054, 0.0, null, null, '867902100', '1NXBU4EE0AZ728996', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '19:43', 2055, 0.0, null, null, '256675273', 'WBALM7C50EJ481786', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '20:49', 2056, 0.8, 9170, 9268, '746571460', 'WAUSF78E86A955810', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '18:33', 2057, 0.0, null, null, '751071056', 'WA1WKAFP7BA756222', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '23:28', 2058, 0.0, null, null, '561575384', 'JH4CU4F43BC700470', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '15:14', 2059, 0.0, null, null, '246338662', 'WVGAK7A98AD752684', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '21:56', 2060, 0.3, 3592, 2056, '496424910', '5UXFG83569L636220', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '23:28', 2061, 1.3, 5310, 1288, '177471025', 'JTHBE1D25E5380442', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '13:54', 2062, 0.0, null, null, '742990096', '5GTMNGEE2A8807003', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '17:24', 2063, 0.9, 6676, 4375, '593401612', 'WA1DMAFP4EA694431', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '21:27', 2064, 0.0, null, null, '824181785', '2FMGK5BC6BB921520', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '23:33', 2065, 0.0, null, null, '533359548', 'WAUSF98E08A618367', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '20:19', 2066, 0.0, null, null, '121840385', '5FRYD4H95GB896243', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '20:23', 2067, 1.6, 3511, 3741, '186255585', 'WAUKFAFL2DN755509', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '20:25', 2068, 0.0, null, null, '354505811', 'JH4CU2F62BC972398', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '22:11', 2069, 1.7, 2652, 2536, '884042793', '1FTMF1E82AF941658', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '22:34', 2070, 0.5, 3312, 4196, '215002486', '3VW1K7AJ2DM396091', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '22:45', 2071, 0.0, null, null, '394687949', 'JTDJTUD37ED994296', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '15:33', 2072, 1.1, 3906, 9533, '136981363', 'WP0AA2A91AS695721', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '20:31', 2073, 0.6, 7013, 8685, '958427658', '1FADP5AU9FL039128', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('14/12/2021', '19:01', 2074, 0.0, null, null, '112979442', 'JHMZF1C69CS136579', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('15/12/2021', '16:23', 2075, 0.0, null, null, '745051370', 'YV4852CT4B1073730', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('16/12/2021', '13:09', 2076, 1.9, 1941, 9878, '024933524', 'WAUSGCFC2CN565877', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('17/12/2021', '22:38', 2077, 0.0, null, null, '597940065', 'KNAFX6A83F5565302', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('18/12/2021', '17:19', 2078, 1.8, 8041, 1073, '423865141', 'JN8AS5MT6BW380644', 1);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('18/12/2021', '22:33', 2079, 0.0, null, null, '130513342', '1N6AA0CA7CN577568', 1);

insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('1/12/2021', '22:14', 1234, 0.3, 9522, 2794, '262387098', '1G6DH5E52D0497945', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('2/12/2021', '15:34', 1235, 0.0, null, null, '276316814', '3VW4A7AT3DM018914', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('2/12/2021', '21:27', 1236, 0.0, null, null, '984280744', 'WBAHN03518D429161', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '15:10', 1237, 0.7, 8406, 5246, '453222645', '5FRYD3H82FB671133', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '20:50', 1238, 0.0, null, null, '032381398', '3C3CFFCR4FT846818', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('4/12/2021', '15:37', 1239, 1.6, 2825, 1301, '195561049', 'JTJYWRBZ1F2641833', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('5/12/2021', '13:45', 1240, 0.0, null, null, '578194868', 'WDDEJ7HBXAA398658', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '13:15', 1241, 0.2, 2638, 4162, '846448201', 'WBAYF8C53FD405713', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '20:38', 1242, 1.1, 6428, 1246, '108123897', 'SALAB2D42DA779739', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '15:43', 1243, 1.1, 3642, 1026, '945375052', 'WAUHE78P38A894190', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '21:58', 1244, 1.3, 7684, 1570, '174150174', '1G6AB5RA0D0060523', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '18:19', 1245, 1.5, 8398, 7753, '930030252', '1C4SDJCT4CC694865', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '20:30', 1246, 0.0, null, null, '016531300', 'WA1VMAFE6CD167411', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '18:44', 1247, 0.4, 1016, 8326, '046441785', 'KMHTC6AD6FU540586', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '22:02', 1248, 0.0, null, null, '755158499', 'WBAKG1C55DJ024356', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '18:43', 1249, 1.0, 7734, 8668, '313289573', 'JTHSE5BC2F5877128', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '13:42', 1250, 1.4, 8708, 5161, '688256412', 'WDDHF2EBXCA944836', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('11/12/2021', '18:10', 1251, 0.0, null, null, '735971164', '1FTEW1CM8EK301665', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '17:16', 1252, 0.5, 2243, 8550, '989759509', '5N1AZ2MH3FN575173', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('12/12/2021', '18:44', 1253, 0.0, null, null, '443041933', 'WAUAFAFL0DN825343', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '14:42', 1254, 0.3, 5320, 5009, '479891425', 'WA1LGAFE7ED753391', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '16:51', 1255, 1.0, 2535, 8887, '661270320', '3D7TT2CT4AG274990', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '16:58', 1256, 0.6, 1460, 7664, '476103709', '3C6TD4KT5CG808612', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '19:16', 1257, 0.0, null, null, '528907472', 'WP0AA2A91DS328905', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('13/12/2021', '23:31', 1258, 0.0, null, null, '035529797', '3VWML7AJ1EM773263', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('14/12/2021', '18:11', 1259, 1.0, 2591, 9459, '366187526', 'WAULD64B03N699201', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('14/12/2021', '19:53', 1260, 1.4, 8880, 8905, '977671941', 'WAUBGAFB9BN248351', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('15/12/2021', '17:55', 1261, 1.8, 7905, 6397, '740595658', 'WBAEN33455E913237', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('16/12/2021', '16:27', 1262, 1.5, 8443, 3460, '186533510', 'WBA6A0C58DD673578', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('17/12/2021', '13:51', 1263, 0.7, 1081, 9637, '384128261', '1GYS4EEJ4DR958579', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('17/12/2021', '21:08', 1264, 0.0, null, null, '602813242', 'JHMZE2H37DS653551', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('18/12/2021', '13:58', 1265, 0.0, null, null, '961944488', 'JN8AZ1MU8EW845880', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('18/12/2021', '18:24', 1266, 1.0, 7491, 7647, '701175825', 'WAUDF98E48A231023', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('19/12/2021', '16:23', 1267, 0.0, null, null, '287317003', 'SCFFDABEXAG683428', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('19/12/2021', '19:29', 1268, 1.9, 7508, 2237, '263944794', '2HNYD18235H232804', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('19/12/2021', '19:43', 1269, 0.0, null, null, '150783637', 'SCBDR3ZA5AC329090', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('20/12/2021', '18:26', 1270, 0.3, 2339, 2627, '688037535', '2FMDK3AC8AB940688', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('20/12/2021', '20:54', 1271, 0.7, 2374, 1524, '518962190', '1GD02ZCG7DF799264', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('21/12/2021', '17:12', 1272, 0.0, null, null, '643241738', 'JTDZN3EU9FJ131940', 2);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('22/12/2021', '15:27', 1273, 0.0, null, null, '122176850', '1FMHK7B8XBG954704', 2);

insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('1/12/2021', '17:36', 4555, 0.0, null, null, '121268711', 'YV4952CZ8E1622486', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('2/12/2021', '13:19', 4556, 0.5, 8235, 6965, '288023595', 'WAULT58E75A014686', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('2/12/2021', '19:54', 4557, 0.0, null, null, '199034021', 'WAUFEAFM5BA724286', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '14:53', 4558, 0.0, null, null, '958790985', '1D7RV1GT1BS197465', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('3/12/2021', '22:51', 4559, 0.8, 9836, 7538, '352723212', 'JM3TB2CA0E0525503', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('4/12/2021', '16:29', 4560, 0.7, 5404, 2519, '627161182', 'WBADN63403G220462', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('5/12/2021', '14:08', 4561, 0.0, null, null, '647660242', '19UUA66294A059866', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('5/12/2021', '14:33', 4562, 1.5, 5653, 3796, '451340390', '1G6DJ5EY0B0791694', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '13:11', 4563, 0.0, null, null, '712873956', '1FMJK1J5XAE261373', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '16:47', 4564, 0.0, null, null, '190653161', 'WAULT68E42A051017', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('6/12/2021', '23:17', 4565, 0.0, null, null, '545732772', '1GKS2GEJ2BR910880', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '13:14', 4566, 0.0, null, null, '351035659', '5XXGM4A77DG062232', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '18:18', 4567, 0.2, 6363, 9558, '422139499', '2HNYD28537H570464', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('7/12/2021', '22:23', 4568, 0.1, 2488, 4485, '002475635', '2G4GR5GX9F9169965', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '14:16', 4569, 1.8, 8641, 4194, '338803092', '1FTWX3B58AE631239', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('8/12/2021', '23:57', 4570, 0.1, 6314, 2693, '259693358', '5UXFA93574L165341', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '16:00', 4571, 0.0, null, null, '225414197', 'JTHBK1GG9D1535838', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('9/12/2021', '23:43', 4572, 0.6, 1641, 9931, '902440510', 'WAUDG78E25A107488', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '18:00', 4573, 0.2, 6496, 4228, '327038113', 'KL4CJASB5EB594685', 3);
insert into prueba (fecha, hora, nromuestra, resultado, nroacta, nroretencion, dniconductor, iddominio, idprestamo) values ('10/12/2021', '19:12', 4574, 0.0, null, null, '315410267', 'YV4952CZ8E1622486', 3);
