Característica: Iniciar sesión y registro usuario
    Como joven coleccionista deseo que mis colecciones 
    y datos personales sean privados para que no sean 
    accedidos por terceros no autorizados.

        Escenario: Registro éxitoso
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver la pantalla de Bienvenido

        Escenario: Registro duplicado usuario
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "ale@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje de registro duplicado "Usuario ya se encuentra en uso"

        Escenario: Registro duplicado correo
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "ale" ,correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje de registro duplicado "Correo ya se encuentra en uso"


        Escenario: Registro contraseñas no son iguales
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", contraseña "Tes3!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Las contraseñas no son igualess"
        
        Escenario: Registro sin nombre de usuario
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi correo "test123@gmail.com", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."

        Escenario: Registro sin correo
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123", contraseña "Test123!" y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."

        Escenario: Registro sin contraseña
            Dado que abro la aplicación
            Y doy click en el boton Registrarse
            Y en la pantalla de registro ingreso mi usuario "Test123" ,correo "test123@gmail.com", y confirmo contraseña "Test123!"
            Cuando presiono el botón Registrar
            Entonces puedo ver el mensaje "Ingresa los datos faltantes."

        



        

   