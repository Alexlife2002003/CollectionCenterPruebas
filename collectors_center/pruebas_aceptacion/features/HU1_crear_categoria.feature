Característica: Crear una nueva categoría
  Como joven coleccionista deseo hacer una categoría 
  para poder dársela a uno de los elementos de la colección,
  haciendo más rápida su forma de ordenarlo.

  Escenario: Creación de categoría correcta.
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "Pez"
    Y luego ingreso la descripción de la categoria "La descripción de la categoría que puse"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Categoría agregada exitosamente"
  
  Escenario: Creación de categoría con nombre mayor a 20 caracteres.
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "EsteEsUnNombreMuyLargoYPeculiar"
    Y luego ingreso la descripción de la categoria "La descripción de la categoría que puse"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Categoría agregada exitosamente"
  
  Escenario: Creación de categoría con descripción mayor a 300 caracteres.
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "Lobo"
    Y luego ingreso la descripción de la categoria "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt."
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Categoría agregada exitosamente"

  Escenario: Creación de categoría con descripción mayor a 0 y menor a 15 caracteres.
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "Mapache"
    Y luego ingreso la descripción de la categoria "Lorem ipsum"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "La descripción debe contener letras y tener al menos 15 caracteres"
  
    Escenario: Creación de categoría sin internet.
    Dado que abro la aplicación
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y no tengo internet
    Y ingreso el nombre de la categoría "Categoría 1.3214"
    Y luego ingreso la descripción de la categoria "La descripción de la categoría 1.3214"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Sin conexión a Internet"
    
  Escenario: Creación de categoría con nombre ya existente
    Dado que abro la aplicación
    Y conecto la conexión a internet
    Y espero un rato
    Y doy click en el boton Acceder
    Y espero un rato
    Y en login ingreso mi correo "test123@gmail.com"
    Y luego en login ingreso mi contraseña "Test123!"
    Y persiono el botón de Ingresar
    Y espero un rato
    Y doy click en el boton de 3 líneas
    Y doy click en el boton de categorías
    Y espero un rato
    Y doy clic en el boton de un mas
    Y ingreso el nombre de la categoría "Lobo"
    Y luego ingreso la descripción de la categoria "La descripción de la categoría que puse"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "La categoría ya existe"