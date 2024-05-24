Característica: Iniciar sesión
    Como joven coleccionista deseo que mis colecciones 
    y datos personales sean privados para que no sean 
    accedidos por terceros no autorizados.

        Escenario: Registro éxitoso
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver la pantalla de Bienvenido

        Escenario: Registro duplicado
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Usuario ya se encuentra en uso"

        Escenario: Registro contraseñas no son iguales
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test321" ,correo "test321@gmail.com", contraseña "Test12" y confirmo contraseña "Tes23!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Las contraseñas no son iguales"
        
        Escenario: Registro sin nombre de usuario
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "" ,correo "test321@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes"

        Escenario: Registro sin correo
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test321" ,correo "", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes"

        Escenario: Registro sin contraseña
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test23" ,correo "test321@gmail.com", contraseña "" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes"

        Escenario: Registro sin confirmacion contraseña
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test13" ,correo "test321@gmail.com", contraseña "Test123!" y confirmo contraseña ""
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes"

        Escenario: Registro sin internet
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Y no tengo internet
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Sin conexión a Internet"
        



--------------------------
        Escenario: Login éxitoso
            Dado que abro la aplicación
            Y doy click en el boton Acceder
            Y en la pantalla de login ingreso mi correo "test123@gmail.com" y contraseña "jkafgea"
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
        

   