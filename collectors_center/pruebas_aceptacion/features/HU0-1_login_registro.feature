Característica: Iniciar sesión y registro usuario
    Como joven coleccionista deseo que mis colecciones 
    y datos personales sean privados para que no sean 
    accedidos por terceros no autorizados.


    Escenario: Registro sin confirmacion contraseña
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Registrarse
            Y espero un rato
            Y ingreso mi usuario "Test123"
            Y luego ingreso mi correo "test123@gmail.com"
            Y luego ingreso mi contraseña "Test123!" 
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."


        Escenario: Login éxitoso
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "test123@gmail.com"
            Y luego en login ingreso mi contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver la pantalla de Bienvenido

        Escenario: Login sin internet
            Dado que abro la aplicación
            Y espero un rato
            Y no tengo internet
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "test123@gmail.com"
            Y luego en login ingreso mi contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "Sin conexión a Internet"

        Escenario: Login no éxitoso
            Dado que abro la aplicación
            Y conecto la conexión a internet
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "Miguel@gmail.com"
            Y luego en login ingreso mi contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "La contraseña o el correo electrónico son incorrectos"

         Escenario: Login sin correo
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "Ingresa tu correo electrónico y contraseña."

        Escenario: Login sin contraseña
            Dado que abro la aplicación
            Y espero un rato
            Y doy click en el boton Acceder
            Y espero un rato
            Y en login ingreso mi correo "test@gmail.com"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "Ingresa tu correo electrónico y contraseña."
        

        