Característica: Eliminar artículo
  Como joven coleccionista 
  deseo eliminar un artículo 
  para quitar elementos repetidos o que ya no tengo.

  Escenario: Eliminar artículo sin internet
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y doy click en el boton de 3 líneas
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el boton de mas
    Y selecciono el icono de imagen
    Y selecciono la opcion de camara
    Y tomo la foto
    Y acepto la foto
    Y le asigno un nombre "Sapolote"
    Y presiono Guardar
    Y espero un rato
    Y no tengo internet
    Y le doy click en el articulo "0"
    Y presiono el boton Eliminar
    Cuando presiono el boton Eliminar de la ventana emergente
    Entonces puedo ver el mensaje "Sin conexión a Internet"

  Escenario: Eliminar artículo exitosamente
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y doy click en el boton de 3 líneas
    Y presiono Articulos
    Y presiono el dropdown de categoria "ranas"
    Y selecciono la categoria "sapos"
    Y le doy click en el articulo "0"
    Y presiono el boton Eliminar
    Cuando presiono el boton Eliminar de la ventana emergente
    Entonces puedo ver el mensaje "El artículo ha sido eliminado correctamente"