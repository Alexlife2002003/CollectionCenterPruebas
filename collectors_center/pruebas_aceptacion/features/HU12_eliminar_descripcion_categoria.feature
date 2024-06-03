Característica: Agregar articulo
    Como joven coleccionista deseo eliminar las descripciones 
    de mis categorías para no conservar información obsoleta o innecesaria.


    Escenario: Eliminar descripcion sin internet
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "test123@gmail.com"
            Y luego en login ingreso mi contraseña "Test123!"
            Y presiono el botón Ingresar
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y presiono la categoria "ranas"
            Y espero un rato
            Y selecciono el icono de eliminar
            Y no tengo internet
            Y presiono el boton eliminar
            Entonces puedo ver el mensaje "Sin conexión a Internet"


    Escenario: Eliminar descripcion 
            Dado que abro la aplicación
            Y conecto la conexión a internet
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "test123@gmail.com"
            Y luego en login ingreso mi contraseña "Test123!"
            Y presiono el botón Ingresar
            Y presiono el boton hamburguesa
            Y presiono Categorias
            Y presiono la categoria "ranas"
            Y selecciono el icono de eliminar
            Y presiono el boton eliminar
            Entonces puedo ver el mensaje "La descripción de la categoría eliminada exitosamente"