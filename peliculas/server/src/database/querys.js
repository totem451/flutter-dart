const queries = {
  getAllCards:
    'SELECT c.id AS id,c.nombre AS nombre, c.apellido AS apellido, c.foto AS foto, r.rareza AS rareza,p.posicion AS posicion,e.equipo AS equipo,s.serie AS serie from cartas AS c JOIN rarezas AS r ON r.id = c.id_rarezas JOIN posiciones AS p ON p.id = c.id_posiciones JOIN equipos AS e ON e.id = c.id_equipos JOIN series AS s ON s.id = c.id_series WHERE active = 0',
  insertCards:
    'INSERT INTO cartas (nombre,apellido,foto,id_rarezas,id_posiciones,id_equipos,id_series)VALUES (@nombre,@apellido,@foto,@id_rarezas,@id_posiciones,@id_equipos,@id_series)',
  getCardById: 'SELECT * FROM cartas WHERE id=@id AND isDeleted=0',
  deleteCardById: 'UPDATE cartas SET isDeleted=@isDeleted WHERE id=@id',
  updateCardById:
    'UPDATE cartas SET nombre=@nombre, apellido=@apellido, foto=@foto, id_rarezas=@id_rarezas, id_posiciones= @id_posiciones,id_equipos=id_equipos WHERE id=@id',
  getAllUsers:
    'SELECT u.id,u.usuario,u.contraseña,u.email, ru.rol FROM usuarios AS u JOIN rolesUsuario as ru ON ru.id = u.id_rol WHERE isDeleted=0',
  insertUser:
    'INSERT INTO usuarios (usuario,contraseña,email,id_rol)VALUES (@usuario,@contraseña,@email,@id_rol)',
  getUserById: 'SELECT * FROM usuarios WHERE id=@id AND isDeleted=0',
  deleteUserById: 'UPDATE usuarios SET isDeleted=@isDeleted WHERE id=@id',
  updateUserById:
    'UPDATE usuarios SET usuario=@usuario, contraseña=@contraseña, email=@email, id_rol=@id_rol WHERE id=@id',
  getCardsByUser: 'SELECT * FROM cartasUsuario WHERE id_usuarios=@idUser',
};
module.exports = { queries };
