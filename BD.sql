create database Practica
go
use Practica

create table Productos 
(
Id int identity (1,1) primary key,
Nombre nvarchar (100),
Descripcion nvarchar (100),
Marca nvarchar (100),
Precio float,
Stock int
)

insert into Productos 
values
('COCACOLA ZERO','3 litros','COCACOLA',7.5,24),
('PAPAS RUFLES','100 gramos','INALECSA',12.5,36)

---PROCEDIMIENTOS ALMACENADOS 
--------------------------MOSTRAR 
create procedure MostrarProductos
as
select *from Productos
go

--------------------------INSERTAR 
create procedure InsetarProductos
@nombre nvarchar (100),
@descrip nvarchar (100),
@marca nvarchar (100),
@precio float,
@stock int
as
insert into Productos values (@nombre,@descrip,@marca,@precio,@stock)
go

------------------------ELIMINAR
create procedure EliminarProducto
@idpro int
as
delete from Productos where Id=@idpro
go
------------------EDITAR

create procedure EditarProductos
@nombre nvarchar (100),
@descrip nvarchar (100),
@marca nvarchar (100),
@precio float,
@stock int,
@id int
as
update Productos set Nombre=@nombre, Descripcion=@descrip, Marca=@marca, Precio=@precio, Stock=@stock where Id=@id
go

------------------verificar rutinas creadas
SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES
WHERE ROUTINE_TYPE = 'PROCEDURE'
ORDER BY ROUTINE_NAME
