Característica: Agregar articulo
    Como joven coleccionista deseo agregar una descrcipcion al articulo 
    para facilitar la informacion importante del articulo de la colecccion y  
    sea necesario obtenerla tiempo depues.


    Escenario: Agregar articulo descrcipcion
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Ingresar
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Acceder
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y selecciono la categoria "pitufos"
            Y le doy click en el boton de mas
            Y subo la imagen "imagen.jpg"
            Y le doy el nombre "Gato Burbuja"
            Y le doy la descrcipcion "El gato burbuja que burbujea"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Articulo agregado exitosamente"


    Escenario: Agregar articulo descrcipcion igual a su nombre
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Ingresar
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Acceder
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y selecciono la categoria "pitufos"
            Y le doy click en el boton de mas
            Y subo la imagen "imagen.jpg"
            Y le doy el nombre "aaaaaaaaaa"
            Y le doy la descrcipcion "aaaaaaaaaa"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripcion no puede ser igual al nombre del articulo"

    
    Escenario: Agregar articulo descrcipcion igual a su nombre de categoria
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Ingresar
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Acceder
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y selecciono la categoria "pitufos"
            Y le doy click en el boton de mas
            Y subo la imagen "imagen.jpg"
            Y le doy el nombre "aaaaaaaaaa"
            Y le doy la descrcipcion "pitufos"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripcion no puede ser igual al nombre de la categoria"

    Escenario: Agregar articulo descrcipcion con menos de 10 caracteres
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Ingresar
            Y espero un rato
            Y ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!"
            Y presiono el botón Acceder
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y selecciono la categoria "pitufos"
            Y le doy click en el boton de mas
            Y subo la imagen "imagen.jpg"
            Y le doy el nombre "lena luthor"
            Y le doy la descrcipcion "si"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripcion debe contener minimo 10 caracteres si no es vacio"