Característica: Iniciar sesión y registro usuario
    Como joven coleccionista deseo que mis colecciones 
    y datos personales sean privados para que no sean 
    accedidos por terceros no autorizados.


    Escenario: Registro sin confirmacion contraseña
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Test123!" 
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."


        Escenario: Login éxitoso
            Dado que abro la aplicación
            Y doy click en el boton Acceder
            Y en la pantalla de login ingreso mi correo "test123@gmail.com" y contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver la pantalla de Bienvenido

        Escenario: Login no éxitoso
            Dado que abro la aplicación
            Y doy click en el boton Acceder
            Y en la pantalla de login ingreso mi correo "Miguel@gmail.com" y contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "La contraseña o el correo electrónico son incorrectos"

         Escenario: Login sin correo
            Dado que abro la aplicación
            Y doy click en el boton Acceder
            Y en la pantalla de login ingreso mi correo "" y contraseña "Test123!"
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "Ingresa tu correo electrónico y contraseña"

        Escenario: Login sin contraseña
            Dado que abro la aplicación
            Y doy click en el boton Acceder
            Y en la pantalla de login ingreso mi correo "test@gmail.com" y contraseña ""
            Cuando presiono el botón Ingresar
            Entonces puedo ver el mensaje "Ingresa tu correo electrónico y contraseña"