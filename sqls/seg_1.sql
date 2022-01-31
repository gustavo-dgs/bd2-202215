/*
Realice las sentencias SQL para definir el usuario "usr_sitio_web_<cédula>" 
con acceso de lectura a todas las tablas de la base de datos respectiva a la 
<cédula> y que, además, posea permisos de escritura sobre la tabla de atletas siempre 
que se conecte desde el equipo "serverweb".

*/

CREATE USER usr_sitio_web_27506984@localhost IDENTIFIED BY 'pass1234';

CREATE USER usr_sitio_web_27506984@% IDENTIFIED BY 'pass1234';

GRANT ALL
ON bd2_202215_27506984.*
TO usr_sitio_web_28611790@%;

GRANT INSERT, UPDATE, DELETE
ON bd2_202215_27506984.candidatos
TO usr_sitio_web_28611790@serverweb;
