
 Create DataBase ECOMMERCE
 go
use ECOMMERCE
go
Create table CATEGORIAS(
ID int identity(1,1) primary key,
CODIGO VARCHAR(8) NOT NULL UNIQUE,
DESCRIPCION VARCHAR(50) NOT NULL,
OBS VARCHAR(200),
ESTADO BIT NOT NULL
)
GO
create table ARTICULOS
(
ID int identity(1,1) primary key,
CODIGO VARCHAR(10) NOT NULL UNIQUE,
DESCRIPCION VARCHAR(50) NOT NULL,
DESCRIPCION_AD VARCHAR(1000) NOT NULL,
PRECIO float NOT NULL,
TIPO varchar(3) NOT NULL check(tipo = 'ART' OR tipo = 'CON'),
OBS VARCHAR(200),
ESTADO BIT NOT NULL,
ID_CATEGORIA INT FOREIGN KEY REFERENCES CATEGORIAS(ID) 
)
GO
create table IMAGENES
(
ID int identity(1,1) primary key,
URL VARCHAR(400) NOT NULL,
ORDEN INT NOT NULL,
ESTADO BIT NOT NULL,
ID_ARTICULO INT FOREIGN KEY REFERENCES ARTICULOS(ID)
)

use ECOMMERCE
--Insert de Categorias
insert into CATEGORIAS(CODIGO,DESCRIPCION,OBS,ESTADO) values('1','Biombo','Madera','1')
insert into CATEGORIAS(CODIGO,DESCRIPCION,OBS,ESTADO) values('2','Sillas','Madera','1')

select * from CATEGORIAS

--Insert de Articulos
insert into ARTICULOS (CODIGO, DESCRIPCION, DESCRIPCION_AD, PRECIO,TIPO, OBS, ESTADO, ID_CATEGORIA) values('1','Biombo Soshi','Biombos realizados en armazon de madera ( BLANCO O NEGRO) Impresos sobre vinilo de alta resistencia totalmente lavable. Diseño de frente. Consultar si se necesita de ambos lados. ESTILO ORIENTAL Se realizan con la cantidad que necesiten segun el espacio a ocupar. Las ruedas son opcionales. ( no estan incluidas en el precio) Medidas preferentes: 1,80 mts x 48 cm (cada hoja)','2300','ART','OK','1','1')
insert into ARTICULOS (CODIGO, DESCRIPCION, DESCRIPCION_AD, PRECIO,TIPO, OBS, ESTADO, ID_CATEGORIA) values('2','Silla Bebe1','SILLA DE COMER BEBE BOOSTER ALTA PORTATIL 3 EN 1 ROOBY VARIOS COLORES - Material: Polipropileno - Colores disponibles: Rosa, celeste o verde - Peso: 2 kg.- Marca: Rooby - Edad recomendada: 6 meses - 3 años - Peso máximo recomendado: 25 kg.','1200','ART','OK','1','2')
insert into ARTICULOS (CODIGO, DESCRIPCION, DESCRIPCION_AD, PRECIO,TIPO, OBS, ESTADO, ID_CATEGORIA) values('3','Biombo Standard','biombo separador fabricado en mdf natural( SIN PINTAR) espesor 5.5 mm medidas preferentes 183cmx50cm. Se entrega armado con las bisagras.','1500','ART','OK','1','2')

select * from ARTICULOS

insert into IMAGENES (URL, ORDEN, ESTADO, ID_ARTICULO) values ('https://raw.githubusercontent.com/MATUKE23/PROYECTO-FINAL-PROG-III/main/Fotos%20Biombos/BIOMBO%201.jpg','1','1','3') 
insert into IMAGENES (URL, ORDEN, ESTADO, ID_ARTICULO) values ('https://raw.githubusercontent.com/MATUKE23/PROYECTO-FINAL-PROG-III/main/Fotos%20Otros%20Productos/Mesa1.jpg','1','1','2')
insert into IMAGENES (URL, ORDEN, ESTADO, ID_ARTICULO) values ('https://raw.githubusercontent.com/MATUKE23/PROYECTO-FINAL-PROG-III/main/Fotos%20Biombos/BIOMBO%2013.jpg','1','1','1')

