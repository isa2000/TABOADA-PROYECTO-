--TABLA DISE�ADOR
create table dise�ador (
iddise�ador int primary key not null,
idautoria int not null,
nombredise�ador varchar (20) not null,
apellidodise�ador varchar (20) not null,
correo varchar (20) not null);
drop table dise�ador

--TABLA EDITOR
create table editor (
ideditor int primary key not null,
nombreeditor varchar(20) not null,
apellidoeditor varchar (20) not null,
correoeditor varchar (20) not null);

--TABLA PORTADA     DISE�ADOR
create table portada(
idportada int primary key not null,
iddise�ador int not null,
titulo varchar (20) not null,
nombreautor varchar (20) not null,	
nombreeditorial varchar (20) not null); 
     
drop table portada
--TABLA EDICION   EDITOR 
create table edicion(
idedicion int primary key  not null,
ideditor int not null,
idcontenidoliterario int not null,
tama�otexto int not null,
paginas int not null,
tipoletra varchar (20) not null,  
);
drop table edicion

--TABLA AUTORIA
create table AUTORIA(
idautoria int primary key not null,
nombreautor varchar(20) not null,
nacionalidad varchar(20) not null,
edad int not null,
profesi�n varchar (20) not null,
genero varchar (20) not null,
);

--TABLA CONTENIDO
Create table contenidoliterario(
idcontenidoliterario int primary key not null,
idautoria int not null,
idportada int not null,
genero varchar (20) not null);
drop table contenidoliterario
--INGRESAR DISE�ADORES
INSERT INTO dise�ador(iddise�ador,nombredise�ador, apellidodise�ador, correo)
VALUES 
('1','Garzon','Garcia','garzon@gmail.com'),
('2','Fatima','Bravo','fatima@gmail.com'),
('3','Jaime','Naranjo','jaime@gmail.com'),
('4','Pamela','Cruz','pamela@gmail.com');

--INGRESAR EDITORES
INSERT INTO editor(ideditor,nombreeditor, apellidoeditor, correoeditor)
VALUES 
('10','	Ruben','Taboada','taboada@gmail.com'),
('11','Patricia','Delgado','patricia@gmail.com'),
('12','Kimberly','Bravo','kimbi@gmail.com'),
('13','Sofia','Pineda','sofi@gmail.com');

--INGRESAR AUTORES
INSERT INTO AUTORIA(idautoria,nombreautor, nacionalidad, edad, profesi�n, genero)
VALUES 
('100','Rocio De la Rosa','Ecuatoriana', '60','Ingeniero','Social'),
('101','Ruben Dario','Chileno','45','Abogado','Politico'),
('102','Rodolfo Riofrio','Peruano','55', 'Licenciado','Cultural'),
('103','Irene Santillan','Espa�ol','70','Escritor','Economico');

--INGRESAR CONTENIDO LITERARIO
INSERT INTO contenidoliterario(idcontenidoliterario,idautoria,idportada,genero)
VALUES 
('1000','100','10000','Social'),
('1001','101','10002','Politico'),
('1002','102','10003','Cultural'),
('1003','103','10004','Economico');
select *from portada
--INGRESAR PORTADA
INSERT INTO portada(idportada,iddise�ador,titulo,nombreautor,nombreeditorial)
VALUES 
('10000','1','NI�EZ Y JUVENTUD','Rocio De la Rosa','santillana'),
('10002','2','MANIFESTACIONES','Ruben Dario','aguilar'),
('10003','3','CULTURA GENERAL','Rodolfo Riofrio','alba'),
('10004','4','LA BANCA','Irene Santillan','alba');

--INGRESAR EDICION
INSERT INTO edicion(idedicion,ideditor,idcontenidoliterario,tama�otexto,paginas,tipoletra)
VALUES 
('100000','10','1000','12','119','Calibri'),
('100002','11','1001','11','150','Calibri'),
('100003','12','1002','12','200','Time new Roman'),
('100004','13','1003','12','85','Time new Roman');

ALTER TABLE portada
ADD FOREIGN KEY (iddise�ador)
REFERENCES dise�ador

ALTER TABLE edicion
ADD FOREIGN KEY (ideditor)
REFERENCES editor

ALTER TABLE contenidoliterario
ADD FOREIGN KEY (idautoria)
REFERENCES AUTORIA

ALTER TABLE contenidoliterario
ADD FOREIGN KEY (idportada)
REFERENCES portada

ALTER TABLE edicion
ADD FOREIGN KEY (idcontenidoliterario)
REFERENCES contenidoliterario

select*from edicion
select *from editor

SELECT 
edicion.tama�otexto AS Tama�o_Texto,
edicion.paginas AS Pagina,
edicion.tipoletra AS Tipo_Letra,
editor.nombreeditor AS Nombre,
editor.apellidoeditor AS Apellido,
editor.correoeditor AS Correo
FROM edicion INNER JOIN editor ON edicion.ideditor = editor.ideditor

WHERE edicion.tipoletra = 'Calibri';

select *from contenidoliterario
select *from AUTORIA
select *from portada

SELECT 
contenidoliterario.genero AS GENERO,
AUTORIA.nombreautor AS AUTOR,
AUTORIA.nacionalidad AS NACIONALIDAD,
AUTORIA.edad AS EDAD,
AUTORIA.profesi�n AS PROFESION,
portada.titulo AS TITULO,
portada.nombreautor AS AUTOR,
portada.nombreeditorial AS EDITORIAL
FROM contenidoliterario 
INNER JOIN AUTORIA ON contenidoliterario.idautoria = AUTORIA.idautoria
INNER JOIN portada ON contenidoliterario.idportada = portada.idportada

select* from portada
SELECT 
dise�ador.nombredise�ador AS NOMBRE_DISE�ADOR,
dise�ador.apellidodise�ador AS APELLIDO,
dise�ador.correo AS CORREO,
portada.idportada AS ID,
portada.titulo,
portada.nombreautor AUTOR,
portada.nombreeditorial AS EDITORIAL
FROM portada
INNER JOIN dise�ador ON portada.iddise�ador = dise�ador.iddise�ador
UPDATE portada set nombreeditorial = 'santillana'


SELECT 
edicion.tama�otexto AS Tama�o_Texto,
edicion.paginas AS Pagina,
edicion.tipoletra AS Tipo_Letra,
editor.nombreeditor AS Nombre,
editor.apellidoeditor AS Apellido,
editor.correoeditor AS Correo
FROM edicion 
INNER JOIN editor ON edicion.ideditor = editor.ideditor
DELETE  edicion 
WHERE tama�otexto=10

select *from editor
ORDER BY apellidoeditor DESC

