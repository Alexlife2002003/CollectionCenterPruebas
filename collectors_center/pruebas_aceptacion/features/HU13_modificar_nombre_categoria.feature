Característica: Modificar nombre de la Categoría
  Como joven coleccionista 
  deseo cambiar los nombres de mis categorías 
  para reflejar cambios en el contenido de la colección.

  Escenario: Modificar nombre de categoría por uno ya existente
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "Perro"
    Y luego ingreso la descripción de la categoria "La descripción de la categoría perro O.o"
    Y presiono Guardar
    Y presiono la categoria "Perro"
    Y espero un rato
    Y presiono el boton de editar al lado del nombre
    Y cambio el nombre "Perro" a "ranas"
    Cuando presiono el icono de palomita
    Entonces puedo ver el mensaje "El nombre de la categoría ya existe"
  
  Escenario: Modificar nombre de categoría sin Internet
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y presiono la categoria "Perro"
    Y espero un rato
    Y presiono el boton de editar al lado del nombre
    Y cambio el nombre "Perro" a "Babuino"
    Y no tengo internet
    Cuando presiono el icono de palomita
    Entonces puedo ver el mensaje "Sin conexión a Internet"

  Escenario: Modificar nombre de categoría exitoso
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y presiono el botón Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y presiono la categoria "Perro"
    Y espero un rato
    Y presiono el boton de editar al lado del nombre
    Y cambio el nombre "Perro" a "Babuino"
    Cuando presiono el icono de palomita
    Entonces puedo ver el mensaje "Se han guardado los cambios"
