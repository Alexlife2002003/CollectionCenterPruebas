Característica: Agregar articulo
    Como joven coleccionista deseo agregar un articulo
    a la aplicacion para hacer registro de el 
    y facilitarme el ordenarlo con toda la coleccion

        Escenario: Agregar articulo
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Ingresar
            Y presiono el boton hamburguesa
            Y presiono agregar nuevo articulo
            Y selecciono una imagen "imagen.jpg"
            Y le asigno un nombre "Mercurio"
            Y selecciono la categoria "Categoria Creada"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Articulo agregado exitosamente"


        Escenario: Agregar articulo nombre igual categoria
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Ingresar
            Y presiono el boton hamburguesa
            Y presiono agregar nuevo articulo
            Y selecciono una imagen "imagen.jpg"
            Y le asigno un nombre "Categoria Creada"
            Y selecciono la categoria "Categoria Creada"
            Y presiono Guardar
            Entonces puedo ver el mensaje "No puede llevar el nombre de la categoria"

        Escenario: Agregar articulo nombre vacio
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Ingresar
            Y presiono el boton hamburguesa
            Y presiono agregar nuevo articulo
            Y selecciono una imagen "imagen.jpg"
            Y selecciono la categoria "Categoria Creada"
            Y presiono Guardar
            Entonces puedo ver el mensaje "El nombre del articulo no puede ir vacio"
