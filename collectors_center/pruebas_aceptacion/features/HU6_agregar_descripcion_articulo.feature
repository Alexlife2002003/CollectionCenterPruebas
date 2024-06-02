Característica: Agregar descripcion articulo
    Como joven coleccionista deseo agregar una descripcion al articulo 
    para facilitar la informacion importante del articulo de la colecccion y  
    sea necesario obtenerla tiempo depues.

    Escenario: Agregar articulo nuevo descripcion
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
            Y le asigno un nombre "Gato Burbuja"
            Y le doy la descripcion "El gato burbuja que burbujea"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Artículo agregado exitosamente"


    Escenario: Agregar articulo descripcion
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
            Y le doy click en el articulo "0"
            Y le doy click al boton de editar descripcion
            Y edito la descripcion "El gato burbuja que burbujea" a "El gato triste esta llorando"
            Y le doy click a la palomita
            Entonces puedo ver el mensaje "Se han guardado los cambios"


    Escenario: Agregar articulo descripcion con menos de 10 caracteres
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
            Y le asigno un nombre "lena luthor"
            Y le doy la descripcion "si"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripción debe contener mínimo 10 caracteres si no es vacia"

            
    

    Escenario: Agregar articulo descripcion igual a su nombre
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
            Y acepto la foto
            Y le asigno un nombre "aaaaaaaaaa"
            Y le doy la descripcion "aaaaaaaaaa"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripción no puede ser igual al nombre del artículo"

    
    Escenario: Agregar articulo Descripcion igual a su nombre de categoria
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
            Y selecciono la categoria "El super mundo"
            Y le doy click en el boton de mas
            Y selecciono el icono de imagen
            Y selecciono la opcion de camara
            Y le asigno un nombre "aaaaaaaaaa"
            Y le doy la descripcion "El super mundo"
            Y presiono Guardar
            Entonces puedo ver el mensaje "Descripción no puede ser igual al nombre de la categoría"

    