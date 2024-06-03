Característica: Modificar descripción de artículo
  Como joven coleccionista 
  deseo modificar la descripción del artículo 
  para que en caso de cometer un error en la escritura 
  de la descripción se 
  pueda corregir sin la necesidad de borrar todo.

  Escenario: Modificar descripción de artículo sin internet
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y presiono el boton hamburguesa
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el boton de mas
    Y selecciono el icono de imagen
    Y selecciono la opcion de camara
    Y le asigno un nombre "Gato Bomba"
    Y le doy la descripcion "El gato hizo BOOM"
    Y presiono Guardar
    Y espero un rato
    Y le doy click en el articulo "0"
    Y espero un rato
    Y le doy click al boton de editar descripcion
    Y edito la descripcion "El gato hizo BOOM" a "El gato saltó en el agua e hizo SPLASH"
    Y no tengo internet
    Y espero un rato
    Cuando le doy click a la palomita
    Entonces puedo ver el mensaje "Sin conexión a Internet"

  Escenario: Modificar descripción de un artículo con mismo nombre del artículo
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y presiono el boton hamburguesa
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el articulo "0"
    Y espero un rato
    Y le doy click al boton de editar descripcion
    Y edito la descripcion "El gato hizo BOOM" a "Gato Bomba"
    Cuando le doy click a la palomita
    Entonces puedo ver el mensaje "La descripción no puede ser igual al nombre del artículo"
  
  Escenario: Modificar descripción de un artículo con el nombre igual a la categoría
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y presiono el boton hamburguesa
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "El super mundo"
    Y le doy click en el articulo "0"
    Y espero un rato
    Y le doy click al boton de editar descripcion
    Y edito la descripcion "El gato hizo BOOM" a "El super mundo"
    Cuando le doy click a la palomita
    Entonces puedo ver el mensaje "La descripción no puede ser igual al nombre de la categoría"
  
  Escenario: Modificar descripción de un artículo con menos de 10 caracteres
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y presiono el boton hamburguesa
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el articulo "0"
    Y espero un rato
    Y le doy click al boton de editar descripcion
    Y edito la descripcion "El gato hizo BOOM" a "BOOM"
    Cuando le doy click a la palomita
    Entonces puedo ver el mensaje "La descripción debe contener mínimo 10 caracteres si no es vacia"

  Escenario: Modificar descripción de un artículo exitosamente
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y presiono el boton hamburguesa
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el articulo "0"
    Y espero un rato
    Y le doy click al boton de editar descripcion
    Y edito la descripcion "El gato hizo BOOM" a "El gato saltó en el agua e hizo SPLASH"
    Cuando le doy click a la palomita
    Entonces puedo ver el mensaje "Se han guardado los cambios"
