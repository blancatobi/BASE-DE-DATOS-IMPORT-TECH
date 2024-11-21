drop table detalle;
drop table producto;
drop table factura;
drop table cliente;
drop table categoria;
drop table proveedor;

create table cliente( nip_cliente int not null,
nombre varchar(15) not null,
direccion varchar(30) not null,
telefono varchar(10) not null,
ciudad varchar(20) not null);

create table categoria(id_categoria int not null,
nombre varchar(20) not null,
descripcion varchar(30) not null );


create table proveedor( nit_proveedor int  null,
nip int not null,
nombre varchar(15) not null,
pagina_web varchar(30) not null,
direccion varchar(30) not null,
telefono varchar(10) not null );

create table factura (No_factura int not null,
nip_cliente int not null,
fecha date not null );

create table producto(id_producto int not null,
id_categoria int not null,
nit_proveedor int not null,
nombre varchar(20) not null,
precio_actual int not null,
stock int not null );

create table detalle( no_detalle int not null,
no_factura int not null,
id_producto int not null,
cantidad int not null,
precio int not null );

alter table cliente add(PRIMARY key(nip_cliente));
alter table categoria add(PRIMARY key(id_categoria));
alter table proveedor  add(PRIMARY key(nit_proveedor));
alter table factura  add(PRIMARY key(no_factura));
alter table factura  add(FOREIGN key(nip_cliente) REFERENCES cliente(nip_cliente));
alter TABLE producto add(PRIMARY key(id_producto));
alter TABLE producto add(FOREIGN key(nit_proveedor) REFERENCES proveedor(nit_proveedor));
alter TABLE producto add(FOREIGN key(id_categoria) REFERENCES categoria(id_categoria));
alter TABLE detalle add(PRIMARY key(no_detalle));
alter TABLE detalle add(FOREIGN key(no_factura) REFERENCES  factura(no_factura));
alter TABLE detalle add(FOREIGN key(id_producto) REFERENCES producto(id_producto));


INSERT INTO cliente (nip_cliente, nombre, direccion, telefono, ciudad) VALUES
(1010, 'Juan Perez', 'Calle 1', '1234567890', 'Ciudad A'),
(2020, 'Maria Lopez', 'Calle 2', '0987654321', 'Ciudad B'),
(3020, 'Carlos Ruiz', 'Calle 3', '2112233445', 'Ciudad C'),
(4040, 'Nacho Perez', 'Calle 13', '3234567890', 'Ciudad A'),
(5050, 'Lucio Lopez', 'Calle 12', '4987654321', 'Ciudad B'),
(6060, 'Federico Ruiz', 'Calle 13', '5112233445', 'Ciudad C');

INSERT INTO categoria (id_categoria, nombre, descripcion) VALUES
(101, 'Electrónica', 'Productos electrónicos'),
(202, 'Ropa', 'Vestimenta y accesorios'),
(303, 'Alimentos', 'Comestibles y bebidas'),
(404, 'Belleza', 'Cosméticos'),
(505, 'Deporte', 'Balones'),
(606, 'Viajes', 'Paises');

INSERT INTO proveedor (nit_proveedor, nip, nombre, pagina_web, direccion, telefono) VALUES
(1001, 1, 'Andres', 'www.proveedora.com', 'Direccion A', '2223334445'),
(1002, 2, 'Pedro', 'www.proveedorb.com', 'Direccion B', '5556667778'),
(1003, 3, 'Camilo', 'www.proveedorca.com', 'Direccion C', '4223334445'),
(1004, 4, 'Pedro', 'www.proveedorpe.com', 'Direccion D', '6556667778'),
(1005, 5, 'Andrea', 'www.proveedoran.com', 'Direccion E', '7223334445'),
(1006, 6, 'Sandra', 'www.proveedorsan.com', 'Direccion F', '8556667778');

INSERT INTO factura (No_factura, nip_cliente, fecha) VALUES
(11, 3020, '2023-10-01'),
(22, 4040, '2023-10-02'),
(33, 3020, '2023-10-01'),
(44, 4040, '2023-10-02'),
(55, 6060, '2023-10-01'),
(66, 6060, '2023-10-02');

INSERT INTO producto (id_producto, id_categoria, nit_proveedor, nombre, precio_actual, stock) VALUES
(1, 101, 1001, 'Televisor', 500, 10),
(2, 101, 1001, 'Celular Samsung', 100, 10),
(3, 101, 1006, 'Celular HUAWEI', 200, 30),
(4, 606, 1006, 'Chile', 1500, 10),
(5, 606, 1005, 'Candad', 2000, 50);

INSERT INTO detalle (no_detalle, no_factura, id_producto, cantidad, precio) VALUES
(1, 11, 1, 5, 100),
(2, 11, 2, 20, 50);