select * from IMAGENES
--SELECT a.Id as id, Codigo, Nombre, a.Descripcion dart, c.descripcion  id_categoria , m.descripcion  Marca, ImagenUrl, Precio, c.Id IdCategoria, m.Id IdMarca from ARTICULOS a, CATEGORIAS c, MARCAS m where a.IdCategoria = c.Id and a.IdMarca = m.Id";

SELECT a.Id as id, A.CODIGO,  a.Descripcion dart,  A.PRECIO, A.TIPO, a.OBS, A.ESTADO, a.ID_CATEGORIA IdCategoria from ARTICULOS a


Create Table Usuarios (
Nombres nVarchar(max) not null,
Apellidos nVarchar(max) not null,
DNI int primary key ,
Telefono1 nvarchar(22) not null,
Telefono2 nvarchar(22) null,
FechaNacimiento date not null,
Estado bit
)

USE ECOMMERCE

ALTER TABLE USUARIOS
ADD TIPO INT CHECK (TIPO >=0 AND TIPO <=9)


SELECT * FROM USUARIOS

--AGREGAR COLUMNA USER 

ALTER TABLE USUARIOS
ADD USUARIO NVARCHAR(15) NOT NULL 

ALTER TABLE USUARIOS
ADD PASS NVARCHAR(15) NOT NULL 

use ECOMMERCE



Create Table Domicilios(
DNI int foreign key references usuarios (DNI),
Calle nvarchar(max) not null,
NumeroDeCalle int not null,
EntreCalles nvarchar(max) null,
Edificio nvarchar(max) null,
Departamento nvarchar(max) null,
CodigoPostal Nvarchar(10) not null unique,
InfoAdicional text null
Primary Key (DNI, CodigoPostal)
)

Create Table Localidades (
CodigoPostal Nvarchar(10) foreign key references Domicilios (CodigoPostal),
IdProvincia int not null,
NombreLocalidad nvarchar(max) not null,
Primary Key (CodigoPostal,IdProvincia)
)


Create Table Provincias(
IdProvicia int foreign key references Localidades (IdProvincia),
NombreProvincia nvarchar(max) not null,
Primary Key (IdProvicia)
)



create Table Pedidos(
NroComprobante bigint Primary key identity(1,1),
Estado varchar(15) not null check( Estado='SOLICITADO' OR Estado='ACEPTADO' OR Estado='CANCELADO' OR Estado='DEVUELTO' OR Estado='ENVIADO' OR Estado='ENTREGADO'),
Cliente int foreign key references usuarios (DNI),
FechaAlta date not null,
FechaModificacion date not null, --ultimo cambio de estado
FormaDePago varchar(15) not null check(FormaDePago = 'EFECTIVO' OR FormaDePago='TRANSFERENCIA' OR FormaDePago= 'TARJETA'),
Total float not null
)

create table DetallePedido(
Id bigint primary key identity(1,1),
NroComprobante bigint foreign key references Pedidos(NroComprobante),
IdArticulo int foreign key references Articulos(ID),
Cantidad int not null check (Cantidad>0),
Monto float not null
)




Create Table Usuarios1 (
USUARIO nVarchar(50) primary key,
PASS nVarchar(50) not null,
TIPO int null, 
Estado bit
)

insert into Usuarios1 (USUARIO,PASS,TIPO,Estado) values ('test','test','1','1')
insert into Usuarios1 (USUARIO,PASS,TIPO,Estado) values ('admin','admin','2','1')


select * from Usuarios1
go
create procedure AltaUsuario (
@USUARIO nvarchar(50),
@PASS nvarchar(50)
)
as
insert into Usuarios1 (USUARIO,PASS,TIPO,Estado) values (@USUARIO, @PASS,'1', '1')


--test  altaUsuario 'prueba0', '1

 Create Table Clientes (
Nombres nVarchar(max) not null,
Apellidos nVarchar(max) not null,
DNI int primary key ,
Telefono1 nvarchar(22) not null,
Telefono2 nvarchar(22) null,
FechaNacimiento date not null,
Estado bit,
Usuario nvarchar(50) foreign key references usuarios1(usuario)
)

