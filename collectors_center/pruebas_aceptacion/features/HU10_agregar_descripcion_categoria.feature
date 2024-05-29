Característica: Agregar descripción a una categoría
  Como joven coleccionista 
  deseo agregar una descripción a la categoría 
  para facilitar la clasificación de los artículos.

  Escenario: Agregar descripción de menos de 15 caracteres a categoría cuando es creada
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
    Y ingreso el nombre de la categoría "Gatos"
    Y luego ingreso la descripción de la categoria "Gatitos"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "La descripción debe contener letras y tener al menos 15 caracteres"

  Escenario: Agregar descripción a categoría cuando es creada con el mismo nombre al de la categoria
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
    Y ingreso el nombre de la categoría "hiperblanduzcos"
    Y luego ingreso la descripción de la categoria "hiperblanduzcos"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "La descripción no puede ser igual al nombre de la categoría."

  Escenario: Agregar descripción a categoría cuando es creada sin internet
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
    Y ingreso el nombre de la categoría "hiperblanduzcos"
    Y no tengo internet
    Y espero un rato
    Y luego ingreso la descripción de la categoria "hiperblanduzcos"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Sin conexión a Internet"

  Escenario: Agregar descripción a categoría cuando es creada
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
    Y ingreso el nombre de la categoría "Gatos"
    Y luego ingreso la descripción de la categoria "La descripción correspondiemte para los gatos"
    Cuando presiono el botón de Guardar
    Entonces puedo ver el mensaje "Categoría agregada exitosamente"