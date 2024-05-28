Característica: Agregar articulo
    Como joven coleccionista deseo agregar un articulo
    a la aplicacion para hacer registro de el 
    y facilitarme el ordenarlo con toda la coleccion

        Escenario: Agregar articulo
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
            Y tomo la foto
            Y acepto la foto
            Y le asigno un nombre "Mercurio"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Artículo agregado exitosamente"


        Escenario: Agregar articulo sin internet
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
            Y no tengo internet
            Y selecciono el icono de imagen
            Y selecciono la opcion de camara
            Y tomo la foto
            Y acepto la foto
            Y le asigno un nombre "Mercurio"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Sin conexión a Internet"

        Escenario: Agregar articulo nombre igual categoria
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
            Y le doy click en el boton de mas
            Y selecciono el icono de imagen
            Y selecciono la opcion de camara
            Y tomo la foto
            Y acepto la foto
            Y le asigno un nombre "sapos"
            Y presiono Guardar
            Entonces puedo ver el mensaje "No puede llevar el nombre de la categoría"

        Escenario: Agregar articulo nombre vacio
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
            Y tomo la foto
            Y acepto la foto
            Y presiono Guardar
            Entonces puedo ver el mensaje "El nombre del artículo no puede ir vacío"

        Escenario: Agregar articulo sin foto
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
            Y le asigno un nombre "naranjas"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Error al subir la imagen"


        

        


        

    

       