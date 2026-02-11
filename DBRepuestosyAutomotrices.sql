drop database if exists DBRepuestosAutomotriz_in5cm;
create database DBRepuestosAutomotriz_in5cm;
use DBRepuestosAutomotriz_in5cm;
 
create table Proveedores(
	id_proveedor int auto_increment not null,
	nombre_proveedor varchar (60) not null,
	telefono_proveedor int not null,
	direccion varchar (100) not null,
	email_proveedor varchar (100) not null,
	primary key PK_id_proveedor(id_proveedor)
);
 
create table Empleados(
	id_empleado int auto_increment not null,
    nombre_empleado varchar (60) not null,
    apellido_empleado varchar (60) not null,
    puesto_empleado varchar (20) not null,
    email_empleado varchar (100) not null,
    primary key PK_id_empleado(id_empleado)
);
 
create table Repuestos(
	id_repuesto int auto_increment not null,
    nombre_repuesto varchar (60) not null,
    categoria_repuesto varchar (60) not null,
    precio_compra double not null,
    precio_venta double not null,
    id_proveedor int not null,
    primary key PK_id_repuesto(id_repuesto),
    constraint FK_repuesto_proveedor foreign key (id_proveedor)
		references proveedores(id_proveedor) on delete cascade
);
 
create table Ventas(
	id_venta int auto_increment not null,
    fecha_venta date not null,
    cantidad int not null,
    total double not null,
    id_empleado int not null,
    id_repuesto int not null,
    primary key PK_id_venta(id_venta),
    constraint FK_ventas_empleado foreign key (id_empleado)
		references Empleados(id_empleado) on delete cascade,
	constraint FK_ventas_repuestos foreign key (id_repuesto)
		references Repuestos(id_repuesto) on delete cascade
);
 
INSERT INTO Proveedores (nombre_proveedor, telefono_proveedor, direccion, email_proveedor) VALUES
('AutoPartes El Tigre', 22334455, 'Av. Central #123, San Salvador', 'contacto@autopartestigre.com'),
('Repuestos Morales', 71223344, 'Col. Escalón, Calle 5', 'ventas@moralesrep.com'),
('Distribuidora La Rueda', 23456789, 'Boulevard Los Próceres', 'info@larueda.com'),
('Importadora Japón', 76543218, 'Zona Industrial Soyapango', 'importaciones@japonrep.com'),
('AutoRepuestos López', 77889900, 'Calle Roosevelt #45', 'lopez@autorep.com'),
('Repuestos El Buen Precio', 22331122, 'Col. Médica, Pasaje 3', 'ventas@buenprecio.com'),
('Motores y Más', 70112233, 'Carretera al Puerto km 18', 'motoresymas@gmail.com'),
('AutoSupply Centro', 21004567, 'Centro Histórico, Local 12', 'autosupply@correo.com'),
('Repuestos Premium', 79884521, 'Santa Tecla, Av. Chiltiupán', 'premium@repuestos.com'),
('Distribuidora El Pistón', 24567890, 'San Marcos, Calle Principal', 'elpiston@dist.com');
 
INSERT INTO Empleados (nombre_empleado, apellido_empleado, puesto_empleado, email_empleado) VALUES
('Carlos', 'Hernández', 'Vendedor', 'carlos.h@empresa.com'),
('María', 'López', 'Cajera', 'maria.l@empresa.com'),
('José', 'Martínez', 'Vendedor', 'jose.m@empresa.com'),
('Ana', 'Ramírez', 'Administradora', 'ana.r@empresa.com'),
('Luis', 'Pérez', 'Bodeguero', 'luis.p@empresa.com'),
('Sofía', 'Gómez', 'Cajera', 'sofia.g@empresa.com'),
('Miguel', 'Castro', 'Vendedor', 'miguel.c@empresa.com'),
('Paola', 'Vásquez', 'Supervisora', 'paola.v@empresa.com'),
('Ricardo', 'Flores', 'Bodeguero', 'ricardo.f@empresa.com'),
('Daniela', 'Ortiz', 'Vendedor', 'daniela.o@empresa.com');
 
INSERT INTO Repuestos (nombre_repuesto, categoria_repuesto, precio_compra, precio_venta, id_proveedor) VALUES
('Filtro de aceite', 'Motor', 4.50, 8.00, 1),
('Pastillas de freno', 'Frenos', 15.00, 25.00, 2),
('Batería 12V', 'Eléctrico', 55.00, 80.00, 3),
('Bujías estándar', 'Encendido', 2.00, 4.50, 4),
('Amortiguador delantero', 'Suspensión', 35.00, 60.00, 5),
('Filtro de aire', 'Motor', 6.00, 12.00, 6),
('Radiador', 'Enfriamiento', 70.00, 110.00, 7),
('Disco de freno', 'Frenos', 28.00, 50.00, 8),
('Alternador', 'Eléctrico', 90.00, 140.00, 9),
('Correa de tiempo', 'Motor', 18.00, 35.00, 10);
 
INSERT INTO Ventas (fecha_venta, cantidad, total, id_empleado, id_repuesto) VALUES
('2025-01-10', 2, 16.00, 1, 1),
('2025-01-11', 1, 25.00, 2, 2),
('2025-01-12', 1, 80.00, 3, 3),
('2025-01-13', 4, 18.00, 4, 4),
('2025-01-14', 2, 120.00, 5, 5),
('2025-01-15', 3, 36.00, 6, 6),
('2025-01-16', 1, 110.00, 7, 7),
('2025-01-17', 2, 100.00, 8, 8),
('2025-01-18', 1, 140.00, 9, 9),
('2025-01-19', 1, 35.00, 10, 10);
 
-- procesos almacenados de proveedores
delimiter $$
create procedure sp_listar_proveedores()
begin
	select * from Proveedores;
end $$
delimiter ;
 
delimiter $$
 
create procedure sp_insertar_proveedor(
    in p_nombre varchar(60),
    in p_telefono int,
    in p_direccion varchar(100),
    in p_email varchar(100)
)
begin
    insert into proveedores (nombre_proveedor, telefono_proveedor, direccion, email_proveedor)
    values (p_nombre, p_telefono, p_direccion, p_email);
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_actualizar_proveedor(
    in p_id int,
    in p_telefono int,
    in p_direccion varchar(100)
)
begin
    update proveedores
    set telefono_proveedor = p_telefono,
        direccion = p_direccion
    where id_proveedor = p_id;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_eliminar_proveedor(in p_id int)
begin
    delete from proveedores where id_proveedor = p_id;
end $$
 
delimiter ;
 
-- procesos almacenados de empleados 
delimiter $$
 
create procedure sp_listar_empleados()
begin
    select * from empleados;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_insertar_empleado(
    in p_nombre varchar(60),
    in p_apellido varchar(60),
    in p_puesto varchar(20),
    in p_email varchar(100)
)
begin
    insert into empleados (nombre_empleado, apellido_empleado, puesto_empleado, email_empleado)
    values (p_nombre, p_apellido, p_puesto, p_email);
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_actualizar_empleado(
    in p_id int,
    in p_puesto varchar(20)
)
begin
    update empleados
    set puesto_empleado = p_puesto
    where id_empleado = p_id;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_eliminar_empleado(in p_id int)
begin
    delete from empleados where id_empleado = p_id;
end $$
 
delimiter ;
 
-- procesos almacenados para repuestos
delimiter $$
 
create procedure sp_listar_repuestos()
begin
    select * from repuestos;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_insertar_repuesto(
    in p_nombre varchar(60),
    in p_categoria varchar(60),
    in p_precio_compra double,
    in p_precio_venta double,
    in p_id_proveedor int
)
begin
    insert into repuestos
    (nombre_repuesto, categoria_repuesto, precio_compra, precio_venta, id_proveedor)
    values
    (p_nombre, p_categoria, p_precio_compra, p_precio_venta, p_id_proveedor);
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_actualizar_repuesto(
    in p_id int,
    in p_precio_venta double
)
begin
    update repuestos
    set precio_venta = p_precio_venta
    where id_repuesto = p_id;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_eliminar_repuesto(in p_id int)
begin
    delete from repuestos where id_repuesto = p_id;
end $$
 
delimiter ;
 
-- procesos almacenados para ventas
delimiter $$
 
create procedure sp_listar_ventas()
begin
    select * from ventas;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_insertar_venta(
    in p_fecha date,
    in p_cantidad int,
    in p_total double,
    in p_id_empleado int,
    in p_id_repuesto int
)
begin
    insert into ventas (fecha_venta, cantidad, total, id_empleado, id_repuesto)
    values (p_fecha, p_cantidad, p_total, p_id_empleado, p_id_repuesto);
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_actualizar_venta(
    in p_id int,
    in p_cantidad int,
    in p_total double
)
begin
    update ventas
    set cantidad = p_cantidad,
        total = p_total
    where id_venta = p_id;
end $$
 
delimiter ;
 
delimiter $$
 
create procedure sp_eliminar_venta(in p_id int)
begin
    delete from ventas where id_venta = p_id;
end $$
 
delimiter ;

select * from DBRepuestosAutomotriz_in5cm.Repuestos;